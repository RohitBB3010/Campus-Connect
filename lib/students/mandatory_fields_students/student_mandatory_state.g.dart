// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mandatory_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentMandatoryStateCWProxy {
  StudentMandatoryState name(String? name);

  StudentMandatoryState email(String? email);

  StudentMandatoryState committeesSubscribed(
      List<String>? committeesSubscribed);

  StudentMandatoryState phoneNumber(String? phoneNumber);

  StudentMandatoryState committeesList(List<CommitteeList>? committeesList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryState call({
    String? name,
    String? email,
    List<String>? committeesSubscribed,
    String? phoneNumber,
    List<CommitteeList>? committeesList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentMandatoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentMandatoryState.copyWith.fieldName(...)`
class _$StudentMandatoryStateCWProxyImpl
    implements _$StudentMandatoryStateCWProxy {
  const _$StudentMandatoryStateCWProxyImpl(this._value);

  final StudentMandatoryState _value;

  @override
  StudentMandatoryState name(String? name) => this(name: name);

  @override
  StudentMandatoryState email(String? email) => this(email: email);

  @override
  StudentMandatoryState committeesSubscribed(
          List<String>? committeesSubscribed) =>
      this(committeesSubscribed: committeesSubscribed);

  @override
  StudentMandatoryState phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  StudentMandatoryState committeesList(List<CommitteeList>? committeesList) =>
      this(committeesList: committeesList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? committeesSubscribed = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? committeesList = const $CopyWithPlaceholder(),
  }) {
    return StudentMandatoryState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      committeesSubscribed: committeesSubscribed == const $CopyWithPlaceholder()
          ? _value.committeesSubscribed
          // ignore: cast_nullable_to_non_nullable
          : committeesSubscribed as List<String>?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      committeesList: committeesList == const $CopyWithPlaceholder()
          ? _value.committeesList
          // ignore: cast_nullable_to_non_nullable
          : committeesList as List<CommitteeList>?,
    );
  }
}

extension $StudentMandatoryStateCopyWith on StudentMandatoryState {
  /// Returns a callable class that can be used as follows: `instanceOfStudentMandatoryState.copyWith(...)` or like so:`instanceOfStudentMandatoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentMandatoryStateCWProxy get copyWith =>
      _$StudentMandatoryStateCWProxyImpl(this);
}
