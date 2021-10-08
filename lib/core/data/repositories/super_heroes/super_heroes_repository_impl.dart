import 'package:injectable/injectable.dart';
import 'package:my_app/core/adapter/super_heroes/super_heroes_adapter.dart';
import 'package:my_app/core/data/data_sources/super_heroes/remote/super_heroes_remote_data_source.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/entities/super_hero/super_hero_entity.dart';
import 'package:my_app/core/domain/repositories/super_heroes/super_heroes_repository.dart';

@Injectable(as: SuperHeroesRepository)
class SuperHeroesRepositoryImpl extends SuperHeroesRepository {
  final SuperHeroesRemoteDataSource _remoteDataSource;

  SuperHeroesRepositoryImpl(this._remoteDataSource);

  @override
  Future<Resource<List<SuperHeroEntity>>> searchSuperHeroesByName({
    required String name,
  }) =>
      Resource.asFuture(
        () => _remoteDataSource.searchSuperHeroByName(name: name),
        (data) => SuperHeroesResponseAdapter.fromJsonList(
          List<Map<String, dynamic>>.from(data['results'] ?? []),
        ),
      );
}
