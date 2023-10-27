import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/saleorder/CustomerOrderController.dart';
import '../../models/SaleOrders/customerorder.dart';
import '../../screens/shared_widgets/sized_box.dart';

class CustomerOrderListScreen extends StatefulWidget {
  @override
  State<CustomerOrderListScreen> createState() => _CustomerOrderListScreenState();
}

class _CustomerOrderListScreenState extends State<CustomerOrderListScreen> {
  final controller = Get.put(CustomerOrderController());

int? arguments = Get.arguments as int?;

  @override
  void initState() {
    if (arguments!=null && arguments!>0) {
      controller.Bycustomer = true;
      controller.customerId = arguments!;
    }  else {
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
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order ID: ${customerOrder.orderId}'),
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
                        margin: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product Name: ${orderDetail.productName}'),
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
