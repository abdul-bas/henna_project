
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';

class SideBarProfileFooter extends StatelessWidget {
  const SideBarProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 16, backgroundColor: AppColors.divider, child: Icon(Icons.person, size: 16, color: AppColors.textSecondary)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Basith Al-Khatib', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                Text('Master Artisan • Online', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Icon(Icons.help_outline, size: 15, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Text('Artisan Help', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.logout, size: 15, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Text('Log Out', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}