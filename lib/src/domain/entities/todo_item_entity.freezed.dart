// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoItemEntity _$ToDoItemEntityFromJson(Map<String, dynamic> json) {
  return _ToDoItemEntity.fromJson(json);
}

/// @nodoc
mixin _$ToDoItemEntity {
  bool? get isChecked => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoItemEntityCopyWith<ToDoItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoItemEntityCopyWith<$Res> {
  factory $ToDoItemEntityCopyWith(
          ToDoItemEntity value, $Res Function(ToDoItemEntity) then) =
      _$ToDoItemEntityCopyWithImpl<$Res, ToDoItemEntity>;
  @useResult
  $Res call({bool? isChecked, String? name});
}

/// @nodoc
class _$ToDoItemEntityCopyWithImpl<$Res, $Val extends ToDoItemEntity>
    implements $ToDoItemEntityCopyWith<$Res> {
  _$ToDoItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoItemEntityImplCopyWith<$Res>
    implements $ToDoItemEntityCopyWith<$Res> {
  factory _$$ToDoItemEntityImplCopyWith(_$ToDoItemEntityImpl value,
          $Res Function(_$ToDoItemEntityImpl) then) =
      __$$ToDoItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? isChecked, String? name});
}

/// @nodoc
class __$$ToDoItemEntityImplCopyWithImpl<$Res>
    extends _$ToDoItemEntityCopyWithImpl<$Res, _$ToDoItemEntityImpl>
    implements _$$ToDoItemEntityImplCopyWith<$Res> {
  __$$ToDoItemEntityImplCopyWithImpl(
      _$ToDoItemEntityImpl _value, $Res Function(_$ToDoItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChecked = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ToDoItemEntityImpl(
      isChecked: freezed == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDoItemEntityImpl implements _ToDoItemEntity {
  _$ToDoItemEntityImpl({required this.isChecked, required this.name});

  factory _$ToDoItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoItemEntityImplFromJson(json);

  @override
  final bool? isChecked;
  @override
  final String? name;

  @override
  String toString() {
    return 'ToDoItemEntity(isChecked: $isChecked, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoItemEntityImpl &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isChecked, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoItemEntityImplCopyWith<_$ToDoItemEntityImpl> get copyWith =>
      __$$ToDoItemEntityImplCopyWithImpl<_$ToDoItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoItemEntityImplToJson(
      this,
    );
  }
}

abstract class _ToDoItemEntity implements ToDoItemEntity {
  factory _ToDoItemEntity(
      {required final bool? isChecked,
      required final String? name}) = _$ToDoItemEntityImpl;

  factory _ToDoItemEntity.fromJson(Map<String, dynamic> json) =
      _$ToDoItemEntityImpl.fromJson;

  @override
  bool? get isChecked;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ToDoItemEntityImplCopyWith<_$ToDoItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
