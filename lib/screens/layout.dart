import 'package:flutter/material.dart';
import 'package:web_responsive/helpers/http_helper.dart';
import 'package:web_responsive/exports.dart';


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
    {'locale': const Locale('en', ''), 'name': 'English'},
    {'locale': const Locale('ru', ''), 'name': 'Russian'},
    {'locale': const Locale('sw', ''), 'name': 'Swahili'},
    {'locale': const Locale('fr', ''), 'name': 'French'},
  ];

  Map<String, dynamic> selectedLanguage = {
    'locale': const Locale('en', ''),
    'name': 'English'
  };

  final NavigationController navigationcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    navigationcontroller.screenWidth.value = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: MediaQuery.of(context).size.width < 900 ? myAppbar() : null,
      drawer: const MyDrawer(),
      body: Row(
        children: [
          navigationcontroller.screenWidth.value > 900
              ? const MyDrawer()
              : const SizedBox(),
          Obx(
            () => Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myAppbar(),
                  Container(
                    // color: Colors.red,
                    margin: const EdgeInsets.all(20),
                    child: navigationcontroller.selectedScreen.value ==
                            SelectedScreen.Home
                        ? LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              if (constraints.maxWidth > 580) {
                                return const Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: HomeCentre(),
                                    ),
                                    VerticalDivider(
                                      indent: 23,
                                      thickness: 10,
                                      width: 10,
                                      endIndent: 30,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: HomeRight(),
                                    ),
                                  ],
                                );
                              } else {
                                return const Column(
                                  children: [
                                    HomeCentre(),
                                    HomeRight(),
                                  ],
                                );
                              }
                            },
                          )
                        : navigationcontroller.selectedScreen.value ==
                                SelectedScreen.Contact
                            ? LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  if (constraints.maxWidth > 580) {
                                    return const Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: ContactCentre(),
                                        ),
                                        VerticalDivider(
                                          indent: 23,
                                          thickness: 10,
                                          width: 10,
                                          endIndent: 30,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: ContactRight(),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const Column(
                                      children: [
                                        ContactCentre(),
                                        ContactRight(),
                                      ],
                                    );
                                  }
                                },
                              )
                            : navigationcontroller.selectedScreen.value ==
                                    SelectedScreen.About
                                ? LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      if (constraints.maxWidth > 580) {
                                        return const Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: AboutCentre(),
                                            ),
                                            VerticalDivider(
                                              color: Colors.pink,
                                              indent: 23,
                                              thickness: 10,
                                              width: 10,
                                              endIndent: 30,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: AboutRight(),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Column(
                                          children: [
                                            AboutCentre(),
                                            AboutRight(),
                                          ],
                                        );
                                      }
                                    },
                                  )
                                : null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(const Locale('en', ''));
            },
            text: 'English',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(const Locale('ru', ''));
            },
            text: 'Russian',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(const Locale('sw', ''));
            },
            text: 'Swahili',
          ),
          LanguageButtons(
            onPressed: () {
              Get.updateLocale(const Locale('fr', ''));
            },
            text: 'French',
          ),
        ],
      ),
    );
  }

  AppBar myAppbar() {
    return AppBar(
      backgroundColor: Colors.purple.shade200,
      toolbarHeight: 65,
      leading: navigationcontroller.screenWidth.value < 900
          ? Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            )
          : null,
      actions: [
        Obx(
          () => Text(
            '${navigationcontroller.screenWidth.value}',
          ),
        ),
        IconButton(
          onPressed: () {
            print(HttpHelper().fetchCatFacts(''));
          },
          icon: const Icon(
            Icons.info,
            color: Colors.brown,
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}


//  Get.updateLocale(newItem!.locale);
