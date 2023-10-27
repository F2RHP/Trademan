import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/saleorder/SaleOrderCashController.dart';
import '../../screens/shared_widgets/sized_box.dart';

class Cash_TransactionList extends StatefulWidget {
  @override
  State<Cash_TransactionList> createState() => _Cash_TransactionListState();
}

class _Cash_TransactionListState extends State<Cash_TransactionList> {
  final SaleOrderCashController controller = Get.put(SaleOrderCashController());

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
    controller.LoadAllCashTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.cashTransactions.isEmpty) {
          return const Center(
            child: Text('No cashTransactions available.'),
          );
        }

        return ListView.builder(
          itemCount: controller.cashTransactions.length,
          itemBuilder: (context, index) {
            final transaction = controller.cashTransactions[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.customerName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'Transaction Type: ${transaction.transactionTypeName}'),
                    Text(
                      'Amount: \₹ ${transaction.transactionAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20),
                    ),
                    Text(
                        'Transaction Date: ${transaction.transactionDate.toString()}'),
                    // Other transaction details can be added here
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller
              .LoadAllCashTransactions(); // Fetch transactions when the button is pressed
        },
        child: const Icon(Icons.refresh),
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
        AppStrings.CashTransactionList,
        style: TextStyle(
          color: AppColors.kSecondaryColor,
        ),
      ),
    );
  }
}
