// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(
            PaymentSummaryFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryEventCopyWith<$Res> {
  factory $PaymentSummaryEventCopyWith(
          PaymentSummaryEvent value, $Res Function(PaymentSummaryEvent) then) =
      _$PaymentSummaryEventCopyWithImpl<$Res, PaymentSummaryEvent>;
}

/// @nodoc
class _$PaymentSummaryEventCopyWithImpl<$Res, $Val extends PaymentSummaryEvent>
    implements $PaymentSummaryEventCopyWith<$Res> {
  _$PaymentSummaryEventCopyWithImpl(this._value, this._then);

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
      {CustomerCodeInfo customerCodeInfo, SalesOrganisation salesOrganization});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganization = null,
  }) {
    return _then(_$_Initialized(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.customerCodeInfo, required this.salesOrganization});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganization;

  @override
  String toString() {
    return 'PaymentSummaryEvent.initialized(customerCodeInfo: $customerCodeInfo, salesOrganization: $salesOrganization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, salesOrganization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(
            PaymentSummaryFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return initialized(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(customerCodeInfo, salesOrganization);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentSummaryEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganization}) = _$_Initialized;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganization;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryFilter appliedFilter, SearchKey searchKey});

  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_Fetch(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.appliedFilter, required this.searchKey});

  @override
  final PaymentSummaryFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'PaymentSummaryEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(
            PaymentSummaryFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return fetch(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentSummaryEvent {
  const factory _Fetch(
      {required final PaymentSummaryFilter appliedFilter,
      required final SearchKey searchKey}) = _$_Fetch;

  PaymentSummaryFilter get appliedFilter;
  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'PaymentSummaryEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(
            PaymentSummaryFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements PaymentSummaryEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
mixin _$PaymentSummaryState {
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  List<PaymentSummaryDetails> get details => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  PaymentSummaryFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryStateCopyWith<PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryStateCopyWith<$Res> {
  factory $PaymentSummaryStateCopyWith(
          PaymentSummaryState value, $Res Function(PaymentSummaryState) then) =
      _$PaymentSummaryStateCopyWithImpl<$Res, PaymentSummaryState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      List<PaymentSummaryDetails> details,
      bool isFetching,
      bool canLoadMore,
      PaymentSummaryFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$PaymentSummaryStateCopyWithImpl<$Res, $Val extends PaymentSummaryState>
    implements $PaymentSummaryStateCopyWith<$Res> {
  _$PaymentSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? details = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value) as $Val);
    });
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
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryStateCopyWith<$Res>
    implements $PaymentSummaryStateCopyWith<$Res> {
  factory _$$_PaymentSummaryStateCopyWith(_$_PaymentSummaryState value,
          $Res Function(_$_PaymentSummaryState) then) =
      __$$_PaymentSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      List<PaymentSummaryDetails> details,
      bool isFetching,
      bool canLoadMore,
      PaymentSummaryFilter appliedFilter,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_PaymentSummaryStateCopyWithImpl<$Res>
    extends _$PaymentSummaryStateCopyWithImpl<$Res, _$_PaymentSummaryState>
    implements _$$_PaymentSummaryStateCopyWith<$Res> {
  __$$_PaymentSummaryStateCopyWithImpl(_$_PaymentSummaryState _value,
      $Res Function(_$_PaymentSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? details = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentSummaryState(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryState extends _PaymentSummaryState {
  const _$_PaymentSummaryState(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required final List<PaymentSummaryDetails> details,
      required this.isFetching,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.searchKey,
      required this.failureOrSuccessOption})
      : _details = details,
        super._();

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  final List<PaymentSummaryDetails> _details;
  @override
  List<PaymentSummaryDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final PaymentSummaryFilter appliedFilter;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentSummaryState(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, details: $details, isFetching: $isFetching, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, searchKey: $searchKey, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryState &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganization,
      customerCodeInfo,
      const DeepCollectionEquality().hash(_details),
      isFetching,
      canLoadMore,
      appliedFilter,
      searchKey,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      __$$_PaymentSummaryStateCopyWithImpl<_$_PaymentSummaryState>(
          this, _$identity);
}

abstract class _PaymentSummaryState extends PaymentSummaryState {
  const factory _PaymentSummaryState(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final List<PaymentSummaryDetails> details,
      required final bool isFetching,
      required final bool canLoadMore,
      required final PaymentSummaryFilter appliedFilter,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentSummaryState;
  const _PaymentSummaryState._() : super._();

  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  List<PaymentSummaryDetails> get details;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  PaymentSummaryFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
