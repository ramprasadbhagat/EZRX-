// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_price_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialPriceDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailEventCopyWith<$Res> {
  factory $MaterialPriceDetailEventCopyWith(MaterialPriceDetailEvent value,
          $Res Function(MaterialPriceDetailEvent) then) =
      _$MaterialPriceDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MaterialPriceDetailEventCopyWithImpl<$Res>
    implements $MaterialPriceDetailEventCopyWith<$Res> {
  _$MaterialPriceDetailEventCopyWithImpl(this._value, this._then);

  final MaterialPriceDetailEvent _value;
  // ignore: unused_field
  final $Res Function(MaterialPriceDetailEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res>
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
    return 'MaterialPriceDetailEvent.initialized()';
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
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialPriceDetailEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call(
      {CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      ShipToInfo shipToCode,
      List<MaterialQueryInfo> materialInfos});

  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $ShipToInfoCopyWith<$Res> get shipToCode;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? customerCode = freezed,
    Object? salesOrganisation = freezed,
    Object? salesOrganisationConfigs = freezed,
    Object? shipToCode = freezed,
    Object? materialInfos = freezed,
  }) {
    return _then(_$_Fetch(
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: salesOrganisationConfigs == freezed
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToCode: shipToCode == freezed
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialInfos: materialInfos == freezed
          ? _value._materialInfos
          : materialInfos // ignore: cast_nullable_to_non_nullable
              as List<MaterialQueryInfo>,
    ));
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCode, (value) {
      return _then(_value.copyWith(customerCode: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
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
  $ShipToInfoCopyWith<$Res> get shipToCode {
    return $ShipToInfoCopyWith<$Res>(_value.shipToCode, (value) {
      return _then(_value.copyWith(shipToCode: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.customerCode,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.shipToCode,
      required final List<MaterialQueryInfo> materialInfos})
      : _materialInfos = materialInfos;

  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final ShipToInfo shipToCode;
  final List<MaterialQueryInfo> _materialInfos;
  @override
  List<MaterialQueryInfo> get materialInfos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialInfos);
  }

  @override
  String toString() {
    return 'MaterialPriceDetailEvent.fetch(customerCode: $customerCode, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, shipToCode: $shipToCode, materialInfos: $materialInfos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality().equals(
                other.salesOrganisationConfigs, salesOrganisationConfigs) &&
            const DeepCollectionEquality()
                .equals(other.shipToCode, shipToCode) &&
            const DeepCollectionEquality()
                .equals(other._materialInfos, _materialInfos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(salesOrganisationConfigs),
      const DeepCollectionEquality().hash(shipToCode),
      const DeepCollectionEquality().hash(_materialInfos));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)
        fetch,
  }) {
    return fetch(customerCode, salesOrganisation, salesOrganisationConfigs,
        shipToCode, materialInfos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
        fetch,
  }) {
    return fetch?.call(customerCode, salesOrganisation,
        salesOrganisationConfigs, shipToCode, materialInfos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode,
            List<MaterialQueryInfo> materialInfos)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCode, salesOrganisation, salesOrganisationConfigs,
          shipToCode, materialInfos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialPriceDetailEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final ShipToInfo shipToCode,
      required final List<MaterialQueryInfo> materialInfos}) = _$_Fetch;

  CustomerCodeInfo get customerCode;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  ShipToInfo get shipToCode;
  List<MaterialQueryInfo> get materialInfos;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPriceDetailState {
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialPriceDetailStateCopyWith<MaterialPriceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailStateCopyWith<$Res> {
  factory $MaterialPriceDetailStateCopyWith(MaterialPriceDetailState value,
          $Res Function(MaterialPriceDetailState) then) =
      _$MaterialPriceDetailStateCopyWithImpl<$Res>;
  $Res call(
      {Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
      bool isFetching});
}

/// @nodoc
class _$MaterialPriceDetailStateCopyWithImpl<$Res>
    implements $MaterialPriceDetailStateCopyWith<$Res> {
  _$MaterialPriceDetailStateCopyWithImpl(this._value, this._then);

  final MaterialPriceDetailState _value;
  // ignore: unused_field
  final $Res Function(MaterialPriceDetailState) _then;

  @override
  $Res call({
    Object? materialDetails = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      materialDetails: materialDetails == freezed
          ? _value.materialDetails
          : materialDetails // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, MaterialPriceDetail>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialPriceDetailStateCopyWith<$Res>
    implements $MaterialPriceDetailStateCopyWith<$Res> {
  factory _$$_MaterialPriceDetailStateCopyWith(
          _$_MaterialPriceDetailState value,
          $Res Function(_$_MaterialPriceDetailState) then) =
      __$$_MaterialPriceDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
      bool isFetching});
}

/// @nodoc
class __$$_MaterialPriceDetailStateCopyWithImpl<$Res>
    extends _$MaterialPriceDetailStateCopyWithImpl<$Res>
    implements _$$_MaterialPriceDetailStateCopyWith<$Res> {
  __$$_MaterialPriceDetailStateCopyWithImpl(_$_MaterialPriceDetailState _value,
      $Res Function(_$_MaterialPriceDetailState) _then)
      : super(_value, (v) => _then(v as _$_MaterialPriceDetailState));

  @override
  _$_MaterialPriceDetailState get _value =>
      super._value as _$_MaterialPriceDetailState;

  @override
  $Res call({
    Object? materialDetails = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_$_MaterialPriceDetailState(
      materialDetails: materialDetails == freezed
          ? _value._materialDetails
          : materialDetails // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, MaterialPriceDetail>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialPriceDetailState implements _MaterialPriceDetailState {
  const _$_MaterialPriceDetailState(
      {required final Map<MaterialQueryInfo, MaterialPriceDetail>
          materialDetails,
      required this.isFetching})
      : _materialDetails = materialDetails;

  final Map<MaterialQueryInfo, MaterialPriceDetail> _materialDetails;
  @override
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialDetails);
  }

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'MaterialPriceDetailState(materialDetails: $materialDetails, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceDetailState &&
            const DeepCollectionEquality()
                .equals(other._materialDetails, _materialDetails) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_materialDetails),
      const DeepCollectionEquality().hash(isFetching));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialPriceDetailStateCopyWith<_$_MaterialPriceDetailState>
      get copyWith => __$$_MaterialPriceDetailStateCopyWithImpl<
          _$_MaterialPriceDetailState>(this, _$identity);
}

abstract class _MaterialPriceDetailState implements MaterialPriceDetailState {
  const factory _MaterialPriceDetailState(
      {required final Map<MaterialQueryInfo, MaterialPriceDetail>
          materialDetails,
      required final bool isFetching}) = _$_MaterialPriceDetailState;

  @override
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceDetailStateCopyWith<_$_MaterialPriceDetailState>
      get copyWith => throw _privateConstructorUsedError;
}
