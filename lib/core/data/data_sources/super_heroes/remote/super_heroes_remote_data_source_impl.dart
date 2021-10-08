import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/data_sources/super_heroes/remote/super_heroes_remote_data_source.dart';
import 'package:my_app/core/data/network/dio_client.dart';

@Injectable(as: SuperHeroesRemoteDataSource)
class SuperHeroesRemoteDataSourceImpl extends SuperHeroesRemoteDataSource {
  final DioClient _dio;

  SuperHeroesRemoteDataSourceImpl(this._dio);

  @override
  Future<Map<String, dynamic>?> searchSuperHeroByName({
    required String name,
  }) =>
      _dio.get<Map<String, dynamic>>('search/$name');
}
