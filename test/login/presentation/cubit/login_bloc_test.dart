import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_configuration_module/generated/l10n.dart';
import 'package:flutter_architecture_cubit/data/user/model/response/login_response.dart';
import 'package:flutter_architecture_cubit/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/config.dart';
import '../../mock.dart';

void main() {
  LoginUserCaseMock mockUseCase;
  LoginCubit loginCubit;

  setUp(() async {
    await TestUtilities.setupLocalization();
  });

  final response = LoginResponse('KbseWdVo87DkmNDO9klriT8SNOkEWRZC');

  blocTest<LoginCubit, LoginState>(
    'Test login bloc yield the right state successfully',
    build: () {
      mockUseCase = LoginUserCaseMock();
      loginCubit = LoginCubit(loginUseCase: mockUseCase);
      when(mockUseCase.login('test', 'test')).thenAnswer((_) async => response);
      return loginCubit;
    },
    act: (cubit) async => await cubit.login(user: 'test', password: 'test'),
    expect: () =>
        [LoadingLoginState(), LoginSuccessfullyState(response: response)],
  );

  blocTest<LoginCubit, LoginState>(
    'Test login bloc with type cast error',
    build: () {
      mockUseCase = LoginUserCaseMock();
      loginCubit = LoginCubit(loginUseCase: mockUseCase);
      when(mockUseCase.login(null, null)).thenAnswer((_) => throw TypeError());
      return loginCubit;
    },
    act: (cubit) async => await cubit.login(user: 'test', password: 'test'),
    expect: () => [
      LoadingLoginState(),
      ErrorLoginState(errorMessage: S.current.connectionProblem)
    ],
  );
}
