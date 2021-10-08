import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/interceptors/app_interceptor.dart';
import 'package:my_app/core/data/network/dio_client.dart';
import 'package:my_app/flavors/flavor_values.dart';

// Use this module to inject your third-party dependencies like [FirebaseAuth]
// E.g. FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

@module
abstract class RemoteModule {
  Dio provideDio() {
    final dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.sendTimeout = 20000;
    dio.options.receiveTimeout = 10000;
    dio.options.baseUrl =
        '${FlavorConfig.instance.values.baseUrl}/${FlavorConfig.instance.values.accessToken}/';
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    return dio;
  }

  @singleton
  InterceptorsWrapper provideInterceptor(
          Dio dio,
          @Named('language') String language,
          FlutterSecureStorage flutterSecureStorage) =>
      AppInterceptor.init(dio, language, flutterSecureStorage);

  DioClient provideApi(Dio dio, InterceptorsWrapper interceptor) {
    dio.interceptors.add(interceptor);
    return DioClient(dio);
  }
}
