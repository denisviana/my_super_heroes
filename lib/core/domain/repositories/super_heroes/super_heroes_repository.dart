import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/super_hero/super_hero_entity.dart';

abstract class SuperHeroesRepository {
  Future<Resource<List<SuperHeroEntity>>> searchSuperHeroesByName(
      {required String name});
}
