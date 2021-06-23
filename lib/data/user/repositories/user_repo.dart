import 'dart:async';

import 'package:flutter_architecture_cubit/data/common/api_exception.dart';
import 'package:flutter_architecture_cubit/data/user/model/response/login_response.dart';
import 'package:flutter_architecture_cubit/data/user/source/remote/user_api.dart';
import 'package:flutter_architecture_cubit/domain/login/repositories/login_repository.dart';
import 'package:dio/dio.dart';

class UserRepoImpl implements LoginRepository {
  UserApi? userApi;

  UserRepoImpl({this.userApi});

  @override
  Future<LoginResponse?>? login(String? user, String? password) async {
    try {
      assert(user != null && password != null);
      return await Future.value(
          LoginResponse('KbseWdVo87DkmNDO9klriT8SNOkEWRZC'));
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
