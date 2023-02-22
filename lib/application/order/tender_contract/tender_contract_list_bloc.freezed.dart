// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tender_contract_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TenderContractListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractListEventCopyWith<$Res> {
  factory $TenderContractListEventCopyWith(TenderContractListEvent value,
          $Res Function(TenderContractListEvent) then) =
      _$TenderContractListEventCopyWithImpl<$Res, TenderContractListEvent>;
}

/// @nodoc
class _$TenderContractListEventCopyWithImpl<$Res,
        $Val extends TenderContractListEvent>
    implements $TenderContractListEventCopyWith<$Res> {
  _$TenderContractListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$TenderContractListEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'TenderContractListEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)
        fetch,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements TenderContractListEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      List<MaterialNumber> materialNumbers});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$TenderContractListEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? materialNumbers = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialNumbers: null == materialNumbers
          ? _value._materialNumbers
          : materialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
    ));
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
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required final List<MaterialNumber> materialNumbers})
      : _materialNumbers = materialNumbers;

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  final List<MaterialNumber> _materialNumbers;
  @override
  List<MaterialNumber> get materialNumbers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialNumbers);
  }

  @override
  String toString() {
    return 'TenderContractListEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, materialNumbers: $materialNumbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            const DeepCollectionEquality()
                .equals(other._materialNumbers, _materialNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      const DeepCollectionEquality().hash(_materialNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)
        fetch,
  }) {
    return fetch(
        salesOrganisation, customerCodeInfo, shipToInfo, materialNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
  }) {
    return fetch?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, materialNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            List<MaterialNumber> materialNumbers)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          salesOrganisation, customerCodeInfo, shipToInfo, materialNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements TenderContractListEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final List<MaterialNumber> materialNumbers}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  List<MaterialNumber> get materialNumbers;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TenderContractListState {
  Map<MaterialNumber, List<TenderContract>> get tenderContracts =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TenderContractListStateCopyWith<TenderContractListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractListStateCopyWith<$Res> {
  factory $TenderContractListStateCopyWith(TenderContractListState value,
          $Res Function(TenderContractListState) then) =
      _$TenderContractListStateCopyWithImpl<$Res, TenderContractListState>;
  @useResult
  $Res call(
      {Map<MaterialNumber, List<TenderContract>> tenderContracts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class _$TenderContractListStateCopyWithImpl<$Res,
        $Val extends TenderContractListState>
    implements $TenderContractListStateCopyWith<$Res> {
  _$TenderContractListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContracts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
  }) {
    return _then(_value.copyWith(
      tenderContracts: null == tenderContracts
          ? _value.tenderContracts
          : tenderContracts // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, List<TenderContract>>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TenderContractListStateCopyWith<$Res>
    implements $TenderContractListStateCopyWith<$Res> {
  factory _$$_TenderContractListStateCopyWith(_$_TenderContractListState value,
          $Res Function(_$_TenderContractListState) then) =
      __$$_TenderContractListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<MaterialNumber, List<TenderContract>> tenderContracts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class __$$_TenderContractListStateCopyWithImpl<$Res>
    extends _$TenderContractListStateCopyWithImpl<$Res,
        _$_TenderContractListState>
    implements _$$_TenderContractListStateCopyWith<$Res> {
  __$$_TenderContractListStateCopyWithImpl(_$_TenderContractListState _value,
      $Res Function(_$_TenderContractListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContracts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
  }) {
    return _then(_$_TenderContractListState(
      tenderContracts: null == tenderContracts
          ? _value._tenderContracts
          : tenderContracts // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, List<TenderContract>>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TenderContractListState implements _TenderContractListState {
  const _$_TenderContractListState(
      {required final Map<MaterialNumber, List<TenderContract>> tenderContracts,
      required this.apiFailureOrSuccessOption,
      required this.isFetching})
      : _tenderContracts = tenderContracts;

  final Map<MaterialNumber, List<TenderContract>> _tenderContracts;
  @override
  Map<MaterialNumber, List<TenderContract>> get tenderContracts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tenderContracts);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;

  @override
  String toString() {
    return 'TenderContractListState(tenderContracts: $tenderContracts, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TenderContractListState &&
            const DeepCollectionEquality()
                .equals(other._tenderContracts, _tenderContracts) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tenderContracts),
      apiFailureOrSuccessOption,
      isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TenderContractListStateCopyWith<_$_TenderContractListState>
      get copyWith =>
          __$$_TenderContractListStateCopyWithImpl<_$_TenderContractListState>(
              this, _$identity);
}

abstract class _TenderContractListState implements TenderContractListState {
  const factory _TenderContractListState(
      {required final Map<MaterialNumber, List<TenderContract>> tenderContracts,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching}) = _$_TenderContractListState;

  @override
  Map<MaterialNumber, List<TenderContract>> get tenderContracts;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_TenderContractListStateCopyWith<_$_TenderContractListState>
      get copyWith => throw _privateConstructorUsedError;
}
