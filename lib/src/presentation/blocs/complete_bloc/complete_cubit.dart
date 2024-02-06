import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';

class CompleteCubit extends Cubit<CompleteState> {
  CompleteCubit() : super(CompleteInitial());


  void getItems({List<TodoIsar>? items}) {
    final List<TodoIsar> _items = items!.where((element) => element.isChecked == true).toList();
    emit(CompleteInitial(items: _items));
  }

}