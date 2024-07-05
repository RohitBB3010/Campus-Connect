import 'package:json_annotation/json_annotation.dart';

part 'committee.g.dart';

@JsonSerializable()
class Committee {
  String name;
  String code;
  String image;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);

  Committee({
    required this.name,
    required this.code,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$CommitteeToJson(this);
}
