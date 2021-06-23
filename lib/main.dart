import 'dart:async';

import 'package:flutter_architecture_cubit/presentation/common/styles/style.dart';

import 'package:flutter_configuration_module/environment/env.dart';
import 'package:flutter_configuration_module/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_cubit/di/injection/injection.dart';
import 'package:flutter_architecture_cubit/manifest.dart';
import 'package:flutter_architecture_cubit/presentation/login/login_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// EndPoint default
void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    Style.styleDefault();

    return Application();
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter architecture',
      builder: (context, widget) {
        return MediaQuery(
          //Setting font does not change with system font size
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
      theme: AppThemes.defaultTheme(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: LoginRoute.id,
      onGenerateRoute: manifest,
      // home: Test(),
    );
  }
}
