import 'package:json_annotation/json_annotation.dart';

part 'committee.g.dart';

@JsonSerializable()
class CommitteeList {
  String name;
  String code;
  String logo;

  factory CommitteeList.fromJson(Map<String, dynamic> json) =>
      _$CommitteeListFromJson(json);

  CommitteeList({
    required this.name,
    required this.code,
    required this.logo,
  });

  Map<String, dynamic> toJson() => _$CommitteeListToJson(this);
}
