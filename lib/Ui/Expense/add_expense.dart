import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Expense/expense_list.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';

import '../../controllers/Expense/add_expense_controller.dart';
import '../../models/expense/expensetype.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {


  final ctrl = Get.put(AddExpenseCtrl());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 40.0,
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.Add_Expense,
          style: TextStyle(
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: CustomPadding.padding15,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildInputFiled(),
              CustomBtn(
                label: 'save',
                action: () {
                 ctrl.saveExpenseDetail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         TitleWithTextFormField(controller: ctrl.nameController,
          titleText: AppStrings.Expense_Name,
          hintText: AppStrings.Expense_Name,
        ),
         TitleWithTextFormField(controller: ctrl.detailsController,
          titleText: AppStrings.Expense_Details,
          hintText: AppStrings.Expense_Details,
          maxLines: 5,
        ),
         Text(
          AppStrings.Category,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        AppSizedBox.sizedBoxH15,
        DropdownButtonFormField<ExpenseType>(
          value: ctrl.dropDownExpenseType,
          items: ctrl.expenseType
              .map((label) => DropdownMenuItem<ExpenseType>(
                    value: label,
                    child: Text(label.expenseName!),
                  ))
              .toList(),
          hint: const Text('ExpenseType'),
          onChanged: (ExpenseType? newValue) {
            setState(() {
              ctrl.dropDownExpenseType = newValue!;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: CustomBorderRadius.borderRadius8,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: CustomBorderRadius.borderRadius8,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: CustomBorderRadius.borderRadius8,
              borderSide: BorderSide(
                color: AppColors.grey,
              ),
            ),
            fillColor: AppColors.kSecondaryColor,
            filled: true,
          ),
        ),
        AppSizedBox.sizedBoxH25,
         TitleWithTextFormField(controller: ctrl.dateController,
          titleText: AppStrings.Data,
          hintText: AppStrings.DataType,
        ),
         TitleWithTextFormField(controller: ctrl.costController,
          titleText: AppStrings.Cost,
          hintText: AppStrings.Cost,
        ),
      ],
    );
  }
}
