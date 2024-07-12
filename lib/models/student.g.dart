// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      name: json['name'] as String?,
      email: json['email'] as String?,
      committeesSubscribed: (json['committeesSubscribed'] as List<dynamic>?)
          ?.map((e) => CommitteesSubscribed.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'committeesSubscribed': instance.committeesSubscribed,
    };

CommitteesSubscribed _$CommitteesSubscribedFromJson(
        Map<String, dynamic> json) =>
    CommitteesSubscribed(
      committeeName: json['committeeName'] as String,
      dateSubscribed: tsToDateTime(json['dateSubscribed'] as Timestamp),
    );

Map<String, dynamic> _$CommitteesSubscribedToJson(
        CommitteesSubscribed instance) =>
    <String, dynamic>{
      'committeeName': instance.committeeName,
      'dateSubscribed': datetimeToTs(instance.dateSubscribed),
    };
