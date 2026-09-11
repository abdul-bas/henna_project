class OrderModel {
  final String buyerAndOrderId;
  final String itemsSummary;
  final String price;
  final String statusTag;
  final String deliverySpeed;
 
  const OrderModel({
    required this.buyerAndOrderId,
    required this.itemsSummary,
    required this.price,
    required this.statusTag,
    required this.deliverySpeed,
  });
}