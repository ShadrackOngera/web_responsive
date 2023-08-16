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
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

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
      appBar: MediaQuery.of(context).size.width < 900 ? AppBar( toolbarHeight: 200, ) : null,
      drawer: MyDrawer(),
      body: Row(
        children: [
          MediaQuery.of(context).size.width > 900 ? MyDrawer() : SizedBox(),
          Obx(
            () => Container(
              margin: EdgeInsets.all(20),
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
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(Locale('en', ''));
            },
            text: 'English',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(Locale('ru', ''));
            },
            text: 'Russian',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(Locale('sw', ''));
            },
            text: 'Swahili',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(Locale('fr', ''));
            },
            text: 'French',
          ),
        ],
      ),
    );
  }
}


//  Get.updateLocale(newItem!.locale);
