import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

import '../../../data/source/local/models/todo_item.dart';

 sealed class HomeState extends Equatable{
   const HomeState();
}

class HomeInitialState extends HomeState {
   HomeInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMesg;
  final List<TodoItemHive> items;

   const HomeErrorState(this.errorMesg, this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeClick1 extends HomeState {
   final bool? isChecked;
    HomeClick1({this.isChecked});

   @override
   List<Object?> get props => [isChecked];


}

class HomeHandleStatusItemState extends HomeState {
  final List<TodoItemHive>? items;
  const HomeHandleStatusItemState(this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}
