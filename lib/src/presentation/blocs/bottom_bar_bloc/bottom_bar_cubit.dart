import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInit());

  int? indexSelected = 0;

  void changeIndex({int? index}) {
    indexSelected = index;
    emit(BottomBarIndexState(index: indexSelected));
  }
}