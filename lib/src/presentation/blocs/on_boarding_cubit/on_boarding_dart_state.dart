part of 'on_boarding_dart_cubit.dart';

@freezed
class OnBoardingDartState with _$OnBoardingDartState {
  const factory OnBoardingDartState.initial() = _Initial;
   factory OnBoardingDartState.update({String? slCompanyType}) = _Update;
}
