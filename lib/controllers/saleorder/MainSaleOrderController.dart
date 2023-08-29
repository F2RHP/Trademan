import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/SaleOrders/SaleCustomer.dart';
import 'package:trader_app/services/saleorderservice.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/SaleOrders/CashTransactionInput.dart';
import '../../models/SaleOrders/Saleproduct.dart';
import '../../models/SaleOrders/cash_transaction.dart';
import '../../models/product/product_model.dart';
import '../../models/utility/utility_models.dart';
import '../base_controller.dart';

class MainSaleOrderController extends BaseController {
  //Controllers
  TextEditingController customerGiven = TextEditingController();
  TextEditingController orderNotes = TextEditingController();
  TextEditingController dataController = TextEditingController();

  TextEditingController transactionAmount = TextEditingController();
  TextEditingController transactionNotes = TextEditingController();

  final customerList = <SaleCustomer>[].obs;

  Rx<SaleCustomer> selectedCustomer = Rx<SaleCustomer>(SaleCustomer(
    customerID: 0,
    customerName: '',
    customerNickname: '',
    fatherName: '',
    villageName: '',
    contactNumber: '',
  ));

  Rx<Product> selectedProduct = Product(
    producTId: 0,
    producTName: '',
    producTCode: '',
    producTNotes: '',
    nOOfQuantity: 0,
    producTCost: 0.0,
    sellinGCost: 0.0,
    purchasEDate: DateTime.now(),
    purchaseorderkey: '',
    productSTypeId: 0,
    producTType: '',
    quantitYTypeId: 0,
    quantitYTypeName: '',
    supplieRId: 0,
    supplieRName: '',
    supplieRContact: '',
  ).obs;

  final saleTransactionsType = <SaleTransactionTypeModel>[].obs;
  var selectedsaleTransaction = null;

  final transactionType = <TransactionTypeModel>[].obs;
  var selectedtransactionType = null;

  final productList = <Product>[].obs;

  final saleProductList = <SaleProduct>[].obs;

  late SaleOrderService service;
  late utilityService utService;
  RxInt quantity = 0.obs;

  final filterText = "".obs;

  double get totalprodctAmount {
    return saleProductList.fold(
        0, (sum, product) => sum + product.sellingPrice);
  }

  List<Product> get filteredProducts {
    if (filterText.isEmpty) {
      return productList;
    } else {
      return productList.where((prod) {
        return prod.producTName!
            .toLowerCase()
            .contains(filterText.value.toLowerCase());
      }).toList();
    }
  }

  @override
  void onInit() {
    service = SaleOrderService();
    utService = utilityService();

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
    if (saleTransactionsType.isNotEmpty) {
      SaleTransactionTypeModel defaultSelectedItem = saleTransactionsType
          .firstWhere((type) => type.name!.toUpperCase() == "MONEY");
      selectedsaleTransaction = defaultSelectedItem.saleTransactionId;
    }
    isLoading.value = false;
  }

  bool IsMoney() {
    if (saleTransactionsType.isEmpty) {
      return true;
    }
    SaleTransactionTypeModel currentItem = saleTransactionsType.firstWhere(
        (type) => type.saleTransactionId == selectedsaleTransaction);
    if (currentItem.name!.toLowerCase() == "money") {
      return true;
    } else {
      return false;
    }
  }

  Future<void> LoadAllTransactiontype() async {
    isLoading.value = true;
    transactionType.value = await utService.getTransactionTypes();
    isLoading.value = false;
  }

  Future<void> LoadAllProducts() async {
    isLoading.value = true;
    productList.value = await service.getAllProducts();
    isLoading.value = false;
  }

  Future<void> LoadSaleCustomers() async {
    isLoading.value = true;
    customerList.value = await service.getSaleCustomerDetails();
    isLoading.value = false;
  }

  void addSaleProdcut(Product product) {
    var sp = SaleProduct(
      sno: saleProductList.length + 1, // Assuming you map sno to producTId
      productId: product.producTId,
      productName: product.producTName!,
      quantity: 1,
      productPrice: product.producTCost,
      sellingPrice: product.sellinGCost,
      total: product.sellinGCost * 1,
    );

    saleProductList.add(sp);
  }

  void UpdateSerialnumber() {
    int sNo = 1;
    for (var product in saleProductList) {
      product.sno = sNo;
      sNo = sNo + 1;
    }
  }

  void saveAndNavigate() {
    if (IsMoney()) {
    } else {}
  }

  addSaleProductList(Product product) {
    selectedProduct.value = product;
    addSaleProdcut(product);
  }

  void refreshList() {
final saleProductListTemp = saleProductList.toList();
    saleProductList.value=saleProductListTemp;

  }

  // Future<bool> addCustomer() async {
  //   CashTransactionData  customer=CashTransactionData(actionCode: 'I',transactionAmount: );
  //   const endpoint = 'Customer/AddCustomer';
  //   final body = customer.toJson();

  //   try {
  //     final response = await post(endpoint, body);
  //     return response > 0;
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     return false;
  //   }
  // }
}
