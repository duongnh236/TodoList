import 'package:equatable/equatable.dart';
import '../../../domain/entities/todo_item_entity.dart';

abstract class CompleteState extends Equatable {}
class CompleteInitial extends CompleteState {
  final List<ToDoItemEntity>? items;

  CompleteInitial({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}