import 'package:flutter/material.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Expense/expense_list.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/custom_btn.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<String> list = ['A', 'B'];
  var dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildInputFiled(),
                CustomBtn(
                  label: 'save',
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExpenseList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleWithTextFormField(titleText: AppStrings.Expense_Name,hintText: AppStrings.Expense_Name,),
        const TitleWithTextFormField(titleText: AppStrings.Expense_Details,hintText: AppStrings.Expense_Details,maxLines: 5,),
        const Text(
          AppStrings.Category,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        AppSizedBox.sizedBoxH15,
        DropdownButtonFormField(
          value: dropDownValue,
          items: list
              .map((label) => DropdownMenuItem(
            value: label,
            child: Text(label.toString()),
          ))
              .toList(),
          hint: const Text('Product'),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
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
        const TitleWithTextFormField(titleText: AppStrings.type_your_Category,hintText: AppStrings.type_your_Category,),
        const TitleWithTextFormField(titleText: AppStrings.Data,hintText: AppStrings.DataType,),
        const TitleWithTextFormField(titleText: AppStrings.Cost,hintText: AppStrings.Cost,),
      ],
    );
  }
}
