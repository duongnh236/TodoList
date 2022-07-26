import 'package:hive/hive.dart';
part 'todo_item.g.dart';

@HiveType(typeId: 1)
class TodoItemHive extends HiveObject {
  static const String boxKey = 'todoItem';

  @HiveField(0)
  String? name;

  @HiveField(1)
  bool? isChecked;

}