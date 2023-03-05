import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/Expense_model/add_expense_model.dart';

class AddExpenseCtrl extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController costController = TextEditingController();

  AddExpenseModel? addExpenseModel;

  bool expenseValidate() {
    if (nameController.text.isEmpty ||
        detailsController.text.isEmpty ||
        categoryController.text.isEmpty ||
        dataController.text.isEmpty ||
        costController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      addExpenseModel = AddExpenseModel(
        name: nameController.text,
        details: detailsController.text,
        category: categoryController.text,
        data: dataController.text,
        cost: costController.text,
      );
      return true;
    }
  }

  @override
  void onClose() {
if(addExpenseModel !=null){
  nameController.clear();
  detailsController.clear();
  categoryController.clear();
  dataController.clear();
  costController.clear();
}
    super.onClose();
  }
}
