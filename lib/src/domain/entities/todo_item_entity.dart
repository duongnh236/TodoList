
import 'package:equatable/equatable.dart';

//ignore: must_be_immutable
class ToDoItemEntity extends Equatable{

   String? name;
   bool? isChecked;

   ToDoItemEntity({this.isChecked, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name, isChecked];

}