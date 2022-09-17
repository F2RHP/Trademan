import 'package:trader_app/controllers/invoices_controller.dart';
import 'package:get/get.dart';

import '../../controllers/homescreen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController(), permanent: true);
  }
}
