import 'package:equatable/equatable.dart';

class ToDoItemEntity extends Equatable {
   String? name;
   bool? isChecked;
   ToDoItemEntity({this.isChecked, this.name}): super();

  @override
  // TODO: implement props
  List<Object?> get props => [isChecked, name];

   ToDoItemEntity copyWith({
    String? name,
    bool? isChecked,
  }) {
    return ToDoItemEntity(
      name: name ?? this.name,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}