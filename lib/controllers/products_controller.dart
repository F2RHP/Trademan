import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/generalclass.dart';
import 'base_controller.dart';
import '../services/productservice.dart';

class ProductController extends BaseController
{
  final  products=[].obs;
  late ProductService service;

  var selectedProductType=ProductType.create(1,"None").obs;

final productTypes=<ProductType>[].obs;
List<QuantityType> quantityTypes=[];
  
  TextEditingController ctrlproductname = TextEditingController();
  TextEditingController ctrlnoquantity = TextEditingController();
  TextEditingController ctrlproducttype = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    service=ProductService();
    isLoading.value=true;
    productTypes.value=getProductType();
    productTypes.value.insert(0, selectedProductType.value);
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

