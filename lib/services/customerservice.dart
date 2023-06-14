import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

import '../models/customer_model/CustomerDTO_UPD.dart';
import '../models/customer_model/customer_search_model.dart';

class CustomerService extends BaseService{



  Future<List<CustomersList>> getAllListCustomers() async
  {
    try {

      var response = await  get<List<dynamic>>(ServiceHelper.listCustomer);
        List<CustomersList> customersList = response
            .map((mapElement) => CustomersList.fromMap(mapElement))
            .toList();

        return customersList;
    }
    catch (e) {
      return <CustomersList>[];
    }
  }

Future<List<CustomersList>> getAllListCustomersList(CustomerDTO_Input input) async {
  try {
    var queryParams = input.toJson();
    var response = await getWithParam<List<Map<String, dynamic>>>(
      ServiceHelper.listCustomer,
      queryParams,
    );
    List<CustomersList> customersList = response
        .map((mapElement) => CustomersList.fromMap(mapElement))
        .toList();
    return customersList;
  } catch (e) {
    return <CustomersList>[];
  }
}


  Future<CustomersList> getCustomerbyId(int customerId) async
  {
    try {

      var response = await  get<List<dynamic>>(ServiceHelper.getCustomerById);
        CustomersList customersList = response
            .map((mapElement) => CustomersList.fromMap(mapElement)).first;

        return customersList;
    }
    catch (e) {
      return CustomersList();

    }
  }

Future<void> addCustomer(CustomerDTO_UPD customer) async {
  final endpoint = 'Customer/AddCustomer';
  final body = customer.toJson();

  try {
    final response = await post(endpoint, body);


  } catch (e) {
    print('Error occurred: $e');
  }
}


}