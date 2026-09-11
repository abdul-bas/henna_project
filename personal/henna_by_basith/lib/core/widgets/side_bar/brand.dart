
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';

class SideBarBrand extends StatelessWidget {
  const SideBarBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.inkGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.eco_outlined, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Henna by Basith', style: Theme.of(context).textTheme.titleMedium),
            Text('Luxury Atelier & Apothecary', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}