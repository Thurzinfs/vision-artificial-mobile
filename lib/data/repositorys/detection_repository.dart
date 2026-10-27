import 'dart:convert';

import 'package:app_visao_artificial/data/models/detection_models.dart';
import 'package:app_visao_artificial/data/sources/detection_data_source.dart';
import 'package:app_visao_artificial/domain/entities/detection.dart';
import 'package:app_visao_artificial/domain/repositories/detection_repository.dart';

class DetectionRepositoryImpl implements DetectionRepository {
  final WebSocketChannelDataSource remoteDataSource;

  DetectionRepositoryImpl(this.remoteDataSource);

  @override
  Stream<Detection> get detectionStream {
    return remoteDataSource.stream.map((data) {
      final Map<String, dynamic> jsonMap = jsonDecode(data);
      
      final List<dynamic> detectionsList = jsonMap['detections'] ?? [];
      
      if (detectionsList.isNotEmpty) {
        final firstDetection = detectionsList[0] as Map<String, dynamic>;
        return DetectionModel.fromJson(firstDetection);
      }
      
      return DetectionModel(label: '', position: '', confidence: 0.0, areaRatio: 0.0);
    });
  }
}
