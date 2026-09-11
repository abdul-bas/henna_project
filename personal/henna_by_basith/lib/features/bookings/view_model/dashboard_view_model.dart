import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/enum/chart_filter.dart';

class DashboardViewModel extends ChangeNotifier {
  ChartFilter _chartFilter = ChartFilter.allRevenue;
  int _selectedSidebarIndex = 1; 

  ChartFilter get chartFilter => _chartFilter;
  int get selectedSidebarIndex => _selectedSidebarIndex;

  void selectChartFilter(ChartFilter filter) {
    if (_chartFilter == filter) return;
    _chartFilter = filter;
    notifyListeners();
  }

  void selectSidebarIndex(int index) {
    if (_selectedSidebarIndex == index) return;
    _selectedSidebarIndex = index;
    notifyListeners();
  }
}