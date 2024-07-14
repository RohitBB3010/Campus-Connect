import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'committee.g.dart';

@JsonSerializable()
class Committee {
  String name;
  String? code;
  String? logo;
  String? password;
  List<CommitteeMember>? members;
  List<Event>? events;
  List<Announcement>? announcements;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);

  Committee(
      {required this.name,
      this.code,
      this.logo,
      this.password,
      this.members,
      this.events,
      this.announcements});

  Map<String, dynamic> toJson() => _$CommitteeToJson(this);
}

@JsonSerializable()
class CommitteeMember {
  String? memberName;
  String? memberRole;
  String? memberEmail;
  String? memberPhone;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime? joiningDate;

  factory CommitteeMember.fromJson(Map<String, dynamic> json) =>
      _$CommitteeMemberFromJson(json);

  CommitteeMember(
      {this.memberName,
      this.memberRole,
      this.memberEmail,
      this.memberPhone,
      this.joiningDate});

  Map<String, dynamic> toJson() => _$CommitteeMemberToJson(this);
}

@JsonSerializable()
class Event {
  String? eventName;
  String? eventDescription;
  String? eventAddedDate;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime? eventStartDate;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime? eventEndDate;
  String? contactPersonInfo;
  String? eventVenue;
  String? eventType;
  List<String>? eventTags;
  String? registrationLink;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Event(
      {this.eventName,
      this.eventDescription,
      this.eventAddedDate,
      this.eventStartDate,
      this.eventEndDate,
      this.contactPersonInfo,
      this.eventVenue,
      this.eventType,
      this.eventTags,
      this.registrationLink});

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class Announcement {
  String? title;
  String? announcementContent;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime? date;
  @JsonKey(fromJson: tsToDateTime, toJson: datetimeToTs)
  DateTime? expirationDate;
  String? tag;

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Announcement(
      {this.title,
      this.announcementContent,
      this.date,
      this.expirationDate,
      this.tag});

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}

Timestamp? datetimeToTs(DateTime? date) {
  return date != null ? Timestamp.fromDate(date) : null;
}

DateTime? tsToDateTime(Timestamp? ts) {
  return ts?.toDate();
}
