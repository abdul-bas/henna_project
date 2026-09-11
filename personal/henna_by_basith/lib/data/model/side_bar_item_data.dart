

import 'package:flutter/widgets.dart';

class SidebarItemData {
  final IconData icon;
  final String label;
  final int? badgeCount;
  final bool badgeIsDot;

  const SidebarItemData({
    required this.icon,
    required this.label,
    this.badgeCount,
    this.badgeIsDot = false,
  });
}