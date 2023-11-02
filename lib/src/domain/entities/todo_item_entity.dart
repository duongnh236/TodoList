import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_item_entity.g.dart';
part 'todo_item_entity.freezed.dart';


@freezed
class ToDoItemEntity with _$ToDoItemEntity  {
// class ToDoItemEntity extends Equatable {
//    String? name;
//    bool? isChecked;
   // ToDoItemEntity({this.name, this.isChecked});
   factory ToDoItemEntity({ bool? isChecked,   String? name}) = _ToDoItemEntity;
   factory ToDoItemEntity.fromJson(Map<String, Object?> json)=> _$ToDoItemEntityFromJson(json);
  // @override
  // // TODO: implement props
  // List<Object?> get props => [isChecked, name];
  //
  //  ToDoItemEntity copyWith({
  //   String? name,
  //   bool? isChecked,
  // }) {
  //   return ToDoItemEntity(
  //     name: name ?? this.name,
  //     isChecked: isChecked ?? this.isChecked,
  //   );
  // }
}