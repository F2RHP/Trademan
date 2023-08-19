import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/controllers/product/products_controller.dart';
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
  Future<void> saveData() async{
    if (productNameCtrl.text.isEmpty ||
        productDecCtrl.text.isEmpty ||
        productNotesCtrl.text.isEmpty ||
        productCostCtrl.text.isEmpty ||
        sellingCostCtrl.text.isEmpty ||
        purchaseNotesCtrl.text.isEmpty||
        selectedQuantity ==null||
        selectedProductType==null||
        selectedSupplier==null
        ) {
      Get.snackbar(
        "Error",
        "Please Fill all the required fields",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      isLoading.value=true;
      await postData();
      isLoading.value=false;
    }
  }

// void updateControlsFromObject(Product productObject) {
//   productNameCtrl.text = productObject.producTName!;
//   selectedProductType = productObject.productSTypeId;
//   selectedQuantity = productObject.quantitYTypeId;
//   productNoOfquantityCtrl.text = productObject.nOOfQuantity.toString();
//   productCodeCtrl.text = productObject.producTCode!;
//   productDecCtrl.text = productObject.productDescription!;
//   productNotesCtrl.text = productObject.notes;
//   // Set other controls similarly

//   // If you need to handle conversions or formatting, you can do it here
//   productCostCtrl.text = productObject.productCost;
//   sellingCostCtrl.text = productObject.sellingCost;
//   purchaseNotesCtrl.text = productObject.purchaseNotes;


//   // Similar control updates for the remaining properties
// }




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
    {
      LoadAllProducts()
    });
  }

  Future<void>LoadAllProducts() async
  {
    Get.find<AllProductCtrl>().LoadAllProducts();
      Get.back(closeOverlays: true);
  }
}
