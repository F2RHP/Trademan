class Customer {
  int customerId;
  String name;
  String email;

  Customer({required this.customerId, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'name': name,
      'email': email,
    };
  }
}

class OrderDetail {
  int productId;
  double productPrice;
  double sellingPrice;
  int quantity;

  OrderDetail({
    required this.productId,
    required this.productPrice,
    required this.sellingPrice,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productPrice': productPrice,
      'sellingPrice': sellingPrice,
      'quantity': quantity,
    };
  }
}

class OrderDetails {
  List<OrderDetail> orderDetail;

  OrderDetails({required this.orderDetail});

  Map<String, dynamic> toJson() {
    return {
      "orderDetail": orderDetail.map((detail) => detail.toJson()).toList(),
    };
  }
}

class CustomerOrder {
  DateTime orderDate;
  int isBuyOrder;
  String orderNotes;
  OrderDetails orderDetails;
  double customerGiven;

  CustomerOrder({
    required this.orderDate,
    required this.isBuyOrder,
    required this.orderNotes,
    required this.orderDetails,
    required this.customerGiven,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderDate': orderDate.toIso8601String(),
      'isBuyOrder': isBuyOrder,
      'orderNotes': orderNotes,
      'orderDetails': orderDetails.toJson(),
      'customerGiven': customerGiven,
    };
  }
}

class ProductOrder {
  Customer customer;
  CustomerOrder customerOrder;

  ProductOrder({required this.customer, required this.customerOrder});

  Map<String, dynamic> toJson() {
    return {
      'customer': customer.toJson(),
      'customerOrder': customerOrder.toJson(),
    };
  }
}

