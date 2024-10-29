import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://192.168.8.152:8001';

  Future<String> sendMessageToChatbot(String inputText) async {
    final url = Uri.parse('$_baseUrl/generate/');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"input_text": inputText}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['response'];
    } else {
      throw Exception('Failed to get chatbot response');
    }
  }
}
