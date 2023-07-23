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
      quantityTypeId: map['QuantityTypeId'],
      quantityTypeName: map['QuantityTypeName'],
      quantityTypeNotes: map['QuantityTypeNotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'QuantityTypeId': quantityTypeId,
      'QuantityTypeName': quantityTypeName,
      'QuantityTypeNotes': quantityTypeNotes,
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
      productTypeId: map['ProductTypeId'],
      name: map['Name'],
      notes: map['Notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ProductTypeId': productTypeId,
      'Name': name,
      'Notes': notes,
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
      saleTransactionId: map['SaleTransactionId'],
      name: map['Name'],
      notes: map['Notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SaleTransactionId': saleTransactionId,
      'Name': name,
      'Notes': notes,
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
      transactionTypeId: map['TransactionTypeId'],
      transactionTypeName: map['TransactionTypeName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TransactionTypeId': transactionTypeId,
      'TransactionTypeName': transactionTypeName,
    };
  }
}
