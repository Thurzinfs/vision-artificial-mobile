class Detection {
  String label;
  String position;
  double confidence;
  double areaRatio;

  Detection({
    required this.label,
    required this.position,
    required this.confidence,
    required this.areaRatio,
  });
}
