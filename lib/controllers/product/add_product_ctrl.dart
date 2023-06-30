import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

class AddProductCtrl extends GetxController {
  //  "productId": 0,
  //     "productName": "Sakthy 25 KG RICE",
  //     "productsTypeId": 1,
  //     "quantityTypeId": 1,
  //     "noofquantity": 25,
  //     "productCode": "AC",
  //     "productDescription": "SUPER RICE FOR EAT",
  //     "notes": "Sakthy RICE FOR EAT",
  //     "productImageUrl": "",
  //     "supplierId": 1,
  //     "logicalcancel": false,
  //     "productCost": 500,
  //     "sellingCost": 600,
  //     "purchaseNotes": "SUPER RICE FOR EAT"
  //
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
    await BaseService().post(url, bodyData);
  }
}
