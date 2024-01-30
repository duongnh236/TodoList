import 'package:isar/isar.dart';
part 'todo_isar.g.dart';



@Collection()
class TodoIsar{
  TodoIsar({ this.isChecked,  this.name});
  Id? id = Isar.autoIncrement;
  late String? name;
  late bool? isChecked;
  
  TodoIsar copyWith({required bool isChecked}) {
    return TodoIsar(
            isChecked: isChecked,
      name: name ?? ''
    );
  }
}