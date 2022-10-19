// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_information_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockInformationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchInfo value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInformationEventCopyWith<$Res> {
  factory $StockInformationEventCopyWith(StockInformationEvent value,
          $Res Function(StockInformationEvent) then) =
      _$StockInformationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StockInformationEventCopyWithImpl<$Res>
    implements $StockInformationEventCopyWith<$Res> {
  _$StockInformationEventCopyWithImpl(this._value, this._then);

  final StockInformationEvent _value;
  // ignore: unused_field
  final $Res Function(StockInformationEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$StockInformationEventCopyWithImpl<$Res>
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
    return 'StockInformationEvent.initialized()';
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
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
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
    required TResult Function(_FetchInfo value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements StockInformationEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchInfoCopyWith<$Res> {
  factory _$$_FetchInfoCopyWith(
          _$_FetchInfo value, $Res Function(_$_FetchInfo) then) =
      __$$_FetchInfoCopyWithImpl<$Res>;
  $Res call(
      {MaterialInfo material,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo});

  $MaterialInfoCopyWith<$Res> get material;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchInfoCopyWithImpl<$Res>
    extends _$StockInformationEventCopyWithImpl<$Res>
    implements _$$_FetchInfoCopyWith<$Res> {
  __$$_FetchInfoCopyWithImpl(
      _$_FetchInfo _value, $Res Function(_$_FetchInfo) _then)
      : super(_value, (v) => _then(v as _$_FetchInfo));

  @override
  _$_FetchInfo get _value => super._value as _$_FetchInfo;

  @override
  $Res call({
    Object? material = freezed,
    Object? customerCodeInfo = freezed,
    Object? salesOrganisationConfigs = freezed,
    Object? salesOrganisation = freezed,
    Object? shipToInfo = freezed,
  }) {
    return _then(_$_FetchInfo(
      material: material == freezed
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: salesOrganisationConfigs == freezed
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: shipToInfo == freezed
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_FetchInfo implements _FetchInfo {
  const _$_FetchInfo(
      {required this.material,
      required this.customerCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.shipToInfo});

  @override
  final MaterialInfo material;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'StockInformationEvent.fetch(material: $material, customerCodeInfo: $customerCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchInfo &&
            const DeepCollectionEquality().equals(other.material, material) &&
            const DeepCollectionEquality()
                .equals(other.customerCodeInfo, customerCodeInfo) &&
            const DeepCollectionEquality().equals(
                other.salesOrganisationConfigs, salesOrganisationConfigs) &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.shipToInfo, shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(material),
      const DeepCollectionEquality().hash(customerCodeInfo),
      const DeepCollectionEquality().hash(salesOrganisationConfigs),
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(shipToInfo));

  @JsonKey(ignore: true)
  @override
  _$$_FetchInfoCopyWith<_$_FetchInfo> get copyWith =>
      __$$_FetchInfoCopyWithImpl<_$_FetchInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        fetch,
  }) {
    return fetch(material, customerCodeInfo, salesOrganisationConfigs,
        salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
  }) {
    return fetch?.call(material, customerCodeInfo, salesOrganisationConfigs,
        salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialInfo material,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(material, customerCodeInfo, salesOrganisationConfigs,
          salesOrganisation, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchInfo value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchInfo value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchInfo implements StockInformationEvent {
  const factory _FetchInfo(
      {required final MaterialInfo material,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo}) = _$_FetchInfo;

  MaterialInfo get material;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_FetchInfoCopyWith<_$_FetchInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockInformationState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, List<StockInfo>>>
      get stockInfoListFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  List<StockInfo> get stockInfoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockInformationStateCopyWith<StockInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInformationStateCopyWith<$Res> {
  factory $StockInformationStateCopyWith(StockInformationState value,
          $Res Function(StockInformationState) then) =
      _$StockInformationStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, List<StockInfo>>>
          stockInfoListFailureOrSuccessOption,
      List<StockInfo> stockInfoList});
}

/// @nodoc
class _$StockInformationStateCopyWithImpl<$Res>
    implements $StockInformationStateCopyWith<$Res> {
  _$StockInformationStateCopyWithImpl(this._value, this._then);

  final StockInformationState _value;
  // ignore: unused_field
  final $Res Function(StockInformationState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? stockInfoListFailureOrSuccessOption = freezed,
    Object? stockInfoList = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoListFailureOrSuccessOption: stockInfoListFailureOrSuccessOption ==
              freezed
          ? _value.stockInfoListFailureOrSuccessOption
          : stockInfoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<StockInfo>>>,
      stockInfoList: stockInfoList == freezed
          ? _value.stockInfoList
          : stockInfoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ));
  }
}

/// @nodoc
abstract class _$$_StockInformationStateCopyWith<$Res>
    implements $StockInformationStateCopyWith<$Res> {
  factory _$$_StockInformationStateCopyWith(_$_StockInformationState value,
          $Res Function(_$_StockInformationState) then) =
      __$$_StockInformationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, List<StockInfo>>>
          stockInfoListFailureOrSuccessOption,
      List<StockInfo> stockInfoList});
}

/// @nodoc
class __$$_StockInformationStateCopyWithImpl<$Res>
    extends _$StockInformationStateCopyWithImpl<$Res>
    implements _$$_StockInformationStateCopyWith<$Res> {
  __$$_StockInformationStateCopyWithImpl(_$_StockInformationState _value,
      $Res Function(_$_StockInformationState) _then)
      : super(_value, (v) => _then(v as _$_StockInformationState));

  @override
  _$_StockInformationState get _value =>
      super._value as _$_StockInformationState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? stockInfoListFailureOrSuccessOption = freezed,
    Object? stockInfoList = freezed,
  }) {
    return _then(_$_StockInformationState(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoListFailureOrSuccessOption: stockInfoListFailureOrSuccessOption ==
              freezed
          ? _value.stockInfoListFailureOrSuccessOption
          : stockInfoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<StockInfo>>>,
      stockInfoList: stockInfoList == freezed
          ? _value._stockInfoList
          : stockInfoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ));
  }
}

/// @nodoc

class _$_StockInformationState implements _StockInformationState {
  const _$_StockInformationState(
      {required this.isSubmitting,
      required this.showErrorMessages,
      required this.stockInfoListFailureOrSuccessOption,
      required final List<StockInfo> stockInfoList})
      : _stockInfoList = stockInfoList;

  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<ApiFailure, List<StockInfo>>>
      stockInfoListFailureOrSuccessOption;
  final List<StockInfo> _stockInfoList;
  @override
  List<StockInfo> get stockInfoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockInfoList);
  }

  @override
  String toString() {
    return 'StockInformationState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, stockInfoListFailureOrSuccessOption: $stockInfoListFailureOrSuccessOption, stockInfoList: $stockInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockInformationState &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(
                other.stockInfoListFailureOrSuccessOption,
                stockInfoListFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._stockInfoList, _stockInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(stockInfoListFailureOrSuccessOption),
      const DeepCollectionEquality().hash(_stockInfoList));

  @JsonKey(ignore: true)
  @override
  _$$_StockInformationStateCopyWith<_$_StockInformationState> get copyWith =>
      __$$_StockInformationStateCopyWithImpl<_$_StockInformationState>(
          this, _$identity);
}

abstract class _StockInformationState implements StockInformationState {
  const factory _StockInformationState(
      {required final bool isSubmitting,
      required final bool showErrorMessages,
      required final Option<Either<ApiFailure, List<StockInfo>>>
          stockInfoListFailureOrSuccessOption,
      required final List<StockInfo> stockInfoList}) = _$_StockInformationState;

  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<ApiFailure, List<StockInfo>>>
      get stockInfoListFailureOrSuccessOption;
  @override
  List<StockInfo> get stockInfoList;
  @override
  @JsonKey(ignore: true)
  _$$_StockInformationStateCopyWith<_$_StockInformationState> get copyWith =>
      throw _privateConstructorUsedError;
}
