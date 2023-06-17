import 'package:trader_app/models/expense/expensetype.dart';
import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

import '../models/expense/expensedetails.dart';

class ExpenseService extends BaseService {
  Future<List<ExpenseDetails>> getAllListExpenses() async {
    try {
      return expenseDetailsList;
      var response = await get<List<dynamic>>(ServiceHelper.listExpenses);
      List<ExpenseDetails> expenseList = response
          .map((mapElement) => ExpenseDetails.fromMap(mapElement))
          .toList();

      return expenseList;
    } catch (e) {
      return <ExpenseDetails>[];
    }
  }

  Future<List<ExpenseType>> getAllListExpensesType() async {
    try {
      return ExpenseType().expenseList;

      var response = await get<List<dynamic>>(ServiceHelper.listExpenses);
      List<ExpenseType> expenseList = response
          .map((mapElement) => ExpenseType.fromMap(mapElement))
          .toList();

      return expenseList;
    } catch (e) {
      return <ExpenseType>[];
    }
  }

  List<ExpenseDetails> expenseDetailsList = [
    ExpenseDetails(
      expenseID: 1,
      expenseName: 'Lunch',
      expenseDescription: 'Lunch',
      expenseTypeId: 1,
      expenseTypeName: 'Food',
      expenseDate: DateTime(2023, 6, 1),
      expenseCost: 15.99,
    ),
    ExpenseDetails(
      expenseID: 2,
      expenseName: 'Lunch',
      expenseDescription: 'Gas',
      expenseTypeId: 2,
      expenseTypeName: 'Transportation',
      expenseDate: DateTime(2023, 6, 5),
      expenseCost: 40.25,
    ),
    ExpenseDetails(
      expenseID: 3,
      expenseName: 'Lunch',
      expenseDescription: 'Movie tickets',
      expenseTypeId: 3,
      expenseTypeName: 'Entertainment',
      expenseDate: DateTime(2023, 6, 10),
      expenseCost: 25.50,
    ),
    // Add more ExpenseDetails objects here for further testing
  ];

  void saveExpense(ExpenseDetails details) {}
}
