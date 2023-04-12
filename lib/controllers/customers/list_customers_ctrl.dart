import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/productservice.dart';

class ListCustomersCtrl extends BaseController {
  final customersList = <CustomersList>[].obs;
  List searchList = [].obs;
  late ProductService service;

  void onItemClick(CustomersList m) {
    Get.to(const CustomerRegistration(),arguments: {'customer': m});
  }

  @override
  void onInit() async {
    super.onInit();
    service = ProductService();
    customersList.value = await service.getAllListCustomers();
    isLoading.value = false;
  }
}
