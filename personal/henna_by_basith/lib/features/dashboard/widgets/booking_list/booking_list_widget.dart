import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';
import 'package:henna_by_basith/core/enum/booking_status.dart';
import 'package:henna_by_basith/core/widgets/booking_list/action.dart';
import 'package:henna_by_basith/core/widgets/booking_list/status_chip.dart';
import 'package:henna_by_basith/data/model/booking_data.dart';


class BookingListWidget extends StatelessWidget {
  final List<BookingModel> bookings;
  final VoidCallback? onViewAll;

  const BookingListWidget({super.key, required this.bookings, this.onViewAll});

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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upcoming Bridal Artistry Bookings', style: AppTextStyles.cardTitle),
                  SizedBox(height: 2),
                  Text('Confirmed bespoke bridal ceremonies and studio trials',
                      style: AppTextStyles.caption),
                ],
              ),
              TextButton(
                onPressed: onViewAll,
                child: Row(
                  children: const [
                    Text('View All Roster (64)',
                        style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, size: 14, color: AppColors.textPrimary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final booking in bookings)Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.chipPeach,
            child: Text(booking.initials,
                style: const TextStyle(color: AppColors.primaryBrick, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(booking.clientName, style: AppTextStyles.bodyStrong),
                    const SizedBox(width: 8),
                    BookingStatusChip(status: booking.status,),
                  ],
                ),
                const SizedBox(height: 4),
                Text(booking.description, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 12, color: AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text(booking.date, style: AppTextStyles.caption),
                    const SizedBox(width: 10),
                    const Icon(Icons.access_time, size: 12, color: AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text(booking.duration, style: AppTextStyles.caption),
                    const SizedBox(width: 10),
                    Text(booking.price, style: AppTextStyles.bodyStrong),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          BookingAction(booking: booking,isDeposit:booking.status == BookingStatus.pendingDeposit ,),
        ],
      ),
    ),
        ],
      ),
    );
  }



}