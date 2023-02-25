import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}