import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/constants/menu_bar_items.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/core/widgets/side_bar/brand.dart';
import 'package:henna_by_basith/core/widgets/side_bar/profile_footer.dart';
import 'package:henna_by_basith/core/widgets/side_bar/reserve_button.dart';
import 'package:henna_by_basith/core/widgets/side_bar/side_bar_tile.dart';
import 'package:henna_by_basith/features/bookings/view_model/dashboard_view_model.dart';
import 'package:provider/provider.dart';


class SidebarWidget extends StatelessWidget {
  final int activeIndex;
 

  const SidebarWidget({super.key, this.activeIndex = 1, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SideBarBrand(),
          const SizedBox(height: 20),
           SideBarReserveButton(),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount:   sideBarItems.length,
              separatorBuilder: (_, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = sideBarItems[index];
                final bool isDashboardHighlighted = index == activeIndex;
                return SidebarTile(
                 data: item,
                  selected: isDashboardHighlighted,
                  onTap: () => context.read<DashboardViewModel>().selectSidebarIndex(index),
                );
              },
            ),
          ),
          const Divider(color: AppColors.border, height: 24),
        SideBarProfileFooter(),
          const SizedBox(height: 12),
          SideBarReserveButton(),
        ],
      ),
    );
  }
}
