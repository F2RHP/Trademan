import 'package:get/get.dart';
import '../../controllers/product/products_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllProductCtrl(), permanent: false);
  }
}
