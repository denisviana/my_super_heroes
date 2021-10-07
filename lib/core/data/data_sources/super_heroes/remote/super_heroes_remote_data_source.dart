abstract class SuperHeroesRemoteDataSource {
  Future<Map<String, dynamic>?> searchSuperHeroByName({
    required String name,
  });
}
