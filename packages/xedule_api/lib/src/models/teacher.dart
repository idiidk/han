import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  const Teacher({
    required this.id,
    required this.code,
    required this.name,
    required this.attGLs,
    required this.attTLs
  });

  final String id;
  final String code;
  final String name;
  final List<String> attGLs;
  final List<String> attTLs;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}