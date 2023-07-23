import 'package:trader_app/services/servicebase.dart';

import '../models/utility/utility_models.dart';

// ignore: camel_case_types
class utilityService extends BaseService
{
Future<List<ExpenseTypeModel>> getMockExpenseTypes() async {
  return [
    ExpenseTypeModel(
      expenseTypeId: 1,
      name: "Expense Type 1",
      notes: "Expense Type 1 Notes",
    ),
    ExpenseTypeModel(
      expenseTypeId: 2,
      name: "Expense Type 2",
      notes: "Expense Type 2 Notes",
    ),
    // Add more expense types as needed
  ];
}

Future<List<QuantityTypeModel>> getMockQuantityTypes() async {
  return [
    QuantityTypeModel(
      quantityTypeId: 1,
      quantityTypeName: "KG",
      quantityTypeNotes: "KG",
    ),
    QuantityTypeModel(
      quantityTypeId: 2,
      quantityTypeName: "PACK",
      quantityTypeNotes: "PACK",
    ),
    // Add more quantity types as needed
  ];
}

Future<List<ProductTypeModel>> getMockProductTypes() async {
  return [
    ProductTypeModel(
      productTypeId: 1,
      name: "RICE",
      notes: "RICE",
    ),
    ProductTypeModel(
      productTypeId: 2,
      name: "GOODS",
      notes: "GOODS",
    ),
    // Add more product types as needed
  ];
}

Future<List<SaleTransactionTypeModel>> getMockSaleTransactionTypes() async {
  return [
    SaleTransactionTypeModel(
      saleTransactionId: 1,
      name: "Sale Transaction Type 1",
      notes: "Sale Transaction Type 1 Notes",
    ),
    SaleTransactionTypeModel(
      saleTransactionId: 2,
      name: "Sale Transaction Type 2",
      notes: "Sale Transaction Type 2 Notes",
    ),
    // Add more sale transaction types as needed
  ];
}

Future<List<TransactionTypeModel>> getMockTransactionTypes() async {
  return [
    TransactionTypeModel(
      transactionTypeId: 1,
      transactionTypeName: "Transaction Type 1",
    ),
    TransactionTypeModel(
      transactionTypeId: 2,
      transactionTypeName: "Transaction Type 2",
    ),
    // Add more transaction types as needed
  ];
}

}