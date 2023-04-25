import 'package:get/get.dart';
import 'package:pac/controller/auth_controller.dart';
import 'package:pac/controller/category_controller.dart';
import 'package:pac/controller/dashboard_controller.dart';
import 'package:pac/controller/home_controller.dart';
import 'package:pac/controller/product_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
    Get.put(AuthController());
  }
}
