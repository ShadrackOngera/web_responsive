import 'package:flutter/material.dart';
import 'package:telegram/telegram.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onHover: (v) {
            Telegram.send(
              username: '@youngphreatic',
              message: 'Kudos bruv!',
            );
          },
          onTap: () async {
            final Email email = Email(
              body: 'Email body',
              subject: 'Email subject',
              recipients: ['shadrack.sme@gmail.com'],
              isHTML: false,
            );

            await FlutterEmailSender.send(email);
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
