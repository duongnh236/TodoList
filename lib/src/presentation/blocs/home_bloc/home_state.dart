import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

 abstract class HomeState extends Equatable  {
   const HomeState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMesg;
  final List<ToDoItemEntity> items;

  const HomeErrorState(this.errorMesg, this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMesg, items];
}

class HomeHandleStatusItemState extends HomeState {
  final List<ToDoItemEntity> items;
  const HomeHandleStatusItemState(this.items);

  @override
  List<Object?> get props => [items];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeHandleStatusItemState &&
              runtimeType == other.runtimeType &&
              items == other.items;
  @override
  int get hashCode => items.hashCode;

}
