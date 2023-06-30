import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/product_model.dart';
import '../../models/generalclass.dart';
import '../base_controller.dart';
import '../../services/productservice.dart';

class AllProductCtrl extends BaseController {
  final  products=<Product>[].obs;
  List searchList = [].obs;
  late ProductService service;
  bool isSearch = true;

  var selectedProductType=ProductType.create(1,"None").obs;

final productTypes=<ProductType>[].obs;
List<QuantityType> quantityTypes=[];

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
    isLoading.value=true;
    productTypes.value=getProductType();
    productTypes.insert(0, selectedProductType.value);
    quantityTypes=getQuantityType();
    products.value = await service.getAllProducts();
    isLoading.value=false;
  }

   List<ProductType> getProductType()
  {
    List<ProductType> type=[];
    type.add(ProductType.create(1,"RICE"));
    type.add(ProductType.create(2,"SEEDS"));
    return type;
  }
   List<QuantityType> getQuantityType()
  {
    List<QuantityType> type=[];
    type.add(QuantityType.create(1,"PACK"));
    type.add(QuantityType.create(2,"KG"));
    return type;
  }
}