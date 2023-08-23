import 'package:web_responsive/exports.dart';
import 'package:flutter/material.dart';

class HomeRight extends StatelessWidget {
  HomeRight({
    super.key,
  });
  final NavigationController navigationcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('dfghjk'),
        Container(
          height: 300,
          width: 39,
          color: Colors.deepOrange,
        )
      ],
    );
  }
}
