// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailEventCopyWith(
          ProductDetailEvent value, $Res Function(ProductDetailEvent) then) =
      _$ProductDetailEventCopyWithImpl<$Res, ProductDetailEvent>;
}

/// @nodoc
class _$ProductDetailEventCopyWithImpl<$Res, $Val extends ProductDetailEvent>
    implements $ProductDetailEventCopyWith<$Res> {
  _$ProductDetailEventCopyWithImpl(this._value, this._then);

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
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ProductDetailEvent.initialized()';
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
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
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
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ProductDetailEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Locale locale});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? locale = null,
  }) {
    return _then(_$_Fetch(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
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
  _$_Fetch(
      {required this.materialNumber,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.locale});

  @override
  final MaterialNumber materialNumber;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'ProductDetailEvent.fetch(materialNumber: $materialNumber, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber,
      salesOrganisation, customerCodeInfo, shipToInfo, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return fetch(materialNumber, salesOrganisation, customerCodeInfo,
        shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return fetch?.call(materialNumber, salesOrganisation, customerCodeInfo,
        shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(materialNumber, salesOrganisation, customerCodeInfo,
          shipToInfo, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductDetailEvent {
  factory _Fetch(
      {required final MaterialNumber materialNumber,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Locale locale}) = _$_Fetch;

  MaterialNumber get materialNumber;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  Locale get locale;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchSimilarProductCopyWith<$Res> {
  factory _$$_FetchSimilarProductCopyWith(_$_FetchSimilarProduct value,
          $Res Function(_$_FetchSimilarProduct) then) =
      __$$_FetchSimilarProductCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Locale locale});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchSimilarProductCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_FetchSimilarProduct>
    implements _$$_FetchSimilarProductCopyWith<$Res> {
  __$$_FetchSimilarProductCopyWithImpl(_$_FetchSimilarProduct _value,
      $Res Function(_$_FetchSimilarProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? locale = null,
  }) {
    return _then(_$_FetchSimilarProduct(
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
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
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

class _$_FetchSimilarProduct implements _FetchSimilarProduct {
  _$_FetchSimilarProduct(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.locale});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchSimilarProduct(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchSimilarProduct &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, customerCodeInfo, shipToInfo, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchSimilarProductCopyWith<_$_FetchSimilarProduct> get copyWith =>
      __$$_FetchSimilarProductCopyWithImpl<_$_FetchSimilarProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return fetchSimilarProduct(
        salesOrganisation, customerCodeInfo, shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return fetchSimilarProduct?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchSimilarProduct != null) {
      return fetchSimilarProduct(
          salesOrganisation, customerCodeInfo, shipToInfo, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchSimilarProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchSimilarProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchSimilarProduct != null) {
      return fetchSimilarProduct(this);
    }
    return orElse();
  }
}

abstract class _FetchSimilarProduct implements ProductDetailEvent {
  factory _FetchSimilarProduct(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Locale locale}) = _$_FetchSimilarProduct;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  Locale get locale;
  @JsonKey(ignore: true)
  _$$_FetchSimilarProductCopyWith<_$_FetchSimilarProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchMetaDataCopyWith<$Res> {
  factory _$$_FetchMetaDataCopyWith(
          _$_FetchMetaData value, $Res Function(_$_FetchMetaData) then) =
      __$$_FetchMetaDataCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Locale locale});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchMetaDataCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_FetchMetaData>
    implements _$$_FetchMetaDataCopyWith<$Res> {
  __$$_FetchMetaDataCopyWithImpl(
      _$_FetchMetaData _value, $Res Function(_$_FetchMetaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? locale = null,
  }) {
    return _then(_$_FetchMetaData(
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
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
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

class _$_FetchMetaData implements _FetchMetaData {
  _$_FetchMetaData(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.locale});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchMetaData(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchMetaData &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, customerCodeInfo, shipToInfo, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchMetaDataCopyWith<_$_FetchMetaData> get copyWith =>
      __$$_FetchMetaDataCopyWithImpl<_$_FetchMetaData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return fetchMetaData(
        salesOrganisation, customerCodeInfo, shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return fetchMetaData?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchMetaData != null) {
      return fetchMetaData(
          salesOrganisation, customerCodeInfo, shipToInfo, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchMetaData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchMetaData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchMetaData != null) {
      return fetchMetaData(this);
    }
    return orElse();
  }
}

abstract class _FetchMetaData implements ProductDetailEvent {
  factory _FetchMetaData(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Locale locale}) = _$_FetchMetaData;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  Locale get locale;
  @JsonKey(ignore: true)
  _$$_FetchMetaDataCopyWith<_$_FetchMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchProductImageCopyWith<$Res> {
  factory _$$_FetchProductImageCopyWith(_$_FetchProductImage value,
          $Res Function(_$_FetchProductImage) then) =
      __$$_FetchProductImageCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialNumber> materialNumbers});
}

/// @nodoc
class __$$_FetchProductImageCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_FetchProductImage>
    implements _$$_FetchProductImageCopyWith<$Res> {
  __$$_FetchProductImageCopyWithImpl(
      _$_FetchProductImage _value, $Res Function(_$_FetchProductImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumbers = null,
  }) {
    return _then(_$_FetchProductImage(
      materialNumbers: null == materialNumbers
          ? _value._materialNumbers
          : materialNumbers // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
    ));
  }
}

/// @nodoc

class _$_FetchProductImage implements _FetchProductImage {
  _$_FetchProductImage({required final List<MaterialNumber> materialNumbers})
      : _materialNumbers = materialNumbers;

  final List<MaterialNumber> _materialNumbers;
  @override
  List<MaterialNumber> get materialNumbers {
    if (_materialNumbers is EqualUnmodifiableListView) return _materialNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialNumbers);
  }

  @override
  String toString() {
    return 'ProductDetailEvent.fetchProductImage(materialNumbers: $materialNumbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchProductImage &&
            const DeepCollectionEquality()
                .equals(other._materialNumbers, _materialNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_materialNumbers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchProductImageCopyWith<_$_FetchProductImage> get copyWith =>
      __$$_FetchProductImageCopyWithImpl<_$_FetchProductImage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return fetchProductImage(materialNumbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return fetchProductImage?.call(materialNumbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchProductImage != null) {
      return fetchProductImage(materialNumbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchProductImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchProductImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchProductImage != null) {
      return fetchProductImage(this);
    }
    return orElse();
  }
}

abstract class _FetchProductImage implements ProductDetailEvent {
  factory _FetchProductImage(
          {required final List<MaterialNumber> materialNumbers}) =
      _$_FetchProductImage;

  List<MaterialNumber> get materialNumbers;
  @JsonKey(ignore: true)
  _$$_FetchProductImageCopyWith<_$_FetchProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchStockCopyWith<$Res> {
  factory _$$_FetchStockCopyWith(
          _$_FetchStock value, $Res Function(_$_FetchStock) then) =
      __$$_FetchStockCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Locale locale});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_FetchStockCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_FetchStock>
    implements _$$_FetchStockCopyWith<$Res> {
  __$$_FetchStockCopyWithImpl(
      _$_FetchStock _value, $Res Function(_$_FetchStock) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? locale = null,
  }) {
    return _then(_$_FetchStock(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
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
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
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

class _$_FetchStock implements _FetchStock {
  _$_FetchStock(
      {required this.materialNumber,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.locale});

  @override
  final MaterialNumber materialNumber;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchStock(materialNumber: $materialNumber, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchStock &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber,
      salesOrganisation, customerCodeInfo, shipToInfo, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchStockCopyWith<_$_FetchStock> get copyWith =>
      __$$_FetchStockCopyWithImpl<_$_FetchStock>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return fetchStock(materialNumber, salesOrganisation, customerCodeInfo,
        shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return fetchStock?.call(materialNumber, salesOrganisation, customerCodeInfo,
        shipToInfo, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(materialNumber, salesOrganisation, customerCodeInfo,
          shipToInfo, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(this);
    }
    return orElse();
  }
}

abstract class _FetchStock implements ProductDetailEvent {
  factory _FetchStock(
      {required final MaterialNumber materialNumber,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Locale locale}) = _$_FetchStock;

  MaterialNumber get materialNumber;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  Locale get locale;
  @JsonKey(ignore: true)
  _$$_FetchStockCopyWith<_$_FetchStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeImageCopyWith<$Res> {
  factory _$$_ChangeImageCopyWith(
          _$_ChangeImage value, $Res Function(_$_ChangeImage) then) =
      __$$_ChangeImageCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeImageCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_ChangeImage>
    implements _$$_ChangeImageCopyWith<$Res> {
  __$$_ChangeImageCopyWithImpl(
      _$_ChangeImage _value, $Res Function(_$_ChangeImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeImage(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeImage implements _ChangeImage {
  _$_ChangeImage(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ProductDetailEvent.changeImage(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeImage &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      __$$_ChangeImageCopyWithImpl<_$_ChangeImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return changeImage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return changeImage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements ProductDetailEvent {
  factory _ChangeImage(final int index) = _$_ChangeImage;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeImageCopyWith<_$_ChangeImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddFavouriteCopyWith<$Res> {
  factory _$$_AddFavouriteCopyWith(
          _$_AddFavourite value, $Res Function(_$_AddFavourite) then) =
      __$$_AddFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isForSimilarProduct, MaterialNumber materialNumber});
}

/// @nodoc
class __$$_AddFavouriteCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_AddFavourite>
    implements _$$_AddFavouriteCopyWith<$Res> {
  __$$_AddFavouriteCopyWithImpl(
      _$_AddFavourite _value, $Res Function(_$_AddFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForSimilarProduct = null,
    Object? materialNumber = null,
  }) {
    return _then(_$_AddFavourite(
      isForSimilarProduct: null == isForSimilarProduct
          ? _value.isForSimilarProduct
          : isForSimilarProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_AddFavourite implements _AddFavourite {
  _$_AddFavourite(
      {required this.isForSimilarProduct, required this.materialNumber});

  @override
  final bool isForSimilarProduct;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductDetailEvent.addFavourite(isForSimilarProduct: $isForSimilarProduct, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavourite &&
            (identical(other.isForSimilarProduct, isForSimilarProduct) ||
                other.isForSimilarProduct == isForSimilarProduct) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isForSimilarProduct, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      __$$_AddFavouriteCopyWithImpl<_$_AddFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return addFavourite(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return addFavourite?.call(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(isForSimilarProduct, materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return addFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return addFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(this);
    }
    return orElse();
  }
}

abstract class _AddFavourite implements ProductDetailEvent {
  factory _AddFavourite(
      {required final bool isForSimilarProduct,
      required final MaterialNumber materialNumber}) = _$_AddFavourite;

  bool get isForSimilarProduct;
  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFavouriteCopyWith<$Res> {
  factory _$$_DeleteFavouriteCopyWith(
          _$_DeleteFavourite value, $Res Function(_$_DeleteFavourite) then) =
      __$$_DeleteFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isForSimilarProduct, MaterialNumber materialNumber});
}

/// @nodoc
class __$$_DeleteFavouriteCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$_DeleteFavourite>
    implements _$$_DeleteFavouriteCopyWith<$Res> {
  __$$_DeleteFavouriteCopyWithImpl(
      _$_DeleteFavourite _value, $Res Function(_$_DeleteFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForSimilarProduct = null,
    Object? materialNumber = null,
  }) {
    return _then(_$_DeleteFavourite(
      isForSimilarProduct: null == isForSimilarProduct
          ? _value.isForSimilarProduct
          : isForSimilarProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_DeleteFavourite implements _DeleteFavourite {
  _$_DeleteFavourite(
      {required this.isForSimilarProduct, required this.materialNumber});

  @override
  final bool isForSimilarProduct;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductDetailEvent.deleteFavourite(isForSimilarProduct: $isForSimilarProduct, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFavourite &&
            (identical(other.isForSimilarProduct, isForSimilarProduct) ||
                other.isForSimilarProduct == isForSimilarProduct) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isForSimilarProduct, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      __$$_DeleteFavouriteCopyWithImpl<_$_DeleteFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchSimilarProduct,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchMetaData,
    required TResult Function(List<MaterialNumber> materialNumbers)
        fetchProductImage,
    required TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)
        fetchStock,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
  }) {
    return deleteFavourite(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult? Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult? Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
  }) {
    return deleteFavourite?.call(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchSimilarProduct,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchMetaData,
    TResult Function(List<MaterialNumber> materialNumbers)? fetchProductImage,
    TResult Function(
            MaterialNumber materialNumber,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            Locale locale)?
        fetchStock,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(isForSimilarProduct, materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchProductImage value) fetchProductImage,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return deleteFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchProductImage value)? fetchProductImage,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return deleteFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchProductImage value)? fetchProductImage,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavourite implements ProductDetailEvent {
  factory _DeleteFavourite(
      {required final bool isForSimilarProduct,
      required final MaterialNumber materialNumber}) = _$_DeleteFavourite;

  bool get isForSimilarProduct;
  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailState {
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ProductDetailAggregate get productDetailAggregate =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  int get selectedImageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ProductDetailAggregate productDetailAggregate,
      bool isFetching,
      int selectedImageIndex});

  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSuccessOption = null,
    Object? productDetailAggregate = null,
    Object? isFetching = null,
    Object? selectedImageIndex = null,
  }) {
    return _then(_value.copyWith(
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      productDetailAggregate: null == productDetailAggregate
          ? _value.productDetailAggregate
          : productDetailAggregate // ignore: cast_nullable_to_non_nullable
              as ProductDetailAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate {
    return $ProductDetailAggregateCopyWith<$Res>(_value.productDetailAggregate,
        (value) {
      return _then(_value.copyWith(productDetailAggregate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductDetailStateCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$_ProductDetailStateCopyWith(_$_ProductDetailState value,
          $Res Function(_$_ProductDetailState) then) =
      __$$_ProductDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ProductDetailAggregate productDetailAggregate,
      bool isFetching,
      int selectedImageIndex});

  @override
  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate;
}

/// @nodoc
class __$$_ProductDetailStateCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$_ProductDetailState>
    implements _$$_ProductDetailStateCopyWith<$Res> {
  __$$_ProductDetailStateCopyWithImpl(
      _$_ProductDetailState _value, $Res Function(_$_ProductDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSuccessOption = null,
    Object? productDetailAggregate = null,
    Object? isFetching = null,
    Object? selectedImageIndex = null,
  }) {
    return _then(_$_ProductDetailState(
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      productDetailAggregate: null == productDetailAggregate
          ? _value.productDetailAggregate
          : productDetailAggregate // ignore: cast_nullable_to_non_nullable
              as ProductDetailAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductDetailState extends _ProductDetailState {
  const _$_ProductDetailState(
      {required this.failureOrSuccessOption,
      required this.productDetailAggregate,
      required this.isFetching,
      this.selectedImageIndex = 0})
      : super._();

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ProductDetailAggregate productDetailAggregate;
  @override
  final bool isFetching;
  @override
  @JsonKey()
  final int selectedImageIndex;

  @override
  String toString() {
    return 'ProductDetailState(failureOrSuccessOption: $failureOrSuccessOption, productDetailAggregate: $productDetailAggregate, isFetching: $isFetching, selectedImageIndex: $selectedImageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailState &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.productDetailAggregate, productDetailAggregate) ||
                other.productDetailAggregate == productDetailAggregate) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.selectedImageIndex, selectedImageIndex) ||
                other.selectedImageIndex == selectedImageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrSuccessOption,
      productDetailAggregate, isFetching, selectedImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailStateCopyWith<_$_ProductDetailState> get copyWith =>
      __$$_ProductDetailStateCopyWithImpl<_$_ProductDetailState>(
          this, _$identity);
}

abstract class _ProductDetailState extends ProductDetailState {
  const factory _ProductDetailState(
      {required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption,
      required final ProductDetailAggregate productDetailAggregate,
      required final bool isFetching,
      final int selectedImageIndex}) = _$_ProductDetailState;
  const _ProductDetailState._() : super._();

  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ProductDetailAggregate get productDetailAggregate;
  @override
  bool get isFetching;
  @override
  int get selectedImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailStateCopyWith<_$_ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
