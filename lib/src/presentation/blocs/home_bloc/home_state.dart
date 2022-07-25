import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

abstract class HomeState {}
class HomeInitialState extends HomeState {
}

//ignore: must_be_immutable
class HomeHandleStatusItemState extends HomeState {
  List<ToDoItemEntity>? items;

  HomeHandleStatusItemState({this.items});

}