import 'package:equatable/equatable.dart';
import 'package:fluttertemplate/src/domain/entities/todo_item_entity.dart';

enum TestStatus {
  initial,
  loading,
  success,
  failure,
}

class TesstState extends Equatable {
  final List<ToDoItemEntity> items;
  final TestStatus status;

  TesstState({
    required this.items,
    required this.status,
  });

  @override
  List<Object?> get props => [items, status];

  TesstState copyWith({
    List<ToDoItemEntity>? items,
    TestStatus? status,
  }) {
    return TesstState(
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }
}
