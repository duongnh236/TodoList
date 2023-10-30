import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeToggleStatusEvent extends HomeEvent {

  final int? index;
  const HomeToggleStatusEvent({this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];

}
final class HomeCreateTaskEvent extends HomeEvent {
  final String? taskName;
  const HomeCreateTaskEvent({this.taskName});
  @override
  // TODO: implement props
  List<Object?> get props => [taskName];

}

final class HomeGetTodoEvent extends HomeEvent {
const HomeGetTodoEvent();
@override
// TODO: implement props
List<Object?> get props => [];

}