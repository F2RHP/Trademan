import 'package:flutter/material.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  TextEditingController controller = TextEditingController();
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
              Icons.home,
              size: 40.0,
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.Expense,
          style: TextStyle(
            color: AppColors.kSecondaryColor,
          ),
        ),
        actions: [
          Icon(
            Icons.calendar_view_month_outlined,
            size: 40.0,
            color: AppColors.kSecondaryColor,
          ),
          AppSizedBox.sizedBoxW8,
        ],
      ),
      body: Padding(
        padding: CustomPadding.padding15,
        child: Column(
          children: [
            AppSizedBox.sizedBoxH8,
            const KPRTraders(),
            AppSizedBox.sizedBoxH15,
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => popIpContent(),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  Icons.filter_list_alt,
                  color: AppColors.kSecondaryColor,
                ),
              ),
              label: Text(
                AppStrings.Filter_Expense,
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.kSecondaryColor,
                ),
              ),
            ),
            AppSizedBox.sizedBoxH15,
            const Text('1 Expense (1999-01-01 To2023-02-04)'),
            AppSizedBox.sizedBoxH15,
            const AppTextFormFiled(
              hintText: 'Search..',
              autoValidator: true,
            ),
            AppSizedBox.sizedBoxH15,
            Container(
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
                  const Text('Travel'),
                  AppSizedBox.sizedBoxH15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Travel'),
                      Text(
                        '2500',
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: AppColors.yellowDark,
                          borderRadius: CustomBorderRadius.borderRadius13,
                        ),
                        child: const Text(
                          'Car & Truck Expenses',
                          style: TextStyle(
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
                          '2022-08-26',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }

//content
  Widget popIpContent() {
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
