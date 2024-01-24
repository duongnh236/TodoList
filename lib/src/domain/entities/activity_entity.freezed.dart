// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return _Activity.fromJson(json);
}

/// @nodoc
mixin _$Activity {
  String get activity => throw _privateConstructorUsedError;
  double get participants => throw _privateConstructorUsedError;
  dynamic get type => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  double get accessibility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String activity,
      double participants,
      dynamic type,
      double price,
      String link,
      String key,
      double accessibility});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? participants = null,
    Object? type = freezed,
    Object? price = null,
    Object? link = null,
    Object? key = null,
    Object? accessibility = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as double,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as dynamic,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      accessibility: null == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activity,
      double participants,
      dynamic type,
      double price,
      String link,
      String key,
      double accessibility});
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? participants = null,
    Object? type = freezed,
    Object? price = null,
    Object? link = null,
    Object? key = null,
    Object? accessibility = null,
  }) {
    return _then(_$ActivityImpl(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as double,
      type: freezed == type ? _value.type! : type,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      accessibility: null == accessibility
          ? _value.accessibility
          : accessibility // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityImpl implements _Activity {
  const _$ActivityImpl(
      {this.activity = '',
      this.participants = 0,
      this.type = '',
      this.price = 0,
      this.link = '',
      this.key = '',
      this.accessibility = 0});

  factory _$ActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityImplFromJson(json);

  @override
  @JsonKey()
  final String activity;
  @override
  @JsonKey()
  final double participants;
  @override
  @JsonKey()
  final dynamic type;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final double accessibility;

  @override
  String toString() {
    return 'Activity(activity: $activity, participants: $participants, type: $type, price: $price, link: $link, key: $key, accessibility: $accessibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.participants, participants) ||
                other.participants == participants) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.accessibility, accessibility) ||
                other.accessibility == accessibility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activity,
      participants,
      const DeepCollectionEquality().hash(type),
      price,
      link,
      key,
      accessibility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityImplToJson(
      this,
    );
  }
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {final String activity,
      final double participants,
      final dynamic type,
      final double price,
      final String link,
      final String key,
      final double accessibility}) = _$ActivityImpl;

  factory _Activity.fromJson(Map<String, dynamic> json) =
      _$ActivityImpl.fromJson;

  @override
  String get activity;
  @override
  double get participants;
  @override
  dynamic get type;
  @override
  double get price;
  @override
  String get link;
  @override
  String get key;
  @override
  double get accessibility;
  @override
  @JsonKey(ignore: true)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
