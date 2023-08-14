import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //English
        'en': {
          'that-says': 'THAT SAYS',
          'welcome': 'Welcome',
          'about': 'About',
          'contact': 'Contact',
          'home': 'Home'
        },
        //Swahili
        'sw': {
          'that-says': 'HILI LINASEMA',
          'welcome': 'Karibu',
          'about': 'Kuhusu',
          'contact': 'Wasiliana nasi',
          'home': 'Nyumbani'
        },
        //Russian
        'ru': {
          'that-says': 'ЭТО ГОВОРИТ',
          'welcome': 'Добро пожаловать',
          'about': 'О нас',
          'contact': 'Контакты',
          'home': 'Главная'
        },
        // French
        'fr': {
          'that-says': 'CELA DIT',
          'welcome': 'Bienvenue',
          'about': 'À propos',
          'contact': 'Contact',
          'home': 'Accueil'
        },
      };
}
