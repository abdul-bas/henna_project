import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/enum/booking_status.dart';
import 'package:henna_by_basith/data/model/status_chip_style.dart';

StatusChipStyle getStatusStyle(BookingStatus status) {
  switch (status) {
    case BookingStatus.confirmed:
      return StatusChipStyle(
        backgroundColor: AppColors.successBg,
        foregroundColor: AppColors.successText,
        label: 'Confirmed',
      );

    case BookingStatus.preTrial:
      return StatusChipStyle(
        backgroundColor: AppColors.warningBg,
        foregroundColor: AppColors.warningText,
        label: 'Pre-Stain Trial',
      );

    case BookingStatus.pendingDeposit:
      return StatusChipStyle(
        backgroundColor: AppColors.dangerBg,
        foregroundColor: AppColors.dangerText,
        label: 'Pending Deposit',
      );
  }
}