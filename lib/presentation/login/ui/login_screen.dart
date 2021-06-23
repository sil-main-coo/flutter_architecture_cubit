import 'package:flutter_configuration_module/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_cubit/presentation/home/home_route.dart';
import 'package:flutter_architecture_cubit/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    printScreenInformation();
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          print('listener $state');
          if (state is LoginSuccessfullyState) {
            Navigator.pushNamed(context, HomeRoute.id,
                arguments: state.response);
          }
        },
        buildWhen: (previous, current) => current is LoginInitial,
        builder: (context, state) {
          return Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  context
                      .read<LoginCubit>()
                      .login(user: 'VMO', password: 'VMO');
                },
                child: Text(
                  S.current.login,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void printScreenInformation() {
    print('Device width dp:${1.sw}dp');
    print('Device height dp:${1.sh}dp');
    print('Device pixel density:${ScreenUtil().pixelRatio}');
    print('Bottom safe zone distance dp:${ScreenUtil().bottomBarHeight}dp');
    print('Status bar height dp:${ScreenUtil().statusBarHeight}dp');
    print('The ratio of actual width to UI design:${ScreenUtil().scaleWidth}');
    print(
        'The ratio of actual height to UI design:${ScreenUtil().scaleHeight}');
    print('System font scaling:${ScreenUtil().textScaleFactor}');
    print('0.5 times the screen width:${0.5.sw}dp');
    print('0.5 times the screen height:${0.5.sh}dp');
    print('Screen orientation:${ScreenUtil().orientation}');
    print('Screen orientation:${ScreenUtil().screenHeight}');
  }
}
