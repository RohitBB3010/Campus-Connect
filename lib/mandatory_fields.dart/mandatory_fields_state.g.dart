// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mandatory_fields_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MandatoryFieldsFillingStateCWProxy {
  MandatoryFieldsFillingState name(String? name);

  MandatoryFieldsFillingState email(String? email);

  MandatoryFieldsFillingState phone(String? phone);

  MandatoryFieldsFillingState role(String? role);

  MandatoryFieldsFillingState committeesSubscribed(
      List<String?>? committeesSubscribed);

  MandatoryFieldsFillingState committeesList(List<Committee>? committeesList);

  MandatoryFieldsFillingState isStudent(bool? isStudent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryFieldsFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryFieldsFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryFieldsFillingState call({
    String? name,
    String? email,
    String? phone,
    String? role,
    List<String?>? committeesSubscribed,
    List<Committee>? committeesList,
    bool? isStudent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMandatoryFieldsFillingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMandatoryFieldsFillingState.copyWith.fieldName(...)`
class _$MandatoryFieldsFillingStateCWProxyImpl
    implements _$MandatoryFieldsFillingStateCWProxy {
  const _$MandatoryFieldsFillingStateCWProxyImpl(this._value);

  final MandatoryFieldsFillingState _value;

  @override
  MandatoryFieldsFillingState name(String? name) => this(name: name);

  @override
  MandatoryFieldsFillingState email(String? email) => this(email: email);

  @override
  MandatoryFieldsFillingState phone(String? phone) => this(phone: phone);

  @override
  MandatoryFieldsFillingState role(String? role) => this(role: role);

  @override
  MandatoryFieldsFillingState committeesSubscribed(
          List<String?>? committeesSubscribed) =>
      this(committeesSubscribed: committeesSubscribed);

  @override
  MandatoryFieldsFillingState committeesList(List<Committee>? committeesList) =>
      this(committeesList: committeesList);

  @override
  MandatoryFieldsFillingState isStudent(bool? isStudent) =>
      this(isStudent: isStudent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryFieldsFillingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryFieldsFillingState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryFieldsFillingState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? committeesSubscribed = const $CopyWithPlaceholder(),
    Object? committeesList = const $CopyWithPlaceholder(),
    Object? isStudent = const $CopyWithPlaceholder(),
  }) {
    return MandatoryFieldsFillingState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
      committeesSubscribed: committeesSubscribed == const $CopyWithPlaceholder()
          ? _value.committeesSubscribed
          // ignore: cast_nullable_to_non_nullable
          : committeesSubscribed as List<String?>?,
      committeesList: committeesList == const $CopyWithPlaceholder()
          ? _value.committeesList
          // ignore: cast_nullable_to_non_nullable
          : committeesList as List<Committee>?,
      isStudent: isStudent == const $CopyWithPlaceholder()
          ? _value.isStudent
          // ignore: cast_nullable_to_non_nullable
          : isStudent as bool?,
    );
  }
}

extension $MandatoryFieldsFillingStateCopyWith on MandatoryFieldsFillingState {
  /// Returns a callable class that can be used as follows: `instanceOfMandatoryFieldsFillingState.copyWith(...)` or like so:`instanceOfMandatoryFieldsFillingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MandatoryFieldsFillingStateCWProxy get copyWith =>
      _$MandatoryFieldsFillingStateCWProxyImpl(this);
}
