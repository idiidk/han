import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom extends Equatable {
  const Classroom({
    required this.id,
    required this.code,
    required this.organisationalUnitIds,
  });

  final String id;
  final String code;
  final List<int> organisationalUnitIds;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);

  @override
  List<Object?> get props => [id, code, organisationalUnitIds];
}
