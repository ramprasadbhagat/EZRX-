// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRestrictionDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionDetailsEventCopyWith<$Res> {
  factory $UserRestrictionDetailsEventCopyWith(
          UserRestrictionDetailsEvent value,
          $Res Function(UserRestrictionDetailsEvent) then) =
      _$UserRestrictionDetailsEventCopyWithImpl<$Res,
          UserRestrictionDetailsEvent>;
}

/// @nodoc
class _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        $Val extends UserRestrictionDetailsEvent>
    implements $UserRestrictionDetailsEventCopyWith<$Res> {
  _$UserRestrictionDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Initialized(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.initialized(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return initialized(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return initialized?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements UserRestrictionDetailsEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation}) = _$_Initialized;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_fetchUserRestrictionDetailsCopyWith<$Res> {
  factory _$$_fetchUserRestrictionDetailsCopyWith(
          _$_fetchUserRestrictionDetails value,
          $Res Function(_$_fetchUserRestrictionDetails) then) =
      __$$_fetchUserRestrictionDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation, Username userName});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_fetchUserRestrictionDetailsCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_fetchUserRestrictionDetails>
    implements _$$_fetchUserRestrictionDetailsCopyWith<$Res> {
  __$$_fetchUserRestrictionDetailsCopyWithImpl(
      _$_fetchUserRestrictionDetails _value,
      $Res Function(_$_fetchUserRestrictionDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? userName = null,
  }) {
    return _then(_$_fetchUserRestrictionDetails(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_fetchUserRestrictionDetails implements _fetchUserRestrictionDetails {
  const _$_fetchUserRestrictionDetails(
      {required this.salesOrganisation, required this.userName});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final Username userName;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.fetchUserRestrictionDetails(salesOrganisation: $salesOrganisation, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchUserRestrictionDetails &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_fetchUserRestrictionDetailsCopyWith<_$_fetchUserRestrictionDetails>
      get copyWith => __$$_fetchUserRestrictionDetailsCopyWithImpl<
          _$_fetchUserRestrictionDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return fetchUserRestrictionDetails(salesOrganisation, userName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return fetchUserRestrictionDetails?.call(salesOrganisation, userName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (fetchUserRestrictionDetails != null) {
      return fetchUserRestrictionDetails(salesOrganisation, userName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return fetchUserRestrictionDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return fetchUserRestrictionDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (fetchUserRestrictionDetails != null) {
      return fetchUserRestrictionDetails(this);
    }
    return orElse();
  }
}

abstract class _fetchUserRestrictionDetails
    implements UserRestrictionDetailsEvent {
  const factory _fetchUserRestrictionDetails(
      {required final SalesOrganisation salesOrganisation,
      required final Username userName}) = _$_fetchUserRestrictionDetails;

  SalesOrganisation get salesOrganisation;
  Username get userName;
  @JsonKey(ignore: true)
  _$$_fetchUserRestrictionDetailsCopyWith<_$_fetchUserRestrictionDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateTextFieldCopyWith<$Res> {
  factory _$$_updateTextFieldCopyWith(
          _$_updateTextField value, $Res Function(_$_updateTextField) then) =
      __$$_updateTextFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, UserRestrictionLabel label, int index});
}

/// @nodoc
class __$$_updateTextFieldCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res, _$_updateTextField>
    implements _$$_updateTextFieldCopyWith<$Res> {
  __$$_updateTextFieldCopyWithImpl(
      _$_updateTextField _value, $Res Function(_$_updateTextField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? index = null,
  }) {
    return _then(_$_updateTextField(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as UserRestrictionLabel,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_updateTextField implements _updateTextField {
  const _$_updateTextField(
      {required this.value, required this.label, required this.index});

  @override
  final String value;
  @override
  final UserRestrictionLabel label;
  @override
  final int index;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.updateTextField(value: $value, label: $label, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateTextField &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, label, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_updateTextFieldCopyWith<_$_updateTextField> get copyWith =>
      __$$_updateTextFieldCopyWithImpl<_$_updateTextField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return updateTextField(value, label, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return updateTextField?.call(value, label, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (updateTextField != null) {
      return updateTextField(value, label, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return updateTextField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return updateTextField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (updateTextField != null) {
      return updateTextField(this);
    }
    return orElse();
  }
}

abstract class _updateTextField implements UserRestrictionDetailsEvent {
  const factory _updateTextField(
      {required final String value,
      required final UserRestrictionLabel label,
      required final int index}) = _$_updateTextField;

  String get value;
  UserRestrictionLabel get label;
  int get index;
  @JsonKey(ignore: true)
  _$$_updateTextFieldCopyWith<_$_updateTextField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_addApproverRightsCopyWith<$Res> {
  factory _$$_addApproverRightsCopyWith(_$_addApproverRights value,
          $Res Function(_$_addApproverRights) then) =
      __$$_addApproverRightsCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_addApproverRightsCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_addApproverRights> implements _$$_addApproverRightsCopyWith<$Res> {
  __$$_addApproverRightsCopyWithImpl(
      _$_addApproverRights _value, $Res Function(_$_addApproverRights) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_addApproverRights(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_addApproverRights implements _addApproverRights {
  const _$_addApproverRights({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.addApproverRights(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addApproverRights &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addApproverRightsCopyWith<_$_addApproverRights> get copyWith =>
      __$$_addApproverRightsCopyWithImpl<_$_addApproverRights>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return addApproverRights(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return addApproverRights?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (addApproverRights != null) {
      return addApproverRights(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return addApproverRights(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return addApproverRights?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (addApproverRights != null) {
      return addApproverRights(this);
    }
    return orElse();
  }
}

abstract class _addApproverRights implements UserRestrictionDetailsEvent {
  const factory _addApproverRights({required final SalesOrg salesOrg}) =
      _$_addApproverRights;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_addApproverRightsCopyWith<_$_addApproverRights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_deleteApproverRightsCopyWith<$Res> {
  factory _$$_deleteApproverRightsCopyWith(_$_deleteApproverRights value,
          $Res Function(_$_deleteApproverRights) then) =
      __$$_deleteApproverRightsCopyWithImpl<$Res>;
  @useResult
  $Res call({ApproverRightsDetails approverRightsDetails});

  $ApproverRightsDetailsCopyWith<$Res> get approverRightsDetails;
}

/// @nodoc
class __$$_deleteApproverRightsCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_deleteApproverRights>
    implements _$$_deleteApproverRightsCopyWith<$Res> {
  __$$_deleteApproverRightsCopyWithImpl(_$_deleteApproverRights _value,
      $Res Function(_$_deleteApproverRights) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRightsDetails = null,
  }) {
    return _then(_$_deleteApproverRights(
      approverRightsDetails: null == approverRightsDetails
          ? _value.approverRightsDetails
          : approverRightsDetails // ignore: cast_nullable_to_non_nullable
              as ApproverRightsDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverRightsDetailsCopyWith<$Res> get approverRightsDetails {
    return $ApproverRightsDetailsCopyWith<$Res>(_value.approverRightsDetails,
        (value) {
      return _then(_value.copyWith(approverRightsDetails: value));
    });
  }
}

/// @nodoc

class _$_deleteApproverRights implements _deleteApproverRights {
  const _$_deleteApproverRights({required this.approverRightsDetails});

  @override
  final ApproverRightsDetails approverRightsDetails;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.deleteApproverRights(approverRightsDetails: $approverRightsDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_deleteApproverRights &&
            (identical(other.approverRightsDetails, approverRightsDetails) ||
                other.approverRightsDetails == approverRightsDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, approverRightsDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_deleteApproverRightsCopyWith<_$_deleteApproverRights> get copyWith =>
      __$$_deleteApproverRightsCopyWithImpl<_$_deleteApproverRights>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return deleteApproverRights(approverRightsDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return deleteApproverRights?.call(approverRightsDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (deleteApproverRights != null) {
      return deleteApproverRights(approverRightsDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return deleteApproverRights(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return deleteApproverRights?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (deleteApproverRights != null) {
      return deleteApproverRights(this);
    }
    return orElse();
  }
}

abstract class _deleteApproverRights implements UserRestrictionDetailsEvent {
  const factory _deleteApproverRights(
          {required final ApproverRightsDetails approverRightsDetails}) =
      _$_deleteApproverRights;

  ApproverRightsDetails get approverRightsDetails;
  @JsonKey(ignore: true)
  _$$_deleteApproverRightsCopyWith<_$_deleteApproverRights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_addUserRestrictionCopyWith<$Res> {
  factory _$$_addUserRestrictionCopyWith(_$_addUserRestriction value,
          $Res Function(_$_addUserRestriction) then) =
      __$$_addUserRestrictionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_addUserRestrictionCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_addUserRestriction> implements _$$_addUserRestrictionCopyWith<$Res> {
  __$$_addUserRestrictionCopyWithImpl(
      _$_addUserRestriction _value, $Res Function(_$_addUserRestriction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_addUserRestriction implements _addUserRestriction {
  const _$_addUserRestriction();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.addUserRestriction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_addUserRestriction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return addUserRestriction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return addUserRestriction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (addUserRestriction != null) {
      return addUserRestriction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return addUserRestriction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return addUserRestriction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (addUserRestriction != null) {
      return addUserRestriction(this);
    }
    return orElse();
  }
}

abstract class _addUserRestriction implements UserRestrictionDetailsEvent {
  const factory _addUserRestriction() = _$_addUserRestriction;
}

/// @nodoc
abstract class _$$_configureUserRestrictionCopyWith<$Res> {
  factory _$$_configureUserRestrictionCopyWith(
          _$_configureUserRestriction value,
          $Res Function(_$_configureUserRestriction) then) =
      __$$_configureUserRestrictionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_configureUserRestrictionCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_configureUserRestriction>
    implements _$$_configureUserRestrictionCopyWith<$Res> {
  __$$_configureUserRestrictionCopyWithImpl(_$_configureUserRestriction _value,
      $Res Function(_$_configureUserRestriction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_configureUserRestriction implements _configureUserRestriction {
  const _$_configureUserRestriction();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.configureUserRestriction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_configureUserRestriction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return configureUserRestriction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return configureUserRestriction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (configureUserRestriction != null) {
      return configureUserRestriction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return configureUserRestriction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return configureUserRestriction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (configureUserRestriction != null) {
      return configureUserRestriction(this);
    }
    return orElse();
  }
}

abstract class _configureUserRestriction
    implements UserRestrictionDetailsEvent {
  const factory _configureUserRestriction() = _$_configureUserRestriction;
}

/// @nodoc
abstract class _$$_deleteUserRestrictionCopyWith<$Res> {
  factory _$$_deleteUserRestrictionCopyWith(_$_deleteUserRestriction value,
          $Res Function(_$_deleteUserRestriction) then) =
      __$$_deleteUserRestrictionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_deleteUserRestrictionCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$_deleteUserRestriction>
    implements _$$_deleteUserRestrictionCopyWith<$Res> {
  __$$_deleteUserRestrictionCopyWithImpl(_$_deleteUserRestriction _value,
      $Res Function(_$_deleteUserRestriction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_deleteUserRestriction implements _deleteUserRestriction {
  const _$_deleteUserRestriction();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.deleteUserRestriction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_deleteUserRestriction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation, Username userName)
        fetchUserRestrictionDetails,
    required TResult Function(
            String value, UserRestrictionLabel label, int index)
        updateTextField,
    required TResult Function(SalesOrg salesOrg) addApproverRights,
    required TResult Function(ApproverRightsDetails approverRightsDetails)
        deleteApproverRights,
    required TResult Function() addUserRestriction,
    required TResult Function() configureUserRestriction,
    required TResult Function() deleteUserRestriction,
  }) {
    return deleteUserRestriction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult? Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult? Function(SalesOrg salesOrg)? addApproverRights,
    TResult? Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult? Function()? addUserRestriction,
    TResult? Function()? configureUserRestriction,
    TResult? Function()? deleteUserRestriction,
  }) {
    return deleteUserRestriction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, Username userName)?
        fetchUserRestrictionDetails,
    TResult Function(String value, UserRestrictionLabel label, int index)?
        updateTextField,
    TResult Function(SalesOrg salesOrg)? addApproverRights,
    TResult Function(ApproverRightsDetails approverRightsDetails)?
        deleteApproverRights,
    TResult Function()? addUserRestriction,
    TResult Function()? configureUserRestriction,
    TResult Function()? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (deleteUserRestriction != null) {
      return deleteUserRestriction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchUserRestrictionDetails value)
        fetchUserRestrictionDetails,
    required TResult Function(_updateTextField value) updateTextField,
    required TResult Function(_addApproverRights value) addApproverRights,
    required TResult Function(_deleteApproverRights value) deleteApproverRights,
    required TResult Function(_addUserRestriction value) addUserRestriction,
    required TResult Function(_configureUserRestriction value)
        configureUserRestriction,
    required TResult Function(_deleteUserRestriction value)
        deleteUserRestriction,
  }) {
    return deleteUserRestriction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult? Function(_updateTextField value)? updateTextField,
    TResult? Function(_addApproverRights value)? addApproverRights,
    TResult? Function(_deleteApproverRights value)? deleteApproverRights,
    TResult? Function(_addUserRestriction value)? addUserRestriction,
    TResult? Function(_configureUserRestriction value)?
        configureUserRestriction,
    TResult? Function(_deleteUserRestriction value)? deleteUserRestriction,
  }) {
    return deleteUserRestriction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchUserRestrictionDetails value)?
        fetchUserRestrictionDetails,
    TResult Function(_updateTextField value)? updateTextField,
    TResult Function(_addApproverRights value)? addApproverRights,
    TResult Function(_deleteApproverRights value)? deleteApproverRights,
    TResult Function(_addUserRestriction value)? addUserRestriction,
    TResult Function(_configureUserRestriction value)? configureUserRestriction,
    TResult Function(_deleteUserRestriction value)? deleteUserRestriction,
    required TResult orElse(),
  }) {
    if (deleteUserRestriction != null) {
      return deleteUserRestriction(this);
    }
    return orElse();
  }
}

abstract class _deleteUserRestriction implements UserRestrictionDetailsEvent {
  const factory _deleteUserRestriction() = _$_deleteUserRestriction;
}

/// @nodoc
mixin _$UserRestrictionDetailsState {
  bool get isFetching => throw _privateConstructorUsedError;
  ApprovalLimits get approvalLimits => throw _privateConstructorUsedError;
  List<ApproverRightsDetails> get addedApproverRightsList =>
      throw _privateConstructorUsedError;
  ApproverRights get approverRights => throw _privateConstructorUsedError;
  UserRestrictionStatus get userRestrictionStatus =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRestrictionDetailsStateCopyWith<UserRestrictionDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionDetailsStateCopyWith<$Res> {
  factory $UserRestrictionDetailsStateCopyWith(
          UserRestrictionDetailsState value,
          $Res Function(UserRestrictionDetailsState) then) =
      _$UserRestrictionDetailsStateCopyWithImpl<$Res,
          UserRestrictionDetailsState>;
  @useResult
  $Res call(
      {bool isFetching,
      ApprovalLimits approvalLimits,
      List<ApproverRightsDetails> addedApproverRightsList,
      ApproverRights approverRights,
      UserRestrictionStatus userRestrictionStatus,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $ApprovalLimitsCopyWith<$Res> get approvalLimits;
  $ApproverRightsCopyWith<$Res> get approverRights;
  $UserRestrictionStatusCopyWith<$Res> get userRestrictionStatus;
}

/// @nodoc
class _$UserRestrictionDetailsStateCopyWithImpl<$Res,
        $Val extends UserRestrictionDetailsState>
    implements $UserRestrictionDetailsStateCopyWith<$Res> {
  _$UserRestrictionDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? approvalLimits = null,
    Object? addedApproverRightsList = null,
    Object? approverRights = null,
    Object? userRestrictionStatus = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      approvalLimits: null == approvalLimits
          ? _value.approvalLimits
          : approvalLimits // ignore: cast_nullable_to_non_nullable
              as ApprovalLimits,
      addedApproverRightsList: null == addedApproverRightsList
          ? _value.addedApproverRightsList
          : addedApproverRightsList // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetails>,
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRights,
      userRestrictionStatus: null == userRestrictionStatus
          ? _value.userRestrictionStatus
          : userRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as UserRestrictionStatus,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovalLimitsCopyWith<$Res> get approvalLimits {
    return $ApprovalLimitsCopyWith<$Res>(_value.approvalLimits, (value) {
      return _then(_value.copyWith(approvalLimits: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverRightsCopyWith<$Res> get approverRights {
    return $ApproverRightsCopyWith<$Res>(_value.approverRights, (value) {
      return _then(_value.copyWith(approverRights: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRestrictionStatusCopyWith<$Res> get userRestrictionStatus {
    return $UserRestrictionStatusCopyWith<$Res>(_value.userRestrictionStatus,
        (value) {
      return _then(_value.copyWith(userRestrictionStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserRestrictionDetailsStateCopyWith<$Res>
    implements $UserRestrictionDetailsStateCopyWith<$Res> {
  factory _$$_UserRestrictionDetailsStateCopyWith(
          _$_UserRestrictionDetailsState value,
          $Res Function(_$_UserRestrictionDetailsState) then) =
      __$$_UserRestrictionDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      ApprovalLimits approvalLimits,
      List<ApproverRightsDetails> addedApproverRightsList,
      ApproverRights approverRights,
      UserRestrictionStatus userRestrictionStatus,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $ApprovalLimitsCopyWith<$Res> get approvalLimits;
  @override
  $ApproverRightsCopyWith<$Res> get approverRights;
  @override
  $UserRestrictionStatusCopyWith<$Res> get userRestrictionStatus;
}

/// @nodoc
class __$$_UserRestrictionDetailsStateCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsStateCopyWithImpl<$Res,
        _$_UserRestrictionDetailsState>
    implements _$$_UserRestrictionDetailsStateCopyWith<$Res> {
  __$$_UserRestrictionDetailsStateCopyWithImpl(
      _$_UserRestrictionDetailsState _value,
      $Res Function(_$_UserRestrictionDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? approvalLimits = null,
    Object? addedApproverRightsList = null,
    Object? approverRights = null,
    Object? userRestrictionStatus = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_UserRestrictionDetailsState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      approvalLimits: null == approvalLimits
          ? _value.approvalLimits
          : approvalLimits // ignore: cast_nullable_to_non_nullable
              as ApprovalLimits,
      addedApproverRightsList: null == addedApproverRightsList
          ? _value._addedApproverRightsList
          : addedApproverRightsList // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetails>,
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRights,
      userRestrictionStatus: null == userRestrictionStatus
          ? _value.userRestrictionStatus
          : userRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as UserRestrictionStatus,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_UserRestrictionDetailsState extends _UserRestrictionDetailsState {
  _$_UserRestrictionDetailsState(
      {required this.isFetching,
      required this.approvalLimits,
      required final List<ApproverRightsDetails> addedApproverRightsList,
      required this.approverRights,
      required this.userRestrictionStatus,
      required this.apiFailureOrSuccessOption})
      : _addedApproverRightsList = addedApproverRightsList,
        super._();

  @override
  final bool isFetching;
  @override
  final ApprovalLimits approvalLimits;
  final List<ApproverRightsDetails> _addedApproverRightsList;
  @override
  List<ApproverRightsDetails> get addedApproverRightsList {
    if (_addedApproverRightsList is EqualUnmodifiableListView)
      return _addedApproverRightsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedApproverRightsList);
  }

  @override
  final ApproverRights approverRights;
  @override
  final UserRestrictionStatus userRestrictionStatus;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'UserRestrictionDetailsState(isFetching: $isFetching, approvalLimits: $approvalLimits, addedApproverRightsList: $addedApproverRightsList, approverRights: $approverRights, userRestrictionStatus: $userRestrictionStatus, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRestrictionDetailsState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.approvalLimits, approvalLimits) ||
                other.approvalLimits == approvalLimits) &&
            const DeepCollectionEquality().equals(
                other._addedApproverRightsList, _addedApproverRightsList) &&
            (identical(other.approverRights, approverRights) ||
                other.approverRights == approverRights) &&
            (identical(other.userRestrictionStatus, userRestrictionStatus) ||
                other.userRestrictionStatus == userRestrictionStatus) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      approvalLimits,
      const DeepCollectionEquality().hash(_addedApproverRightsList),
      approverRights,
      userRestrictionStatus,
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRestrictionDetailsStateCopyWith<_$_UserRestrictionDetailsState>
      get copyWith => __$$_UserRestrictionDetailsStateCopyWithImpl<
          _$_UserRestrictionDetailsState>(this, _$identity);
}

abstract class _UserRestrictionDetailsState
    extends UserRestrictionDetailsState {
  factory _UserRestrictionDetailsState(
      {required final bool isFetching,
      required final ApprovalLimits approvalLimits,
      required final List<ApproverRightsDetails> addedApproverRightsList,
      required final ApproverRights approverRights,
      required final UserRestrictionStatus userRestrictionStatus,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_UserRestrictionDetailsState;
  _UserRestrictionDetailsState._() : super._();

  @override
  bool get isFetching;
  @override
  ApprovalLimits get approvalLimits;
  @override
  List<ApproverRightsDetails> get addedApproverRightsList;
  @override
  ApproverRights get approverRights;
  @override
  UserRestrictionStatus get userRestrictionStatus;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_UserRestrictionDetailsStateCopyWith<_$_UserRestrictionDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
