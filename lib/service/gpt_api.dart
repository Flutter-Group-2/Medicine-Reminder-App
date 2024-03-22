import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatGPT {
  String linkChat = "https://api.openai.com/v1/chat/completions";
  Future<String> getChatAnswer(String prompt) async {
    final uri = Uri.parse(linkChat);
    String answer = "";
    await http
        .post(
      uri,
      headers: {
        "Authorization": "Bearer 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",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content":
                  "",
            },
            {
              "role": "user",
              "content": prompt,
            }
          ],
        },
      ),
    )
        .then((value) {
      final response = jsonDecode(value.body);
      answer = response["choices"][0]["message"]["content"];
    });
    return answer;
  }
}
