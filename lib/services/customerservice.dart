import 'package:trader_app/models/customer_model/list_customer_model.dart';
import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

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


}