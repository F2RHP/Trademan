import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';
import '../../controllers/Expense/add_expense_controller.dart';
import '../../controllers/Expense/list_expense_controller.dart';
import '../../models/expense/expensedetails.dart';
import '../../models/expense/expensetype.dart';
import 'expense_list.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final ctrl = Get.put(AddExpenseCtrl());
  ExpenseDetails? arguments = Get.arguments as ExpenseDetails?;

  @override
  void initState() {
    if(arguments!=null)
    {
      ctrl.btnText.value="Edit";
      ctrl.passExpensevalue(arguments);
    }
    else
    {
      ctrl.btnText.value="Save";
    }
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
      body: Obx(() => Padding(
            padding: CustomPadding.padding15,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildInputFiled(),
                  CustomBtn(
                    label: ctrl.btnText.value,
                    action: ()  {
                     saveAndNavigate();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
Future<void> saveAndNavigate() async {
  if (await ctrl.saveExpenseDetail() > 0) {
    String msg = ctrl.btnText.value;
    Get.snackbar("Information", '$msg successfully',
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));

    bool isRegistered = GetInstance().isRegistered<ListExpenseCtrl>();
    if (isRegistered) {
      var listCustomerCtrl = Get.find<ListExpenseCtrl>();
      await listCustomerCtrl.loadExpenseList();
      navigateBack();
    }
  }
}

void navigateBack() {
  Get.off(ExpenseList());
}
  Widget buildInputFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleWithTextFormField(
          controller: ctrl.nameController,
          titleText: AppStrings.Expense_Name,
          hintText: AppStrings.Expense_Name,
        ),
        TitleWithTextFormField(
          controller: ctrl.detailsController,
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
        // loadDropdown(),

        DropdownButtonFormField<int>(
          value: ctrl.dropDownExpenseType,
          onChanged: (newValue) {
            setState(() {
              ctrl.dropDownExpenseType = newValue!;
            });
          },
          items: ctrl.expenseType.map((expenseType) {
            return DropdownMenuItem<int>(
              value: expenseType.expenseTypeID,
              child: Text(expenseType.expenseName!),
            );
          }).toList(),
          decoration: dropDownDecoration(),
        ),

        AppSizedBox.sizedBoxH25,
        TitleWithTextFormField(
          readOnly: true,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
            ).then((value) {
              ctrl.dateController.text =
                  DateFormat('yyyy-MM-dd').format(value!);
            });
          },
          titleText: AppStrings.ExpenseDate,
          hintText: AppStrings.ExpenseDate,
          controller: ctrl.dateController,
        ),
        // TitleWithTextFormField(
        //   controller: ctrl.dateController,
        //   titleText: AppStrings.Data,
        //   hintText: AppStrings.DataType,
        // ),
        TitleWithTextFormField(
          type: TextInputType.number,
          controller: ctrl.costController,
          titleText: AppStrings.Cost,
          hintText: AppStrings.Cost,
        ),
      ],
    );
  }

  DropdownButtonFormField<int> loadDropdown() {
    var dropdownButtonFormField = DropdownButtonFormField<int>(
      value: ctrl.dropDownExpenseType,
      items: ctrl.expenseType
          .map((label) => DropdownMenuItem<int>(
                value: label.expenseTypeID,
                child: Text(label.expenseName!),
              ))
          .toList(),
      hint: const Text('ExpenseType'),
      onChanged: (newValue) {
        setState(() {
          ctrl.dropDownExpenseType = newValue!;
        });
      },
      decoration: dropDownDecoration(),
    );
    return dropdownButtonFormField;
  }


}
