import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';
import 'package:henna_by_basith/core/widgets/stock_alert/alert_row.dart';
import 'package:henna_by_basith/data/model/stock_alert_dart.dart';

class StockAlertWidget extends StatelessWidget {
  final List<StockAlertModel> alerts;

  const StockAlertWidget({super.key, required this.alerts});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.warning_amber_rounded, size: 18, color: AppColors.dangerText),
                  SizedBox(width: 8),
                  Text('Apothecary Stock Alerts', style: AppTextStyles.bodyStrong),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.dangerBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Action Required',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.dangerText),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (final alert in alerts) StockAlertRow(alert: alert,),
        ],
      ),
    );
  }
}