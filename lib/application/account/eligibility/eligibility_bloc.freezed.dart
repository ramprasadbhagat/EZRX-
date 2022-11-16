// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'eligibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EligibilityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityEventCopyWith<$Res> {
  factory $EligibilityEventCopyWith(
          EligibilityEvent value, $Res Function(EligibilityEvent) then) =
      _$EligibilityEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EligibilityEventCopyWithImpl<$Res>
    implements $EligibilityEventCopyWith<$Res> {
  _$EligibilityEventCopyWithImpl(this._value, this._then);

  final EligibilityEvent _value;
  // ignore: unused_field
  final $Res Function(EligibilityEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'EligibilityEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)
        update,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements EligibilityEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_UpdateCopyWith<$Res> {
  factory _$$_UpdateCopyWith(_$_Update value, $Res Function(_$_Update) then) =
      __$$_UpdateCopyWithImpl<$Res>;
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_UpdateCopyWithImpl<$Res> extends _$EligibilityEventCopyWithImpl<$Res>
    implements _$$_UpdateCopyWith<$Res> {
  __$$_UpdateCopyWithImpl(_$_Update _value, $Res Function(_$_Update) _then)
      : super(_value, (v) => _then(v as _$_Update));

  @override
  _$_Update get _value => super._value as _$_Update;

  @override
  $Res call({
    Object? user = freezed,
    Object? salesOrganisation = freezed,
    Object? salesOrgConfigs = freezed,
    Object? customerCodeInfo = freezed,
  }) {
    return _then(_$_Update(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: salesOrgConfigs == freezed
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'EligibilityEvent.update(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Update &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.salesOrgConfigs, salesOrgConfigs) &&
            const DeepCollectionEquality()
                .equals(other.customerCodeInfo, customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(salesOrgConfigs),
      const DeepCollectionEquality().hash(customerCodeInfo));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      __$$_UpdateCopyWithImpl<_$_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)
        update,
  }) {
    return update(user, salesOrganisation, salesOrgConfigs, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
  }) {
    return update?.call(
        user, salesOrganisation, salesOrgConfigs, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo)?
        update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(user, salesOrganisation, salesOrgConfigs, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements EligibilityEvent {
  const factory _Update(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Update;

  User get user;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrgConfigs;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EligibilityState {
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EligibilityStateCopyWith<EligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityStateCopyWith<$Res> {
  factory $EligibilityStateCopyWith(
          EligibilityState value, $Res Function(EligibilityState) then) =
      _$EligibilityStateCopyWithImpl<$Res>;
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$EligibilityStateCopyWithImpl<$Res>
    implements $EligibilityStateCopyWith<$Res> {
  _$EligibilityStateCopyWithImpl(this._value, this._then);

  final EligibilityState _value;
  // ignore: unused_field
  final $Res Function(EligibilityState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? salesOrganisation = freezed,
    Object? salesOrgConfigs = freezed,
    Object? customerCodeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: salesOrgConfigs == freezed
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_EligibilityStateCopyWith<$Res>
    implements $EligibilityStateCopyWith<$Res> {
  factory _$$_EligibilityStateCopyWith(
          _$_EligibilityState value, $Res Function(_$_EligibilityState) then) =
      __$$_EligibilityStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_EligibilityStateCopyWithImpl<$Res>
    extends _$EligibilityStateCopyWithImpl<$Res>
    implements _$$_EligibilityStateCopyWith<$Res> {
  __$$_EligibilityStateCopyWithImpl(
      _$_EligibilityState _value, $Res Function(_$_EligibilityState) _then)
      : super(_value, (v) => _then(v as _$_EligibilityState));

  @override
  _$_EligibilityState get _value => super._value as _$_EligibilityState;

  @override
  $Res call({
    Object? user = freezed,
    Object? salesOrganisation = freezed,
    Object? salesOrgConfigs = freezed,
    Object? customerCodeInfo = freezed,
  }) {
    return _then(_$_EligibilityState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: salesOrgConfigs == freezed
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }
}

/// @nodoc

class _$_EligibilityState extends _EligibilityState {
  const _$_EligibilityState(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo})
      : super._();

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'EligibilityState(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EligibilityState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.salesOrgConfigs, salesOrgConfigs) &&
            const DeepCollectionEquality()
                .equals(other.customerCodeInfo, customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(salesOrgConfigs),
      const DeepCollectionEquality().hash(customerCodeInfo));

  @JsonKey(ignore: true)
  @override
  _$$_EligibilityStateCopyWith<_$_EligibilityState> get copyWith =>
      __$$_EligibilityStateCopyWithImpl<_$_EligibilityState>(this, _$identity);
}

abstract class _EligibilityState extends EligibilityState {
  const factory _EligibilityState(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo}) = _$_EligibilityState;
  const _EligibilityState._() : super._();

  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_EligibilityStateCopyWith<_$_EligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}
