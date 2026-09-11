import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';

class TestimonialWidget extends StatelessWidget {
  final int rating;
  final String quote;
  final String authorName;
  final String authorSubtitle;
  final String authorInitials;

  const TestimonialWidget({
    super.key,
    required this.rating,
    required this.quote,
    required this.authorName,
    required this.authorSubtitle,
    required this.authorInitials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (i) => Icon(
                Icons.star_rounded,
                size: 16,
                color: i < rating ? AppColors.gold : AppColors.border,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '"$quote"',
            style: AppTextStyles.body.copyWith(
              fontFamily: AppTextStyles.serifFamily,
              fontStyle: FontStyle.italic,
              color: AppColors.textPrimary,
              fontSize: 14.5,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.chipPeach,
                child: Text(authorInitials,
                    style: const TextStyle(fontSize: 12, color: AppColors.primaryBrick, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName, style: AppTextStyles.bodyStrong.copyWith(fontSize: 12.5)),
                    Text(authorSubtitle, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Text('99', style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}