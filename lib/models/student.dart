import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  String? name;
  String? email;
  String? rollNumber;
  List<CommitteeData>? committees;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Student({this.name, this.email, this.rollNumber, this.committees});

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class CommitteeData {
  String committeeName;
  DateTime joined;

  factory CommitteeData.fromJson(Map<String, dynamic> json) =>
      _$CommitteeDataFromJson(json);

  CommitteeData({required this.committeeName, required this.joined});

  Map<String, dynamic> toJson() => _$CommitteeDataToJson(this);
}
