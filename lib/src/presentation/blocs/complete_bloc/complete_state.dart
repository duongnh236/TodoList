import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/data/source/local/models/todo_isar.dart';
import '../../../domain/entities/todo_item_entity.dart';

abstract class CompleteState extends Equatable {}
class CompleteInitial extends CompleteState {
  final List<TodoIsar>? items;

  CompleteInitial({this.items});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}