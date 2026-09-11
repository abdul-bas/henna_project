

import 'dart:ui';

class ConeOrderData {
  final String clientAndOrderId;
  final String itemsDescription;
  final String price;
  final String priceNote;
  final String tag;
  final Color tagColor;
  final Color tagBg;

  const ConeOrderData({
    required this.clientAndOrderId,
    required this.itemsDescription,
    required this.price,
    required this.priceNote,
    required this.tag,
    required this.tagColor,
    required this.tagBg,
  });
}