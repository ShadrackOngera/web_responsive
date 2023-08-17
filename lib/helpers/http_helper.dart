import 'package:web_responsive/routes.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
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
}
