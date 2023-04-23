import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/customers/list_customers_ctrl.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class CustomersList extends StatefulWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  State<CustomersList> createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  final ctrl = Get.put(ListCustomersCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppSizedBox.sizedBoxH10,
                const KPRTraders(),
                AppSizedBox.sizedBoxH20,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: GroupButton(
                    buttons: const [
                      'A-Z',
                      'Z-A',
                      'Due',
                    ],
                    options: GroupButtonOptions(
                      unselectedColor: AppColors.blueAccentShade700,
                      selectedColor: AppColors.blue,
                      spacing: 0,
                      buttonWidth: 100,
                      buttonHeight: 50,
                      unselectedTextStyle: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                AppSizedBox.sizedBoxH20,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                AppSizedBox.sizedBoxH5,
                customerCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customerCard() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ctrl.customersList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: GestureDetector(
            onTap: () {
              ctrl.onItemClick(ctrl.customersList[index],);
            },
            child: Container(
              padding: CustomPadding.padding14,
              decoration: BoxDecoration(
                borderRadius: CustomBorderRadius.borderRadius10,
                border: Border.all(),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: CustomPadding.padding5,
                      child: const Icon(
                        Icons.person,
                        size: 40.0,
                      ),
                    ),
                  ),
                  AppSizedBox.sizedBoxW8,
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.03,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name : ${ctrl.customersList[index].customeRName!}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Father : ${ctrl.customersList[index].fatheRName!}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Village : ${ctrl.customersList[index].villagename!}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Phone No : ${ctrl.customersList[index].brancHContact!}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSizedBox.sizedBoxW8,
                  Container(
                    padding: CustomPadding.padding8,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: CustomBorderRadius.borderRadius8,
                    ),
                    child: Text(
                      'Rs.8943',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
      centerTitle: true,
      title: Text(
        AppStrings.AddCustomer,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CustomerRegistration(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
