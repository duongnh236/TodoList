import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

abstract class HomeState {
  final List<ToDoItemEntity>? items;
  final String? errorMesg;

  HomeState({this.items, this.errorMesg});
}
class HomeInitialState extends HomeState {
   HomeInitialState();
}

class HomeErrorState extends HomeState {
  final String errorMesg;
  final List<ToDoItemEntity> items;
  HomeErrorState(this.errorMesg, this.items) : super(errorMesg: errorMesg, items: items);
}
//ignore: must_be_immutable
class HomeHandleStatusItemState extends HomeState {
  HomeHandleStatusItemState(List<ToDoItemEntity> items) : super(items: items);
}