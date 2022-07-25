import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';
import 'package:fluttertemplate/src/presentation/blocs/incomplete_bloc/incomplete_state.dart';

import '../../../domain/entities/todo_item_entity.dart';

class CompleteCubit extends Cubit<CompleteState> {
  CompleteCubit() : super(CompleteInitial());


  void getItems({List<ToDoItemEntity>? items}) {
    final List<ToDoItemEntity> _items = items!.where((element) => element.isChecked == true).toList();
    emit(CompleteInitial(items: _items));
  }

}