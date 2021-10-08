import 'package:get/get.dart';
import 'package:my_app/app/widgets/cards/super_hero_card/model/super_hero_model.dart';
import 'package:my_app/core/data/model/resource.dart';

class SuperHeroDetailsController extends GetxController {
  //region Variables
  final state = Resource.loading<SuperHeroModel>().obs;

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    final SuperHeroModel model = Get.arguments;
    state.value = Resource.success(data: model);
  }
//endregion

}
