// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginItemEntity _$LoginItemEntityFromJson(Map<String, dynamic> json) {
  return _LoginItemEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginItemEntity {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginItemEntityCopyWith<LoginItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginItemEntityCopyWith<$Res> {
  factory $LoginItemEntityCopyWith(
          LoginItemEntity value, $Res Function(LoginItemEntity) then) =
      _$LoginItemEntityCopyWithImpl<$Res, LoginItemEntity>;
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class _$LoginItemEntityCopyWithImpl<$Res, $Val extends LoginItemEntity>
    implements $LoginItemEntityCopyWith<$Res> {
  _$LoginItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginItemEntityImplCopyWith<$Res>
    implements $LoginItemEntityCopyWith<$Res> {
  factory _$$LoginItemEntityImplCopyWith(_$LoginItemEntityImpl value,
          $Res Function(_$LoginItemEntityImpl) then) =
      __$$LoginItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String password});
}

/// @nodoc
class __$$LoginItemEntityImplCopyWithImpl<$Res>
    extends _$LoginItemEntityCopyWithImpl<$Res, _$LoginItemEntityImpl>
    implements _$$LoginItemEntityImplCopyWith<$Res> {
  __$$LoginItemEntityImplCopyWithImpl(
      _$LoginItemEntityImpl _value, $Res Function(_$LoginItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$LoginItemEntityImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginItemEntityImpl implements _LoginItemEntity {
  _$LoginItemEntityImpl({required this.userName, required this.password});

  factory _$LoginItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginItemEntityImplFromJson(json);

  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginItemEntity(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginItemEntityImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginItemEntityImplCopyWith<_$LoginItemEntityImpl> get copyWith =>
      __$$LoginItemEntityImplCopyWithImpl<_$LoginItemEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginItemEntityImplToJson(
      this,
    );
  }
}

abstract class _LoginItemEntity implements LoginItemEntity {
  factory _LoginItemEntity(
      {required final String userName,
      required final String password}) = _$LoginItemEntityImpl;

  factory _LoginItemEntity.fromJson(Map<String, dynamic> json) =
      _$LoginItemEntityImpl.fromJson;

  @override
  String get userName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginItemEntityImplCopyWith<_$LoginItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
