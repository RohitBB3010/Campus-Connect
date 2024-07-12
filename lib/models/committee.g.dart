// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Committee _$CommitteeFromJson(Map<String, dynamic> json) => Committee(
      name: json['name'] as String,
      code: json['code'] as String?,
      logo: json['logo'] as String?,
      password: json['password'] as String?,
      member: (json['member'] as List<dynamic>?)
          ?.map((e) => CommitteeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      announcements: (json['announcements'] as List<dynamic>?)
          ?.map((e) => Announcement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommitteeToJson(Committee instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
      'password': instance.password,
      'member': instance.member,
      'events': instance.events,
      'announcements': instance.announcements,
    };

CommitteeMember _$CommitteeMemberFromJson(Map<String, dynamic> json) =>
    CommitteeMember(
      memberName: json['memberName'] as String?,
      memberRole: json['memberRole'] as String?,
      memberEmail: json['memberEmail'] as String?,
      joiningDate: json['joiningDate'] as String?,
    );

Map<String, dynamic> _$CommitteeMemberToJson(CommitteeMember instance) =>
    <String, dynamic>{
      'memberName': instance.memberName,
      'memberRole': instance.memberRole,
      'memberEmail': instance.memberEmail,
      'joiningDate': instance.joiningDate,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventName: json['eventName'] as String?,
      eventDescription: json['eventDescription'] as String?,
      eventAddedDate: json['eventAddedDate'] as String?,
      eventStartDate: tsToDateTime(json['eventStartDate'] as Timestamp?),
      eventEndDate: tsToDateTime(json['eventEndDate'] as Timestamp?),
      contactPersonInfo: json['contactPersonInfo'] as String?,
      eventVenue: json['eventVenue'] as String?,
      eventType: json['eventType'] as String?,
      eventTags: (json['eventTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      registrationLink: json['registrationLink'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventName': instance.eventName,
      'eventDescription': instance.eventDescription,
      'eventAddedDate': instance.eventAddedDate,
      'eventStartDate': datetimeToTs(instance.eventStartDate),
      'eventEndDate': datetimeToTs(instance.eventEndDate),
      'contactPersonInfo': instance.contactPersonInfo,
      'eventVenue': instance.eventVenue,
      'eventType': instance.eventType,
      'eventTags': instance.eventTags,
      'registrationLink': instance.registrationLink,
    };

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      title: json['title'] as String?,
      announcementContent: json['announcementContent'] as String?,
      date: tsToDateTime(json['date'] as Timestamp?),
      expirationDate: tsToDateTime(json['expirationDate'] as Timestamp?),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'announcementContent': instance.announcementContent,
      'date': datetimeToTs(instance.date),
      'expirationDate': datetimeToTs(instance.expirationDate),
      'tag': instance.tag,
    };
