
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/data/model/side_bar_item_data.dart';

class SidebarTile extends StatelessWidget {
  final SidebarItemData data;
  final bool selected;
  final VoidCallback onTap;

  const SidebarTile({super.key, required this.data, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final fg = selected ? Colors.white : AppColors.textPrimary;
    return Material(
      color: selected ? AppColors.inkGreen : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          child: Row(
            children: [
              Icon(data.icon, size: 18, color: fg),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  data.label,
                  style: TextStyle(color: fg, fontSize: 13.5, fontWeight: FontWeight.w500),
                ),
              ),
              if (data.badgeCount != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white24 : AppColors.pendingBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${data.badgeCount}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : AppColors.pendingText,
                    ),
                  ),
                ),
              if (data.badgeIsDot)
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(color: AppColors.brick, shape: BoxShape.circle),
                ),
            ],
          ),
        ),
      ),
    );
  }
}