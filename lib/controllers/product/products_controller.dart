import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/product/product_model.dart';
import 'package:trader_app/services/utilityservice.dart';
import '../../models/generalclass.dart';
import '../../services/supplierService.dart';
import '../base_controller.dart';
import '../../services/productservice.dart';

class AllProductCtrl extends BaseController {
  final  products=<Product>[].obs;
  List searchList = [].obs;
  late ProductService service;
  late utilityService utService;

 var filterText = ''.obs;

  TextEditingController ctrlProductName = TextEditingController();
  TextEditingController ctrlNoQuantity = TextEditingController();
  TextEditingController ctrlProductType = TextEditingController();


  @override
  void onInit() async {
    super.onInit();
    service=ProductService();
    utService=utilityService();
    isLoading.value=true;
    LoadAllProducts();
    isLoading.value=false;
  }

Future<void>LoadAllProducts() async
{
  isLoading.value=true;
    products.value = await service.getAllProducts();
    isLoading.value=false;
}

 List<Product> get filteredProducts {
    if (filterText.isEmpty) {
      return products;
    } else {
      return products.where((prod) {
        
        return prod.producTName!.toLowerCase().contains(filterText.value.toLowerCase());
      }
      
      ).toList();
    }
 }

}