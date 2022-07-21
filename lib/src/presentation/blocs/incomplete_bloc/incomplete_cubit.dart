import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

class IncompleteCubit extends Cubit<IncompleteState> {
  IncompleteCubit(IncompleteState initialState) : super(initialState);

}