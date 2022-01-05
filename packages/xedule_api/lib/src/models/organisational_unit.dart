import 'package:json_annotation/json_annotation.dart';

part 'organisational_unit.g.dart';

@JsonSerializable()
class OrganisationalUnit {
  const OrganisationalUnit({
    required this.id,
    required this.code,
    required this.yeas,
    required this.timeZone,
  });

  final String id;
  final String code;
  final String timeZone;
  final List<String> yeas;

  factory OrganisationalUnit.fromJson(Map<String, dynamic> json) =>
      _$OrganisationalUnitFromJson(json);

  Map<String, dynamic> toJson() => _$OrganisationalUnitToJson(this);
}
