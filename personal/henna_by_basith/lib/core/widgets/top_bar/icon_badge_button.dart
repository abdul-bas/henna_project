
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';

class TopBarIconBadgeButton extends StatelessWidget {
  final IconData icon;
  final bool hasDot;
  final VoidCallback onTap;

  const TopBarIconBadgeButton({super.key, required this.icon, required this.hasDot, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.divider),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, size: 19, color: AppColors.textSecondary),
            if (hasDot)
              Positioned(
                top: 10,
                right: 11,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(color: AppColors.brick, shape: BoxShape.circle),
                ),
              ),
          ],
        ),
      ),
    );
  }
}