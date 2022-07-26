import 'package:equatable/equatable.dart';

import '../../../domain/entities/todo_item_entity.dart';

abstract class IncompleteState extends Equatable {}
class IncompleteInitial extends IncompleteState {
  final List<ToDoItemEntity>? items;

  IncompleteInitial({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

