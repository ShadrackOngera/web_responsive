import 'package:web_responsive/exports.dart';

class MessagingController {
  Rx<String> homeMessage = ''.obs;

  void updateHomeMessagingField(String newMessage) {
    homeMessage.value = newMessage;
  }
}
