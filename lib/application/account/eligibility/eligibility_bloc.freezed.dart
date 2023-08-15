// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
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
      _$EligibilityEventCopyWithImpl<$Res, EligibilityEvent>;
}

/// @nodoc
class _$EligibilityEventCopyWithImpl<$Res, $Val extends EligibilityEvent>
    implements $EligibilityEventCopyWith<$Res> {
  _$EligibilityEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)
        update,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
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
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      OrderDocumentType selectedOrderType});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
}

/// @nodoc
class __$$_UpdateCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$_Update>
    implements _$$_UpdateCopyWith<$Res> {
  __$$_UpdateCopyWithImpl(_$_Update _value, $Res Function(_$_Update) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? selectedOrderType = null,
  }) {
    return _then(_$_Update(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.selectedOrderType, (value) {
      return _then(_value.copyWith(selectedOrderType: value));
    });
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.selectedOrderType});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final OrderDocumentType selectedOrderType;

  @override
  String toString() {
    return 'EligibilityEvent.update(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, selectedOrderType: $selectedOrderType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Update &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrganisation,
      salesOrgConfigs, customerCodeInfo, shipToInfo, selectedOrderType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)
        update,
  }) {
    return update(user, salesOrganisation, salesOrgConfigs, customerCodeInfo,
        shipToInfo, selectedOrderType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
        update,
  }) {
    return update?.call(user, salesOrganisation, salesOrgConfigs,
        customerCodeInfo, shipToInfo, selectedOrderType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            User user,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            OrderDocumentType selectedOrderType)?
        update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(user, salesOrganisation, salesOrgConfigs, customerCodeInfo,
          shipToInfo, selectedOrderType);
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
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
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final OrderDocumentType selectedOrderType}) = _$_Update;

  User get user;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrgConfigs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  OrderDocumentType get selectedOrderType;
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
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  OrderDocumentType get selectedOrderType => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EligibilityStateCopyWith<EligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityStateCopyWith<$Res> {
  factory $EligibilityStateCopyWith(
          EligibilityState value, $Res Function(EligibilityState) then) =
      _$EligibilityStateCopyWithImpl<$Res, EligibilityState>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      OrderDocumentType selectedOrderType,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
}

/// @nodoc
class _$EligibilityStateCopyWithImpl<$Res, $Val extends EligibilityState>
    implements $EligibilityStateCopyWith<$Res> {
  _$EligibilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? selectedOrderType = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.selectedOrderType, (value) {
      return _then(_value.copyWith(selectedOrderType: value) as $Val);
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
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      OrderDocumentType selectedOrderType,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
}

/// @nodoc
class __$$_EligibilityStateCopyWithImpl<$Res>
    extends _$EligibilityStateCopyWithImpl<$Res, _$_EligibilityState>
    implements _$$_EligibilityStateCopyWith<$Res> {
  __$$_EligibilityStateCopyWithImpl(
      _$_EligibilityState _value, $Res Function(_$_EligibilityState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? selectedOrderType = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$_EligibilityState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EligibilityState extends _EligibilityState {
  const _$_EligibilityState(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.selectedOrderType,
      required this.failureOrSuccessOption,
      required this.isLoading})
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
  final ShipToInfo shipToInfo;
  @override
  final OrderDocumentType selectedOrderType;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'EligibilityState(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, selectedOrderType: $selectedOrderType, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EligibilityState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      salesOrganisation,
      salesOrgConfigs,
      customerCodeInfo,
      shipToInfo,
      selectedOrderType,
      failureOrSuccessOption,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EligibilityStateCopyWith<_$_EligibilityState> get copyWith =>
      __$$_EligibilityStateCopyWithImpl<_$_EligibilityState>(this, _$identity);
}

abstract class _EligibilityState extends EligibilityState {
  const factory _EligibilityState(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final OrderDocumentType selectedOrderType,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading}) = _$_EligibilityState;
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
  ShipToInfo get shipToInfo;
  @override
  OrderDocumentType get selectedOrderType;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_EligibilityStateCopyWith<_$_EligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}
