import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/Cash/Cash_TransactionList.dart';
import 'package:trader_app/Ui/Cash/CustomerOrderListScreen.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/customers/list_customers_ctrl.dart';
import 'package:trader_app/screens/shared_widgets/custom_richText.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                      )
                    ],
                  ),

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
      ),
    );
  }

  _textMe() async {
    // Android
    const uri = 'sms:+39 348 060 888?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:0039-222-060-888?body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  Widget customerCard() {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: ctrl.filteredCustomers.length,
        itemBuilder: (context, index) {
          var isGoods = ctrl.filteredCustomers[index].amounT_PRODUCT
              .toString()
              .contains('-');
          var isCash = ctrl.filteredCustomers[index].amounT_CASH
              .toString()
              .contains('-');
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // AppSizedBox.sizedBoxW20,
                        ctrl.filteredCustomers[index].contactnumber == null
                            ? const SizedBox()
                            : ctrl.filteredCustomers[index].contactnumber! == ''
                                ? const SizedBox()
                                : IconButton(
                                    iconSize: 20,
                                    onPressed: () => launchUrlString(
                                        'sms:${ctrl.filteredCustomers[index].contactnumber!}?body=${'${isTotal ? 'Trader to Customer Total Rs: ${ctrl.filteredCustomers[index].totaL_BALANCE}' : 'Customer to Trader Total Rs: ${ctrl.filteredCustomers[index].totaL_BALANCE}'}'
                                            '\nName :  ${ctrl.filteredCustomers[index].customeRName!},'
                                            '\nFather :  ${ctrl.filteredCustomers[index].fatheRName!},'
                                            '\nVillage :  ${ctrl.filteredCustomers[index].villagename!},'
                                            '\nContact Number :  ${ctrl.filteredCustomers[index].contactnumber!}.'}'),

                                    /// https://stackoverflow.com/questions/54301938/how-to-send-sms-with-url-launcher-package-with-flutter
                                    icon: Icon(
                                      Icons.sms,
                                      color: AppColors.green,
                                    )),

                        ctrl.filteredCustomers[index].contactnumber == null
                            ? const SizedBox()
                            : ctrl.filteredCustomers[index].contactnumber! == ''
                                ? const SizedBox()
                                : IconButton(
                                    iconSize: 20,
                                    onPressed: () => launchUrlString(
                                          "https://wa.me/${ctrl.filteredCustomers[index].contactnumber!}?text=${'${isTotal ? 'Trader to Customer Total Rs: ${ctrl.filteredCustomers[index].totaL_BALANCE}' : 'Customer to Trader Total Rs: ${ctrl.filteredCustomers[index].totaL_BALANCE}'}'
                                              '\nName :  ${ctrl.filteredCustomers[index].customeRName!},'
                                              '\nFather :  ${ctrl.filteredCustomers[index].fatheRName!},'
                                              '\nVillage :  ${ctrl.filteredCustomers[index].villagename!},'
                                              '\nContact Number :  ${ctrl.filteredCustomers[index].contactnumber!}.'}",
                                          mode: LaunchMode.externalApplication,
                                        ),
                                    icon: Icon(
                                      Icons.whatsapp,
                                      color: AppColors.green,
                                    )),

                        ctrl.filteredCustomers[index].contactnumber == null
                            ? const SizedBox()
                            : ctrl.filteredCustomers[index].contactnumber! == ''
                                ? const SizedBox()
                                : IconButton(
                                    iconSize: 20,
                                    onPressed: () => launchUrlString(
                                        'tel://${ctrl.filteredCustomers[index].contactnumber!}'),
                                    icon: Icon(
                                      Icons.call,
                                      color: AppColors.green,
                                    )),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        // AppSizedBox.sizedBoxW8,
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichText(
                                    text: 'Name : ',
                                    fontSize: 15,
                                    align: TextAlign.start,
                                    maxLines: 1,
                                    fontWeight: FontWeight.bold,
                                    children: [
                                      TextSpan(
                                        text: ctrl.filteredCustomers[index]
                                            .customeRName!,
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ]),
                                Text(
                                  'Father : ${ctrl.filteredCustomers[index].fatheRName!}',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'Village : ${ctrl.filteredCustomers[index].villagename!}',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                Text(
                                  'Phone No : ${ctrl.filteredCustomers[index].contactnumber!}',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // AppSizedBox.sizedBoxW8,
                      ],
                    ),
                    AppSizedBox.sizedBoxH15,
                    // Goods, Cash, Total Ui
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
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
                                  color: AppColors.kPrimaryColor,
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
                                        'Rs: ${ctrl.filteredCustomers[index].amounT_PRODUCT}',
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
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
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
                                  color: AppColors.kPrimaryColor,
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
                                        'Rs: ${ctrl.filteredCustomers[index].amounT_CASH}',
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
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
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
                                        'Rs: ${ctrl.filteredCustomers[index].totaL_BALANCE}',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),

                    /// =====================
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        },
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
            FocusScope.of(context).unfocus();
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
