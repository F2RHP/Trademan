import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/services/servicebase.dart';

class AddProductCtrl extends GetxController {

  TextEditingController productNameCtrl = TextEditingController();
  var product_ID;
  var productTypeID;
  var quantity_Type;
  var product_Code;
  TextEditingController productDecCtrl = TextEditingController();
  TextEditingController productNotesCtrl = TextEditingController();
  TextEditingController productCostCtrl = TextEditingController();
  var supplierID;
  var noOfQuantity;
  TextEditingController sellingCostCtrl = TextEditingController();
  TextEditingController purchaseNotesCtrl = TextEditingController();

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
      "productsTypeId": productTypeID,
      "quantityTypeId": quantity_Type,
      "noofquantity": noOfQuantity,
      "productCode": product_Code,
      "productDescription": productDecCtrl.text,
      "notes": productNotesCtrl.text,
      "productImageUrl": "",
      "supplierId": supplierID,
      "logicalcancel": false,
      "productCost": productCostCtrl.text,
      "sellingCost": sellingCostCtrl.text,
      "purchaseNotes": purchaseNotesCtrl.text,
    };
    await BaseService().post(url, bodyData).whenComplete(() => Get.back());
  }
}
