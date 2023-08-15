import 'package:flutter/material.dart';
import 'package:web_responsive/routes.dart';

class Language {
  final Locale locale;
  final String displayName;

  Language(this.locale, this.displayName);
}

class MasterLayout extends StatefulWidget {
  const MasterLayout({super.key});

  @override
  State<MasterLayout> createState() => _MasterLayoutState();
}

class _MasterLayoutState extends State<MasterLayout> {
  bool _showLanguages = false;

  final List supportedLanguages = [
    {'locale': Locale('en', ''), 'name': 'English'},
    {'locale': Locale('ru', ''), 'name': 'Russian'},
    {'locale': Locale('sw', ''), 'name': 'Swahili'},
    {'locale': Locale('fr', ''), 'name': 'French'},
  ];

  Map<String, dynamic> selectedLanguage = {
    'locale': Locale('en', ''),
    'name': 'English'
  };

  final NavigationController navigationcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              MyDrawer(),
              Obx(
                () => Container(
                  child: navigationcontroller.selectedScreen.value ==
                          SelectedScreen.Home
                      ? HomeScreen()
                      : navigationcontroller.selectedScreen.value ==
                              SelectedScreen.Contact
                          ? ContactScreen()
                          : navigationcontroller.selectedScreen.value ==
                                  SelectedScreen.About
                              ? AboutScreen()
                              : null,
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            right: -150,
            child: Container(
              width: 500,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showLanguages = !_showLanguages;
                      });
                    },
                    child: Text(
                      'change-language'.tr,
                    ),
                  ),
                  if (_showLanguages)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('en', ''));
                          },
                          child: Text(
                            'english'.tr,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('ru', ''));
                          },
                          child: Text(
                            'russian'.tr,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('fr', ''));
                          },
                          child: Text(
                            'french'.tr,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('sw', ''));
                          },
                          child: Text(
                            'swahili'.tr,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//  Get.updateLocale(newItem!.locale);
