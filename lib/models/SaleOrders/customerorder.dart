class CustomerOrder {
  int customerId;
  String customerName;
  String customerNickname;
  String contactNumber;
  int orderId;
  DateTime orderDate;
  double totalCost;
  double totalSellingAmount;
  double pendingAmount;
  double customerGiven;
  String orderStatusName;

  CustomerOrder({
    required this.customerId,
    required this.customerName,
    required this.customerNickname,
    required this.contactNumber,
    required this.orderId,
    required this.orderDate,
    required this.totalCost,
    required this.totalSellingAmount,
    required this.pendingAmount,
    required this.customerGiven,
    required this.orderStatusName,
  });

  factory CustomerOrder.fromMap(Map<String, dynamic> map) {
    return CustomerOrder(
      customerId: map['customerId'],
      customerName: map['customerName'],
      customerNickname: map['customerNickname'],
      contactNumber: map['contactNumber'],
      orderId: map['orderId'],
      orderDate: DateTime.parse(map['orderDate']),
      totalCost: map['totalCost'].toDouble(),
      totalSellingAmount: map['totalSellingAmount'].toDouble(),
      pendingAmount: map['pendingAmount'].toDouble(),
      customerGiven: map['customerGiven'].toDouble(),
      orderStatusName: map['orderStatusName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'customerNickname': customerNickname,
      'contactNumber': contactNumber,
      'orderId': orderId,
      'orderDate': orderDate.toIso8601String(),
      'totalCost': totalCost,
      'totalSellingAmount': totalSellingAmount,
      'pendingAmount': pendingAmount,
      'customerGiven': customerGiven,
      'orderStatusName': orderStatusName,
    };
  }
}
