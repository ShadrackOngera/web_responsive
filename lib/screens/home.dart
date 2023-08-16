import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_responsive/utilities/private_keys.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> sendMessageToUser() async {
    final botToken = PrivateKeys.telegram_bot_token;
    final chatId = PrivateKeys.chat_id;

    final response = await http.post(
      Uri.parse('https://api.telegram.org/bot$botToken/sendMessage'),
      headers: {
        'Content-Type': 'application/json', // Specify content type as JSON
      },
      body: json.encode({
        'chat_id': chatId,
        'text': 'Your message here',
      }),
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message');
      print('Response: ${response.body}');
    }
  }
  // Future<void> sendMessageToUser() async {
  //   final botToken = PrivateKeys.telegram_bot_token;
  //   final chatId = PrivateKeys.chat_id;

  //   final response = await http.post(
  //     Uri.parse('https://api.telegram.org/bot$botToken/sendMessage'),
  //     body: {
  //       'chat_id': chatId,
  //       'text': 'Your message here',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print('Message sent successfully');
  //   } else {
  //     print('Failed to send message');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            sendMessageToUser();
            print('object');
          },
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            minRadius: 80,
          ),
        )
      ],
    );
  }
}
