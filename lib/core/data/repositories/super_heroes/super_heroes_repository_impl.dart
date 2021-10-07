import 'package:injectable/injectable.dart';
import 'package:radio_life/core/data/data_sources/super_heroes/remote/super_heroes_remote_data_source.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/super_hero/super_hero_entity.dart';
import 'package:radio_life/core/domain/repositories/super_heroes/super_heroes_repository.dart';

@Injectable(as: SuperHeroesRepository)
class SuperHeroesRepositoryImpl extends SuperHeroesRepository {
  final SuperHeroesRemoteDataSource _remoteDataSource;

  SuperHeroesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Resource<List<SuperHeroEntity>>> searchSuperHeroesByName({
    required String name,
  }) =>
      Resource.asFuture(() async {
        final response =
            await _remoteDataSource.searchSuperHeroByName(name: name);
        return <SuperHeroEntity>[];
      });
}
