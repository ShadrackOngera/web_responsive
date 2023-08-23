import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_responsive/controllers/messaging_controller.dart';
import 'package:web_responsive/helpers/http_helper.dart';
import 'package:web_responsive/routes.dart';
import 'package:web_responsive/utilities/private_keys.dart';

class HomeCentre extends StatefulWidget {
  const HomeCentre({super.key});

  @override
  State<HomeCentre> createState() => _HomeCentreState();
}

class _HomeCentreState extends State<HomeCentre> {
  final NavigationController navigationcontroller = Get.find();

  Future<void> _launchTwitter() async {
    if (!await launchUrlString(
      'https://pub.dev/packages/url_launcher',
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }

  final MessagingController messagingController = Get.find();
  TextEditingController messagingFieldValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            HttpHelper().sendMessageToUser('Poked');
            print('object');
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            minRadius: 80,
          ),
        ),
        const SizedBox(height: 15),
        TextFormField(
          controller: messagingFieldValue,
          onChanged: (v) {
            messagingController.homeMessage.value = messagingFieldValue.text;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            hintText: 'leave-me-a-message'.tr,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                // width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.blue.shade300,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: Colors.red.shade300,
                width: 1,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Obx(
          () => Visibility(
            visible: messagingController.homeMessage.value.length > 1,
            child: ElevatedButton(
              onPressed: () {
                HttpHelper().sendMessageToUser(messagingFieldValue.text);
                messagingFieldValue.text = '';
                messagingController.homeMessage.value = '';
              },
              child: Text(
                'send'.tr,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'socials'.tr,
            style: TextStyle(
              color: Colors.brown.shade900,
              fontWeight: FontWeight.w700,
              fontSize: 19,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: _launchTwitter,
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
