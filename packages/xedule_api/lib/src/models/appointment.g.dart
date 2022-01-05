// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      name: json['name'] as String,
      summary: json['summary'] as String,
      attention: json['attention'] as String,
      iStart: json['iStart'] as String,
      iEnd: json['iEnd'] as String,
      atts: (json['atts'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'attention': instance.attention,
      'iStart': instance.iStart,
      'iEnd': instance.iEnd,
      'atts': instance.atts,
    };
