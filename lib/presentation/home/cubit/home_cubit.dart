import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_cubit/domain/home/usecases/home_usecases.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());
}
