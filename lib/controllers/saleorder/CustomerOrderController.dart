import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/SaleOrders/customerorder.dart';
import 'package:trader_app/services/saleorderservice.dart';
import '../../models/SaleOrders/OrderDetails.dart';
import '../../models/SaleOrders/cash_transaction.dart';
import '../base_controller.dart';

class CustomerOrderController extends BaseController {


  final customerOrders = <CustomerOrder>[].obs;
  final orderDetails = <OrderDetail>[].obs;

  late SaleOrderService service;
  RxInt quantity = 0.obs;

  var Bycustomer=false;

  var customerId=0;

  @override
  void onInit() {
    service = SaleOrderService();

    isLoading.value = true;
    //LoadCustomerOrderTransactions();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> LoadCustomerOrderTransactions() async {
    isLoading.value = true;
    if (Bycustomer) {
      customerOrders.value =
          await service.getAllCustomerOrder_ByCustomer(customerId);
    } else {
      customerOrders.value = await service.getAllCustomerOrder();
    }
    isLoading.value = false;
  }

  Future<void> LoadCustomerOrderDetails(int orderId) async {
    isLoading.value = true;
    orderDetails.value = await service.getOrderDetailsbyOrderid(orderId);
    isLoading.value = false;
  }
}
