// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      id: json['id'] as String,
      name: json['name'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      attributes:
          (json['attributes'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'attributes': instance.attributes,
    };
