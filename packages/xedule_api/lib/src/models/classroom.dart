import 'package:json_annotation/json_annotation.dart';

part 'classroom.g.dart';

@JsonSerializable()
class Classroom {
  const Classroom({
    required this.id,
    required this.code,
    required this.orus,
  });

  final String id;
  final String code;
  final List<int> orus;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}
