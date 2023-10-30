import 'package:equatable/equatable.dart';

class ToDoItemEntity extends Equatable {
   String? name;
   bool? isChecked;
   ToDoItemEntity({this.isChecked, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [isChecked, name];

}