import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/super_hero/super_hero_entity.dart';
import 'package:radio_life/core/domain/repositories/super_heroes/super_heroes_repository.dart';
import 'package:radio_life/core/domain/use_cases/base/base_use_case.dart';

@injectable
class SearchSuperHeroesByNameUseCase
    extends BaseFutureResourceUseCase<String, List<SuperHeroEntity>> {
  final SuperHeroesRepository _superHeroesRepository;

  SearchSuperHeroesByNameUseCase(this._superHeroesRepository);

  @override
  Future<Resource<List<SuperHeroEntity>?>> call(String params) =>
      _superHeroesRepository.searchSuperHeroesByName(name: params);
}
