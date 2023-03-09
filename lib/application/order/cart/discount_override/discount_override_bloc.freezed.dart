// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discount_override_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscountOverrideEvent {
  Price get price => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)
        fetch,
    required TResult Function(Price price, bool showErrorMessages) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult? Function(Price price, bool showErrorMessages)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult Function(Price price, bool showErrorMessages)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Update value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Update value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountOverrideEventCopyWith<DiscountOverrideEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountOverrideEventCopyWith<$Res> {
  factory $DiscountOverrideEventCopyWith(DiscountOverrideEvent value,
          $Res Function(DiscountOverrideEvent) then) =
      _$DiscountOverrideEventCopyWithImpl<$Res, DiscountOverrideEvent>;
  @useResult
  $Res call({Price price});

  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class _$DiscountOverrideEventCopyWithImpl<$Res,
        $Val extends DiscountOverrideEvent>
    implements $DiscountOverrideEventCopyWith<$Res> {
  _$DiscountOverrideEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res>
    implements $DiscountOverrideEventCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      MaterialInfo material,
      MaterialNumber materialNumber,
      ShipToInfo shipToInfo,
      Price price});

  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $MaterialInfoCopyWith<$Res> get material;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$DiscountOverrideEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? salesOrganisation = null,
    Object? material = null,
    Object? materialNumber = null,
    Object? shipToInfo = null,
    Object? price = null,
  }) {
    return _then(_$_Fetch(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCode, (value) {
      return _then(_value.copyWith(customerCode: value));
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
  $MaterialInfoCopyWith<$Res> get material {
    return $MaterialInfoCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
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
      {required this.customerCode,
      required this.salesOrganisation,
      required this.material,
      required this.materialNumber,
      required this.shipToInfo,
      required this.price});

  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final MaterialInfo material;
  @override
  final MaterialNumber materialNumber;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Price price;

  @override
  String toString() {
    return 'DiscountOverrideEvent.fetch(customerCode: $customerCode, salesOrganisation: $salesOrganisation, material: $material, materialNumber: $materialNumber, shipToInfo: $shipToInfo, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCode, salesOrganisation,
      material, materialNumber, shipToInfo, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)
        fetch,
    required TResult Function(Price price, bool showErrorMessages) update,
  }) {
    return fetch(customerCode, salesOrganisation, material, materialNumber,
        shipToInfo, price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult? Function(Price price, bool showErrorMessages)? update,
  }) {
    return fetch?.call(customerCode, salesOrganisation, material,
        materialNumber, shipToInfo, price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult Function(Price price, bool showErrorMessages)? update,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCode, salesOrganisation, material, materialNumber,
          shipToInfo, price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Update value) update,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Update value)? update,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements DiscountOverrideEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final MaterialInfo material,
      required final MaterialNumber materialNumber,
      required final ShipToInfo shipToInfo,
      required final Price price}) = _$_Fetch;

  CustomerCodeInfo get customerCode;
  SalesOrganisation get salesOrganisation;
  MaterialInfo get material;
  MaterialNumber get materialNumber;
  ShipToInfo get shipToInfo;
  @override
  Price get price;
  @override
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCopyWith<$Res>
    implements $DiscountOverrideEventCopyWith<$Res> {
  factory _$$_UpdateCopyWith(_$_Update value, $Res Function(_$_Update) then) =
      __$$_UpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Price price, bool showErrorMessages});

  @override
  $PriceCopyWith<$Res> get price;
}

/// @nodoc
class __$$_UpdateCopyWithImpl<$Res>
    extends _$DiscountOverrideEventCopyWithImpl<$Res, _$_Update>
    implements _$$_UpdateCopyWith<$Res> {
  __$$_UpdateCopyWithImpl(_$_Update _value, $Res Function(_$_Update) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_Update(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update({required this.price, required this.showErrorMessages});

  @override
  final Price price;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'DiscountOverrideEvent.update(price: $price, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Update &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      __$$_UpdateCopyWithImpl<_$_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)
        fetch,
    required TResult Function(Price price, bool showErrorMessages) update,
  }) {
    return update(price, showErrorMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult? Function(Price price, bool showErrorMessages)? update,
  }) {
    return update?.call(price, showErrorMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            MaterialInfo material,
            MaterialNumber materialNumber,
            ShipToInfo shipToInfo,
            Price price)?
        fetch,
    TResult Function(Price price, bool showErrorMessages)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(price, showErrorMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Update value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Update value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Update value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements DiscountOverrideEvent {
  const factory _Update(
      {required final Price price,
      required final bool showErrorMessages}) = _$_Update;

  @override
  Price get price;
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiscountOverrideState {
  Price get materialPrice => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountOverrideStateCopyWith<DiscountOverrideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountOverrideStateCopyWith<$Res> {
  factory $DiscountOverrideStateCopyWith(DiscountOverrideState value,
          $Res Function(DiscountOverrideState) then) =
      _$DiscountOverrideStateCopyWithImpl<$Res, DiscountOverrideState>;
  @useResult
  $Res call(
      {Price materialPrice,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool showErrorMessages});

  $PriceCopyWith<$Res> get materialPrice;
}

/// @nodoc
class _$DiscountOverrideStateCopyWithImpl<$Res,
        $Val extends DiscountOverrideState>
    implements $DiscountOverrideStateCopyWith<$Res> {
  _$DiscountOverrideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialPrice = null,
    Object? apiFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      materialPrice: null == materialPrice
          ? _value.materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Price,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get materialPrice {
    return $PriceCopyWith<$Res>(_value.materialPrice, (value) {
      return _then(_value.copyWith(materialPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiscountOverrideStateCopyWith<$Res>
    implements $DiscountOverrideStateCopyWith<$Res> {
  factory _$$_DiscountOverrideStateCopyWith(_$_DiscountOverrideState value,
          $Res Function(_$_DiscountOverrideState) then) =
      __$$_DiscountOverrideStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Price materialPrice,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool showErrorMessages});

  @override
  $PriceCopyWith<$Res> get materialPrice;
}

/// @nodoc
class __$$_DiscountOverrideStateCopyWithImpl<$Res>
    extends _$DiscountOverrideStateCopyWithImpl<$Res, _$_DiscountOverrideState>
    implements _$$_DiscountOverrideStateCopyWith<$Res> {
  __$$_DiscountOverrideStateCopyWithImpl(_$_DiscountOverrideState _value,
      $Res Function(_$_DiscountOverrideState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialPrice = null,
    Object? apiFailureOrSuccessOption = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_DiscountOverrideState(
      materialPrice: null == materialPrice
          ? _value.materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Price,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DiscountOverrideState extends _DiscountOverrideState {
  const _$_DiscountOverrideState(
      {required this.materialPrice,
      required this.apiFailureOrSuccessOption,
      required this.showErrorMessages})
      : super._();

  @override
  final Price materialPrice;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'DiscountOverrideState(materialPrice: $materialPrice, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountOverrideState &&
            (identical(other.materialPrice, materialPrice) ||
                other.materialPrice == materialPrice) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, materialPrice, apiFailureOrSuccessOption, showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountOverrideStateCopyWith<_$_DiscountOverrideState> get copyWith =>
      __$$_DiscountOverrideStateCopyWithImpl<_$_DiscountOverrideState>(
          this, _$identity);
}

abstract class _DiscountOverrideState extends DiscountOverrideState {
  const factory _DiscountOverrideState(
      {required final Price materialPrice,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool showErrorMessages}) = _$_DiscountOverrideState;
  const _DiscountOverrideState._() : super._();

  @override
  Price get materialPrice;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountOverrideStateCopyWith<_$_DiscountOverrideState> get copyWith =>
      throw _privateConstructorUsedError;
}
