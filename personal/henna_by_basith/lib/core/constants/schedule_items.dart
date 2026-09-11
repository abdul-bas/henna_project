 import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/data/model/schedule_item_data.dart';

const List<ScheduleItemData> scheduleItems = [
  ScheduleItemData(
    time: '09:00 AM — 11:30 AM',
    title: 'Fresh Henna Paste Mixing & Dye Release',
    subtitle: 'Batch #B-208 with organic eucalyptus oil infusion',
    dotColor: AppColors.textPrimary,
  ),
  ScheduleItemData(
    time: '01:00 PM — 03:00 PM',
    title: 'Private Bridal Consultation: Maya Patel',
    subtitle: 'Custom motif sketch session & skin patch test',
    dotColor: AppColors.primaryBrick,
  ),
  ScheduleItemData(
    time: '04:30 PM — 06:00 PM',
    title: 'Cold-Pack Order Dispatch Courier Pickup',
    subtitle: '14 insulated packages prepared for express delivery',
    dotColor: AppColors.textMuted,
  ),
];