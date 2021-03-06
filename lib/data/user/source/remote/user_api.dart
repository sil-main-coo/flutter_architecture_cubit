import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:flutter_architecture_cubit/data/user/model/request/login_request.dart';
import 'package:flutter_architecture_cubit/data/user/model/response/login_response.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('auth/login')
  Future<LoginResponse?>? login(@Body() LoginRequest request);
}
