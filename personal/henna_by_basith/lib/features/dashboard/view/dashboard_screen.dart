import 'package:flutter/material.dart';

import 'package:henna_by_basith/core/constants/dashboard_stats.dart';
import 'package:henna_by_basith/core/constants/menu_bar_items.dart';

import 'package:henna_by_basith/core/constants/schedule_items.dart';
import 'package:henna_by_basith/core/enum/booking_status.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/theme/app_text_style.dart';
import 'package:henna_by_basith/core/widgets/apothecary_highlight/apothecary_highlight_widget.dart';
import 'package:henna_by_basith/core/widgets/cone_orders/cone_orders_widget.dart';
import 'package:henna_by_basith/core/widgets/revenue_chart/revenue_chart.dart';
import 'package:henna_by_basith/core/widgets/schedule/schedule_widget.dart';
import 'package:henna_by_basith/core/widgets/side_bar/app_side_bar.dart';
import 'package:henna_by_basith/core/widgets/stat_card/stat_card.dart';
import 'package:henna_by_basith/core/widgets/stock_alert/stock_alert_widget.dart';
import 'package:henna_by_basith/core/widgets/testimonial/testimonial_widget.dart';
import 'package:henna_by_basith/data/model/booking_data.dart';

import 'package:henna_by_basith/data/model/order_model.dart';
import 'package:henna_by_basith/data/model/stock_alert_dart.dart';
import 'package:henna_by_basith/features/bookings/view_model/dashboard_view_model.dart';
import 'package:henna_by_basith/features/dashboard/widgets/booking_list/booking_list_widget.dart';

import 'package:henna_by_basith/features/dashboard/widgets/top_bar/top_bar.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Selector<DashboardViewModel, int>(
      selector: (context, p) => p.selectedSidebarIndex,
      builder: (context, index, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Row(
            children: [
              SidebarWidget(activeIndex: index),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [const TopBar(), sideBarItems[index].route],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

   const List<StockAlertModel> _stockAlerts = [
    StockAlertModel(
      name: 'Organic Henna ...',
      remaining: 'Only 8 boxes remaining in cold storage',
      actionLabel: 'Mix Batch',
    ),
    StockAlertModel(
      name: 'Herbal Sealant A...',
      remaining: 'Only 4 jars left (60ml Hand-poured)',
      actionLabel: 'Restock',
    ),
  ];

   const List<OrderModel> _coneOrders = [
    OrderModel(
      buyerAndOrderId: 'Sana Mir (Order #HB-9104)',
      itemsSummary: '2x Organic Cones, 1x Herbal Balm',
      price: '\$55.00',
      statusTag: 'Cold-Pack Needed',
      deliverySpeed: 'Express',
    ),
    OrderModel(
      buyerAndOrderId: 'Dr. Leila Haddad (Order #HB-9102)',
      itemsSummary: '4x Cones + Eucalyptus Sealant Spray',
      price: '\$78.00',
      statusTag: 'Insulated & Packed',
      deliverySpeed: 'Standard',
    ),
  ];

   const List<BookingModel> _bookings = [
    BookingModel(
      clientName: 'Ayesha Khan',
      initials: 'AK',
      status: BookingStatus.confirmed,
      description: 'Royal Maharani Bridal Suite (Elbow to Palms + Full Feet)',
      date: 'Sat, Nov 15',
      duration: '10:00 AM (6hrs)',
      price: '\$380.00',
      primaryActionLabel: 'Review Details',
    ),
    BookingModel(
      clientName: 'Noor Fatima',
      initials: 'NF',
      status: BookingStatus.preTrial,
      description: 'Contemporary Arabic Floral Cuff & Negative Space Mesh',
      date: 'Sun, Nov 16',
      duration: '02:30 PM (2.5hrs)',
      price: '\$195.00',
      primaryActionLabel: 'Review Details',
    ),
    BookingModel(
      clientName: 'Zara Malik',
      initials: 'ZM',
      status: BookingStatus.pendingDeposit,
      description: 'Sangeet Party Group Package (Bride + 5 Guests)',
      date: 'Tue, Nov 18',
      duration: '04:00 PM (4.5hrs)',
      price: '\$450.00',
      primaryActionLabel: 'Confirm & Send Invoice',
    ),
  ];
Widget buildHeaderBanner() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _pillTag(
                  'Bridal Peak Season Active',
                  AppColors.chipPeach,
                  AppColors.primaryBrick,
                ),
                const SizedBox(width: 8),
                Text('• Autumn Couture Roster', style: AppTextStyles.caption),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Artisan Command Center —\nSalaam, Basith',
              style: AppTextStyles.heading,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: AppTextStyles.body,
                children: const [
                  TextSpan(text: 'You have '),
                  TextSpan(
                    text: '3 bridal appointments',
                    style: AppTextStyles.bodyStrong,
                  ),
                  TextSpan(text: ' scheduled this week and '),
                  TextSpan(
                    text: '14 organic cone orders',
                    style: AppTextStyles.bodyStrong,
                  ),
                  TextSpan(text: ' pending fresh cold-pack dispatch.'),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: 16),
      OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.inventory_2_outlined, size: 16),
        label: const Text('Add Product'),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      const SizedBox(width: 10),
      ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.calendar_month_outlined, size: 16),
        label: const Text('New Booking'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBrick,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}

Widget _pillTag(String label, Color bg, Color fg) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg),
    ),
  );
}

Widget buildStatsRow(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final bool isWide = constraints.maxWidth > 900;
      if (isWide) {
        return Row(
          children: stats
              .map(
                (s) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: StatCard(data: s),
                  ),
                ),
              )
              .toList(),
        );
      }
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: stats
            .map((s) => SizedBox(width: 260, child: StatCard(data: s)))
            .toList(),
      );
    },
  );
}

Widget buildMainContentRow(BuildContext context) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final bool isWide = constraints.maxWidth > 1000;

      final leftColumn = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RevenueChartCard(),
          const SizedBox(height: 18),
          BookingListWidget(bookings: _bookings),
          const SizedBox(height: 18),
          const ApothecaryHighlightWidget(
            tag: 'APOTHECARY HIGHLIGHT',
            title: 'Rajasthani Triple-Sifted Organic Cones',
            description: 'Hand-blended with therapeutic Bulgarian Lavender & Cajeput essential oils. Cold-shipped weekly on ice.',
            price: '\$32.00 / 3-pack',
            soldNote: '42 packs shipped this month',
          ),
        ],
      );

      final rightColumn = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScheduleWidget(dateLabel: 'Nov 13, 2025', items: scheduleItems),
          const SizedBox(height: 18),
          const StockAlertWidget(alerts: _stockAlerts),
          const SizedBox(height: 18),
          const ConeOrdersWidget(pendingCount: 14, orders: _coneOrders),
          const SizedBox(height: 18),
          const TestimonialWidget(
            rating: 5,
            quote: "Basith's artistry made my bridal morning an oasis of calm. The stain reached a breathtaking deep mahogany tone within 36 hours!",
            authorName: 'Fatima Zahra',
            authorSubtitle: 'Verified Bride • London',
            authorInitials: 'FZ',
          ),
        ],
      );

      if (isWide) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: leftColumn),
            const SizedBox(width: 18),
            Expanded(flex: 1, child: rightColumn),
          ],
        );
      }

      return Column(
        children: [leftColumn, const SizedBox(height: 18), rightColumn],
      );
    },
  );
}

class AdminPanelWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        buildHeaderBanner(),
        const SizedBox(height: 22),
        buildStatsRow(context),
        const SizedBox(height: 22),
        buildMainContentRow(context),
      ],
    );
  }
}
//  bars: chartBars,
//             bigValue: '\$7,420.00',
//             periodLabel: 'This Week',
//             peakNote: 'Peak Artistry Period: Friday & Saturday Mehndi Evenings',
//             avgOrderNote: 'Average Order Value: \$156.30',
