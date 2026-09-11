
   import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/enum/trend_direction.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/data/model/stat_card_data.dart';
const List<StatModel> stats = [
  StatModel(
    label: 'TOTAL REVENUE',
    icon: Icons.bookmark_border,
    iconBg: AppColors.successBg,
    iconColor: AppColors.successText,
    value: '\$28,450.00',
    trendLabel: '+18.4%',
    trend: TrendDirection.up,
    footNoteLeft: 'vs last month',
    footNoteRight: 'Avg bridal order \$340.00',
  ),

  StatModel(
    label: 'BRIDAL BOOKINGS',
    icon: Icons.favorite_border,
    iconBg: AppColors.successBg,
    iconColor: AppColors.successText,
    value: '64 Appointments',
    trendLabel: '+12%',
    trend: TrendDirection.up,
    footNoteLeft: 'bridal peak',
    footNoteRight: 'Confirmed capacity 92% full',
  ),

  StatModel(
    label: 'APOTHECARY ORDERS',
    icon: Icons.spa_outlined,
    iconBg: AppColors.successBg,
    iconColor: AppColors.successText,
    value: '182 Batches',
    trendLabel: '+24%',
    trend: TrendDirection.up,
    footNoteLeft: 'fresh organic cones',
    footNoteRight: 'Pending pack 14 orders',
  ),

  StatModel(
    label: 'ACTIVE PATRONS',
    icon: Icons.favorite_border,
    iconBg: AppColors.successBg,
    iconColor: AppColors.successText,
    value: '348 Brides',
    trendLabel: null,
    trend: TrendDirection.flat,
    footNoteLeft: '4.98 · 98% satisfaction',
    footNoteRight: 'Repeat patrons 41%',
  ),
];