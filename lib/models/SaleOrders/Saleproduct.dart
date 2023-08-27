class SaleProduct {
  int sno;
  int productId;
  String productName;
  int quantity;
  double productPrice;
  double sellingPrice;
  double total;

  SaleProduct({
    required this.sno,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.productPrice,
    required this.sellingPrice,
    required this.total,
  });

  factory SaleProduct.fromMap(Map<String, dynamic> map) {
    return SaleProduct(
      sno: map['sno'],
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      productPrice: map['productPrice'],
      sellingPrice: map['sellingPrice'],
      total: map['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sno': sno,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'productPrice': productPrice,
      'sellingPrice': sellingPrice,
      'total': total,
    };
  }
}