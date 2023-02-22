import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class CustomersList extends StatefulWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  State<CustomersList> createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          AppSizedBox.sizedBoxH10,
          const KPRTraders(),
          AppSizedBox.sizedBoxH10,
            GroupButton(
              buttons: const [
            'A-Z',
            'Z-A',
            'Due',
          ],
          options: GroupButtonOptions(
            // unselectedColor: AppColors.,
          ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(elevation: 0,
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
    );
  }
}
