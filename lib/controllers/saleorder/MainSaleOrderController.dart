import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/SaleOrders/SaleCustomer.dart';
import 'package:trader_app/services/saleorderservice.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/SaleOrders/Saleproduct.dart';
import '../../models/SaleOrders/cash_transaction.dart';
import '../../models/product/product_model.dart';
import '../../models/utility/utility_models.dart';
import '../base_controller.dart';

class MainSaleOrderController extends BaseController {
 //Controllers
  TextEditingController customerGiven = TextEditingController();
  TextEditingController orderNotes = TextEditingController();

   TextEditingController transactionAmount = TextEditingController();
   TextEditingController transactionNotes = TextEditingController();

 final  customerList=<SaleCustomer>[].obs;

  final saleTransactionsType=<SaleTransactionTypeModel>[].obs;
  var selectedsaleTransaction=null;

  final transactionType=<TransactionTypeModel>[].obs;
  var  selectedtransactionType=null;

 final  productList=<Product>[].obs;



final saleProductList= <SaleProduct>[].obs;

  late SaleOrderService service;
  late utilityService utService;
  RxInt quantity = 0.obs;

  @override
  void onInit() {
    service = SaleOrderService();
    utService=utilityService();

    isLoading.value = true;
    LoadAllSaleTransactiontype();
    LoadSaleCustomers();
    LoadAllTransactiontype();
    LoadAllProducts();
    isLoading.value = false;

    super.onInit();
  }

  Future<void> LoadAllSaleTransactiontype() async {
    isLoading.value = true;
    saleTransactionsType.value = await utService.getSaleTransactionTypes();
    isLoading.value = false;
  }

   Future<void> LoadAllTransactiontype() async {
    isLoading.value = true;
    transactionType.value = await utService.getTransactionTypes();
    isLoading.value = false;
  }

  Future<void>LoadAllProducts() async
{
  isLoading.value=true;
    productList.value = await service.getAllProducts();
    isLoading.value=false;
}

  Future<void>LoadSaleCustomers() async
{
  isLoading.value=true;
    customerList.value = await service.getSaleCustomerDetails();
    isLoading.value=false;
}



 void addProdcut(Product product) {
    var sp= SaleProduct(
      sno: saleProductList.length, // Assuming you map sno to producTId
      productId: product.producTId,
      productName: product.producTName!,
      quantity: product.nOOfQuantity,
      productPrice: product.producTCost,
      sellingPrice: product.sellinGCost,
      total: product.sellinGCost * product.nOOfQuantity,
    );

    saleProductList.add(sp);
  }

  void UpdateSerialnumber()
  {
    int sNo=1;
     for (var product in saleProductList) {
    product.sno=sNo;
    sNo=sNo+1;
     }
  }

}


