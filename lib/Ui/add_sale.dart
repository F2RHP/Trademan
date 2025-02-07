import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/Ui/Invoice/file_handle_api.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';
import 'package:trader_app/controllers/saleorder/MainSaleOrderController.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';
import 'package:trader_app/screens/shared_widgets/title_with_text_form_field.dart';

import '../models/SaleOrders/Saleproduct.dart';
import '../screens/shared_widgets/custom_btn.dart';

class AddSale extends StatefulWidget {
  const AddSale({Key? key}) : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  final mainSaleCtrl = Get.put(MainSaleOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(
        () => Padding(
          padding: CustomPadding.padding18,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => {_showCustomerListDialog(context)},
                      child: Container(
                        width: Get.size.width / 1.6,
                        padding: CustomPadding.padding20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: AppColors.greyLight),
                        ),
                        child: Text(
                          mainSaleCtrl.selectedCustomer.value.customerID == 0
                              ? '+ ${AppStrings.chooseCustomer}'
                              : mainSaleCtrl
                                  .selectedCustomer.value.customerName,
                          style: TextStyle(
                            color: AppColors.blueAccentShade700,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const CustomersList()),
                      child: Container(
                          padding: CustomPadding.padding20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: AppColors.greyLight),
                          ),
                          child: const Icon(Icons.add)
                          // Text(
                          //   '+ ${AppStrings.addCustomer}',
                          //   style: TextStyle(
                          //     color: AppColors.blueAccentShade700,
                          //     fontSize: 16.0,
                          //   ),
                          // ),

                          ),
                    ),
                  ],
                ),
                AppSizedBox.sizedBoxH15,
                DropdownButtonFormField<int>(
                  value: mainSaleCtrl.selectedsaleTransaction,
                  onChanged: (newValue) {
                    setState(() {
                      mainSaleCtrl.selectedsaleTransaction = newValue!;
                    });
                  },
                  items: mainSaleCtrl.saleTransactionsType.map((expenseType) {
                    return DropdownMenuItem<int>(
                      value: expenseType.saleTransactionId,
                      child: Text(expenseType.name!),
                    );
                  }).toList(),
                  decoration: dropDownDecoration(),
                ),
                AppSizedBox.sizedBoxH15,
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: AnimatedCrossFade(
                    firstChild: moneyView(),
                    secondChild: goodsView(),
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: mainSaleCtrl.IsMoney()
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                ),
                Row(
                  mainAxisAlignment:
                      // mainSaleCtrl.saleProductList.isEmpty
                      //     ? MainAxisAlignment.center
                      //     :
                      MainAxisAlignment.spaceEvenly,
                  children: [
                    mainSaleCtrl.isSaveLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomBtn(
                            label: "Save",
                            action: () {
                              mainSaleCtrl.saveAndNavigate();
                            },
                          ),
                    // mainSaleCtrl.saleProductList.isEmpty
                    //     ? const SizedBox()
                    //     :
                    CustomBtn(
                      action: () async {
                        // mainSaleCtrl.saveAndNavigate();
                        // // // Generate PDF and download it
                        // final pdfData = await generatePdf(
                        //   PdfPageFormat.a4,
                        //   mainSaleOrderController: mainSaleCtrl,
                        // );
                        // await downloadAndOpenPdf(pdfData);

                        Get.to(PdfView(
                          mainSaleOrderController: mainSaleCtrl,
                        ));
                      },
                      label: 'View PDF',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCustomerListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _buildCustomerListDialog(context);
      },
    );
  }

  Widget _buildCustomerListDialog(BuildContext context) {
    return Obx(() => AlertDialog(
          title: const Text('Customer List'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) =>
                      mainSaleCtrl.customerFilter.value = value,
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mainSaleCtrl.filteredCustomer.length,
                    itemBuilder: (context, index) {
                      var customer = mainSaleCtrl.filteredCustomer[index];
                      return GestureDetector(
                        child: ListTile(
                          title: Text(customer.customerName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(customer.villageName),
                              Text(customer.contactNumber),
                            ],
                          ),
                          // isThreeLine: true,
                          onTap: () {
                            mainSaleCtrl.selectedCustomer.value = customer;
                            mainSaleCtrl.customerFilter.value = '';
                            Get.back(closeOverlays: true);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back(closeOverlays: true);
              },
              child: const Text('Close'),
            ),
          ],
        ));
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

  Widget getBuyOrSale() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile(
          title: const Text('Buy'),
          value: 'Buy',
          groupValue: mainSaleCtrl.selectedOption.value,
          onChanged: (value) {
            setState(() {
              mainSaleCtrl.selectedOption.value = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text('Sale'),
          value: 'Sale',
          groupValue: mainSaleCtrl.selectedOption.value,
          onChanged: (value) {
            setState(() {
              mainSaleCtrl.selectedOption.value = value.toString();
            });
          },
        ),
      ],
    );
  }

  Widget goodsView() => Column(
        children: [
          getBuyOrSale(),
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
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    mainSaleCtrl.goodsOrderDate.value =
                        DateFormat('yyyy-MM-dd').format(value!);
                  });
                },
                child: Container(
                  padding: CustomPadding.padding14,
                  decoration: BoxDecoration(
                    borderRadius: CustomBorderRadius.borderRadius5,
                    color: AppColors.greyLight,
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Text(
                    mainSaleCtrl.goodsOrderDate.value,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSizedBox.sizedBoxH15,
          TitleWithTextFormField(
            titleText: 'Order Notes',
            controller: mainSaleCtrl.orderNotes,
          ),
          TitleWithTextFormField(
            titleText: mainSaleCtrl.selectedOption.value == 'Sale'
                ? 'Customer Given'
                : 'Trader Given',
            controller: mainSaleCtrl.customerGiven,
            type: TextInputType.number,
          ),
          AppSizedBox.sizedBoxH15,
          Obx(() => FittedBox(
                child: DataTable(
                  columnSpacing: Get.size.width > 600
                      ? Get.size.width / 8
                      : Get.size.width / 30,
                  headingRowHeight: 30.0,
                  headingRowColor: MaterialStateColor.resolveWith(
                    (states) {
                      return const Color(0xFFE7E7E7);
                    },
                  ),
                  columns: mainSaleCtrl.tableLabelList
                      .map(
                        (e) => DataColumn(
                          label: Text(e),
                        ),
                      )
                      .toList(),
                  rows: List.generate(
                    mainSaleCtrl.saleProductList.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          GestureDetector(
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) => EditDialog(
                                    product:
                                        mainSaleCtrl.saleProductList[index]),
                              )
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            mainSaleCtrl.saleProductList[index].sno.toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: Get.size.width > 600 ? 300 : 180,
                            child: Text(
                              mainSaleCtrl.saleProductList[index].productName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            mainSaleCtrl.saleProductList[index].quantity
                                .toString(),
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              decorationStyle: TextDecorationStyle.double,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            mainSaleCtrl.saleProductList[index].sellingPrice
                                .toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            mainSaleCtrl.saleProductList[index].total
                                .toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              mainSaleCtrl.saleProductList
                                  .remove(mainSaleCtrl.saleProductList[index]);
                              mainSaleCtrl.refreshList();
                            },
                            child: const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const Divider(),
          Table(
            children: [
              TableRow(children: [
                const TableCell(
                  child: SizedBox(
                    width: 200.0,
                  ),
                ),
                const TableCell(
                  child: Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                TableCell(
                  child: Text(
                    mainSaleCtrl.totalProductAmount.value.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          const Divider(),
        ],
      );
  Widget moneyView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: 'Transaction Type'),
          AppSizedBox.sizedBoxH10,
          DropdownButtonFormField<int>(
            value: mainSaleCtrl.selectedtransactionType,
            onChanged: (newValue) {
              setState(() {
                mainSaleCtrl.selectedtransactionType = newValue!;
              });
            },
            items: mainSaleCtrl.transactionType.map((expenseType) {
              return DropdownMenuItem<int>(
                value: expenseType.transactionTypeId,
                child: Text(expenseType.transactionTypeName!),
              );
            }).toList(),
            decoration: dropDownDecoration(),
          ),
          AppSizedBox.sizedBoxH20,
          TitleWithTextFormField(
            isRequired: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              ).then((value) {
                mainSaleCtrl.dataController.text =
                    DateFormat('yyyy-MM-dd').format(value!);
              });
            },
            titleText: AppStrings.Trans_Date,
            hintText: AppStrings.Trans_Date,
            controller: mainSaleCtrl.dataController,
          ),
          TitleWithTextFormField(
            titleText: 'Transaction Amount',
            controller: mainSaleCtrl.transactionAmount,
            type: TextInputType.number,
          ),
          TitleWithTextFormField(
            isRequired: true,
            titleText: 'Transaction Notes',
            controller: mainSaleCtrl.transactionNotes,
          ),
        ],
      );
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
  final SaleProduct product;

  EditDialog({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  String qu = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Product",
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
                    Text(
                      widget.product.productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.product.quantity == 0) {
                              widget.product.quantity = 0;
                            } else {
                              widget.product.quantity--;
                            }
                            setState(() {
                              qu = widget.product.quantity.toString();
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.rectangle,
                              ),
                              child:
                                  Icon(Icons.remove, color: AppColors.white)),
                        ),
                        SizedBox(
                            width: 80,
                            height: 60,
                            child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                controller: TextEditingController(
                                    text: widget.product.quantity.toString()),
                                onChanged: (p0) {
                                  int? parsedValue = int.tryParse(p0);
                                  if (parsedValue != null) {
                                    widget.product.quantity = parsedValue;
                                  } else {
                                    widget.product.quantity = 0;
                                  }
                                })),
                        GestureDetector(
                          onTap: () {
                            widget.product.quantity++;
                            setState(() {
                              qu = widget.product.quantity.toString();
                            });
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
                    TitleWithTextFormField(
                        type: TextInputType.number,
                        controller: TextEditingController(
                            text: widget.product.productPrice.toString()),
                        onChanged: (p0) {
                          double? parsedValue = double.tryParse(p0);
                          if (parsedValue != null) {
                            widget.product.productPrice = parsedValue;
                          } else {
                            widget.product.productPrice = 0;
                          }
                        },
                        titleText: 'Product cost(per unit)'),
                    TitleWithTextFormField(
                        type: TextInputType.number,
                        controller: TextEditingController(
                            text: widget.product.sellingPrice.toString()),
                        onChanged: (p0) {
                          double? parsedValue = double.tryParse(p0);
                          if (parsedValue != null) {
                            widget.product.sellingPrice = parsedValue;
                          } else {
                            widget.product.sellingPrice = 0;
                          }
                        },
                        titleText: 'Selling Price'),
                    ElevatedButton(
                        onPressed: () {
                          final mainSaleCtrl =
                              Get.put(MainSaleOrderController());

                          widget.product.total = widget.product.quantity *
                              widget.product.sellingPrice;
                          mainSaleCtrl.refreshList();
                          Get.back();
                        },
                        child: const Text('Save')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
    final mainSaleCtrl = Get.find<MainSaleOrderController>();
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
                TextFormField(
                  onChanged: (value) => mainSaleCtrl.filterText.value = value,
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
                  child: ListView.separated(
                    itemCount: mainSaleCtrl.filteredProducts.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        mainSaleCtrl.addSaleProductList(
                            mainSaleCtrl.filteredProducts[index]);
                        mainSaleCtrl.filterText.value = '';
                        Get.back();
                      },
                      title: Text(
                        mainSaleCtrl.filteredProducts[index].producTName ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      subtitle: Row(
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
                                  text: mainSaleCtrl
                                      .filteredProducts[index].producTCost
                                      .toString(),
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
                                  text: mainSaleCtrl
                                      .filteredProducts[index].sellinGCost
                                      .toString(),
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class PdfView extends StatefulWidget {
  final MainSaleOrderController mainSaleOrderController;
  const PdfView({super.key, required this.mainSaleOrderController});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(
        canChangePageFormat: false,
        canDebug: false,
        // pdfFileName: 'Product-Sale-pdf',
        // actions: [
        //   IconButton(onPressed: () async {}, icon: const Icon(Icons.download))
        // ],
        build: (format) => generatePdf(format,
            mainSaleOrderController: widget.mainSaleOrderController),
      ),
    );
  }
}

Future<Uint8List> generatePdf(PdfPageFormat format,
    {MainSaleOrderController? mainSaleOrderController}) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: format,
      build: (context) {
        return [
          /// PDF Title
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        AppStrings.KPR_TradersTitle,
                        style: pw.TextStyle(
                          fontSize: 23.0,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        AppStrings.KPRTraderAddress,
                        style: pw.TextStyle(
                          // fontSize: 23.0,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Align(
                          alignment: pw.Alignment.topRight,
                          child: pw.Text(
                              DateFormat.yMMMMEEEEd().format(DateTime.now()))),
                      pw.Align(
                          alignment: pw.Alignment.topRight,
                          child:
                              pw.Text(DateFormat.jmz().format(DateTime.now()))),
                    ]),
              ]),

          /// Table Section
          pw.SizedBox(height: 20.0),
          pw.Row(
            children: mainSaleOrderController!.tablePdfLabelList
                .map(
                  (e) => pw.Expanded(
                    child: pw.Container(
                      alignment: pw.Alignment.center,
                      padding: const pw.EdgeInsets.all(8.0),
                      color: const PdfColor.fromInt(0xFFc2c2c2),
                      child: pw.Text(e),
                    ),
                  ),
                )
                .toList(),
          ),

          ...mainSaleOrderController.saleProductList
              .map((element) => pw.Column(children: [
                    pw.Row(children: [
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(8.0),
                          // color: const PdfColor.fromInt(0xFFc2c2c2),
                          child: pw.Text('${element.sno}'),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(8.0),
                          // color: const PdfColor.fromInt(0xFFc2c2c2),
                          child: pw.Text(
                            element.productName,
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(8.0),
                          // color: const PdfColor.fromInt(0xFFc2c2c2),
                          child: pw.Text(
                            element.quantity.toString(),
                          ),
                        ),
                      ),
                      // pw.Expanded(
                      //   child: pw.Container(
                      //     alignment: pw.Alignment.center,
                      //     padding: const pw.EdgeInsets.all(8.0),
                      //     // color: const PdfColor.fromInt(0xFFc2c2c2),
                      //     child: pw.Text(
                      //       element.productPrice.toString(),
                      //     ),
                      //   ),
                      // ),
                      pw.Expanded(
                        child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: const pw.EdgeInsets.all(8.0),
                          // color: const PdfColor.fromInt(0xFFc2c2c2),
                          child: pw.Text(
                            element.total.toString(),
                          ),
                        ),
                      ),
                    ]),
                    pw.Divider(),
                  ])),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
            pw.Container(
              alignment: pw.Alignment.center,
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                'Total',
                style: const pw.TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            pw.SizedBox(width: 23.0),
            pw.Container(
              alignment: pw.Alignment.center,
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                mainSaleOrderController.totalProductAmount.value.toString(),
                style: const pw.TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ]),
        ];
      },
    ),
  );

  return pdf.save();
}

Future<void> downloadAndOpenPdf(Uint8List pdfData) async {
  // Get the path to the Download directory
  final directory = await getExternalStorageDirectory(); // For Android
  final downloadDirectory = Directory('${directory!.path}/Download');
  await downloadDirectory.create(recursive: true);

  // Define the file path where PDF will be saved
  final filePath = '${downloadDirectory.path}/Product-Sale-pdf.pdf';
  final file = File(filePath);

  // Save the PDF data to the Download folder
  await file.writeAsBytes(pdfData);

  // Open the PDF file using the open_file package
  final result = await OpenFile.open(filePath);
  if (result.type != ResultType.done) {
    // Handle the case where the PDF couldn't be opened (maybe due to an error or missing app)
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Unable to open the PDF.')),
    // );
    Get.snackbar('Error', 'Unable to open the PDF.');
  }
}
