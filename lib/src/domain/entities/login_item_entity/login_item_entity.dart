import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_item_entity.g.dart';
part 'login_item_entity.freezed.dart';

@freezed
class LoginItemEntity with _$LoginItemEntity {
  factory LoginItemEntity({required String userName, required String password}) = _LoginItemEntity;
  factory LoginItemEntity.fromJson(Map<String, Object?> json)=> _$LoginItemEntityFromJson(json);
}