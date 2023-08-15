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


  bool isSearch = true;


  TextEditingController ctrlProductName = TextEditingController();
  TextEditingController ctrlNoQuantity = TextEditingController();
  TextEditingController ctrlProductType = TextEditingController();

  onSearch(value) {
    isSearch = false;
    searchList = products
        .where((getValue) =>
    getValue.producTName!.contains(value) ||
        getValue.supplieRName!.contains(value))
        .toList();
  }

  @override
  void onInit() async {
    super.onInit();
    service=ProductService();
    utService=utilityService();
    isLoading.value=true;
    products.value = await service.getAllProducts();
    isLoading.value=false;
  }


}