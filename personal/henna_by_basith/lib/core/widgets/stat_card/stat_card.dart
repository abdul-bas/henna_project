import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/widgets/stat_card/trend_pill.dart';
import 'package:henna_by_basith/data/model/stat_card_data.dart';


class StatCard extends StatelessWidget {
  final StatModel data;
  const StatCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  data.label.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: data.iconBg, borderRadius: BorderRadius.circular(9)),
                child: Icon(data.icon, size: 16, color: data.iconColor),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(data.value, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),
          if (data.trendLabel != null) StatCardTrendPill(label: data.trendLabel!, trend: data.trend),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.footNoteLeft, style: Theme.of(context).textTheme.bodySmall),
              Text(
                data.footNoteRight,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
