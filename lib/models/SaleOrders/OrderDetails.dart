class OrderDetail {
  int orderDetailId;
  int orderId;
  String productName;
  int quantity;

  OrderDetail({
    required this.orderDetailId,
    required this.orderId,
    required this.productName,
    required this.quantity,
  });

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      orderDetailId: map['orderDetailId'],
      orderId: map['orderId'],
      productName: map['productName'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderDetailId': orderDetailId,
      'orderId': orderId,
      'productName': productName,
      'quantity': quantity,
    };
  }
}
