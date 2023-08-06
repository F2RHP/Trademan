class ExpenseTypeModel {
  int? expenseTypeId;
  String? name;
  String? notes;

  ExpenseTypeModel({
    this.expenseTypeId,
    this.name,
    this.notes,
  });

  factory ExpenseTypeModel.fromMap(Map<String, dynamic> map) {
    return ExpenseTypeModel(
      expenseTypeId: map['ExpenseTypeId'],
      name: map['Name'],
      notes: map['Notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ExpenseTypeId': expenseTypeId,
      'Name': name,
      'Notes': notes,
    };
  }
}

class QuantityTypeModel {
  int? quantityTypeId;
  String? quantityTypeName;
  String? quantityTypeNotes;

  QuantityTypeModel({
    this.quantityTypeId,
    this.quantityTypeName,
    this.quantityTypeNotes,
  });

  factory QuantityTypeModel.fromMap(Map<String, dynamic> map) {
    return QuantityTypeModel(
      quantityTypeId: map['quantityTypeId'],
      quantityTypeName: map['quantityTypeName'],
      quantityTypeNotes: map['quantityTypeNotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantityTypeId': quantityTypeId,
      'quantityTypeName': quantityTypeName,
      'quantityTypeNotes': quantityTypeNotes,
    };
  }
}

class ProductTypeModel {
  int? productTypeId;
  String? name;
  String? notes;

  ProductTypeModel({
    this.productTypeId,
    this.name,
    this.notes,
  });

  factory ProductTypeModel.fromMap(Map<String, dynamic> map) {
    return ProductTypeModel(
      productTypeId: map['productTypeId'],
      name: map['name'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productTypeId': productTypeId,
      'name': name,
      'notes': notes,
    };
  }


}

class SaleTransactionTypeModel {
  int? saleTransactionId;
  String? name;
  String? notes;

  SaleTransactionTypeModel({
    this.saleTransactionId,
    this.name,
    this.notes,
  });

  factory SaleTransactionTypeModel.fromMap(Map<String, dynamic> map) {
    return SaleTransactionTypeModel(
      saleTransactionId: map['saleTransactionId'],
      name: map['name'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'saleTransactionId': saleTransactionId,
      'name': name,
      'notes': notes,
    };
  }
}

class TransactionTypeModel {
  int? transactionTypeId;
  String? transactionTypeName;

  TransactionTypeModel({
    this.transactionTypeId,
    this.transactionTypeName,
  });

  factory TransactionTypeModel.fromMap(Map<String, dynamic> map) {
    return TransactionTypeModel(
      transactionTypeId: map['transactionTypeId'],
      transactionTypeName: map['transactionTypeName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactionTypeId': transactionTypeId,
      'transactionTypeName': transactionTypeName,
    };
  }
}
