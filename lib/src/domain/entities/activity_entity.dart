
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity_entity.g.dart';
part 'activity_entity.freezed.dart';

@freezed
class Activity with _$Activity {
  const factory Activity ({
    @Default('') String activity,
    @Default(0) double participants,
    @Default('') type,
    @Default(0) double price,
    @Default('') String link,
    @Default('') String key,
    @Default(0) double accessibility
  }) = _Activity;
  factory Activity.fromJson(Map<String, Object?> json) => _$ActivityFromJson(json); 
}