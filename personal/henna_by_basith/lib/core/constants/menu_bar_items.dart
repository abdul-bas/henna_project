
 import 'package:flutter/material.dart';
import 'package:henna_by_basith/data/model/side_bar_item_data.dart';

  const sideBarItems = [
    SidebarItemData(icon: Icons.spa_outlined, label: 'Services'),
    SidebarItemData(icon: Icons.grid_view_rounded, label: 'Dashboard'),
    SidebarItemData(icon: Icons.inventory_2_outlined, label: 'Products'),
    SidebarItemData(icon: Icons.event_note_outlined, label: 'Bookings', badgeCount: 3),
    SidebarItemData(icon: Icons.receipt_long_outlined, label: 'Orders', badgeCount: 5),
    SidebarItemData(icon: Icons.people_outline, label: 'Customers'),
    SidebarItemData(icon: Icons.star_border_rounded, label: 'Reviews'),
    SidebarItemData(icon: Icons.notifications_none_rounded, label: 'Notifications', badgeIsDot: true),
    SidebarItemData(icon: Icons.settings_outlined, label: 'Settings'),
  ];