import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

class IncompleteCubit extends Cubit<IncompleteState> {
  IncompleteCubit() : super(IncompleteInitial());

  void getItems({List<ToDoItemEntity>? items}) {
    final List<ToDoItemEntity> _items = items!.where((element) => element.isChecked == false).toList();
    emit(IncompleteInitial(items: _items));
  }
}