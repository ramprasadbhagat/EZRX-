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
    TResult? Function()? initialized,
    TResult? Function(
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchInfo value)? fetch,
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
      _$StockInformationEventCopyWithImpl<$Res, StockInformationEvent>;
}

/// @nodoc
class _$StockInformationEventCopyWithImpl<$Res,
        $Val extends StockInformationEvent>
    implements $StockInformationEventCopyWith<$Res> {
  _$StockInformationEventCopyWithImpl(this._value, this._then);

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
    extends _$StockInformationEventCopyWithImpl<$Res, _$_Initialized>
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
    TResult? Function()? initialized,
    TResult? Function(
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchInfo value)? fetch,
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
  @useResult
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
    extends _$StockInformationEventCopyWithImpl<$Res, _$_FetchInfo>
    implements _$$_FetchInfoCopyWith<$Res> {
  __$$_FetchInfoCopyWithImpl(
      _$_FetchInfo _value, $Res Function(_$_FetchInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_FetchInfo(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material, customerCodeInfo,
      salesOrganisationConfigs, salesOrganisation, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function()? initialized,
    TResult? Function(
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
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchInfo value)? fetch,
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
      _$StockInformationStateCopyWithImpl<$Res, StockInformationState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, List<StockInfo>>>
          stockInfoListFailureOrSuccessOption,
      List<StockInfo> stockInfoList});
}

/// @nodoc
class _$StockInformationStateCopyWithImpl<$Res,
        $Val extends StockInformationState>
    implements $StockInformationStateCopyWith<$Res> {
  _$StockInformationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? stockInfoListFailureOrSuccessOption = null,
    Object? stockInfoList = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoListFailureOrSuccessOption: null ==
              stockInfoListFailureOrSuccessOption
          ? _value.stockInfoListFailureOrSuccessOption
          : stockInfoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<StockInfo>>>,
      stockInfoList: null == stockInfoList
          ? _value.stockInfoList
          : stockInfoList // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StockInformationStateCopyWith<$Res>
    implements $StockInformationStateCopyWith<$Res> {
  factory _$$_StockInformationStateCopyWith(_$_StockInformationState value,
          $Res Function(_$_StockInformationState) then) =
      __$$_StockInformationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ApiFailure, List<StockInfo>>>
          stockInfoListFailureOrSuccessOption,
      List<StockInfo> stockInfoList});
}

/// @nodoc
class __$$_StockInformationStateCopyWithImpl<$Res>
    extends _$StockInformationStateCopyWithImpl<$Res, _$_StockInformationState>
    implements _$$_StockInformationStateCopyWith<$Res> {
  __$$_StockInformationStateCopyWithImpl(_$_StockInformationState _value,
      $Res Function(_$_StockInformationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? stockInfoListFailureOrSuccessOption = null,
    Object? stockInfoList = null,
  }) {
    return _then(_$_StockInformationState(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      stockInfoListFailureOrSuccessOption: null ==
              stockInfoListFailureOrSuccessOption
          ? _value.stockInfoListFailureOrSuccessOption
          : stockInfoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<StockInfo>>>,
      stockInfoList: null == stockInfoList
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
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.stockInfoListFailureOrSuccessOption,
                    stockInfoListFailureOrSuccessOption) ||
                other.stockInfoListFailureOrSuccessOption ==
                    stockInfoListFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._stockInfoList, _stockInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSubmitting,
      showErrorMessages,
      stockInfoListFailureOrSuccessOption,
      const DeepCollectionEquality().hash(_stockInfoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
