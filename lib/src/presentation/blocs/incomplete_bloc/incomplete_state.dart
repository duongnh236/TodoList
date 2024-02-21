import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';

import '../../../domain/entities/todo_item_entity.dart';

abstract class IncompleteState extends Equatable {}
class IncompleteInitial extends IncompleteState {
  final List<TodoIsar?>? items;

  IncompleteInitial({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

