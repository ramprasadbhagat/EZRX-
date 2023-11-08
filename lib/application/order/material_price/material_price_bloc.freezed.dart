// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceEventCopyWith<$Res> {
  factory $MaterialPriceEventCopyWith(
          MaterialPriceEvent value, $Res Function(MaterialPriceEvent) then) =
      _$MaterialPriceEventCopyWithImpl<$Res, MaterialPriceEvent>;
}

/// @nodoc
class _$MaterialPriceEventCopyWithImpl<$Res, $Val extends MaterialPriceEvent>
    implements $MaterialPriceEventCopyWith<$Res> {
  _$MaterialPriceEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialized(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value));
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

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.salesConfigs,
      required this.shipToInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'MaterialPriceEvent.initialized(customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, salesConfigs: $salesConfigs, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo,
      salesOrganisation, salesConfigs, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return initialized(
        customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return initialized?.call(
        customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialPriceEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesConfigs,
      required final ShipToInfo shipToInfo}) = _$_Initialized;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesConfigs;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> materials, bool comboDealEligible});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? comboDealEligible = null,
  }) {
    return _then(_$_Fetch(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required final List<MaterialInfo> materials,
      required this.comboDealEligible})
      : _materials = materials;

  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  final bool comboDealEligible;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetch(materials: $materials, comboDealEligible: $comboDealEligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_materials), comboDealEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetch(materials, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetch?.call(materials, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(materials, comboDealEligible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
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
      {required final List<MaterialInfo> materials,
      required final bool comboDealEligible}) = _$_Fetch;

  List<MaterialInfo> get materials;
  bool get comboDealEligible;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPriceCartProductCopyWith<$Res> {
  factory _$$_FetchPriceCartProductCopyWith(_$_FetchPriceCartProduct value,
          $Res Function(_$_FetchPriceCartProduct) then) =
      __$$_FetchPriceCartProductCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> products, bool comboDealEligible});
}

/// @nodoc
class __$$_FetchPriceCartProductCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$_FetchPriceCartProduct>
    implements _$$_FetchPriceCartProductCopyWith<$Res> {
  __$$_FetchPriceCartProductCopyWithImpl(_$_FetchPriceCartProduct _value,
      $Res Function(_$_FetchPriceCartProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? comboDealEligible = null,
  }) {
    return _then(_$_FetchPriceCartProduct(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FetchPriceCartProduct implements _FetchPriceCartProduct {
  const _$_FetchPriceCartProduct(
      {required final List<MaterialInfo> products,
      required this.comboDealEligible})
      : _products = products;

  final List<MaterialInfo> _products;
  @override
  List<MaterialInfo> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final bool comboDealEligible;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetchPriceCartProduct(products: $products, comboDealEligible: $comboDealEligible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPriceCartProduct &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), comboDealEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchPriceCartProductCopyWith<_$_FetchPriceCartProduct> get copyWith =>
      __$$_FetchPriceCartProductCopyWithImpl<_$_FetchPriceCartProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct(products, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct?.call(products, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceCartProduct != null) {
      return fetchPriceCartProduct(products, comboDealEligible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceCartProduct != null) {
      return fetchPriceCartProduct(this);
    }
    return orElse();
  }
}

abstract class _FetchPriceCartProduct implements MaterialPriceEvent {
  const factory _FetchPriceCartProduct(
      {required final List<MaterialInfo> products,
      required final bool comboDealEligible}) = _$_FetchPriceCartProduct;

  List<MaterialInfo> get products;
  bool get comboDealEligible;
  @JsonKey(ignore: true)
  _$$_FetchPriceCartProductCopyWith<_$_FetchPriceCartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPriceForZDP5MaterialsCopyWith<$Res> {
  factory _$$_FetchPriceForZDP5MaterialsCopyWith(
          _$_FetchPriceForZDP5Materials value,
          $Res Function(_$_FetchPriceForZDP5Materials) then) =
      __$$_FetchPriceForZDP5MaterialsCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo materialInfo});

  $MaterialInfoCopyWith<$Res> get materialInfo;
}

/// @nodoc
class __$$_FetchPriceForZDP5MaterialsCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res,
        _$_FetchPriceForZDP5Materials>
    implements _$$_FetchPriceForZDP5MaterialsCopyWith<$Res> {
  __$$_FetchPriceForZDP5MaterialsCopyWithImpl(
      _$_FetchPriceForZDP5Materials _value,
      $Res Function(_$_FetchPriceForZDP5Materials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfo = null,
  }) {
    return _then(_$_FetchPriceForZDP5Materials(
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value));
    });
  }
}

/// @nodoc

class _$_FetchPriceForZDP5Materials implements _FetchPriceForZDP5Materials {
  const _$_FetchPriceForZDP5Materials({required this.materialInfo});

  @override
  final MaterialInfo materialInfo;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetchPriceForZDP5Materials(materialInfo: $materialInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPriceForZDP5Materials &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchPriceForZDP5MaterialsCopyWith<_$_FetchPriceForZDP5Materials>
      get copyWith => __$$_FetchPriceForZDP5MaterialsCopyWithImpl<
          _$_FetchPriceForZDP5Materials>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials(materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials?.call(materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceForZDP5Materials != null) {
      return fetchPriceForZDP5Materials(materialInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceForZDP5Materials != null) {
      return fetchPriceForZDP5Materials(this);
    }
    return orElse();
  }
}

abstract class _FetchPriceForZDP5Materials implements MaterialPriceEvent {
  const factory _FetchPriceForZDP5Materials(
          {required final MaterialInfo materialInfo}) =
      _$_FetchPriceForZDP5Materials;

  MaterialInfo get materialInfo;
  @JsonKey(ignore: true)
  _$$_FetchPriceForZDP5MaterialsCopyWith<_$_FetchPriceForZDP5Materials>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPriceState {
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesConfigs =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
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
      _$MaterialPriceStateCopyWithImpl<$Res, MaterialPriceState>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo,
      Map<MaterialNumber, Price> materialPrice,
      bool isFetching});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$MaterialPriceStateCopyWithImpl<$Res, $Val extends MaterialPriceState>
    implements $MaterialPriceStateCopyWith<$Res> {
  _$MaterialPriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
    Object? materialPrice = null,
    Object? isFetching = null,
  }) {
    return _then(_value.copyWith(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialPrice: null == materialPrice
          ? _value.materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialPriceStateCopyWith<$Res>
    implements $MaterialPriceStateCopyWith<$Res> {
  factory _$$_MaterialPriceStateCopyWith(_$_MaterialPriceState value,
          $Res Function(_$_MaterialPriceState) then) =
      __$$_MaterialPriceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo,
      Map<MaterialNumber, Price> materialPrice,
      bool isFetching});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_MaterialPriceStateCopyWithImpl<$Res>
    extends _$MaterialPriceStateCopyWithImpl<$Res, _$_MaterialPriceState>
    implements _$$_MaterialPriceStateCopyWith<$Res> {
  __$$_MaterialPriceStateCopyWithImpl(
      _$_MaterialPriceState _value, $Res Function(_$_MaterialPriceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
    Object? materialPrice = null,
    Object? isFetching = null,
  }) {
    return _then(_$_MaterialPriceState(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialPrice: null == materialPrice
          ? _value._materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialPriceState extends _MaterialPriceState {
  const _$_MaterialPriceState(
      {required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.salesConfigs,
      required this.shipToInfo,
      required final Map<MaterialNumber, Price> materialPrice,
      required this.isFetching})
      : _materialPrice = materialPrice,
        super._();

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final ShipToInfo shipToInfo;
  final Map<MaterialNumber, Price> _materialPrice;
  @override
  Map<MaterialNumber, Price> get materialPrice {
    if (_materialPrice is EqualUnmodifiableMapView) return _materialPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialPrice);
  }

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'MaterialPriceState(customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, salesConfigs: $salesConfigs, shipToInfo: $shipToInfo, materialPrice: $materialPrice, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceState &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            const DeepCollectionEquality()
                .equals(other._materialPrice, _materialPrice) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCodeInfo,
      salesOrganisation,
      salesConfigs,
      shipToInfo,
      const DeepCollectionEquality().hash(_materialPrice),
      isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialPriceStateCopyWith<_$_MaterialPriceState> get copyWith =>
      __$$_MaterialPriceStateCopyWithImpl<_$_MaterialPriceState>(
          this, _$identity);
}

abstract class _MaterialPriceState extends MaterialPriceState {
  const factory _MaterialPriceState(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesConfigs,
      required final ShipToInfo shipToInfo,
      required final Map<MaterialNumber, Price> materialPrice,
      required final bool isFetching}) = _$_MaterialPriceState;
  const _MaterialPriceState._() : super._();

  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesConfigs;
  @override
  ShipToInfo get shipToInfo;
  @override
  Map<MaterialNumber, Price> get materialPrice;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceStateCopyWith<_$_MaterialPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}
