import 'package:app_visao_artificial/domain/entities/detection.dart';

abstract class DetectionRepository {
  Stream<Detection> get detectionStream;
}
