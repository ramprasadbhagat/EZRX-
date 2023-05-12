// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnPriceEvent {
  SalesOrganisation get salesOrg => throw _privateConstructorUsedError;
  List<ReturnItem> get returnItemList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)
        fetchReturnPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)?
        fetchReturnPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)?
        fetchReturnPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchReturnPrice value) fetchReturnPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchReturnPrice value)? fetchReturnPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchReturnPrice value)? fetchReturnPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnPriceEventCopyWith<ReturnPriceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnPriceEventCopyWith<$Res> {
  factory $ReturnPriceEventCopyWith(
          ReturnPriceEvent value, $Res Function(ReturnPriceEvent) then) =
      _$ReturnPriceEventCopyWithImpl<$Res, ReturnPriceEvent>;
  @useResult
  $Res call({SalesOrganisation salesOrg, List<ReturnItem> returnItemList});

  $SalesOrganisationCopyWith<$Res> get salesOrg;
}

/// @nodoc
class _$ReturnPriceEventCopyWithImpl<$Res, $Val extends ReturnPriceEvent>
    implements $ReturnPriceEventCopyWith<$Res> {
  _$ReturnPriceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? returnItemList = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      returnItemList: null == returnItemList
          ? _value.returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrg, (value) {
      return _then(_value.copyWith(salesOrg: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FetchReturnPriceCopyWith<$Res>
    implements $ReturnPriceEventCopyWith<$Res> {
  factory _$$_FetchReturnPriceCopyWith(
          _$_FetchReturnPrice value, $Res Function(_$_FetchReturnPrice) then) =
      __$$_FetchReturnPriceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrganisation salesOrg, List<ReturnItem> returnItemList});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrg;
}

/// @nodoc
class __$$_FetchReturnPriceCopyWithImpl<$Res>
    extends _$ReturnPriceEventCopyWithImpl<$Res, _$_FetchReturnPrice>
    implements _$$_FetchReturnPriceCopyWith<$Res> {
  __$$_FetchReturnPriceCopyWithImpl(
      _$_FetchReturnPrice _value, $Res Function(_$_FetchReturnPrice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? returnItemList = null,
  }) {
    return _then(_$_FetchReturnPrice(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      returnItemList: null == returnItemList
          ? _value._returnItemList
          : returnItemList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItem>,
    ));
  }
}

/// @nodoc

class _$_FetchReturnPrice implements _FetchReturnPrice {
  const _$_FetchReturnPrice(
      {required this.salesOrg, required final List<ReturnItem> returnItemList})
      : _returnItemList = returnItemList;

  @override
  final SalesOrganisation salesOrg;
  final List<ReturnItem> _returnItemList;
  @override
  List<ReturnItem> get returnItemList {
    if (_returnItemList is EqualUnmodifiableListView) return _returnItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemList);
  }

  @override
  String toString() {
    return 'ReturnPriceEvent.fetchReturnPrice(salesOrg: $salesOrg, returnItemList: $returnItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchReturnPrice &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._returnItemList, _returnItemList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg,
      const DeepCollectionEquality().hash(_returnItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchReturnPriceCopyWith<_$_FetchReturnPrice> get copyWith =>
      __$$_FetchReturnPriceCopyWithImpl<_$_FetchReturnPrice>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)
        fetchReturnPrice,
  }) {
    return fetchReturnPrice(salesOrg, returnItemList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)?
        fetchReturnPrice,
  }) {
    return fetchReturnPrice?.call(salesOrg, returnItemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrg, List<ReturnItem> returnItemList)?
        fetchReturnPrice,
    required TResult orElse(),
  }) {
    if (fetchReturnPrice != null) {
      return fetchReturnPrice(salesOrg, returnItemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchReturnPrice value) fetchReturnPrice,
  }) {
    return fetchReturnPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchReturnPrice value)? fetchReturnPrice,
  }) {
    return fetchReturnPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchReturnPrice value)? fetchReturnPrice,
    required TResult orElse(),
  }) {
    if (fetchReturnPrice != null) {
      return fetchReturnPrice(this);
    }
    return orElse();
  }
}

abstract class _FetchReturnPrice implements ReturnPriceEvent {
  const factory _FetchReturnPrice(
      {required final SalesOrganisation salesOrg,
      required final List<ReturnItem> returnItemList}) = _$_FetchReturnPrice;

  @override
  SalesOrganisation get salesOrg;
  @override
  List<ReturnItem> get returnItemList;
  @override
  @JsonKey(ignore: true)
  _$$_FetchReturnPriceCopyWith<_$_FetchReturnPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnPriceState {
  Map<String, ReturnPrice> get returnPrice =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnPriceStateCopyWith<ReturnPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnPriceStateCopyWith<$Res> {
  factory $ReturnPriceStateCopyWith(
          ReturnPriceState value, $Res Function(ReturnPriceState) then) =
      _$ReturnPriceStateCopyWithImpl<$Res, ReturnPriceState>;
  @useResult
  $Res call(
      {Map<String, ReturnPrice> returnPrice,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$ReturnPriceStateCopyWithImpl<$Res, $Val extends ReturnPriceState>
    implements $ReturnPriceStateCopyWith<$Res> {
  _$ReturnPriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnPrice = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      returnPrice: null == returnPrice
          ? _value.returnPrice
          : returnPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, ReturnPrice>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnPriceStateCopyWith<$Res>
    implements $ReturnPriceStateCopyWith<$Res> {
  factory _$$_ReturnPriceStateCopyWith(
          _$_ReturnPriceState value, $Res Function(_$_ReturnPriceState) then) =
      __$$_ReturnPriceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, ReturnPrice> returnPrice,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_ReturnPriceStateCopyWithImpl<$Res>
    extends _$ReturnPriceStateCopyWithImpl<$Res, _$_ReturnPriceState>
    implements _$$_ReturnPriceStateCopyWith<$Res> {
  __$$_ReturnPriceStateCopyWithImpl(
      _$_ReturnPriceState _value, $Res Function(_$_ReturnPriceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnPrice = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_ReturnPriceState(
      returnPrice: null == returnPrice
          ? _value._returnPrice
          : returnPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, ReturnPrice>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ReturnPriceState extends _ReturnPriceState {
  const _$_ReturnPriceState(
      {required final Map<String, ReturnPrice> returnPrice,
      required this.isFetching,
      required this.failureOrSuccessOption})
      : _returnPrice = returnPrice,
        super._();

  final Map<String, ReturnPrice> _returnPrice;
  @override
  Map<String, ReturnPrice> get returnPrice {
    if (_returnPrice is EqualUnmodifiableMapView) return _returnPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_returnPrice);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ReturnPriceState(returnPrice: $returnPrice, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnPriceState &&
            const DeepCollectionEquality()
                .equals(other._returnPrice, _returnPrice) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_returnPrice),
      isFetching,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnPriceStateCopyWith<_$_ReturnPriceState> get copyWith =>
      __$$_ReturnPriceStateCopyWithImpl<_$_ReturnPriceState>(this, _$identity);
}

abstract class _ReturnPriceState extends ReturnPriceState {
  const factory _ReturnPriceState(
      {required final Map<String, ReturnPrice> returnPrice,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_ReturnPriceState;
  const _ReturnPriceState._() : super._();

  @override
  Map<String, ReturnPrice> get returnPrice;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnPriceStateCopyWith<_$_ReturnPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}
