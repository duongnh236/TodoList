// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      activity: json['activity'] as String? ?? '',
      participants: (json['participants'] as num?)?.toDouble() ?? 0,
      type: json['type'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      link: json['link'] as String? ?? '',
      key: json['key'] as String? ?? '',
      accessibility: (json['accessibility'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'participants': instance.participants,
      'type': instance.type,
      'price': instance.price,
      'link': instance.link,
      'key': instance.key,
      'accessibility': instance.accessibility,
    };
