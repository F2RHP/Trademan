import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/saleorder/SaleOrderController.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';

class AddSale extends StatefulWidget {
  const AddSale({Key? key}) : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  final saleCtrl = Get.put(SaleOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: CustomPadding.padding18,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: CustomPadding.padding20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: AppColors.greyLight),
              ),
              child: Text(
                '+ ${AppStrings.chooseCustomer}',
                style: TextStyle(
                  color: AppColors.blueAccentShade700,
                  fontSize: 16.0,
                ),
              ),
            ),
            AppSizedBox.sizedBoxH15,
            // DropdownButtonFormField<String>(
            //   // autovalidateMode: AutovalidateMode.onUserInteraction,
            //   // value: ctrl.selectedProductType,
            //   items: ctrl.productType
            //       .map((label) => DropdownMenuItem<String>(
            //     value: label,
            //     child: Text(label.name!),
            //   ))
            //       .toList(),
            //   hint: const Text(AppStrings.ProductType),
            //   onChanged: (value) {
            //     setState(() {
            //       // ctrl.selectedProductType = value!;
            //     });
            //   },
            //   decoration: dropDownDecoration(),
            // ),
            AppSizedBox.sizedBoxH15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Get.dialog(
                    const AddProductDialog(),
                    barrierDismissible: false,
                  ),
                  child: Padding(
                    padding: CustomPadding.padding14,
                    child: Text(
                      '+ ${AppStrings.addProduct}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: CustomPadding.padding14,
                  decoration: BoxDecoration(
                    borderRadius: CustomBorderRadius.borderRadius5,
                    color: AppColors.greyLight,
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: const Text(
                    '2023-02-25',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            AppSizedBox.sizedBoxH15,
            const TitleWithTextFormField(titleText: 'titleText'),
            AppSizedBox.sizedBoxH15,
            FittedBox(
              child: DataTable(
                columnSpacing: 10.0,
                dataRowHeight: 70.0,
                headingRowHeight: 30.0,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) {
                    return const Color(0xFFE7E7E7);
                  },
                ),
                columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                  DataColumn(
                    label: Text('No.'),
                  ),
                  DataColumn(
                    label: Text('Details'),
                  ),
                  DataColumn(
                    label: Text('Qty'),
                  ),
                  DataColumn(
                    label: Text('Prices'),
                  ),
                  DataColumn(
                    label: Text('Total'),
                  ),
                  DataColumn(
                    label: Text(''),
                  ),
                ],
                rows: List.generate(
                  getValues.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        GestureDetector(
                          onTap: () => Get.dialog(
                            const EditDialog(),
                            barrierDismissible: false,
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/pen.svg',
                            height: 20.0,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(getValues[index]['no']),
                      ),
                      DataCell(
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            getValues[index]['details'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          getValues[index]['qty'],
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.double,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(getValues[index]['prices']),
                      ),
                      DataCell(
                        Text(getValues[index]['total']),
                      ),
                      const DataCell(
                        Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Table(
              children: const [
                TableRow(children: [
                  TableCell(
                    child: SizedBox(
                      width: 200.0,
                    ),
                  ),
                  TableCell(
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      '1000',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            const Divider(),
            // const Text('Discount'),
            // Switch(
            //     activeColor: Colors.green, value: true, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
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
        AppStrings.addSale,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }
}

List getValues = [
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  },
  {
    'no': '1',
    'details':
        'BoxDecoration sfasdfasdf asdfsadfwer sdfasdfwer d fsdf we fwe sdfsadf ',
    'qty': '3',
    'prices': '1888',
    'total': '20981',
  }
];

class EditDialog extends StatefulWidget {
  const EditDialog({super.key});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final saleCtrl = Get.put(SaleOrderController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.clear),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text(
                        'Product Name',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: saleCtrl.quantity.value == 0
                                ? null
                                : () {
                                    saleCtrl.quantity.value--;
                                  },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.red,
                                  shape: BoxShape.rectangle,
                                ),
                                child:
                                    Icon(Icons.remove, color: AppColors.white)),
                          ),
                          Text(saleCtrl.quantity.value.toString()),
                          GestureDetector(
                            onTap: () {
                              saleCtrl.quantity.value++;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                shape: BoxShape.rectangle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const TitleWithTextFormField(
                          titleText: 'Product cost(per unit)'),
                      const TitleWithTextFormField(titleText: 'Selling Price'),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Save')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Product',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
            const Divider(),
            TextFormField(
              // onChanged: ctrl.onSearch,
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
            AppSizedBox.sizedBoxH10,
            // DropdownButtonFormField<String>(
            //   // autovalidateMode: AutovalidateMode.onUserInteraction,
            //   // value: ctrl.selectedProductType,
            //   items: ctrl.productType
            //       .map((label) => DropdownMenuItem<String>(
            //     value: label,
            //     child: Text(label.name!),
            //   ))
            //       .toList(),
            //   hint: const Text(AppStrings.ProductType),
            //   onChanged: (value) {
            //     setState(() {
            //       // ctrl.selectedProductType = value!;
            //     });
            //   },
            //   decoration: dropDownDecoration(),
            // ),
            AppSizedBox.sizedBoxH10,
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: AppColors.black,
                            ),
                          ),
                          child: const FlutterLogo(size: 130),
                        ),
                        AppSizedBox.sizedBoxW10,
                        const Text(
                          'data',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    AppSizedBox.sizedBoxH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Cost : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '2000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSizedBox.sizedBoxW10,
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Sell : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '10,000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColors.kPrimaryColor,
                          ),
                          child: Text(
                            '234',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
