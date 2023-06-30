import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/products/add_product.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/product/products_controller.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ctrl = Get.put(AllProductCtrl());

  List<String> list = ['1', '2', '3', '4'];
  var dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(
        () => ctrl.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      topSection(),
                      AppSizedBox.sizedBoxH20,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: GroupButton(
                            options: GroupButtonOptions(
                                spacing: 0,
                                buttonWidth: 100,
                                buttonHeight: 50,
                                selectedColor: AppColors.kPrimaryColor,
                                unselectedColor: AppColors.blueAccentShade700,
                                unselectedTextStyle: TextStyle(
                                  color: AppColors.white,
                                )),
                            buttons: const <String>[
                              'All',
                              'In Stock',
                              'Stock Out'
                            ]),
                      ),
                      AppSizedBox.sizedBoxH20,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ctrl.isSearch
                            ? ctrl.products.length
                            : ctrl.searchList.length,
                        itemBuilder: (context, index) {
                          var dateTime = DateTime.parse(
                              ctrl.products[index].purchasEDate.toString());
                          DateFormat dateFormat = DateFormat('yyy-MM-dd');
                          var nowDate = dateFormat.format(dateTime);
                          return listMenu(
                              ctrl.isSearch
                                  ? ctrl.products[index]
                                  : ctrl.searchList[index],
                              nowDate);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget listMenu(listMenu, String nowDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(
          15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.account_box_outlined,
                  size: 50.0,
                )),
            AppSizedBox.sizedBoxW15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listMenu.producTName.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  AppSizedBox.sizedBoxH15,
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            text: 'Cost: ',
                            children: [
                              TextSpan(
                                  text: listMenu.producTCost.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]),
                      ),
                      AppSizedBox.sizedBoxW15,
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                            text: 'Sell: ',
                            children: [
                              TextSpan(
                                  text: listMenu.sellinGCost.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ]),
                      ),
                    ],
                  ),
                  AppSizedBox.sizedBoxH15,
                  Text(
                    listMenu.supplieRName.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  AppSizedBox.sizedBoxH15,
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          '${listMenu.nOOfQuantity} ${listMenu.quantitYTypeName}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppSizedBox.sizedBoxW8,
                      // Container(
                      //   padding: const EdgeInsets.all(8.0),
                      //   decoration: BoxDecoration(
                      //       color: Colors.red,
                      //       borderRadius:
                      //           BorderRadius.circular(18.0)),
                      //   child: Text(
                      //     ctrl.products[index].nOOfQuantity
                      //         .toString(),
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                      const Spacer(),
                      Text(
                        nowDate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
              const AddProduct(),
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
        AppStrings.ProductList,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }

  Widget topSection() {
    return Column(
      children: [
        const KPRTraders(),
        SizedBox(height: Dimensions.calcH(20.0)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: Dimensions.calcH(10.0)),
              const Text(
                'All',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              const Text(
                'In Stock',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              const Text(
                'Stock Out',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(width: Dimensions.calcW(15.0)),
              const Text(
                'A-Z',
                selectionColor: Colors.black26,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(height: Dimensions.calcH(10.0)),
            ],
          ),
        ),
        SizedBox(height: Dimensions.calcH(10.0)),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(height: Dimensions.calcH(15)),
        DropdownButtonFormField(
          value: dropDownValue,
          items: list
              .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label.toString()),
                  ))
              .toList(),
          hint: const Text('product'),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ),
        SizedBox(height: Dimensions.calcH(15)),
        TextFormField(
          onChanged: ctrl.onSearch,
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
      ],
    );
  }
}
