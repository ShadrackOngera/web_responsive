import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //English
        'en': {
          'that-says': 'THAT SAYS',
          'welcome': 'WELCOME',
          'to-the-bank': 'TO THE BANK',
          'login': 'LOGIN',
          'good-evening': 'Good evening',
          'good-afternoon': 'Good afternoon',
          'hi-there': 'Hi There',
          'good-morning': 'Good morning',
          'password': 'Password',
          'phone-number': 'Phone Number',
          'enter-password': 'Enter Password',
          'enter-your-password': 'Enter Your Password',
          'choose-the-profile-to-continue-with': 'Choose the Profile to continue with',
          'you-can-easily-switch-between-profiles-when-logged-in':'You can easily switch between profiles when logged in'
          
          

        },
        //Swahili
        'sw': {
          'that-says': 'ISEMAYO',
          'welcome': 'KARIBU',
          'to-the-bank': 'KWENYE BENKI',
          'login': 'INGIA',
        },
      };
}
