import 'package:hive/hive.dart';
part 'todo_item.g.dart';

@HiveType(typeId: 1)
class TodoItemHive extends HiveObject {
  TodoItemHive({this.isChecked, this.name});
  static const String boxKey = 'todoItem';

  @HiveField(0)
  String? name;

  @HiveField(1)
  bool? isChecked;

}