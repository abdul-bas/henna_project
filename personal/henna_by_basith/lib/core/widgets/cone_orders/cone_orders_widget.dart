import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';
import 'package:henna_by_basith/data/model/order_model.dart';

class ConeOrdersWidget extends StatelessWidget {
  final int pendingCount;
  final List<OrderModel> orders;

  const ConeOrdersWidget({super.key, required this.pendingCount, required this.orders});

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
              const Text('Recent Cone & Balm Orders', style: AppTextStyles.bodyStrong),
              Text('$pendingCount pending', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 12),
          for (final order in orders)  Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.buyerAndOrderId, style: AppTextStyles.bodyStrong.copyWith(fontSize: 12.5)),
                const SizedBox(height: 2),
                Text(order.itemsSummary, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(order.statusTag,
                      style: const TextStyle(fontSize: 10.5, color: AppColors.textSecondary)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(order.price, style: AppTextStyles.bodyStrong),
              const SizedBox(height: 4),
              Text(order.deliverySpeed, style: AppTextStyles.caption),
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