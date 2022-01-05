import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment {
  const Appointment({
    required this.id,
    required this.name,
    required this.summary,
    required this.attention,
    required this.iStart,
    required this.iEnd,
    required this.atts,
  });

  final String id;
  final String name;
  final String summary;
  final String attention;
  final String iStart;
  final String iEnd;
  final List<int> atts;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
