import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class ToDoItemEntity extends Equatable{

   String? name;
   bool? isChecked;

   ToDoItemEntity({this.isChecked, this.name});

  @override
  List<Object?> get props => [isChecked, name];
}