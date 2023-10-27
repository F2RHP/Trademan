import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trader_app/models/SaleOrders/SaleCustomer.dart';
import 'package:trader_app/services/saleorderservice.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/SaleOrders/CashTransactionInput.dart';
import '../../models/SaleOrders/Saleproduct.dart';
import '../../models/SaleOrders/new_order_input.dart';
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

  final totalProductAmount = 0.0.obs;

  var customerFilter = "".obs;

  final goodsOrderDate = (DateFormat('yyyy-MM-dd').format(DateTime.now())).toString().obs;
  //DateFormat('yyyy-MM-dd').format(value!)

  void CalculateTotalprodctAmount() {
    totalProductAmount.value =
        saleProductList.fold(0, (sum, product) => sum + product.total);
  }

  final selectedOption = 'Buy'.obs;

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

  List<SaleCustomer> get filteredCustomer {
    if (customerFilter.isEmpty) {
      return customerList;
    } else {
      return customerList.where((prod) {
        return prod.customerName
            .toLowerCase()
            .contains(customerFilter.value.toLowerCase());
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
    transactionAmount.text = "0";
    customerGiven.text = "0";
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

  bool Isbuy() {
    return selectedOption.value.toLowerCase() == "buy";
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
    UpdateSerialnumber();
    CalculateTotalprodctAmount();
  }

  void UpdateSerialnumber() {
    int sNo = 1;
    for (var product in saleProductList) {
      product.sno = sNo;
      sNo = sNo + 1;
    }
  }

  void saveAndNavigate() {
    isLoading.value = true;
    if (IsMoney()) {
      addMoneyDetails();
    } else {
      addProductOrderDetails();
    }
    isLoading.value = false;
  }

  addSaleProductList(Product product) {
    selectedProduct.value = product;
    addSaleProdcut(product);
  }

  void refreshList() {
    final saleProductListTemp = saleProductList.toList();
    saleProductList.value = saleProductListTemp;
    UpdateSerialnumber();
    CalculateTotalprodctAmount();
  }

  Future<bool> addMoneyDetails() async {
    CashTransactionData customer = CashTransactionData(
        actionCode: "I",
        transactionAmount: transactionAmount.text,
        transactionId: 0,
        transactionTypeId: selectedtransactionType,
        transactionDate: dataController.text,
        customerId: selectedCustomer.value.customerID,
        comments: transactionNotes.text);

    if (await service.addMoneyDetails(customer)) {
      Get.snackbar("Information", "Saved sucessfullly");
      dataController.text = "";
      transactionNotes.text = "";
      transactionAmount.text = "";
      return true;
    } else {
      Get.snackbar("Information", "Failed to save");
      return false;
    }
  }

  Future<bool> addProductOrderDetails() async {
    Customer customer = Customer(
        customerId: selectedCustomer.value.customerID,
        name: selectedCustomer.value.customerName,
        email: '');

    List<OrderDetail> order_information = [];
    for (var element in saleProductList) {
      OrderDetail d = OrderDetail(
          productId: element.productId,
          productPrice: element.productPrice,
          sellingPrice: element.sellingPrice,
          quantity: element.quantity);
      order_information.add(d);
    }
    OrderDetails order_details = OrderDetails(orderDetail: order_information);

    double? customerGiv = double.tryParse(customerGiven.text);
    var customerOrder = CustomerOrder(
        customerGiven: customerGiv!,
        orderDate: goodsOrderDate.value.isEmpty
            ? DateTime.now()
            : DateTime.parse(goodsOrderDate.value),
        isBuyOrder: Isbuy() ? 1 : 0,
        orderDetails: order_details,
        orderNotes: orderNotes.text);

    ProductOrder productOrder =
        ProductOrder(customer: customer, customerOrder: customerOrder);

    if (await service.addProductOrderDetails(productOrder)) {
      Get.snackbar("Information", "Saved sucessfullly");
      orderNotes.text = "";
      customerGiven.text = "";
      totalProductAmount.value = 0;
      saleProductList.clear();
      return true;
    } else {
      Get.snackbar("Information", "Failed to save");
      return false;
    }
  }
}
