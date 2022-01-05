// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisational_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganisationalUnit _$OrganisationalUnitFromJson(Map<String, dynamic> json) =>
    OrganisationalUnit(
      id: json['id'] as String,
      code: json['code'] as String,
      yeas: (json['yeas'] as List<dynamic>).map((e) => e as String).toList(),
      timeZone: json['timeZone'] as String,
    );

Map<String, dynamic> _$OrganisationalUnitToJson(OrganisationalUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'timeZone': instance.timeZone,
      'yeas': instance.yeas,
    };
