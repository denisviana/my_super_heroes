import 'package:get/get.dart';
import 'package:my_app/app/pages/super_hero_details/super_hero_details_controller.dart';

class SuperHeroDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuperHeroDetailsController());
  }
}
