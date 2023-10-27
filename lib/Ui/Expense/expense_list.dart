import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Expense/add_expense.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/Expense/add_expense_controller.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

import '../../controllers/Expense/list_expense_controller.dart';
import '../../models/expense/expensedetails.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({Key? key}) : super(key: key);

  final ctrl = Get.put(ListExpenseCtrl());
  final ctrlExpenseType = Get.put(AddExpenseCtrl());

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
                      itemCount: ctrl.isFiltered.value
                          ? ctrl.filteredExpenseList.length
                          : ctrl.expenseList.length,
                      itemBuilder: (context, index) => ctrl.isFiltered.value
                          ? expenseDetail(ctrl.filteredExpenseList[index])
                          : expenseDetail(ctrl.expenseList[index])),
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
        String? selectedDateRange = ctrl.selectedDate.value;
        int? selectedExpenseTypeId = ctrl.selectedExpenseTypeId.value;
        return Obx(() => AlertDialog(
              title: const Text('Select Options'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Date Range:'),
                    ListTile(
                      textColor: ctrl.selectedDate.value == 'Today'
                          ? AppColors.kPrimaryColor
                          : null,
                      title: const Text('Today'),
                      onTap: () {
                        selectedDateRange = 'Today';
                        ctrl.selectedDate.value = selectedDateRange!;
                        // Navigator.of(context).pop(selectedDateRange);
                      },
                    ),
                    ListTile(
                      textColor: ctrl.selectedDate.value == 'Last Week'
                          ? AppColors.kPrimaryColor
                          : null,
                      title: const Text('Last Week'),
                      onTap: () {
                        selectedDateRange = 'Last Week';
                        ctrl.selectedDate.value = selectedDateRange!;
                        // Navigator.of(context).pop(selectedDateRange);
                      },
                    ),
                    ListTile(
                      textColor: ctrl.selectedDate.value == 'Last Month'
                          ? AppColors.kPrimaryColor
                          : null,
                      title: const Text('Last Month'),
                      onTap: () {
                        selectedDateRange = 'Last Month';
                        ctrl.selectedDate.value = selectedDateRange!;
                        // Navigator.of(context).pop(selectedDateRange);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Select Expense Type:'),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      value: ctrl.dropDownExpenseType,
                      onChanged: (newValue) {
                        ctrl.dropDownExpenseType = newValue!;
                        ctrl.filteredExpenseText.value = ctrl.expenseType
                            .firstWhere(
                                (e) => e.expenseTypeID == int.parse(newValue))
                            .expenseName!;
                      },
                      items: ctrl.expenseType.map((expenseType) {
                        return DropdownMenuItem<String>(
                          value: expenseType.expenseTypeID.toString(),
                          child: Text(expenseType.expenseName!),
                        );
                      }).toList(),
                      decoration: dropDownDecoration(),
                    ),
                    // Obx(()=>Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: DropdownButtonHideUnderline(child:DropdownButton<int>(
                    //     iconDisabledColor: Colors.amber,
                    //     value: selectedExpenseTypeId,
                    //     onChanged: (value) {
                    //       ctrl.selectedExpenseTypeId.value = value!;
                    //       // Navigator.of(context).pop(selectedName);
                    //     },
                    //     items:ctrlExpenseType.expenseType.value.map((expenseTypeObj) {
                    //
                    //       return DropdownMenuItem<int>(
                    //         value: expenseTypeObj.expenseTypeID,
                    //         child: Text(expenseTypeObj.expenseName!),
                    //       );
                    //     }).toList(),
                    //   ),)
                    // ))
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        ctrl.isFiltered.value = false;
                        ctrl.dropDownExpenseType = null;
                        ctrl.selectedDate.value = '';
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        log("name: ${selectedExpenseTypeId.toString()}");
                        log("date: $selectedDateRange");
                        if (selectedExpenseTypeId != 0 ||
                            selectedDateRange != '') {
                          ctrl.isFiltered.value = true;
                          ctrl.selectedExpenseTypeId.value =
                              selectedExpenseTypeId;
                          ctrl.selectedDate.value = selectedDateRange!;
                          ctrl.loadFilteredExpenseList(
                              selectedExpenseTypeId, selectedDateRange);
                        } else {
                          ctrl.isFiltered.value = false;
                        }

                        Navigator.of(context)
                            .pop(); // Close the dialog and return the selected values
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ctrl.isFiltered.value = false;
                ctrl.dropDownExpenseType = null;
                ctrl.selectedDate.value = '';
                _showDialog(context);
              },
              child: const Text('Filter'),
            ),
            const SizedBox(width: 20), // Adding space between buttons
            ElevatedButton(
              onPressed: () {
                ctrl.isFiltered.value = false;
              },
              child: const Text('Clear'),
            ),
          ],
        ),
        Visibility(
          visible: ctrl.isFiltered.value,
          child: ListTile(
            title: Text(ctrl.selectedDate.value),
            subtitle: Text(ctrl.filteredExpenseText.value),
          ),
        ),
      ],
    );
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
              () => const AddExpense(),
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
          Get.to(const AddExpense(), arguments: item)
        },
        child: Container(
          padding: CustomPadding.padding10,
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
              AppSizedBox.sizedBoxH5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    item.expenseDescription.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Text(
                    'Rs: ${item.expenseCost}',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              AppSizedBox.sizedBoxH5,
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: CustomBorderRadius.borderRadius13,
                    ),
                    child: Text(
                      DateFormat('yyyy-MM-dd').format(item.expenseDate!),
                      style: TextStyle(
                        color: AppColors.kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              AppSizedBox.sizedBoxH5,
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
                    child: const Icon(Icons.clear)),
              ],
            ),
          ),
          AppSizedBox.sizedBoxH10,
          const Divider(),
          AppSizedBox.sizedBoxH10,
        ],
      ),
    );
  }
}
