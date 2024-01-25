import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'on_boarding_dart_state.dart';
part 'on_boarding_dart_cubit.freezed.dart';


class OnBoardingDartCubit extends Cubit<OnBoardingDartState> {
  OnBoardingDartCubit() : super(const OnBoardingDartState.initial());
  void aa() {
    OnBoardingDartState.update(slCompanyType: 's');
  }
}
