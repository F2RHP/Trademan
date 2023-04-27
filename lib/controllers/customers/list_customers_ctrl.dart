import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/customerservice.dart';
import 'package:trader_app/services/productservice.dart';

import 'add_kpr_customer_controller.dart';

class ListCustomersCtrl extends BaseController {
  final customersList = <CustomersList>[].obs;
  List searchList = [].obs;
  late CustomerService service;

  void onItemClick(CustomersList m) {
    var addController=AddKPRCustomerController();
    addController.action.value="EDIT";
addController.updateCustomerDefiles(m);
bool isRegistered = GetInstance().isRegistered<AddKPRCustomerController>();
if(isRegistered)
{
  Get.delete<AddKPRCustomerController>();
}
     Get.put(addController);
    Get.to(const CustomerRegistration(),arguments: {'customer': m});
  }

  void onItemNewCustomerClick() {
    var addController=AddKPRCustomerController();
    addController.action.value="ADD";
    bool isRegistered = GetInstance().isRegistered<AddKPRCustomerController>();
if(isRegistered)
{
  Get.delete<AddKPRCustomerController>();
}
     Get.put(addController);
    Get.to(const CustomerRegistration());
  }

  @override
  void onInit() async {
    super.onInit();
    service = CustomerService();
    customersList.value = await service.getAllListCustomers();
    isLoading.value = false;
  }
}
