// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mandatory_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentMandatoryFillingStateCWProxy {
  StudentMandatoryFillingState name(String? name);

  StudentMandatoryFillingState email(String? email);

  StudentMandatoryFillingState committeesSubscribed(
      List<String?>? committeesSubscribed);

  StudentMandatoryFillingState phoneNumber(String? phoneNumber);

  StudentMandatoryFillingState committeesList(List<Committee>? committeesList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryFillingState call({
    String? name,
    String? email,
    List<String?>? committeesSubscribed,
    String? phoneNumber,
    List<Committee>? committeesList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentMandatoryFillingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentMandatoryFillingState.copyWith.fieldName(...)`
class _$StudentMandatoryFillingStateCWProxyImpl
    implements _$StudentMandatoryFillingStateCWProxy {
  const _$StudentMandatoryFillingStateCWProxyImpl(this._value);

  final StudentMandatoryFillingState _value;

  @override
  StudentMandatoryFillingState name(String? name) => this(name: name);

  @override
  StudentMandatoryFillingState email(String? email) => this(email: email);

  @override
  StudentMandatoryFillingState committeesSubscribed(
          List<String?>? committeesSubscribed) =>
      this(committeesSubscribed: committeesSubscribed);

  @override
  StudentMandatoryFillingState phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  StudentMandatoryFillingState committeesList(
          List<Committee>? committeesList) =>
      this(committeesList: committeesList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryFillingState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? committeesSubscribed = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? committeesList = const $CopyWithPlaceholder(),
  }) {
    return StudentMandatoryFillingState(
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
          : committeesSubscribed as List<String?>?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      committeesList: committeesList == const $CopyWithPlaceholder()
          ? _value.committeesList
          // ignore: cast_nullable_to_non_nullable
          : committeesList as List<Committee>?,
    );
  }
}

extension $StudentMandatoryFillingStateCopyWith
    on StudentMandatoryFillingState {
  /// Returns a callable class that can be used as follows: `instanceOfStudentMandatoryFillingState.copyWith(...)` or like so:`instanceOfStudentMandatoryFillingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentMandatoryFillingStateCWProxy get copyWith =>
      _$StudentMandatoryFillingStateCWProxyImpl(this);
}
