import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  final String apiKey = "AIzaSyBILGSQvn272I0C44NirjoAKRHGFbs-0oA";

  Future<String> translate(String text, String lang) async {
    final url = Uri.parse(
      "https://translation.googleapis.com/language/translate/v2?key=$apiKey",
    );

    final res = await http.post(url, body: {
      "q": text,
      "target": lang,
    });

    final data = json.decode(res.body);
    return data["data"]["translations"][0]["translatedText"];
  }
}
