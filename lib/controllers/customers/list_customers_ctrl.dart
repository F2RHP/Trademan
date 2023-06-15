import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/customerservice.dart';
import 'add_kpr_customer_controller.dart';

class ListCustomersCtrl extends BaseController {
  final customersList = <CustomersList>[].obs;
  List searchList = [].obs;
  late CustomerService service;

  void onItemClick(CustomersList m) {
    bool isRegistered = GetInstance().isRegistered<AddKPRCustomerController>();
    if (isRegistered) {
      Get.delete<AddKPRCustomerController>();
    }
    var addController = AddKPRCustomerController();
    Get.put(addController);    
    addController.action.value = "EDIT";
    addController.updateCustomerDefiles(m);
    
    Get.to(const CustomerRegistration(), arguments: {'customer': m});
  }

  void onItemNewCustomerClick() {
    var addController = AddKPRCustomerController();
    addController.action.value = "ADD";
    bool isRegistered = GetInstance().isRegistered<AddKPRCustomerController>();
    if (isRegistered) {
      Get.delete<AddKPRCustomerController>();
    }
    Get.put(addController);
    Get.to(const CustomerRegistration());
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    service = CustomerService();
    getAllListCustomersList();
    isLoading.value = false;
  }

  void getAllListCustomersList() async {
    customersList.value = await service.getAllListCustomers();
  }
}
