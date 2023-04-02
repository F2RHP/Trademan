import 'package:get/get.dart';
import '../../controllers/products_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(), permanent: false);
  }
}
