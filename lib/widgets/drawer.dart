import 'package:flutter/material.dart';
import 'package:web_responsive/routes.dart';
import 'package:web_responsive/utilities/constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final NavigationController navigationcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.purple.shade800,
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              'Drawer Header',
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            onTap: () {
              setState(() {
                navigationcontroller.selectedScreen.value = SelectedScreen.Home;
              });
            },
            tileColor:
                navigationcontroller.selectedScreen.value == SelectedScreen.Home
                    ? Colors.purple.shade900
                    : null,
            leading: Icon(Icons.person_3, color: Color(AppColors.kGray500)),
            title: Text(
              'home'.tr,
              style: TextStyle(
                color: Color(AppColors.kGray500),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            onTap: () {
              setState(() {
                navigationcontroller.selectedScreen.value =
                    SelectedScreen.About;
              });
            },
            tileColor: navigationcontroller.selectedScreen.value ==
                    SelectedScreen.About
                ? Colors.purple.shade900
                : null,
            leading: Icon(
              Icons.dock,
              color: Color(AppColors.kGray500),
            ),
            title: Text(
              'about'.tr,
              style: TextStyle(
                color: Color(AppColors.kGray500),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 30),
            onTap: () {
              setState(() {
                navigationcontroller.selectedScreen.value =
                    SelectedScreen.Contact;
              });
            },
            tileColor: navigationcontroller.selectedScreen.value ==
                    SelectedScreen.Contact
                ? Colors.purple.shade900
                : null,
            leading: Icon(
              Icons.phone,
              color: Color(AppColors.kGray500),
            ),
            title: Text(
              'contact'.tr,
              style: const TextStyle(
                color: Color(AppColors.kGray500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
