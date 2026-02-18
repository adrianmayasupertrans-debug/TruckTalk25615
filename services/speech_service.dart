import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  Future<String> listen() async {
    await _speech.initialize();
    String result = "";
    await _speech.listen(onResult: (r) => result = r.recognizedWords);
    await Future.delayed(const Duration(seconds: 5));
    await _speech.stop();
    return result;
  }
}
