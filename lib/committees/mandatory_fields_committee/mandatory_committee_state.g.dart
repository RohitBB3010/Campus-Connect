// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mandatory_committee_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MandatoryCommitteeFillingStateCWProxy {
  MandatoryCommitteeFillingState memberName(String? memberName);

  MandatoryCommitteeFillingState memberEmail(String? memberEmail);

  MandatoryCommitteeFillingState memberRole(String? memberRole);

  MandatoryCommitteeFillingState joiningDate(DateTime? joiningDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryCommitteeFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryCommitteeFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryCommitteeFillingState call({
    String? memberName,
    String? memberEmail,
    String? memberRole,
    DateTime? joiningDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMandatoryCommitteeFillingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMandatoryCommitteeFillingState.copyWith.fieldName(...)`
class _$MandatoryCommitteeFillingStateCWProxyImpl
    implements _$MandatoryCommitteeFillingStateCWProxy {
  const _$MandatoryCommitteeFillingStateCWProxyImpl(this._value);

  final MandatoryCommitteeFillingState _value;

  @override
  MandatoryCommitteeFillingState memberName(String? memberName) =>
      this(memberName: memberName);

  @override
  MandatoryCommitteeFillingState memberEmail(String? memberEmail) =>
      this(memberEmail: memberEmail);

  @override
  MandatoryCommitteeFillingState memberRole(String? memberRole) =>
      this(memberRole: memberRole);

  @override
  MandatoryCommitteeFillingState joiningDate(DateTime? joiningDate) =>
      this(joiningDate: joiningDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryCommitteeFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryCommitteeFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryCommitteeFillingState call({
    Object? memberName = const $CopyWithPlaceholder(),
    Object? memberEmail = const $CopyWithPlaceholder(),
    Object? memberRole = const $CopyWithPlaceholder(),
    Object? joiningDate = const $CopyWithPlaceholder(),
  }) {
    return MandatoryCommitteeFillingState(
      memberName: memberName == const $CopyWithPlaceholder()
          ? _value.memberName
          // ignore: cast_nullable_to_non_nullable
          : memberName as String?,
      memberEmail: memberEmail == const $CopyWithPlaceholder()
          ? _value.memberEmail
          // ignore: cast_nullable_to_non_nullable
          : memberEmail as String?,
      memberRole: memberRole == const $CopyWithPlaceholder()
          ? _value.memberRole
          // ignore: cast_nullable_to_non_nullable
          : memberRole as String?,
      joiningDate: joiningDate == const $CopyWithPlaceholder()
          ? _value.joiningDate
          // ignore: cast_nullable_to_non_nullable
          : joiningDate as DateTime?,
    );
  }
}

extension $MandatoryCommitteeFillingStateCopyWith
    on MandatoryCommitteeFillingState {
  /// Returns a callable class that can be used as follows: `instanceOfMandatoryCommitteeFillingState.copyWith(...)` or like so:`instanceOfMandatoryCommitteeFillingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MandatoryCommitteeFillingStateCWProxy get copyWith =>
      _$MandatoryCommitteeFillingStateCWProxyImpl(this);
}
