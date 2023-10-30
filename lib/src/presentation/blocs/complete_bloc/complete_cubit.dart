import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertemplate/src/presentation/blocs/complete_bloc/complete_state.dart';
import '../../../data/source/local/models/todo_item.dart';
import '../../../domain/entities/todo_item_entity.dart';

class CompleteCubit extends Cubit<CompleteState> {
  CompleteCubit() : super(CompleteInitial());


  void getItems({List<TodoItemHive>? items}) {
    final List<TodoItemHive> _items = items!.where((element) => element.isChecked == true).toList();
    emit(CompleteInitial(items: _items));
  }

}