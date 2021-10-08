import 'package:get/get.dart';
import 'package:my_app/app/pages/home/bindings/home_bindings.dart';
import 'package:my_app/app/pages/home/home_page.dart';
import 'package:my_app/app/pages/super_hero_details/bindings/super_hero_details_bindings.dart';
import 'package:my_app/app/pages/super_hero_details/super_hero_details_page.dart';

abstract class Routes {
  static String initial = '/';
  static String superHeroDetails = '/super-hero-details';
}

mixin AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.initial,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.superHeroDetails,
      page: () => SuperHeroDetailsPage(),
      binding: SuperHeroDetailsBinding(),
    ),
  ];
}
