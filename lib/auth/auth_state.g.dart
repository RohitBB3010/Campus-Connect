// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthAuthenticatedStateCWProxy {
  AuthAuthenticatedState isStudent(bool? isStudent);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthAuthenticatedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthAuthenticatedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthAuthenticatedState call({
    bool? isStudent,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthAuthenticatedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthAuthenticatedState.copyWith.fieldName(...)`
class _$AuthAuthenticatedStateCWProxyImpl
    implements _$AuthAuthenticatedStateCWProxy {
  const _$AuthAuthenticatedStateCWProxyImpl(this._value);

  final AuthAuthenticatedState _value;

  @override
  AuthAuthenticatedState isStudent(bool? isStudent) =>
      this(isStudent: isStudent);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthAuthenticatedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthAuthenticatedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthAuthenticatedState call({
    Object? isStudent = const $CopyWithPlaceholder(),
  }) {
    return AuthAuthenticatedState(
      isStudent: isStudent == const $CopyWithPlaceholder()
          ? _value.isStudent
          // ignore: cast_nullable_to_non_nullable
          : isStudent as bool?,
    );
  }
}

extension $AuthAuthenticatedStateCopyWith on AuthAuthenticatedState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthAuthenticatedState.copyWith(...)` or like so:`instanceOfAuthAuthenticatedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthAuthenticatedStateCWProxy get copyWith =>
      _$AuthAuthenticatedStateCWProxyImpl(this);
}

abstract class _$AuthUnAuthenticatedStateCWProxy {
  AuthUnAuthenticatedState email(String? email);

  AuthUnAuthenticatedState password(String? password);

  AuthUnAuthenticatedState confirmPassword(String? confirmPassword);

  AuthUnAuthenticatedState isStudent(bool? isStudent);

  AuthUnAuthenticatedState selectedCommittee(Committee? selectedCommittee);

  AuthUnAuthenticatedState committeeCode(String? committeeCode);

  AuthUnAuthenticatedState availableCommittes(
      List<Committee>? availableCommittes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUnAuthenticatedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUnAuthenticatedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUnAuthenticatedState call({
    String? email,
    String? password,
    String? confirmPassword,
    bool? isStudent,
    Committee? selectedCommittee,
    String? committeeCode,
    List<Committee>? availableCommittes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthUnAuthenticatedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthUnAuthenticatedState.copyWith.fieldName(...)`
class _$AuthUnAuthenticatedStateCWProxyImpl
    implements _$AuthUnAuthenticatedStateCWProxy {
  const _$AuthUnAuthenticatedStateCWProxyImpl(this._value);

  final AuthUnAuthenticatedState _value;

  @override
  AuthUnAuthenticatedState email(String? email) => this(email: email);

  @override
  AuthUnAuthenticatedState password(String? password) =>
      this(password: password);

  @override
  AuthUnAuthenticatedState confirmPassword(String? confirmPassword) =>
      this(confirmPassword: confirmPassword);

  @override
  AuthUnAuthenticatedState isStudent(bool? isStudent) =>
      this(isStudent: isStudent);

  @override
  AuthUnAuthenticatedState selectedCommittee(Committee? selectedCommittee) =>
      this(selectedCommittee: selectedCommittee);

  @override
  AuthUnAuthenticatedState committeeCode(String? committeeCode) =>
      this(committeeCode: committeeCode);

  @override
  AuthUnAuthenticatedState availableCommittes(
          List<Committee>? availableCommittes) =>
      this(availableCommittes: availableCommittes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthUnAuthenticatedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthUnAuthenticatedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthUnAuthenticatedState call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? isStudent = const $CopyWithPlaceholder(),
    Object? selectedCommittee = const $CopyWithPlaceholder(),
    Object? committeeCode = const $CopyWithPlaceholder(),
    Object? availableCommittes = const $CopyWithPlaceholder(),
  }) {
    return AuthUnAuthenticatedState(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
      isStudent: isStudent == const $CopyWithPlaceholder()
          ? _value.isStudent
          // ignore: cast_nullable_to_non_nullable
          : isStudent as bool?,
      selectedCommittee: selectedCommittee == const $CopyWithPlaceholder()
          ? _value.selectedCommittee
          // ignore: cast_nullable_to_non_nullable
          : selectedCommittee as Committee?,
      committeeCode: committeeCode == const $CopyWithPlaceholder()
          ? _value.committeeCode
          // ignore: cast_nullable_to_non_nullable
          : committeeCode as String?,
      availableCommittes: availableCommittes == const $CopyWithPlaceholder()
          ? _value.availableCommittes
          // ignore: cast_nullable_to_non_nullable
          : availableCommittes as List<Committee>?,
    );
  }
}

extension $AuthUnAuthenticatedStateCopyWith on AuthUnAuthenticatedState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthUnAuthenticatedState.copyWith(...)` or like so:`instanceOfAuthUnAuthenticatedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthUnAuthenticatedStateCWProxy get copyWith =>
      _$AuthUnAuthenticatedStateCWProxyImpl(this);
}
