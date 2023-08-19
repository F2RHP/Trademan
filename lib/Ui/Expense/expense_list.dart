import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Expense/add_expense.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

import '../../controllers/Expense/list_expense_controller.dart';
import '../../models/expense/expensedetails.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({Key? key}) : super(key: key);

  final ctrl = Get.put(ListExpenseCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() => ctrl.isLoading.value || ctrl.expenseList.isEmpty 
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildButtonRow(context),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: ctrl.expenseList.length,
                      itemBuilder: (context, index) =>
                          expenseDetail(ctrl.expenseList[index])),
                ],
              ),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ctrl.addnewExpense();
        },
        child: Icon(
          Icons.add,
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String selectedDateRange = 'Today';
      String selectedName = 'John';

      return AlertDialog(
        title:const Text('Select Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Date Range:'),
            ListTile(
              title: Text('Today'),
              onTap: () {
                selectedDateRange = 'Today';
                Navigator.of(context).pop(selectedDateRange);
              },
            ),
            ListTile(
              title: Text('Last Week'),
              onTap: () {
                selectedDateRange = 'Last Week';
                Navigator.of(context).pop(selectedDateRange);
              },
            ),
            ListTile(
              title: Text('Last Month'),
              onTap: () {
                selectedDateRange = 'Last Month';
                Navigator.of(context).pop(selectedDateRange);
              },
            ),
            SizedBox(height: 20),
            Text('Select Name:'),
            DropdownButton<String>(
              value: selectedName,
              onChanged: (value) {
                selectedName = value!;
                Navigator.of(context).pop(selectedName);
              },
              items: ['John', 'Jane', 'Alice', 'Bob'].map((String name) {
                return DropdownMenuItem<String>(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child:const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(selectedDateRange); // Close the dialog and return the selected values
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      );
    },
  );
}


 Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (){_showDialog(context);},
          child: const Text('Filter'),
        ),
       const SizedBox(width: 20), // Adding space between buttons
        ElevatedButton(
          onPressed: (){},
          child: const Text('Clear'),
        ),
      ],
    );
  }



  topWidgets() {
    //  AppSizedBox.sizedBoxH8,
    //                   const KPRTraders(),
    //                   AppSizedBox.sizedBoxH15,
    //                   ElevatedButton.icon(
    //                     onPressed: () {
    //                       showDialog(
    //                         context: context,
    //                         builder: (context) => popIpContent(context),
    //                       );
    //                     },
    //                     icon: Padding(
    //                       padding: const EdgeInsets.symmetric(vertical: 10.0),
    //                       child: Icon(
    //                         Icons.filter_list_alt,
    //                         color: AppColors.kSecondaryColor,
    //                       ),
    //                     ),
    //                     label: Text(
    //                       AppStrings.Filter_Expense,
    //                       style: TextStyle(
    //                         fontSize: 16.0,
    //                         color: AppColors.kSecondaryColor,
    //                       ),
    //                     ),
    //                   ),
    //                   AppSizedBox.sizedBoxH15,
    //                   const Text('1 Expense (1999-01-01 To2023-02-04)'),
    //                   AppSizedBox.sizedBoxH15,
    //                   const AppTextFormFiled(
    //                     hintText: 'Search..',
    //                     autoValidator: true,
    //                   ),
    //                   AppSizedBox.sizedBoxH15,
  }

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
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
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(
                ()=>const AddExpense(),
            );
          },
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
        AppSizedBox.sizedBoxW10,
      ],
      centerTitle: true,
      title: Text(
        AppStrings.Expense,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }

//expense
  Widget expenseDetail(ExpenseDetails item) {
    return Padding(
      padding: CustomPadding.padding10,
      child: GestureDetector(
        onTap: () => {
          //Get.to(DestinationScreen(), arguments: ExpenseArguments(name, amount));
          Get.to(const AddExpense(),arguments:item)
          },
        child: Container(
          padding: CustomPadding.padding18,
          decoration: BoxDecoration(
            borderRadius: CustomBorderRadius.borderRadius8,
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.expenseName!),
              AppSizedBox.sizedBoxH15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.expenseDescription.toString()),
                  Text(
                    item.expenseCost.toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              AppSizedBox.sizedBoxH15,
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.yellowDark,
                      borderRadius: CustomBorderRadius.borderRadius13,
                    ),
                    child: Text(
                      item.expenseTypeName.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AppSizedBox.sizedBoxW10,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: CustomBorderRadius.borderRadius13,
                    ),
                    child: Text(
                      item.expenseDate.toString(),
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              AppSizedBox.sizedBoxH15,
            ],
          ),
        ),
      ),
    );
  }

//content
  Widget popIpContent(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: CustomPadding.padding18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.Expense,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.clear)),
              ],
            ),
          ),
          AppSizedBox.sizedBoxH10,
          Divider(),
          AppSizedBox.sizedBoxH10,
        ],
      ),
    );
  }
}
