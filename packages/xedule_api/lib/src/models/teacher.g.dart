// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      attGLs:
          (json['attGLs'] as List<dynamic>).map((e) => e as String).toList(),
      attTLs:
          (json['attTLs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'attGLs': instance.attGLs,
      'attTLs': instance.attTLs,
    };
