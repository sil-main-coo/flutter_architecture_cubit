import 'package:flutter_architecture_cubit/domain/login/repositories/login_repository.dart';
import 'package:flutter_architecture_cubit/domain/login/usecases/login_usecases.dart';
import 'package:mockito/mockito.dart';

class LoginUserCaseMock extends Mock implements LoginUseCase {}

class LoginRepositoryMock extends Mock implements LoginRepository {}
