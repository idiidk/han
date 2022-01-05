import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Equatable {
  const Group({
    required this.id,
    required this.code,
    required this.organisationalUnitIds,
  });

  final String id;
  final String code;
  final List<int> organisationalUnitIds;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props => [id, code, organisationalUnitIds];
}
