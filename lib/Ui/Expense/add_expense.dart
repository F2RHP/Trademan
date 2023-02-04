import 'package:flutter/material.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/color_code.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 40.0,
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: CustomPadding.padding15,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const Text(
                AppStrings.Expense_Name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const AppTextFormFiled(
                autoValidator: true,
                hintText: 'Example',
                errorText: 'enter value',
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: const Text('Click'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
