import 'package:flutter_configuration_module/data/common/shared_preferences_manager.dart';
import 'package:flutter_configuration_module/di/di_module.dart';

class ComponentsModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton(SharedPreferencesManager());
  }
}
