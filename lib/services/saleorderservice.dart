import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

import '../models/SaleOrders/cash_transaction.dart';

class SaleOrderService extends BaseService
{
Future<List<Cash_Transaction>> getAllCashTransaction() async {
    try {
      var response = await get<List<dynamic>>(ServiceHelper.cashTransactionGetUrl);
      List<Cash_Transaction> countryReportList =
          response.map((mapElement) => Cash_Transaction.fromMap(mapElement)).toList();

      return countryReportList;
    } catch (e) {
      return <Cash_Transaction>[];
    }
  }
}