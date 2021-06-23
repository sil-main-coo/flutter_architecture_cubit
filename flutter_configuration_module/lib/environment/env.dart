import 'dart:async';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_configuration_module/environment/build_config.dart';
import 'package:flutter_configuration_module/network/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Env {
  final bool checkEnv;
  final Size sizeDesign = Size(360, 690);

  Env({this.checkEnv = false}) {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();

      if (checkEnv) {
        await const MethodChannel('flavor')
            .invokeMethod<String>('getFlavor')
            .then((String? flavor) async {
          BuildConfig.init(flavor: flavor);
        }).catchError((error) {});
      } else {
        BuildConfig.init(flavor: 'default');
      }

      await onInjection();
      HttpOverrides.global = MyHttpOverrides(); // use in run zone

      final StatefulWidget app = await onCreate(); // return init widget
      final wrapMultiScreen = ScreenUtilInit(
        designSize: sizeDesign,
        builder: () => app,
      );

      runApp(wrapMultiScreen);
    }, onError: (Object obj, StackTrace stack) {
      print(obj);
      print(stack);
    });
  }

  Future? onInjection();

  FutureOr<StatefulWidget> onCreate();
}
