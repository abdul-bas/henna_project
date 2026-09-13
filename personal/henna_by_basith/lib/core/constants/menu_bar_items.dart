
 import 'package:flutter/material.dart';
import 'package:henna_by_basith/data/model/side_bar_item_data.dart';
import 'package:henna_by_basith/features/dashboard/view/booking_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/customers.dart';
import 'package:henna_by_basith/features/dashboard/view/dashboard_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/notifications_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/orders_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/product_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/reviews_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/services.dart';
import 'package:henna_by_basith/features/dashboard/view/settings_screen.dart';
const sideBarItems = [
  SidebarItemData(
    icon: Icons.grid_view_rounded,
    label: 'AdminPanel',
    route: AdminPanelWidget(),
  ),
  SidebarItemData(
    icon: Icons.spa_outlined,
    label: 'Services',
    route:ServicesScreen() ,
  ),
  SidebarItemData(
    icon: Icons.inventory_2_outlined,
    label: 'Products',
    route: AddProductScreen(),
  ),
  SidebarItemData(
    icon: Icons.event_note_outlined,
    label: 'Bookings',
    route: BookingScreen(),
    badgeCount: 3,
  ),
  SidebarItemData(
    icon: Icons.receipt_long_outlined,
    label: 'Orders',
    route: OrdersScreen(),
    badgeCount: 5,
  ),
  SidebarItemData(
    icon: Icons.people_outline,
    label: 'Customers',
    route:CustomersScreen(),
  ),
  SidebarItemData(
    icon: Icons.star_border_rounded,
    label: 'Reviews',
    route:ReviewsScreen(),
  ),
  SidebarItemData(
    icon: Icons.notifications_none_rounded,
    label: 'Notifications',
    route: NotificationsScreen(),
    badgeIsDot: true,
  ),
  SidebarItemData(
    icon: Icons.settings_outlined,
    label: 'Settings',
    route: SettingsScreen(),
  ),
];