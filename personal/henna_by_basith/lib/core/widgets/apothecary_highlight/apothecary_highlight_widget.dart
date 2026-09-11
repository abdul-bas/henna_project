import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';


class ApothecaryHighlightWidget extends StatelessWidget {
  final String tag;
  final String title;
  final String description;
  final String price;
  final String soldNote;

  const ApothecaryHighlightWidget({
    super.key,
    required this.tag,
    required this.title,
    required this.description,
    required this.price,
    required this.soldNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 96,
              height: 96,
              color: AppColors.chipPeach,
              child: const Icon(Icons.local_florist_outlined,
                  color: AppColors.primaryBrick, size: 32),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryBrick,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(title, style: AppTextStyles.cardTitle.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(description, style: AppTextStyles.caption),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(price, style: AppTextStyles.bodyStrong),
                    const SizedBox(width: 10),
                    Text('• $soldNote', style: AppTextStyles.caption),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}