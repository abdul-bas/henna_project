
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';

class SideBarReserveButton extends StatelessWidget {
  const SideBarReserveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.calendar_month_outlined, size: 16),
        label: const Text('Reserve Bridal Date'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brick,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
