// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialPriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
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
abstract class $MaterialPriceEventCopyWith<$Res> {
  factory $MaterialPriceEventCopyWith(
          MaterialPriceEvent value, $Res Function(MaterialPriceEvent) then) =
      _$MaterialPriceEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MaterialPriceEventCopyWithImpl<$Res>
    implements $MaterialPriceEventCopyWith<$Res> {
  _$MaterialPriceEventCopyWithImpl(this._value, this._then);

  final MaterialPriceEvent _value;
  // ignore: unused_field
  final $Res Function(MaterialPriceEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res>
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
    return 'MaterialPriceEvent.initialized()';
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
    required TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
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

abstract class _Initialized implements MaterialPriceEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call(
      {CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      List<MaterialInfo> materials});

  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? customerCode = freezed,
    Object? salesOrganisation = freezed,
    Object? materials = freezed,
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
      materials: materials == freezed
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
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
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.customerCode,
      required this.salesOrganisation,
      required final List<MaterialInfo> materials})
      : _materials = materials;

  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'MaterialPriceEvent.fetch(customerCode: $customerCode, salesOrganisation: $salesOrganisation, materials: $materials)';
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
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)
        fetch,
  }) {
    return fetch(customerCode, salesOrganisation, materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
        fetch,
  }) {
    return fetch?.call(customerCode, salesOrganisation, materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation, List<MaterialInfo> materials)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCode, salesOrganisation, materials);
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

abstract class _Fetch implements MaterialPriceEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final List<MaterialInfo> materials}) = _$_Fetch;

  CustomerCodeInfo get customerCode;
  SalesOrganisation get salesOrganisation;
  List<MaterialInfo> get materials;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPriceState {
  Map<MaterialNumber, Price> get materialPrice =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialPriceStateCopyWith<MaterialPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceStateCopyWith<$Res> {
  factory $MaterialPriceStateCopyWith(
          MaterialPriceState value, $Res Function(MaterialPriceState) then) =
      _$MaterialPriceStateCopyWithImpl<$Res>;
  $Res call({Map<MaterialNumber, Price> materialPrice, bool isFetching});
}

/// @nodoc
class _$MaterialPriceStateCopyWithImpl<$Res>
    implements $MaterialPriceStateCopyWith<$Res> {
  _$MaterialPriceStateCopyWithImpl(this._value, this._then);

  final MaterialPriceState _value;
  // ignore: unused_field
  final $Res Function(MaterialPriceState) _then;

  @override
  $Res call({
    Object? materialPrice = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      materialPrice: materialPrice == freezed
          ? _value.materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialPriceStateCopyWith<$Res>
    implements $MaterialPriceStateCopyWith<$Res> {
  factory _$$_MaterialPriceStateCopyWith(_$_MaterialPriceState value,
          $Res Function(_$_MaterialPriceState) then) =
      __$$_MaterialPriceStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<MaterialNumber, Price> materialPrice, bool isFetching});
}

/// @nodoc
class __$$_MaterialPriceStateCopyWithImpl<$Res>
    extends _$MaterialPriceStateCopyWithImpl<$Res>
    implements _$$_MaterialPriceStateCopyWith<$Res> {
  __$$_MaterialPriceStateCopyWithImpl(
      _$_MaterialPriceState _value, $Res Function(_$_MaterialPriceState) _then)
      : super(_value, (v) => _then(v as _$_MaterialPriceState));

  @override
  _$_MaterialPriceState get _value => super._value as _$_MaterialPriceState;

  @override
  $Res call({
    Object? materialPrice = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_$_MaterialPriceState(
      materialPrice: materialPrice == freezed
          ? _value._materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialPriceState implements _MaterialPriceState {
  const _$_MaterialPriceState(
      {required final Map<MaterialNumber, Price> materialPrice,
      required this.isFetching})
      : _materialPrice = materialPrice;

  final Map<MaterialNumber, Price> _materialPrice;
  @override
  Map<MaterialNumber, Price> get materialPrice {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialPrice);
  }

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'MaterialPriceState(materialPrice: $materialPrice, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceState &&
            const DeepCollectionEquality()
                .equals(other._materialPrice, _materialPrice) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_materialPrice),
      const DeepCollectionEquality().hash(isFetching));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialPriceStateCopyWith<_$_MaterialPriceState> get copyWith =>
      __$$_MaterialPriceStateCopyWithImpl<_$_MaterialPriceState>(
          this, _$identity);
}

abstract class _MaterialPriceState implements MaterialPriceState {
  const factory _MaterialPriceState(
      {required final Map<MaterialNumber, Price> materialPrice,
      required final bool isFetching}) = _$_MaterialPriceState;

  @override
  Map<MaterialNumber, Price> get materialPrice;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceStateCopyWith<_$_MaterialPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}
