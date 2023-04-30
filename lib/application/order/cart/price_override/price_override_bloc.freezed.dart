// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_override_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceOverrideEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
    required TResult Function(String newPrice) priceOverrideValueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult? Function(String newPrice)? priceOverrideValueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult Function(String newPrice)? priceOverrideValueChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_PriceOverrideValueChanged value)
        priceOverrideValueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceOverrideEventCopyWith<$Res> {
  factory $PriceOverrideEventCopyWith(
          PriceOverrideEvent value, $Res Function(PriceOverrideEvent) then) =
      _$PriceOverrideEventCopyWithImpl<$Res, PriceOverrideEvent>;
}

/// @nodoc
class _$PriceOverrideEventCopyWithImpl<$Res, $Val extends PriceOverrideEvent>
    implements $PriceOverrideEventCopyWith<$Res> {
  _$PriceOverrideEventCopyWithImpl(this._value, this._then);

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
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'PriceOverrideEvent.initialized()';
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
            PriceAggregate item,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
    required TResult Function(String newPrice) priceOverrideValueChanged,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult? Function(String newPrice)? priceOverrideValueChanged,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult Function(String newPrice)? priceOverrideValueChanged,
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
    required TResult Function(_PriceOverrideValueChanged value)
        priceOverrideValueChanged,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PriceOverrideEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PriceAggregate item,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $PriceAggregateCopyWith<$Res> get item;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_Fetch(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.item,
      required this.salesOrganisation,
      required this.customerCodeInfo});

  @override
  final PriceAggregate item;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PriceOverrideEvent.fetch(item: $item, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, item, salesOrganisation, customerCodeInfo);

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
            PriceAggregate item,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
    required TResult Function(String newPrice) priceOverrideValueChanged,
  }) {
    return fetch(item, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult? Function(String newPrice)? priceOverrideValueChanged,
  }) {
    return fetch?.call(item, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult Function(String newPrice)? priceOverrideValueChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(item, salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_PriceOverrideValueChanged value)
        priceOverrideValueChanged,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PriceOverrideEvent {
  const factory _Fetch(
      {required final PriceAggregate item,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Fetch;

  PriceAggregate get item;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PriceOverrideValueChangedCopyWith<$Res> {
  factory _$$_PriceOverrideValueChangedCopyWith(
          _$_PriceOverrideValueChanged value,
          $Res Function(_$_PriceOverrideValueChanged) then) =
      __$$_PriceOverrideValueChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPrice});
}

/// @nodoc
class __$$_PriceOverrideValueChangedCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$_PriceOverrideValueChanged>
    implements _$$_PriceOverrideValueChangedCopyWith<$Res> {
  __$$_PriceOverrideValueChangedCopyWithImpl(
      _$_PriceOverrideValueChanged _value,
      $Res Function(_$_PriceOverrideValueChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPrice = null,
  }) {
    return _then(_$_PriceOverrideValueChanged(
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PriceOverrideValueChanged implements _PriceOverrideValueChanged {
  const _$_PriceOverrideValueChanged({required this.newPrice});

  @override
  final String newPrice;

  @override
  String toString() {
    return 'PriceOverrideEvent.priceOverrideValueChanged(newPrice: $newPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceOverrideValueChanged &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceOverrideValueChangedCopyWith<_$_PriceOverrideValueChanged>
      get copyWith => __$$_PriceOverrideValueChangedCopyWithImpl<
          _$_PriceOverrideValueChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            PriceAggregate item,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
    required TResult Function(String newPrice) priceOverrideValueChanged,
  }) {
    return priceOverrideValueChanged(newPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult? Function(String newPrice)? priceOverrideValueChanged,
  }) {
    return priceOverrideValueChanged?.call(newPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(PriceAggregate item, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    TResult Function(String newPrice)? priceOverrideValueChanged,
    required TResult orElse(),
  }) {
    if (priceOverrideValueChanged != null) {
      return priceOverrideValueChanged(newPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_PriceOverrideValueChanged value)
        priceOverrideValueChanged,
  }) {
    return priceOverrideValueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
  }) {
    return priceOverrideValueChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_PriceOverrideValueChanged value)?
        priceOverrideValueChanged,
    required TResult orElse(),
  }) {
    if (priceOverrideValueChanged != null) {
      return priceOverrideValueChanged(this);
    }
    return orElse();
  }
}

abstract class _PriceOverrideValueChanged implements PriceOverrideEvent {
  const factory _PriceOverrideValueChanged({required final String newPrice}) =
      _$_PriceOverrideValueChanged;

  String get newPrice;
  @JsonKey(ignore: true)
  _$$_PriceOverrideValueChangedCopyWith<_$_PriceOverrideValueChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceOverrideState {
  List<Price> get cartItemList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  PriceOverrideValue get priceOverrideValue =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceOverrideStateCopyWith<PriceOverrideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceOverrideStateCopyWith<$Res> {
  factory $PriceOverrideStateCopyWith(
          PriceOverrideState value, $Res Function(PriceOverrideState) then) =
      _$PriceOverrideStateCopyWithImpl<$Res, PriceOverrideState>;
  @useResult
  $Res call(
      {List<Price> cartItemList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      PriceOverrideValue priceOverrideValue,
      bool showErrorMessages});
}

/// @nodoc
class _$PriceOverrideStateCopyWithImpl<$Res, $Val extends PriceOverrideState>
    implements $PriceOverrideStateCopyWith<$Res> {
  _$PriceOverrideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? priceOverrideValue = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      cartItemList: null == cartItemList
          ? _value.cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<Price>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverrideValue: null == priceOverrideValue
          ? _value.priceOverrideValue
          : priceOverrideValue // ignore: cast_nullable_to_non_nullable
              as PriceOverrideValue,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceOverrideStateCopyWith<$Res>
    implements $PriceOverrideStateCopyWith<$Res> {
  factory _$$_PriceOverrideStateCopyWith(_$_PriceOverrideState value,
          $Res Function(_$_PriceOverrideState) then) =
      __$$_PriceOverrideStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Price> cartItemList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      PriceOverrideValue priceOverrideValue,
      bool showErrorMessages});
}

/// @nodoc
class __$$_PriceOverrideStateCopyWithImpl<$Res>
    extends _$PriceOverrideStateCopyWithImpl<$Res, _$_PriceOverrideState>
    implements _$$_PriceOverrideStateCopyWith<$Res> {
  __$$_PriceOverrideStateCopyWithImpl(
      _$_PriceOverrideState _value, $Res Function(_$_PriceOverrideState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? priceOverrideValue = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$_PriceOverrideState(
      cartItemList: null == cartItemList
          ? _value._cartItemList
          : cartItemList // ignore: cast_nullable_to_non_nullable
              as List<Price>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverrideValue: null == priceOverrideValue
          ? _value.priceOverrideValue
          : priceOverrideValue // ignore: cast_nullable_to_non_nullable
              as PriceOverrideValue,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PriceOverrideState extends _PriceOverrideState {
  const _$_PriceOverrideState(
      {required final List<Price> cartItemList,
      required this.apiFailureOrSuccessOption,
      required this.isFetching,
      required this.priceOverrideValue,
      required this.showErrorMessages})
      : _cartItemList = cartItemList,
        super._();

  final List<Price> _cartItemList;
  @override
  List<Price> get cartItemList {
    if (_cartItemList is EqualUnmodifiableListView) return _cartItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItemList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final PriceOverrideValue priceOverrideValue;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'PriceOverrideState(cartItemList: $cartItemList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, priceOverrideValue: $priceOverrideValue, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceOverrideState &&
            const DeepCollectionEquality()
                .equals(other._cartItemList, _cartItemList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.priceOverrideValue, priceOverrideValue) ||
                other.priceOverrideValue == priceOverrideValue) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItemList),
      apiFailureOrSuccessOption,
      isFetching,
      priceOverrideValue,
      showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceOverrideStateCopyWith<_$_PriceOverrideState> get copyWith =>
      __$$_PriceOverrideStateCopyWithImpl<_$_PriceOverrideState>(
          this, _$identity);
}

abstract class _PriceOverrideState extends PriceOverrideState {
  const factory _PriceOverrideState(
      {required final List<Price> cartItemList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching,
      required final PriceOverrideValue priceOverrideValue,
      required final bool showErrorMessages}) = _$_PriceOverrideState;
  const _PriceOverrideState._() : super._();

  @override
  List<Price> get cartItemList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  PriceOverrideValue get priceOverrideValue;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$_PriceOverrideStateCopyWith<_$_PriceOverrideState> get copyWith =>
      throw _privateConstructorUsedError;
}
