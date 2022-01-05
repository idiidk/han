// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisational_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganisationalUnit _$OrganisationalUnitFromJson(Map<String, dynamic> json) =>
    OrganisationalUnit(
      id: json['id'] as String,
      code: json['code'] as String,
      timeZone: json['timeZone'] as String,
      yearCodes:
          (json['yearCodes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OrganisationalUnitToJson(OrganisationalUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'timeZone': instance.timeZone,
      'yearCodes': instance.yearCodes,
    };
