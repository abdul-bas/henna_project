import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';
import 'package:henna_by_basith/core/widgets/schedule/schedule_item.dart';

import 'package:henna_by_basith/data/model/schedule_item_data.dart';


class ScheduleWidget extends StatelessWidget {
  final String dateLabel;
  final List<ScheduleItemData> items;

  const ScheduleWidget({super.key, required this.dateLabel, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
                  SizedBox(width: 8),
                  Text("Today's Atelier Schedule", style: AppTextStyles.bodyStrong),
                ],
              ),
              Text(dateLabel, style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 18),
          for (int i = 0; i < items.length; i++) ScheduleItem( isLast: i == items.length - 1,item:  items[i]),
        ],
      ),
    );
  }

}