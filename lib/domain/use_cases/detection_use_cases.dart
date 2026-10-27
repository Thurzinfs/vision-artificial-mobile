import 'package:app_visao_artificial/domain/repositories/speech_repository.dart';
import 'package:app_visao_artificial/domain/repositories/detection_repository.dart';

class DetectionUseCases {
  final DetectionRepository visionRepository;
  final SpeechRepository speechRepository;

  DetectionUseCases(this.speechRepository, this.visionRepository);

  void call() {
    visionRepository.detectionStream.listen((detection) {
      if (detection.confidence > 0.4) {
        String textoFala;

        if (detection.position == "centro") {
          textoFala = "${detection.label} no ${detection.position}";
        } else {
          textoFala = "${detection.label} na ${detection.position}";
        }

        speechRepository.speak(textoFala);
      }
    });
  }
}
