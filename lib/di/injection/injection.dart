import 'package:flutter_architecture_cubit/di/module/api_module.dart';
import 'package:flutter_architecture_cubit/di/module/bloc_module.dart';
import 'package:flutter_architecture_cubit/di/module/components_module.dart';
import 'package:flutter_architecture_cubit/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepoModule().provides();
    await BlocModule().provides();
  }
}
