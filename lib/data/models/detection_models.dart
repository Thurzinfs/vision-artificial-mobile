import 'package:app_visao_artificial/domain/entities/detection.dart';

class DetectionModel extends Detection {
  DetectionModel({
    required super.label,
    required super.position,
    required super.confidence,
    required super.areaRatio,
  });

  factory DetectionModel.fromJson(Map<String, dynamic> json) {
    return DetectionModel(
      label: json['label'] as String? ?? '',
      position: json['position'] as String? ?? '',
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.0,
      areaRatio: (json['area_ratio'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
