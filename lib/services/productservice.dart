import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:trader_app/models/product_model.dart';
import 'package:trader_app/services/servicehelper.dart';

class ProductService {
  Future<List<Product>> getAllProducts() async
  {
    try {
      final _uri = Uri.parse(
          '${ServiceHelper.BaseUrl}${ServiceHelper.productGetUrl}');
      var response = await http.get(_uri);
      if (response.statusCode == ServiceHelper.Sucesscode) {
        List decodedList = convert.jsonDecode(response.body);
        List<Product> countryReportList = decodedList
            .map((mapElement) => Product.fromMap(mapElement))
            .toList();
print(countryReportList.length);
        return countryReportList;
      }
      else {
        return <Product>[];
      }
    }
    catch (e) {
      print(e.toString());
      return <Product>[];

    }
  }
}