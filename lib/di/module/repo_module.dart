import 'package:flutter_configuration_module/di/di_module.dart';
import 'package:flutter_architecture_cubit/data/user/repositories/user_repo.dart';
import 'package:flutter_architecture_cubit/data/user/source/remote/user_api.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<UserRepoImpl>(
        () => UserRepoImpl(userApi: getIt.get<UserApi>()));
  }
}
