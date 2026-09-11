import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/data/model/booking_data.dart';

class BookingAction extends StatelessWidget {
  const new({super.key, required this.booking,required this.isDeposit});
  final BookingModel booking;
  final bool isDeposit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isDeposit)
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.border),
              backgroundColor: AppColors.surface,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Briefing Kit',
              style: TextStyle(fontSize: 11.5, color: AppColors.textPrimary),
            ),
          ),
        const SizedBox(height: 6),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isDeposit
                ? AppColors.primaryBrick
                : AppColors.sidebarDark,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            booking.primaryActionLabel,
            style: const TextStyle(fontSize: 11.5),
          ),
        ),
      ],
    );
  }
}
