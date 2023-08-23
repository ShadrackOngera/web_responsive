import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:web_responsive/helpers/http_helper.dart';
import 'package:web_responsive/exports.dart';

class HomeCentre extends StatefulWidget {
  const HomeCentre({super.key});

  @override
  State<HomeCentre> createState() => _HomeCentreState();
}

class _HomeCentreState extends State<HomeCentre> {
  Future<void> _launchTwitter() async {
    if (!await launchUrlString(
      'https://pub.dev/packages/url_launcher',
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch');
    }
  }

  final NavigationController navigationcontroller = Get.find();
  final MessagingController messagingController = Get.find();
  TextEditingController messagingFieldValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: ClipPath(
            clipper: ImageClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(
                'assets/images/woman.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     HttpHelper().sendMessageToUser('Poked');
        //     print('object');
        //   },
        //   child: CircleAvatar(
        //     backgroundColor: Colors.blue.shade300,
        //     minRadius: 80,
        //   ),
        // ),
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

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final controlPoint1 = Offset(size.width * 0.2, size.height);
    final endPoint1 = Offset(size.width * 0.35, size.height * 0.7);
    path.quadraticBezierTo(
        controlPoint1.dx, controlPoint1.dy, endPoint1.dx, endPoint1.dy);

    final controlPoint2 = Offset(size.width * 0.5, size.height * 0.4);
    final endPoint2 = Offset(size.width * 0.65, size.height * 0.7);
    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy, endPoint2.dx, endPoint2.dy);

    final controlPoint3 = Offset(size.width * 0.8, size.height);
    final endPoint3 = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint3.dx, controlPoint3.dy, endPoint3.dx, endPoint3.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
