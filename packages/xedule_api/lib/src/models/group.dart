import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group {
  const Group({
    required this.id,
    required this.code,
    required this.orus,
  });

  final String id;
  final String code;
  final List<int> orus;

  factory Group.fromJson(Map<String, dynamic> json) =>
      _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
