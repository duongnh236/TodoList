import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

class CompleteCubit extends Cubit<CompleteState> {
  CompleteCubit(CompleteState initialState) : super(initialState);

}