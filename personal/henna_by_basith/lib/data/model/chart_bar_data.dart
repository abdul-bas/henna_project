

class ChartBarData {
  final String dayLabel;
  final double bridalHeight; 
  final double apothecaryHeight; 
  final bool highlighted;

  const ChartBarData({
    required this.dayLabel,
    required this.bridalHeight,
    required this.apothecaryHeight,
    this.highlighted = false,
  });
}
