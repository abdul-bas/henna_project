
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/enum/trend_direction.dart';

class StatCardTrendPill extends StatelessWidget {
  final String label;
  final TrendDirection trend;
  const StatCardTrendPill({super.key, required this.label, required this.trend});

  @override
  Widget build(BuildContext context) {
    final isUp = trend == TrendDirection.up;
    final bg = isUp ? AppColors.positiveBg : AppColors.warningBg;
    final fg = isUp ? AppColors.positiveText : AppColors.warningText;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isUp ? Icons.trending_up : Icons.trending_flat, size: 13, color: fg),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: fg)),
        ],
      ),
    );
  }
}