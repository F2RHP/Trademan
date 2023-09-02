import 'package:get/get.dart';
import 'package:trader_app/services/saleorderservice.dart';
import '../../models/SaleOrders/cash_transaction.dart';
import '../base_controller.dart';

class SaleOrderCashController extends BaseController {
  final cashTransactions = <Cash_Transaction>[].obs;
  late SaleOrderService service;
  RxInt quantity = 0.obs;

  var Bycustomer=false;

  var customerId=0;

  @override
  void onInit() {
    service = SaleOrderService();

    isLoading.value = true;
    //LoadAllCashTransactions();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> LoadAllCashTransactions() async {
    isLoading.value = true;
    if (Bycustomer) {
      cashTransactions.value =
          await service.getAllCashTransaction_ByCustomer(customerId);
    } else {
      cashTransactions.value = await service.getAllCashTransaction();
    }
    isLoading.value = false;
  }
}
