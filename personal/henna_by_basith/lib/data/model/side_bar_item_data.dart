

import 'package:flutter/widgets.dart';
class SidebarItemData {
  final IconData icon;
  final String label;
  final Widget route;
  final int? badgeCount;
  final bool badgeIsDot;

  const SidebarItemData({
    required this.icon,
    required this.label,
    required this.route,
    this.badgeCount,
    this.badgeIsDot = false,
  });
}