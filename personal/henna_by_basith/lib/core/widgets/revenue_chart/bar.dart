
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/data/model/chart_bar_data.dart';

class RevenueBar extends StatelessWidget {
  final ChartBarData data;
  const RevenueBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: (data.bridalHeight + data.apothecaryHeight).clamp(0.0, 1.0),
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
                child: Column(
                  children: [
                    Expanded(
                      flex: (data.apothecaryHeight * 100).round(),
                      child: Container(color: AppColors.chartBrick),
                    ),
                    Expanded(
                      flex: (data.bridalHeight * 100).round(),
                      child: Container(color: AppColors.chartDark),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.dayLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: data.highlighted ? FontWeight.w700 : FontWeight.w500,
              color: data.highlighted ? AppColors.brick : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}