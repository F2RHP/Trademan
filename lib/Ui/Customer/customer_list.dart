import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/SaleOrder/Cash_TransactionList.dart';
import 'package:trader_app/Ui/SaleOrder/CustomerOrderListScreen.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/customers/list_customers_ctrl.dart';
import 'package:trader_app/screens/shared_widgets/custom_richText.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

import '../../screens/shared_widgets/custom_btn.dart';
import 'customer_registration_screen.dart';

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
AppSizedBox.sizedBoxH10,
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: CustomBorderRadius.borderRadius8,
                  ),
                  child: Text(
                    'Trader -> Customer',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: CustomBorderRadius.borderRadius8,
                  ),
                  child: Text(
                    'Customer -> Trader',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )],),

                // AppSizedBox.sizedBoxH20,
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10.0),
                //   child: GroupButton(
                //     buttons: const [
                //       'A-Z',
                //       'Z-A',
                //       'Due',
                //     ],
                //     options: GroupButtonOptions(
                //       unselectedColor: AppColors.blueAccentShade700,
                //       selectedColor: AppColors.blue,
                //       spacing: 0,
                //       buttonWidth: 100,
                //       buttonHeight: 50,
                //       unselectedTextStyle: TextStyle(
                //         color: AppColors.white,
                //       ),
                //     ),
                //   ),
                // ),
                AppSizedBox.sizedBoxH20,
                TextFormField(
                  onChanged: (value) => ctrl.filterText.value = value,
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
                ctrl.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      )
                    : customerCard(),
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
      itemCount: ctrl.filteredCustomers.length,
      itemBuilder: (context, index) {
        var isGoods = ctrl.filteredCustomers[index].amounT_PRODUCT
            .toString()
            .contains('-');
        var isCash =
            ctrl.filteredCustomers[index].amounT_CASH.toString().contains('-');
        var isTotal = ctrl.filteredCustomers[index].totaL_BALANCE
            .toString()
            .contains('-');
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: GestureDetector(
            onTap: () {
              Get.to(const CustomerRegistration(),
                  arguments: ctrl.filteredCustomers[index]);
            },
            child: Container(
              padding: CustomPadding.padding14,
              decoration: BoxDecoration(
                borderRadius: CustomBorderRadius.borderRadius10,
                border: Border.all(),
              ),
              child: Column(
                children: [
                  Row(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(
                              text: 'Name : ',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              children: [
                                TextSpan(
                                  text: ctrl
                                      .filteredCustomers[index].customeRName!,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ]),
                          Text(
                            'Father : ${ctrl.filteredCustomers[index].fatheRName!}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Village : ${ctrl.filteredCustomers[index].villagename!}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Phone No : ${ctrl.filteredCustomers[index].contactnumber!}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      AppSizedBox.sizedBoxW8,
                    ],
                  ),
                  AppSizedBox.sizedBoxH15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(CustomerOrderListScreen(),
                              arguments:
                                  ctrl.filteredCustomers[index].customeRId);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryLight,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Goods',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                AppSizedBox.sizedBoxH10,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isGoods
                                        ? AppColors.red
                                        : AppColors.green,
                                    borderRadius:
                                        CustomBorderRadius.borderRadius8,
                                  ),
                                  child: Text(
                                    'Rs.${ctrl.filteredCustomers[index].amounT_PRODUCT}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(Cash_TransactionList(),
                              arguments:
                                  ctrl.filteredCustomers[index].customeRId);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryLight,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Cash',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                AppSizedBox.sizedBoxH10,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isCash
                                        ? AppColors.red
                                        : AppColors.green,
                                    borderRadius:
                                        CustomBorderRadius.borderRadius8,
                                  ),
                                  child: Text(
                                    'Rs.${ctrl.filteredCustomers[index].amounT_CASH}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(Cash_TransactionList(),
                          //     arguments:
                          //         ctrl.filteredCustomers[index].customeRId);
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                AppSizedBox.sizedBoxH10,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isTotal
                                        ? AppColors.red
                                        : AppColors.green,
                                    borderRadius:
                                        CustomBorderRadius.borderRadius8,
                                  ),
                                  child: Text(
                                    'Rs.${ctrl.filteredCustomers[index].totaL_BALANCE}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
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
        AppStrings.Customer_List,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const CustomerRegistration(),
            //   ),
            // );
            //ctrl.onItemNewCustomerClick();
            Get.to(const CustomerRegistration());
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
