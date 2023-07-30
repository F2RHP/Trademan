import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/Expense/list_expense_controller.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/expense/expensedetails.dart';
import 'package:trader_app/models/expense/expensetype.dart';
import 'package:trader_app/services/expenseservice.dart';

class AddExpenseCtrl extends BaseController {

late ExpenseService expenseService;
   var btnText="Save".obs;

int expenseID=0;
   var expenseType = <ExpenseType>[].obs;
 
   var dropDownExpenseType=null;

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController costController = TextEditingController();



@override
  void onInit() async{
    isLoading.value=true;
    expenseService=ExpenseService();
    expenseType.value= await expenseService.getAllListExpensesType();
    // TODO: implement onInit
    super.onInit();

    isLoading.value=false;

  }


  bool expenseValidate() {
    if (nameController.text.isEmpty ||
        dateController.text.isEmpty ||
        costController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } 

    return true;
  }

  @override
  void onClose() {

  nameController.clear();
  detailsController.clear();
  dateController.clear();
  costController.clear();

    super.onClose();
  }

   Future<int> saveExpenseDetail() async{
ExpenseDetails details = ExpenseDetails(
    expenseName: nameController.text,
    expenseDescription: detailsController.text,
    expenseTypeId: dropDownExpenseType,
    expenseTypeName: "",
    expenseCost: double.parse(costController.text),
    expenseDate: DateTime.parse(dateController.text),
    expenseID: expenseID,
  );

  int savedValue = await expenseService.saveExpense(details);
  return savedValue;


  
   }

  // Function to get ExpenseType by expenseTypeId
ExpenseType getExpenseTypeById(int expenseTypeId) {
  return expenseType.value.firstWhere(
    (expenseType) => expenseType.expenseTypeID == expenseTypeId,
  );
}

  void passExpensevalue(ExpenseDetails? details) {
  nameController.text = details?.expenseName ?? '';
  detailsController.text = details?.expenseDescription ?? '';
  
  // Assuming dropDownExpenseType is of the same type as the ExpenseType in ExpenseDetails
  dropDownExpenseType =details?.expenseTypeId??0;

  costController.text = details?.expenseCost.toString() ?? '';
  dateController.text = details?.expenseDate.toString() ?? '';
  expenseID=details?.expenseID??0;
}






}
