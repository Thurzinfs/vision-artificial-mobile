import 'package:flutter_tts/flutter_tts.dart';

class SpeechDataSource {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.speak(text);
  }
}
