import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';
import 'package:fluttertemplate/src/presentation/blocs/home_bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeState initialState) : super(initialState);

}