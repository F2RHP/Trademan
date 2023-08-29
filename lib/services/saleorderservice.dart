import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

import '../models/SaleOrders/SaleCustomer.dart';
import '../models/SaleOrders/cash_transaction.dart';
import '../models/SaleOrders/customerorder.dart';
import '../models/SaleOrders/OrderDetails.dart';
import '../models/product/product_model.dart';

class SaleOrderService extends BaseService {
  Future<List<Cash_Transaction>> getAllCashTransaction() async {
    try {
      var response =
          await get<List<dynamic>>(ServiceHelper.cashTransactionGetUrl);
      List<Cash_Transaction> countryReportList = response
          .map((mapElement) => Cash_Transaction.fromMap(mapElement))
          .toList();

      return countryReportList;
    } catch (e) {
      return <Cash_Transaction>[];
    }
  }

  Future<List<CustomerOrder>> getAllCustomerOrder() async {
    try {
      var response =
          await get<List<dynamic>>(ServiceHelper.customerOrderGetUrl);
      List<CustomerOrder> countryReportList = response
          .map((mapElement) => CustomerOrder.fromMap(mapElement))
          .toList();

      return countryReportList;
    } catch (e) {
      return <CustomerOrder>[];
    }
  }

  Future<List<OrderDetail>> getOrderDetailsbyOrderid(int orderId) async {
    try {
      var response = await get<List<dynamic>>(
          "${ServiceHelper.customerOrderDetailsGetUrl}?orderId=$orderId");

      List<OrderDetail> orderList = response
          .map((mapElement) => OrderDetail.fromMap(mapElement))
          .toList();

      return orderList;
    } catch (e) {
      return <OrderDetail>[];
    }
  }

  //
    Future<List<SaleCustomer>> getSaleCustomerDetails() async {
    try {
      var response =  await get<List<dynamic>>(ServiceHelper.SalecustomersDetails);

      List<SaleCustomer> customerList = response
          .map((mapElement) => SaleCustomer.fromMap(mapElement))
          .toList();

      return customerList;
    } catch (e) {
      return <SaleCustomer>[];
    }
    }

     Future<List<Product>> getAllProducts() async {
    try {
      var response = await get<List<dynamic>>(ServiceHelper.productGetUrl);
      List<Product> countryReportList =
          response.map((mapElement) => Product.fromMap(mapElement)).toList();

      return countryReportList;
    } catch (e) {
      return <Product>[];
    }
  }
}
