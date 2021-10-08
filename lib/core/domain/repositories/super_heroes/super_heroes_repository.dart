import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/entities/super_hero/super_hero_entity.dart';

abstract class SuperHeroesRepository {
  Future<Resource<List<SuperHeroEntity>>> searchSuperHeroesByName(
      {required String name});
}
