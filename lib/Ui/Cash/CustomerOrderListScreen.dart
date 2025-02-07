import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/saleorder/CustomerOrderController.dart';
import '../../models/SaleOrders/customerorder.dart';
import '../../screens/shared_widgets/sized_box.dart';
import '../Invoice/PdfInvoiceApi.dart';
import '../Invoice/file_handle_api.dart';

class CustomerOrderListScreen extends StatefulWidget {
  @override
  State<CustomerOrderListScreen> createState() =>
      _CustomerOrderListScreenState();
}

class _CustomerOrderListScreenState extends State<CustomerOrderListScreen> {
  final controller = Get.put(CustomerOrderController());

  int? arguments = Get.arguments as int?;

  @override
  void initState() {
    if (arguments != null && arguments! > 0) {
      controller.Bycustomer = true;
      controller.customerId = arguments!;
    } else {
      controller.Bycustomer = false;
      controller.customerId = 0;
    }
    controller.LoadCustomerOrderTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.customerOrders.isEmpty) {
          return const Center(
            child: Text('No customer orders available.'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.customerOrders.length,
            itemBuilder: (context, index) {
              final customerOrder = controller.customerOrders[index];
              return GestureDetector(
                onTap: () {
                  _showOrderDetailsDialog(customerOrder);
                },
                child: Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          /// TMBL0000498 498100050303092
                          children: [
                            Text('Order ID: ${customerOrder.orderId}'),
                            IconButton(
                              iconSize: 36,
                              onPressed: () async {
                                final pdfFile = await PdfInvoiceApi.generate();
                                // opening the pdf file
                                // FileHandleApi.openFile(pdfFile);

                                if (customerOrder.orderId > 0) {
                                  await controller.LoadCustomerOrderDetails(
                                      customerOrder.orderId);
                                  Get.to(PdfViewCustomerOrderList(
                                      index: index,
                                      customerOrderController: controller));
                                }
                              },
                              icon: const Icon(
                                Icons.picture_as_pdf_rounded,
                                color: Colors.greenAccent,
                              ),
                            )
                          ],
                        ),

                        Text('Customer Name: ${customerOrder.customerName}'),
                        Text(
                            'Order Date: ${customerOrder.orderDate.toString()}'),
                        Text(
                            'Total Amount: ${customerOrder.totalCost.toStringAsFixed(2)}'),
                        Text(
                            'Transaction Amount: ${customerOrder.totalSellingAmount.toStringAsFixed(2)}'),
                        Text(
                            'Given Amount: ${customerOrder.customerGiven.toStringAsFixed(2)}'),
                        // Add more details as needed
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.LoadCustomerOrderTransactions();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _showOrderDetailsDialog(CustomerOrder customerOrder) async {
    if (customerOrder.orderId > 0) {
      await controller.LoadCustomerOrderDetails(customerOrder.orderId);
    }
    showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return Obx(() => Dialog(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Order ID: ${customerOrder.orderId}'),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Order Details:'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.orderDetails.length,
                      itemBuilder: (context, index) {
                        final orderDetail = controller.orderDetails[index];
                        return Card(
                          elevation: 3,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Product Name: ${orderDetail.productName}'),
                                Text('Quantity: ${orderDetail.quantity}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back(closeOverlays: true);
                      },
                      child: const Text('Close'),
                    ),
                  ),
                ],
              ),
            ));
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
      actions: [
        GestureDetector(
          onTap: () {
            // Get.to(
            //     ()=>const AddProduct(),
            // );
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
        AppStrings.customerOrderList,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }
}

///======================================================================

class PdfViewCustomerOrderList extends StatefulWidget {
  final CustomerOrderController customerOrderController;
  final int index;
  const PdfViewCustomerOrderList(
      {super.key, required this.customerOrderController, required this.index});

  @override
  State<PdfViewCustomerOrderList> createState() =>
      _PdfViewCustomerOrderListState();
}

class _PdfViewCustomerOrderListState extends State<PdfViewCustomerOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(
        canChangePageFormat: false,
        canDebug: false,
        // pdfFileName: 'Customer-Order',
        build: (format) => generatePdf(format, widget.index,
            customerOrderController: widget.customerOrderController),
      ),
    );
  }
}

Future<Uint8List> generatePdf(PdfPageFormat format, int index,
    {required CustomerOrderController customerOrderController}) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.nunitoExtraLight();

  var serialNumber = List.generate(
      customerOrderController.orderDetails.length, (index) => index + 1);

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
          pw.Text(
              'Order ID: ${customerOrderController.customerOrders[index].orderId.toString()}',
              style: pw.TextStyle(
                fontSize: 20.0,
                fontWeight: pw.FontWeight.bold,
              )),

          pw.SizedBox(height: 20.0),
          pw.Row(
              children: customerOrderController.tableLabelList
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
                  .toList()),

          ...customerOrderController.orderDetails.asMap().entries.map((entry) {
            int index = entry.key; // This is the index of the current element
            var element =
                entry.value; // This is the current element in the list
            return pw.Column(children: [
              pw.Row(children: [
                pw.Expanded(
                  child: pw.Container(
                    alignment: pw.Alignment.center,
                    padding: const pw.EdgeInsets.all(8.0),
                    // color: const PdfColor.fromInt(0xFFc2c2c2),
                    child: pw.Text(
                      '${index + 1}',
                    ),
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
              ]),
              pw.Divider(),
            ]);
          }),

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
                customerOrderController.customerOrders[index].totalCost
                    .toString(),
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
