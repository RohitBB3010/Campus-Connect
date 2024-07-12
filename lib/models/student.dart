import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  String? name;
  String? email;
  String? phoneNumber;
  List<CommitteesSubscribed>? committeesSubscribed;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Student({this.name, this.email, this.committeesSubscribed, this.phoneNumber});

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable()
class CommitteesSubscribed {
  String committeeName;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime dateSubscribed;

  factory CommitteesSubscribed.fromJson(Map<String, dynamic> json) =>
      _$CommitteesSubscribedFromJson(json);

  CommitteesSubscribed(
      {required this.committeeName, required this.dateSubscribed});

  Map<String, dynamic> toJson() => _$CommitteesSubscribedToJson(this);
}

Timestamp datetimeToTs(DateTime date) {
  return Timestamp.fromDate(date);
}

DateTime tsToDateTime(Timestamp ts) {
  return ts.toDate();
}
