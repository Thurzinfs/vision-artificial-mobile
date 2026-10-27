import 'package:app_visao_artificial/domain/repositories/speech_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeechRepositoryImpl implements SpeechRepository {
  final FlutterTts flutterTts;
  late final Future<void> _initialization;
  Future<void> _speechQueue = Future<void>.value();
  String? _lastQueuedText;

  SpeechRepositoryImpl(this.flutterTts) {
    _initialization = _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  Future<void> speak(String text) {
    if (text.isEmpty || text == _lastQueuedText) {
      return Future<void>.value();
    }

    _lastQueuedText = text;
    final speech = _speechQueue.then((_) async {
      await _initialization;
      await flutterTts.speak(text);
    });

    _speechQueue = speech.then<void>(
      (_) {},
      onError: (Object error, StackTrace stackTrace) {
        FlutterError.reportError(
          FlutterErrorDetails(
            exception: error,
            stack: stackTrace,
            library: 'speech repository',
          ),
        );
      },
    );

    return speech;
  }
}
