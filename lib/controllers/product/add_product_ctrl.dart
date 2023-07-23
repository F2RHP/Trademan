import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/supplier/supplier.dart';
import 'package:trader_app/services/productservice.dart';
import 'package:trader_app/services/supplierService.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/utility/utility_models.dart';

class AddProductCtrl extends BaseController {


  var product_ID;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDecCtrl = TextEditingController();
  TextEditingController productCodeCtrl = TextEditingController();
  TextEditingController productNoOfquantityCtrl = TextEditingController();
  TextEditingController productNotesCtrl = TextEditingController();
  TextEditingController productCostCtrl = TextEditingController();
  TextEditingController sellingCostCtrl = TextEditingController();
  TextEditingController purchaseNotesCtrl = TextEditingController();

  late ProductService service;
  late utilityService utService;
  late SupplierService supplierService;

  final quantityType=<QuantityTypeModel>[].obs;
  var selectedQuantity=null;

  final productType=<ProductTypeModel>[].obs;
  var  selectedProductType=null;

  final supplierList=<SupplierDTO>[].obs;
  var  selectedSupplier=null;



  @override
  void onInit() async{
    // TODO: implement onInit
    utService=utilityService();
    service=ProductService();
    supplierService=SupplierService();
    await loadvalues();
    super.onInit();
  }

  Future<void> loadvalues() async {
    isLoading.value=true;
    quantityType.value=await utService.getMockQuantityTypes();
    productType.value=await utService.getMockProductTypes();
    supplierList.value=await supplierService.getSuppliers();
    isLoading.value=false;
  }
  void saveData() {
    if (productNameCtrl.text.isEmpty ||
        productDecCtrl.text.isEmpty ||
        productNotesCtrl.text.isEmpty ||
        productCostCtrl.text.isEmpty ||
        sellingCostCtrl.text.isEmpty ||
        purchaseNotesCtrl.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      postData();
    }
  }

  postData() async {
    String url = 'Products/AddProduct';
    var bodyData = {
      "productId": product_ID,
      "productName": productNameCtrl.text,
      "productsTypeId": productType.value,
      "quantityTypeId": quantityType.value,
      "noofquantity": productNoOfquantityCtrl.text,
      "productCode": productCodeCtrl.text,
      "productDescription": productDecCtrl.text,
      "notes": productNotesCtrl.text,
      "productImageUrl": "",
      "supplierId": selectedSupplier.value,
      "logicalcancel": false,
      "productCost": productCostCtrl.text,
      "sellingCost": sellingCostCtrl.text,
      "purchaseNotes": purchaseNotesCtrl.text,
    };
    await service.post(url, bodyData).whenComplete(() => Get.back());
  }
}
