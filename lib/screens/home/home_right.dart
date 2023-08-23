import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:faker/faker.dart';
import 'package:web_responsive/exports.dart';
import 'package:flutter/material.dart';

class HomeRight extends StatefulWidget {
  const HomeRight({super.key});

  @override
  State<HomeRight> createState() => _HomeRightState();
}

class _HomeRightState extends State<HomeRight> {
  final Faker faker = Faker();
  double _leftPosition = -100.0;
  Future<void> _animateText() async {
    await Future.delayed(Duration(milliseconds: 500)); // Initial delay

    setState(() {
      _leftPosition = 0; // Move text to the screen
    });
  }

  @override
  void initState() {
    super.initState();
    _animateText();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          faker.lorem.word(),
        ),
        AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText('Discipline is the best tool'),
          ],
          // totalRepeatCount: 1,
          isRepeatingAnimation: false,
          pause: const Duration(milliseconds: 2000),
          onTap: () {
            print("Tap Event");
          },
        ),
        
      ],
    );
  }
}
