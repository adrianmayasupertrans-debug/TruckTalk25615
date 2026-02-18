import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();

  Future speak(String text, String lang) async {
    await _tts.setLanguage(lang);
    await _tts.setSpeechRate(0.5);
    await _tts.speak(text);
  }
}
