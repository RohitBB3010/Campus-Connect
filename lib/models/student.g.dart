// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      name: json['name'] as String?,
      email: json['email'] as String?,
      rollNumber: json['rollNumber'] as String?,
      committees: (json['committees'] as List<dynamic>?)
          ?.map((e) => CommitteeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'rollNumber': instance.rollNumber,
      'committees': instance.committees,
    };

CommitteeData _$CommitteeDataFromJson(Map<String, dynamic> json) =>
    CommitteeData(
      committeeName: json['committeeName'] as String,
      joined: DateTime.parse(json['joined'] as String),
    );

Map<String, dynamic> _$CommitteeDataToJson(CommitteeData instance) =>
    <String, dynamic>{
      'committeeName': instance.committeeName,
      'joined': instance.joined.toIso8601String(),
    };
