import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/utils/helper_functions/get_bookingchip_status_style.dart';
import 'package:henna_by_basith/core/enum/booking_status.dart';


class BookingStatusChip extends StatelessWidget {
  final BookingStatus status;

  const BookingStatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final style = getStatusStyle(status);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        style.label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: style.foregroundColor,
        ),
      ),
    );
  }
}