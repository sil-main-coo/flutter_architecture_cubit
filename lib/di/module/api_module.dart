import 'package:flutter_configuration_module/di/di_module.dart';
import 'package:flutter_configuration_module/environment/build_config.dart';
import 'package:flutter_configuration_module/network/interceptor/auth_interceptor.dart';
import 'package:flutter_configuration_module/network/interceptor/token_interceptor.dart';
import 'package:flutter_architecture_cubit/data/user/source/remote/user_api.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    getIt.registerSingleton(dio);
    // register api
    getIt.registerSingleton(UserApi(dio, baseUrl: dio.options.baseUrl));
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(TokenInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
