import 'package:flutter_architecture_cubit/data/user/model/response/login_response.dart';

abstract class LoginRepository{
  Future<LoginResponse?>? login(String? user, String? password);
}