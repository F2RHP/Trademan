import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/customerservice.dart';
import 'add_kpr_customer_controller.dart';

class ListCustomersCtrl extends BaseController {
  var filterText = ''.obs;
  RxList<CustomersList> customersList = <CustomersList>[].obs;
  RxList searchList = [].obs;
  late CustomerService service;

  void onItemClick(CustomersList m) {

    Get.to(const CustomerRegistration(), arguments:  m);

  }

  void onItemNewCustomerClick() {
    Get.to(const CustomerRegistration());
  }

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    service = CustomerService();
    await getAllListCustomersList();
    isLoading.value = false;
  }

  Future<void> getAllListCustomersList() async {
    customersList.value = await service.getAllListCustomers();
  }

   List<CustomersList> get filteredCustomers {
    if (filterText.isEmpty) {
      return customersList;
    } else {
      return customersList.where((customer) {
        
        return customer.customeRName!.toLowerCase().contains(filterText.value.toLowerCase());
      }
      
      ).toList();
    }
   }
}
