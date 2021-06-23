import 'package:flutter_configuration_module/di/di_module.dart';
import 'package:flutter_architecture_cubit/domain/home/usecases/home_usecases.dart';
import 'package:flutter_architecture_cubit/presentation/home/cubit/home_cubit.dart';

class BlocModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton<HomeCubit>(HomeCubit(homeUseCase: HomeUseCase()));
  }
}
