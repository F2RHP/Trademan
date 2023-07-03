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
   var btnText="ADD".obs;
   late ExpenseDetails details;
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
    // if(expenseType.isNotEmpty) {
    //   dropDownExpenseType=expenseType.value.first;
    // }
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

   Future<bool> saveExpenseDetail() async{
// ignore: unrelated_type_equality_checks
//var typeId=expenseType.firstWhere((element) => element.expenseName==dropDownExpenseType).expenseTypeID!;
 details=ExpenseDetails(
  expenseName:nameController.text,
expenseDescription: detailsController.text ,
expenseTypeId: dropDownExpenseType.expenseTypeID,
expenseTypeName: dropDownExpenseType.expenseName!,
expenseCost:double.parse(costController.text),
expenseDate:DateTime.parse(dateController.text) ,
expenseID: 0

);
var isInserted=await expenseService.saveExpense(details);
  if (isInserted) {
      
      bool isRegistered = GetInstance().isRegistered<ListExpenseCtrl>();
      if (isRegistered) {
        var listCustomerCtrl = Get.find<ListExpenseCtrl>();
        listCustomerCtrl.expenseList();
        
      
      }
    }

    return isInserted;
  }


}
