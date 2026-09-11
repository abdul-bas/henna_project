

import 'package:henna_by_basith/core/enum/booking_status.dart';


class BookingModel {
  final String clientName;
  final String initials;
  final BookingStatus status;
  final String description;
  final String date;
  final String duration;
  final String price;
  final String primaryActionLabel;

  const BookingModel({
    required this.clientName,
    required this.initials,
    required this.status,
    required this.description,
    required this.date,
    required this.duration,
    required this.price,
    required this.primaryActionLabel,
  });
}