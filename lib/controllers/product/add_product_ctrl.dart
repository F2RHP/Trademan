import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/controllers/product/products_controller.dart';
import 'package:trader_app/models/product/productobject.dart';
import 'package:trader_app/models/supplier/supplier.dart';
import 'package:trader_app/services/productservice.dart';
import 'package:trader_app/services/supplierService.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/product/product_model.dart';
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

  final quantityType = <QuantityTypeModel>[].obs;
  var selectedQuantity = null;

  final productType = <ProductTypeModel>[].obs;
  var selectedProductType = null;

  final supplierList = <SupplierDTO>[].obs;
  var selectedSupplier = null;

  var action=''.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    utService = utilityService();
    service = ProductService();
    supplierService = SupplierService();
    await loadvalues();
    super.onInit();
  }

  Future<void> loadvalues() async {
    isLoading.value = true;
    quantityType.value = await utService.getMockQuantityTypes();
    productType.value = await utService.getMockProductTypes();
    supplierList.value = await supplierService.getSuppliers();
    isLoading.value = false;
  }

  Future<void> saveData() async {
    if (productNameCtrl.text.isEmpty ||
        sellingCostCtrl.text.isEmpty ||
        supplierList.isEmpty ||
        productNoOfquantityCtrl.text.isEmpty ||
        productCostCtrl.text.isEmpty ||
        selectedQuantity == null ||
        productType.isEmpty ||
        quantityType.isEmpty) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isLoading.value = true;
      await postData();
      isLoading.value = false;
    }
  }

void updateControlsFromObject(ProductObject productObject,Product p) {
  productNameCtrl.text = productObject.PRODUCT_NAME!;
  selectedProductType = productObject.PRODUCTS_TYPE_ID;
  selectedQuantity = productObject.QUANTITY_TYPE_ID;
  productNoOfquantityCtrl.text = p.nOOfQuantity.toString();
  productCodeCtrl.text = productObject.PRODUCT_CODE!;
  productDecCtrl.text = productObject.PRODUCT_DESCRIPTION!;
  productNotesCtrl.text = productObject.NOTES;
  // Set other controls similarly

  // If you need to handle conversions or formatting, you can do it here
  productCostCtrl.text = p.producTCost.toString();
  sellingCostCtrl.text = p.sellinGCost.toString();
  purchaseNotesCtrl.text = '';

  // Similar control updates for the remaining properties
  selectedProductType=productType[0];
  selectedQuantity=quantityType[0];
  selectedSupplier=supplierList[0];
}

  postData() async {
    String url = 'Products/AddProduct';
    var bodyData = {
      "productId": product_ID,
      "productName": productNameCtrl.text,
      "productsTypeId": (selectedProductType as ProductTypeModel).productTypeId,
      "quantityTypeId": (selectedQuantity as QuantityTypeModel).quantityTypeId,
      "noofquantity": productNoOfquantityCtrl.text,
      "productCode": productCodeCtrl.text,
      "productDescription": productDecCtrl.text,
      "notes": productNotesCtrl.text,
      "productImageUrl": "",
      "supplierId": (selectedSupplier as SupplierDTO).supplierId,
      "logicalcancel": false,
      "productCost": productCostCtrl.text,
      "sellingCost": sellingCostCtrl.text,
      "purchaseNotes": purchaseNotesCtrl.text,
    };
    await service.post(url, bodyData).whenComplete(() =>
        // ignore: unnecessary_set_literal
        {LoadAllProducts()});
  }

  Future<void> LoadAllProducts() async {
    Get.find<AllProductCtrl>().LoadAllProducts();
    Get.back(closeOverlays: true);
  }

  void updateproduct(Product? arguments) async {
    ProductObject? p = await service.getProductByID(arguments!.producTId);
    updateControlsFromObject(p!,arguments);
  }
}
