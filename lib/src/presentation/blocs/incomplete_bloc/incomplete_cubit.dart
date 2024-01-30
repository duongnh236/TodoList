import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

class IncompleteCubit extends Cubit<IncompleteState> {
  IncompleteCubit() : super(IncompleteInitial());

  void getItems({List<TodoIsar>? items}) {
    final List<TodoIsar> _items = items!.where((element) => element.isChecked == false).toList();
    emit(IncompleteInitial(items: _items));
  }
}