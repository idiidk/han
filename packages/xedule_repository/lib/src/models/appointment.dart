import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment extends Equatable {
  const Appointment({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.attributes,
  });

  final String id;
  final String name;
  final DateTime start;
  final DateTime end;
  final List<int> attributes;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);

  @override
  List<Object?> get props => [id, name, attributes, start, end];
}
