
import 'package:flutter/widgets.dart';
import 'package:henna_by_basith/core/enum/trend_direction.dart';


class StatModel {
  final String label;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String value;
  final String? trendLabel;
  final TrendDirection trend;
  final String footNoteLeft;
  final String footNoteRight;

  const StatModel({
    required this.label,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    this.trendLabel,
    this.trend = TrendDirection.flat,
    required this.footNoteLeft,
    required this.footNoteRight,
  });
}