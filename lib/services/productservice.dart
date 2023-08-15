import 'package:trader_app/models/product/product_model.dart';
import 'package:trader_app/models/product/productobject.dart';
import 'package:trader_app/services/servicebase.dart';
import 'package:trader_app/services/servicehelper.dart';

class ProductService extends BaseService {
  Future<List<Product>> getAllProducts() async {
    try {
      var response = await get<List<dynamic>>(ServiceHelper.productGetUrl);
      List<Product> countryReportList =
          response.map((mapElement) => Product.fromMap(mapElement)).toList();

      return countryReportList;
    } catch (e) {
      return <Product>[];
    }
  }

  Future<ProductObject?> getProductByID(int productId) async {
    ProductObject product =
        await get<ProductObject>("Uri.parse(ServiceHelper.productGetUrl");

    return product;
  }
}
