import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

 class HomeState extends Equatable{
   // final bool? isCheck;
   final  List<ToDoItemEntity>? items;
   const HomeState({ this.items});


   HomeState copyWith({
    // bool? isCheck,
    List<ToDoItemEntity>? items,
  }) {
    return HomeState(
      // isCheck: isCheck ?? this.isCheck,
      items: items ?? this.items,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ items];


}
class HomeBusy extends HomeState {
    HomeBusy();
}

class HomeInitialState extends HomeState {
   HomeInitialState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeErrorState extends HomeState {
  final String errorMesg;
  final List<ToDoItemEntity> items;

   HomeErrorState(this.errorMesg, this.items);

  @override
  // TODO: implement props
  List<Object?> get props => [errorMesg, items];
}

class HomeClick1 extends HomeState {
   final bool? isChecked;
    HomeClick1({this.isChecked}): super();

   @override
   List<Object?> get props => [isChecked];

   @override
   bool operator ==(Object other) =>
       identical(this, other) ||
           other is HomeClick1 &&
               runtimeType == other.runtimeType &&
               isChecked == other.items;
   @override
   int get hashCode => isChecked.hashCode;
}

class HomeHandleStatusItemState extends HomeState {
  // @override
  final List<ToDoItemEntity>? items;
  HomeHandleStatusItemState({this.items}) : super(items: items);

  // HomeHandleStatusItemState copyWith({
  //   List<ToDoItemEntity>? items,
  // }) {
  //   return HomeHandleStatusItemState(
  //     items: items ?? this.items,
  //   );
  // }
@override
  List<Object?> get props => [items];
  //
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeHandleStatusItemState &&
              runtimeType == other.runtimeType &&
              items == other.items;
  @override
  int get hashCode => items.hashCode;

}
