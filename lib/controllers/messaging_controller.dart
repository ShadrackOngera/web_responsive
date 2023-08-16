import 'package:web_responsive/routes.dart';

class MessagingController {
  Rx<String> homeMessage = ''.obs;

  void updateHomeMessagingField(String newMessage) {
    homeMessage.value = newMessage;
  }
}
