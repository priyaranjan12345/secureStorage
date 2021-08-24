import 'package:get/get.dart';
import 'package:securestorage/controller/mycontroller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MyController());
  }
}
