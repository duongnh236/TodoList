import 'package:equatable/equatable.dart';

import '../../../data/source/local/models/todo_item.dart';
import '../../../domain/entities/todo_item_entity.dart';

abstract class IncompleteState extends Equatable {}
class IncompleteInitial extends IncompleteState {
  final List<TodoItemHive>? items;

  IncompleteInitial({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

