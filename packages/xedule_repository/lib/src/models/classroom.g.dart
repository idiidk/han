// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      id: json['id'] as String,
      code: json['code'] as String,
      organisationalUnitIds: (json['organisationalUnitIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'organisationalUnitIds': instance.organisationalUnitIds,
    };
