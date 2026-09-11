
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/enum/chart_filter.dart';

class RevenueFilterTabs extends StatelessWidget {
  final ChartFilter current;
  final ValueChanged<ChartFilter> onChanged;
  const RevenueFilterTabs({super.key, required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Widget tab(String label, ChartFilter filter) {
      final selected = current == filter;
      return InkWell(
        onTap: () => onChanged(filter),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? AppColors.inkGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          tab('All Revenue', ChartFilter.allRevenue),
          tab('Bridal Artistry', ChartFilter.bridalArtistry),
          tab('Apothecary', ChartFilter.apothecary),
        ],
      ),
    );
  }
}