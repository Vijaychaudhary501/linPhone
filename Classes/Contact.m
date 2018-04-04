//
//  Contact.m
//  linphone
//
//  Created by Gautier Pelloux-Prayer on 12/01/16.
//
//

#import "Contact.h"
#import "ContactsListView.h"

@implementation Contact

- (instancetype)initWithCNContact:(CNContact *)acncontact {
  return [self initWithPerson:acncontact andFriend:NULL];
}

- (instancetype)initWithFriend:(LinphoneFriend *)afriend {
	return [self initWithPerson:NULL andFriend:afriend];
}

- (instancetype)initWithPerson:(CNContact *)acncontact
                     andFriend:(LinphoneFriend *)afriend {
  self = [super init];
  _person = acncontact;
  _friend = afriend ? linphone_friend_ref(afriend) : NULL;
  _added = FALSE;
  _phones = [[NSMutableArray alloc] init];
  _sipAddresses = [[NSMutableArray alloc] init];
  _emails = [[NSMutableArray alloc] init];
  if (_person) {
	  _identifier = _person.identifier;
	  _firstName = _person.givenName;
	  _lastName = _person.familyName;
	  _displayName = [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
	  for (CNLabeledValue<CNPhoneNumber *> *phoneNumber in _person.phoneNumbers) {
		  [_phones addObject:phoneNumber.value.stringValue];
	  }
	  if ([_person respondsToSelector:NSSelectorFromString( CNInstantMessageAddressUsernameKey)] || [_person respondsToSelector:NSSelectorFromString(CNContactInstantMessageAddressesKey)]) {
		  if (_person.instantMessageAddresses != NULL) {
			  for (CNLabeledValue<CNInstantMessageAddress *> *sipAddr in _person.instantMessageAddresses) {
				  if ([FastAddressBook isSipAddress:sipAddr]) {
					  NSString *username =  sipAddr.value.username;
					[_sipAddresses addObject:username];
				  }
			  }
		  }
	  }
	  
	  for (CNLabeledValue<NSString *> *email in _person.emailAddresses) {
		  [_emails addObject:email.value];
	  }
	  const char *key = [NSString stringWithFormat:@"ab%@", acncontact.identifier].UTF8String;
	  // try to find friend associated with that person
	  _friend = linphone_friend_list_find_friend_by_ref_key(linphone_core_get_default_friend_list(LC), key);
	  if (!_friend) {
		  _friend = linphone_friend_ref(linphone_core_create_friend(LC));
		  linphone_friend_set_ref_key(_friend, key);
		  linphone_friend_set_name(_friend, [NSString stringWithFormat:@"%@%@", _firstName ? _firstName : @"", _lastName ? [_firstName ? @" " : @"" stringByAppendingString:_lastName] : @""] .UTF8String);
		  for (NSString *sipAddr in _sipAddresses) {
			  LinphoneAddress *addr = linphone_core_interpret_url(LC, sipAddr.UTF8String);
			  if (addr) {
				  linphone_address_set_display_name(addr, [self displayName].UTF8String);
				  linphone_friend_add_address(_friend, addr);
				  linphone_address_destroy(addr);
			  }
		  }
		  for (NSString *phone in _phones) {
			  linphone_friend_add_phone_number(_friend, phone.UTF8String);
		  }
		  if (_friend) {
			  linphone_friend_enable_subscribes(_friend, FALSE);
			  linphone_friend_set_inc_subscribe_policy(_friend, LinphoneSPDeny);
				  linphone_core_add_friend(LC, _friend);
		  }
	  }
	  linphone_friend_ref(_friend);
	  
  } else if (_friend) {
	  [self loadFriend];
  } else {
	  LOGE(@"Contact cannot be initialized");
	  return nil;
  }

 /* LOGI(@"Contact %@ %@ initialized with %d phones, %d sip, %d emails",
       self.firstName ?: @"", self.lastName ?: @"", self.phones.count,
       self.sipAddresses.count, self.emails.count);
  */
  return self;
}

- (void)dealloc {
	if (_friend) {
		linphone_friend_unref(_friend);
	}
	_person = nil;
	_friend = NULL;
}

#pragma mark - Getters
- (UIImage *)avatar {
  if (_person) {
    @try {
      return [UIImage imageWithData:_person.imageData];
    } @catch (NSException *e) {
      LOGE(@"CNContact imageData CNPropertyNotFetchedException : %@", e);
      return nil;
    }
  }
  return nil;
}

- (NSString *)displayName {
	if (_friend) {
		const char *friend_name = linphone_friend_get_name(_friend);
		if (friend_name) {
			return [NSString stringWithUTF8String:friend_name];
		}
	}

	if (_person != nil) {
          NSString *lFirstName = _person.givenName;
          NSString *lLocalizedFirstName =
              [FastAddressBook localizedLabel:lFirstName];

          NSString *compositeName = _person.nickname;

          NSString *lLastName = _person.familyName;
          NSString *lLocalizedLastName =
              [FastAddressBook localizedLabel:lLastName];

          NSString *lOrganization = _person.organizationName;
          NSString *lLocalizedOrganization =
              [FastAddressBook localizedLabel:lOrganization];

          if (compositeName) {
            return compositeName;
          } else if (lLocalizedFirstName || lLocalizedLastName) {
            return [NSString stringWithFormat:@"%@ %@", lLocalizedFirstName,
                                              lLocalizedLastName];
          } else {
            return (NSString *)lLocalizedOrganization;
          }
        }

        if (_lastName || _firstName) {
          NSMutableString *str;
          if (_firstName)
            [str appendString:_firstName];
          if (_firstName && _lastName)
            [str appendString:@" "];
          if (_lastName)
            [str appendString:_lastName];
        }

        return NSLocalizedString(@"Unknown", nil);
}

#pragma mark - Setters

- (void)setAvatar:(UIImage *)avatar {
  BOOL ret = FALSE;
  if (_person) {
    NSData *imageAvatar = UIImageJPEGRepresentation(avatar, 0.9f);
    [_person setValue:imageAvatar forKey:CNContactImageDataKey];
    ret = TRUE;
  } else {
    LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping", __FUNCTION__);
  }
}

- (void)setFirstName:(NSString *)firstName {
	BOOL ret = FALSE;
        if (![firstName isEqualToString:_firstName]) {
          if (_friend)
            ret = linphone_friend_set_name(
                _friend, [NSString stringWithFormat:@"%@ %@", firstName,
                                                    _person.familyName]
                             .UTF8String);
          if (_person) {
            [_person setValue:firstName forKey:CNContactGivenNameKey];
            [_person setValue:[NSString stringWithFormat:@"%@ %@", firstName,
                                                         _person.familyName]
                       forKey:CNContactNicknameKey];
            ret = TRUE;
          }
          if (ret) {
            _firstName = firstName;
            _displayName = [NSString
                stringWithFormat:@"%@ %@", firstName, _person.familyName];
          }
        }
}

- (void)setLastName:(NSString *)lastName {
	BOOL ret = FALSE;
        if (_friend)
          ret = linphone_friend_set_name(
              _friend,
              [NSString stringWithFormat:@"%@ %@", _person.givenName, lastName]
                  .UTF8String);
        if (_person) {
          [_person setValue:lastName forKey:CNContactFamilyNameKey];
          [_person
              setValue:[NSString stringWithFormat:@"%@ %@", _person.givenName,
                                                  lastName]
                forKey:CNContactNicknameKey];
          ret = TRUE;
        }
        if (ret) {
          _lastName = lastName;
          _displayName =
              [NSString stringWithFormat:@"%@ %@", _person.givenName, lastName];
        }
}

- (BOOL)setSipAddress:(NSString *)sip atIndex:(NSInteger)index {
	BOOL ret = FALSE;
	NSString *normSip = NULL;
        if (_person && ![sip isEqualToString:@" "]) {
          if ((index + 1) > [_person.instantMessageAddresses count]) {
            if ([sip hasPrefix:@" "])
              normSip = [sip substringFromIndex:1];
            else
              normSip = sip;
            CNInstantMessageAddress *cNSipMsgAddr;
            if ([normSip containsString:@"@"])
       		cNSipMsgAddr = [[CNInstantMessageAddress alloc]
							initWithUsername:normSip service:@"SIP"];//service:[normSip componentsSeparatedByString:@"@"][1]];
            else
              cNSipMsgAddr =
                  [[CNInstantMessageAddress alloc] initWithUsername:normSip
                                                            service:@"SIP"];
            CNLabeledValue *sipAddress =
                [CNLabeledValue labeledValueWithLabel:NULL value:cNSipMsgAddr];
            NSMutableArray<CNLabeledValue<CNInstantMessageAddress *> *>
                *tmpSipAddress = [_person.instantMessageAddresses mutableCopy];
            [tmpSipAddress addObject:sipAddress];
            [_person setValue:tmpSipAddress
                       forKey:CNContactInstantMessageAddressesKey];
            ret = TRUE;
            _sipAddresses[index] = normSip;
          } else {
            normSip = sip;
            CNInstantMessageAddress *cNSipMsgAddr;
            if ([[FastAddressBook normalizeSipURI:normSip] containsString:@"@"])
    			cNSipMsgAddr = [[CNInstantMessageAddress alloc]
								initWithUsername:sip service:@"SIP"];
							  //service:[[FastAddressBook normalizeSipURI:normSip]
							//		   componentsSeparatedByString:@"@"][1]];
            else
              cNSipMsgAddr =
				[[CNInstantMessageAddress alloc] initWithUsername:normSip service:@"SIP"];
                                                            //service:normSip];
            CNLabeledValue *sipAddress =
                [CNLabeledValue labeledValueWithLabel:NULL value:cNSipMsgAddr];
            NSMutableArray<CNLabeledValue<CNInstantMessageAddress *> *>
                *tmpSipAddress = [_person.instantMessageAddresses mutableCopy];
            [tmpSipAddress replaceObjectAtIndex:index withObject:sipAddress];
            [_person setValue:tmpSipAddress
                       forKey:CNContactInstantMessageAddressesKey];
            ret = TRUE;
          }
        } else {
          LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping",
               __FUNCTION__);
        }

        if (ret) {
       	_sipAddresses[index] = sip;
        }
        return ret;
}

- (BOOL)setPhoneNumber:(NSString *)phone atIndex:(NSInteger)index {
	BOOL ret = FALSE;
	if (_person) {
          if ((index + 1) > [_person.phoneNumbers count]) {
            CNLabeledValue *mobileNumber = [CNLabeledValue
                labeledValueWithLabel:CNLabelPhoneNumberMobile
                                value:[CNPhoneNumber
                                          phoneNumberWithStringValue:phone]];
            NSMutableArray<CNLabeledValue<CNPhoneNumber *> *> *tmpPhoneNumbers =
                [_person.phoneNumbers mutableCopy];
            [tmpPhoneNumbers addObject:mobileNumber];
            [_person setValue:tmpPhoneNumbers forKey:CNContactPhoneNumbersKey];
            ret = TRUE;
          } else {
            CNLabeledValue *mobileNumber = [CNLabeledValue
                labeledValueWithLabel:CNLabelPhoneNumberMobile
                                value:[CNPhoneNumber
                                          phoneNumberWithStringValue:phone]];
            NSMutableArray<CNLabeledValue<CNPhoneNumber *> *> *tmpPhoneNumbers =
                [_person.phoneNumbers mutableCopy];
            [tmpPhoneNumbers replaceObjectAtIndex:index
                                       withObject:mobileNumber];
            [_person setValue:tmpPhoneNumbers forKey:CNContactPhoneNumbersKey];
            ret = TRUE;
          }
        } else {
          LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping",
               __FUNCTION__);
        }
        if (ret)
          _phones[index] = phone;
        return ret;
}

- (BOOL)setEmail:(NSString *)email atIndex:(NSInteger)index {
	BOOL ret = FALSE;
	if (_person) {
          if ((index + 1) > [_person.emailAddresses count]) {
            CNLabeledValue *emailAddress =
                [CNLabeledValue labeledValueWithLabel:NULL value:email];
            NSMutableArray<CNLabeledValue<NSString *> *> *tmpEmailAddress =
                [_person.emailAddresses mutableCopy];
            [tmpEmailAddress addObject:emailAddress];
            [_person setValue:tmpEmailAddress
                       forKey:CNContactEmailAddressesKey];
            ret = TRUE;
          } else {
            CNLabeledValue *emailAddress =
                [CNLabeledValue labeledValueWithLabel:NULL value:email];
            NSMutableArray<CNLabeledValue<NSString *> *> *tmpEmailAddress =
                [_person.emailAddresses mutableCopy];
            [tmpEmailAddress replaceObjectAtIndex:index
                                       withObject:emailAddress];
            [_person setValue:tmpEmailAddress
                       forKey:CNContactEmailAddressesKey];
            ret = TRUE;
          }
        } else {
          LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping",
               __FUNCTION__);
        }
        if (ret)
          _emails[index] = email;
        return ret;
}

- (BOOL)addSipAddress:(NSString *)sip {
	BOOL ret = FALSE;
        NSString *normSip = NULL;
        if (sip != NULL && ![sip isEqualToString:@""]) {
          if ([sip isEqualToString:@" "])
            ret = TRUE;
          else {
            if (_person) {
              normSip = sip;
              CNInstantMessageAddress *cNSipMsgAddr;
              if ([normSip containsString:@"@"])
                cNSipMsgAddr = [[CNInstantMessageAddress alloc]
                    initWithUsername:[normSip
                                         componentsSeparatedByString:@"@"][0]
								service:@"SIP"];
								//service:[normSip componentsSeparatedByString:@"@"][1]];
              else
                cNSipMsgAddr =
                    [[CNInstantMessageAddress alloc] initWithUsername:normSip
                                                              service:@"SIP"];
              CNLabeledValue *sipAddress =
                  [CNLabeledValue labeledValueWithLabel:NULL
                                                  value:cNSipMsgAddr];
              NSMutableArray<CNLabeledValue<CNInstantMessageAddress *> *> *
                  tmpSipAddress = [_person.instantMessageAddresses mutableCopy];
              [tmpSipAddress addObject:sipAddress];
              [_person setValue:tmpSipAddress
                         forKey:CNContactInstantMessageAddressesKey];
              ret = TRUE;
            } else {
              LinphoneAddress *addr =
                  linphone_core_interpret_url(LC, sip.UTF8String)
                      ?: linphone_address_new(sip.UTF8String);
              if (addr) {
                ret = TRUE;
                linphone_friend_add_address(_friend, addr);
                linphone_address_destroy(addr);
                // ensure that it was added by checking list size
                ret =
                    (bctbx_list_size(linphone_friend_get_addresses(_friend)) ==
                     _sipAddresses.count + 1);
              }
            }
          }
        }
        if (ret) {
          if ([sip hasPrefix:@" "])
            [_sipAddresses addObject:[sip substringFromIndex:1]];
          else
            [_sipAddresses addObject:sip];
        }
        return ret;
}

- (BOOL)addPhoneNumber:(NSString *)phone {
	BOOL ret = FALSE;
        if (phone != NULL && ![phone isEqualToString:@""]) {
          if ([phone isEqualToString:@" "])
            ret = TRUE;
          else {
            if (_person) {
              CNLabeledValue *mobileNumber = [CNLabeledValue
                  labeledValueWithLabel:CNLabelPhoneNumberMobile
                                  value:[CNPhoneNumber
                                            phoneNumberWithStringValue:phone]];
              NSMutableArray<CNLabeledValue<CNPhoneNumber *> *>
                  *tmpPhoneNumbers = [_person.phoneNumbers mutableCopy];
              [tmpPhoneNumbers addObject:mobileNumber];
              [_person setValue:tmpPhoneNumbers
                         forKey:CNContactPhoneNumbersKey];
              ret = TRUE;
            } else {
              char *cphone = ms_strdup(phone.UTF8String);
              if (cphone) {
                linphone_friend_add_phone_number(_friend, cphone);
                phone = [NSString stringWithUTF8String:cphone];
                ms_free(cphone);
                // ensure that it was added by checking list size
                ret = (bctbx_list_size(linphone_friend_get_phone_numbers(
                           _friend)) == _phones.count + 1);
              }
            }
          }
        }
        if (ret) {
          [_phones addObject:phone];
        }
        return ret;
}

- (BOOL)addEmail:(NSString *)email {
	BOOL ret = FALSE;
        if (email != NULL && ![email isEqualToString:@""]) {
          if ([email isEqualToString:@" "])
            ret = TRUE;
          else {
            if (_person) {
              CNLabeledValue *emailAddress =
                  [CNLabeledValue labeledValueWithLabel:NULL value:email];
              NSMutableArray<CNLabeledValue<NSString *> *> *tmpEmailAddress =
                  [_person.emailAddresses mutableCopy];
              [tmpEmailAddress addObject:emailAddress];
              [_person setValue:tmpEmailAddress
                         forKey:CNContactEmailAddressesKey];
              ret = TRUE;
            } else {
              LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping",
                   __FUNCTION__);
            }
          }
        }
        if (ret) {
          [_emails addObject:email];
        }
        return ret;
}

- (BOOL)removeSipAddressAtIndex:(NSInteger)index {
	BOOL ret = FALSE;
	if (_person ) {
          NSMutableArray<CNLabeledValue<CNInstantMessageAddress *> *>
              *tmpSipAddress = [_person.instantMessageAddresses mutableCopy];
		if([tmpSipAddress count] > index){
			  [tmpSipAddress removeObjectAtIndex:index];
			  [_person setValue:tmpSipAddress
						 forKey:CNContactInstantMessageAddressesKey];
		}
          ret = TRUE;
        } else {
          LinphoneAddress *addr = linphone_core_interpret_url(
              LC, ((NSString *)_sipAddresses[index]).UTF8String);
          if (addr) {
            linphone_friend_remove_address(_friend, addr);
            linphone_address_destroy(addr);
            // ensure that it was destroyed by checking list size
            ret =
                (bctbx_list_size(linphone_friend_get_addresses(_friend)) + 1 ==
                 _sipAddresses.count);
          }
        }
        if (ret) {
          [_sipAddresses removeObjectAtIndex:index];
        }
        return ret;
}

- (BOOL)removePhoneNumberAtIndex:(NSInteger)index {
	BOOL ret = FALSE;
        if (_person && _person.phoneNumbers.count > 0) {
          NSMutableArray<CNLabeledValue<CNPhoneNumber *> *> *tmpPhoneNumbers =
              [_person.phoneNumbers mutableCopy];
			if([tmpPhoneNumbers count] > index){
			  [tmpPhoneNumbers removeObjectAtIndex:index];
			  [_person setValue:tmpPhoneNumbers forKey:CNContactPhoneNumbersKey];
			}
          ret = TRUE;
        } else {
          const char *phone = ((NSString *)_phones[index]).UTF8String;
          linphone_friend_remove_phone_number(_friend, phone);
          // ensure that it was destroyed by checking list size
          // ret = (bctbx_list_size(linphone_friend_get_phone_numbers(_friend))
          // + 1 == _phoneNumbers.count);
          ret = TRUE;
        }
        if (ret) {
          [_phones removeObjectAtIndex:index];
        }
        return ret;
}

- (BOOL)removeEmailAtIndex:(NSInteger)index {
	BOOL ret = FALSE;
	if (_person && _person.phoneNumbers.count > 0) {
          NSMutableArray<CNLabeledValue<NSString *> *> *tmpEmailAddresses =
              [_person.emailAddresses mutableCopy];
		if([tmpEmailAddresses count] > index){
          [tmpEmailAddresses removeObjectAtIndex:index];
          [_person setValue:tmpEmailAddresses
                     forKey:CNContactEmailAddressesKey];
		}
          ret = TRUE;
        } else {
          LOGW(@"%s: Cannot do it when using LinphoneFriend, skipping",
               __FUNCTION__);
        }
        if (ret) {
          [_emails removeObjectAtIndex:index];
        }
        return ret;
}


#pragma mark - LinphoneFriend utils

- (void)loadFriend {
	// First and Last name
	{
		_firstName = [NSString stringWithUTF8String:linphone_friend_get_name(_friend) ?: ""];
		_lastName = nil;
	}

	// Phone numbers
	{
          _phones = [[NSMutableArray alloc] init];
          MSList *numbers = linphone_friend_get_phone_numbers(_friend);
          while (numbers) {
            NSString *phone = [NSString stringWithUTF8String:numbers->data];
            [_phones addObject:phone];
            numbers = numbers->next;
          }
        }

        // SIP (IM)
        {
          _sipAddresses = [[NSMutableArray alloc] init];
          const MSList *sips = linphone_friend_get_addresses(_friend);
          while (sips) {
            LinphoneAddress *addr = sips->data;
            char *uri = linphone_address_as_string_uri_only(addr);
            NSString *sipaddr = [NSString stringWithUTF8String:uri];
            [_sipAddresses addObject:sipaddr];
            ms_free(uri);

            sips = sips->next;
          }
        }

        // Email - no support for LinphoneFriend
        { _emails = [[NSMutableArray alloc] init]; }
}

@end