import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organisational_unit.g.dart';

@JsonSerializable()
class OrganisationalUnit extends Equatable {
  const OrganisationalUnit({
    required this.id,
    required this.code,
    required this.timeZone,
    required this.yearCodes,
  });

  final String id;
  final String code;
  final String timeZone;
  final List<String> yearCodes;

  factory OrganisationalUnit.fromJson(Map<String, dynamic> json) =>
      _$OrganisationalUnitFromJson(json);

  Map<String, dynamic> toJson() => _$OrganisationalUnitToJson(this);

  @override
  List<Object?> get props => [id, code, timeZone, yearCodes];
}
