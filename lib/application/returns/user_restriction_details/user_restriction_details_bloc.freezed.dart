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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$InitializedImpl(
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

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.initialized(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

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
      {required final SalesOrganisation salesOrganisation}) = _$InitializedImpl;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$fetchUserRestrictionDetailsImplCopyWith<$Res> {
  factory _$$fetchUserRestrictionDetailsImplCopyWith(
          _$fetchUserRestrictionDetailsImpl value,
          $Res Function(_$fetchUserRestrictionDetailsImpl) then) =
      __$$fetchUserRestrictionDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation, Username userName});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$fetchUserRestrictionDetailsImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$fetchUserRestrictionDetailsImpl>
    implements _$$fetchUserRestrictionDetailsImplCopyWith<$Res> {
  __$$fetchUserRestrictionDetailsImplCopyWithImpl(
      _$fetchUserRestrictionDetailsImpl _value,
      $Res Function(_$fetchUserRestrictionDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? userName = null,
  }) {
    return _then(_$fetchUserRestrictionDetailsImpl(
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

class _$fetchUserRestrictionDetailsImpl
    implements _fetchUserRestrictionDetails {
  const _$fetchUserRestrictionDetailsImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$fetchUserRestrictionDetailsImpl &&
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
  _$$fetchUserRestrictionDetailsImplCopyWith<_$fetchUserRestrictionDetailsImpl>
      get copyWith => __$$fetchUserRestrictionDetailsImplCopyWithImpl<
          _$fetchUserRestrictionDetailsImpl>(this, _$identity);

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
      required final Username userName}) = _$fetchUserRestrictionDetailsImpl;

  SalesOrganisation get salesOrganisation;
  Username get userName;
  @JsonKey(ignore: true)
  _$$fetchUserRestrictionDetailsImplCopyWith<_$fetchUserRestrictionDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$updateTextFieldImplCopyWith<$Res> {
  factory _$$updateTextFieldImplCopyWith(_$updateTextFieldImpl value,
          $Res Function(_$updateTextFieldImpl) then) =
      __$$updateTextFieldImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value, UserRestrictionLabel label, int index});
}

/// @nodoc
class __$$updateTextFieldImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$updateTextFieldImpl> implements _$$updateTextFieldImplCopyWith<$Res> {
  __$$updateTextFieldImplCopyWithImpl(
      _$updateTextFieldImpl _value, $Res Function(_$updateTextFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? index = null,
  }) {
    return _then(_$updateTextFieldImpl(
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

class _$updateTextFieldImpl implements _updateTextField {
  const _$updateTextFieldImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateTextFieldImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, label, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateTextFieldImplCopyWith<_$updateTextFieldImpl> get copyWith =>
      __$$updateTextFieldImplCopyWithImpl<_$updateTextFieldImpl>(
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
      required final int index}) = _$updateTextFieldImpl;

  String get value;
  UserRestrictionLabel get label;
  int get index;
  @JsonKey(ignore: true)
  _$$updateTextFieldImplCopyWith<_$updateTextFieldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addApproverRightsImplCopyWith<$Res> {
  factory _$$addApproverRightsImplCopyWith(_$addApproverRightsImpl value,
          $Res Function(_$addApproverRightsImpl) then) =
      __$$addApproverRightsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$addApproverRightsImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$addApproverRightsImpl>
    implements _$$addApproverRightsImplCopyWith<$Res> {
  __$$addApproverRightsImplCopyWithImpl(_$addApproverRightsImpl _value,
      $Res Function(_$addApproverRightsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$addApproverRightsImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$addApproverRightsImpl implements _addApproverRights {
  const _$addApproverRightsImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.addApproverRights(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addApproverRightsImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addApproverRightsImplCopyWith<_$addApproverRightsImpl> get copyWith =>
      __$$addApproverRightsImplCopyWithImpl<_$addApproverRightsImpl>(
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
      _$addApproverRightsImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$addApproverRightsImplCopyWith<_$addApproverRightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteApproverRightsImplCopyWith<$Res> {
  factory _$$deleteApproverRightsImplCopyWith(_$deleteApproverRightsImpl value,
          $Res Function(_$deleteApproverRightsImpl) then) =
      __$$deleteApproverRightsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApproverRightsDetails approverRightsDetails});

  $ApproverRightsDetailsCopyWith<$Res> get approverRightsDetails;
}

/// @nodoc
class __$$deleteApproverRightsImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$deleteApproverRightsImpl>
    implements _$$deleteApproverRightsImplCopyWith<$Res> {
  __$$deleteApproverRightsImplCopyWithImpl(_$deleteApproverRightsImpl _value,
      $Res Function(_$deleteApproverRightsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRightsDetails = null,
  }) {
    return _then(_$deleteApproverRightsImpl(
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

class _$deleteApproverRightsImpl implements _deleteApproverRights {
  const _$deleteApproverRightsImpl({required this.approverRightsDetails});

  @override
  final ApproverRightsDetails approverRightsDetails;

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.deleteApproverRights(approverRightsDetails: $approverRightsDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteApproverRightsImpl &&
            (identical(other.approverRightsDetails, approverRightsDetails) ||
                other.approverRightsDetails == approverRightsDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, approverRightsDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteApproverRightsImplCopyWith<_$deleteApproverRightsImpl>
      get copyWith =>
          __$$deleteApproverRightsImplCopyWithImpl<_$deleteApproverRightsImpl>(
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
      _$deleteApproverRightsImpl;

  ApproverRightsDetails get approverRightsDetails;
  @JsonKey(ignore: true)
  _$$deleteApproverRightsImplCopyWith<_$deleteApproverRightsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addUserRestrictionImplCopyWith<$Res> {
  factory _$$addUserRestrictionImplCopyWith(_$addUserRestrictionImpl value,
          $Res Function(_$addUserRestrictionImpl) then) =
      __$$addUserRestrictionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$addUserRestrictionImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$addUserRestrictionImpl>
    implements _$$addUserRestrictionImplCopyWith<$Res> {
  __$$addUserRestrictionImplCopyWithImpl(_$addUserRestrictionImpl _value,
      $Res Function(_$addUserRestrictionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$addUserRestrictionImpl implements _addUserRestriction {
  const _$addUserRestrictionImpl();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.addUserRestriction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$addUserRestrictionImpl);
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
  const factory _addUserRestriction() = _$addUserRestrictionImpl;
}

/// @nodoc
abstract class _$$configureUserRestrictionImplCopyWith<$Res> {
  factory _$$configureUserRestrictionImplCopyWith(
          _$configureUserRestrictionImpl value,
          $Res Function(_$configureUserRestrictionImpl) then) =
      __$$configureUserRestrictionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$configureUserRestrictionImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$configureUserRestrictionImpl>
    implements _$$configureUserRestrictionImplCopyWith<$Res> {
  __$$configureUserRestrictionImplCopyWithImpl(
      _$configureUserRestrictionImpl _value,
      $Res Function(_$configureUserRestrictionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$configureUserRestrictionImpl implements _configureUserRestriction {
  const _$configureUserRestrictionImpl();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.configureUserRestriction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$configureUserRestrictionImpl);
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
  const factory _configureUserRestriction() = _$configureUserRestrictionImpl;
}

/// @nodoc
abstract class _$$deleteUserRestrictionImplCopyWith<$Res> {
  factory _$$deleteUserRestrictionImplCopyWith(
          _$deleteUserRestrictionImpl value,
          $Res Function(_$deleteUserRestrictionImpl) then) =
      __$$deleteUserRestrictionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$deleteUserRestrictionImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsEventCopyWithImpl<$Res,
        _$deleteUserRestrictionImpl>
    implements _$$deleteUserRestrictionImplCopyWith<$Res> {
  __$$deleteUserRestrictionImplCopyWithImpl(_$deleteUserRestrictionImpl _value,
      $Res Function(_$deleteUserRestrictionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$deleteUserRestrictionImpl implements _deleteUserRestriction {
  const _$deleteUserRestrictionImpl();

  @override
  String toString() {
    return 'UserRestrictionDetailsEvent.deleteUserRestriction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteUserRestrictionImpl);
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
  const factory _deleteUserRestriction() = _$deleteUserRestrictionImpl;
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
abstract class _$$UserRestrictionDetailsStateImplCopyWith<$Res>
    implements $UserRestrictionDetailsStateCopyWith<$Res> {
  factory _$$UserRestrictionDetailsStateImplCopyWith(
          _$UserRestrictionDetailsStateImpl value,
          $Res Function(_$UserRestrictionDetailsStateImpl) then) =
      __$$UserRestrictionDetailsStateImplCopyWithImpl<$Res>;
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
class __$$UserRestrictionDetailsStateImplCopyWithImpl<$Res>
    extends _$UserRestrictionDetailsStateCopyWithImpl<$Res,
        _$UserRestrictionDetailsStateImpl>
    implements _$$UserRestrictionDetailsStateImplCopyWith<$Res> {
  __$$UserRestrictionDetailsStateImplCopyWithImpl(
      _$UserRestrictionDetailsStateImpl _value,
      $Res Function(_$UserRestrictionDetailsStateImpl) _then)
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
    return _then(_$UserRestrictionDetailsStateImpl(
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

class _$UserRestrictionDetailsStateImpl extends _UserRestrictionDetailsState {
  _$UserRestrictionDetailsStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionDetailsStateImpl &&
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
  _$$UserRestrictionDetailsStateImplCopyWith<_$UserRestrictionDetailsStateImpl>
      get copyWith => __$$UserRestrictionDetailsStateImplCopyWithImpl<
          _$UserRestrictionDetailsStateImpl>(this, _$identity);
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
          apiFailureOrSuccessOption}) = _$UserRestrictionDetailsStateImpl;
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
  _$$UserRestrictionDetailsStateImplCopyWith<_$UserRestrictionDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
