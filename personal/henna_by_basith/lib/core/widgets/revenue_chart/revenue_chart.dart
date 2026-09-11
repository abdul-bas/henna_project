import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/constants/revenue_bars.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/widgets/revenue_chart/bar.dart';
import 'package:henna_by_basith/core/widgets/revenue_chart/filter_tabs.dart';
import 'package:henna_by_basith/core/widgets/revenue_chart/legend_dot.dart';
import 'package:henna_by_basith/features/bookings/view_model/dashboard_view_model.dart';
import 'package:provider/provider.dart';

class RevenueChartCard extends StatelessWidget {
  const RevenueChartCard({super.key});


  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DashboardViewModel>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Revenue & Artisan Bookings Growth', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      'Weekly performance comparing Bridal Couture vs Apothecary Cone Dispensary',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
               RevenueFilterTabs(current: vm.chartFilter, onChanged: context.read<DashboardViewModel>().selectChartFilter),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$7,420.00', style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text('This Week', style: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(width: 16),
              const  RevenueLegendDot(color: AppColors.chartDark, label: 'Bridal Commissions'),
              const SizedBox(width: 14),
              const  RevenueLegendDot(color: AppColors.chartBrick, label: 'Fresh Cones & Balms'),
            ],
          ),
          const SizedBox(height: 4),
          Text('High-Value Services', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 24),
          SizedBox(
            height: 170,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  revenueBars.map((b) => Expanded(child: RevenueBar(data: b))).toList(),
            ),
          ),
          const SizedBox(height: 18),
          const Divider(height: 1),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Peak Artistry Period: Friday & Saturday Mehndi Evenings',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              Text('Average Order Value: \$156.30',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: AppColors.brick)),
            ],
          ),
        ],
      ),
    );
  }
}


