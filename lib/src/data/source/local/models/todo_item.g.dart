// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoItemHiveAdapter extends TypeAdapter<TodoItemHive> {
  @override
  final int typeId = 1;

  @override
  TodoItemHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItemHive(
      isChecked: fields[1] as bool?,
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItemHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
