import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_responsive/controllers/messaging_controller.dart';
import 'package:web_responsive/routes.dart';
import 'package:web_responsive/utilities/private_keys.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationController navigationcontroller = Get.find();
  Future<void> sendMessageToUser(String message) async {
    final botToken = PrivateKeys.telegram_bot_token;
    final chatId = PrivateKeys.chat_id;
    final response = await http.post(
      Uri.parse('https://api.telegram.org/bot$botToken/sendMessage'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'chat_id': chatId,
        'text': message,
      }),
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message');
      print('Response: ${response.body}');
    }
  }

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

  _init() {
    // NetworkInterface();
    sendMessageToUser('Parallel lines have so much in common. \n\nIt\'s a shame they\'ll never meet.');
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, _init);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: navigationcontroller.screenWidth.value * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              sendMessageToUser('Poked');
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
              messagingController.homeMessage.value =
                  messagingFieldValue.text;
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
                  sendMessageToUser(messagingFieldValue.text);
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
          Text('socials'.tr),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                onTap: _launchTwitter,
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
