// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_invoices_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OutstandingInvoicesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoicesEventCopyWith<$Res> {
  factory $OutstandingInvoicesEventCopyWith(OutstandingInvoicesEvent value,
          $Res Function(OutstandingInvoicesEvent) then) =
      _$OutstandingInvoicesEventCopyWithImpl<$Res, OutstandingInvoicesEvent>;
}

/// @nodoc
class _$OutstandingInvoicesEventCopyWithImpl<$Res,
        $Val extends OutstandingInvoicesEvent>
    implements $OutstandingInvoicesEventCopyWith<$Res> {
  _$OutstandingInvoicesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initializedCopyWith<$Res> {
  factory _$$_initializedCopyWith(
          _$_initialized value, $Res Function(_$_initialized) then) =
      __$$_initializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initialized implements _initialized {
  const _$_initialized();

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _initialized implements OutstandingInvoicesEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      OutstandingInvoiceFilter appliedFilter,
      SearchKey searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
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
  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.appliedFilter,
        (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.appliedFilter,
      required this.searchKey});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final OutstandingInvoiceFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation,
      customerCodeInfo, appliedFilter, searchKey);

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
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) {
    return fetch(salesOrganisation, customerCodeInfo, appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return fetch?.call(
        salesOrganisation, customerCodeInfo, appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          salesOrganisation, customerCodeInfo, appliedFilter, searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _Fetch implements OutstandingInvoicesEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final OutstandingInvoiceFilter appliedFilter,
      required final SearchKey searchKey}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  OutstandingInvoiceFilter get appliedFilter;
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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_LoadMore(
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

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.loadMore(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) {
    return loadMore(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return loadMore?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            OutstandingInvoiceFilter appliedFilter,
            SearchKey searchKey)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _LoadMore implements OutstandingInvoicesEvent {
  const factory _LoadMore(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_LoadMore;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OutstandingInvoicesState {
  List<CustomerOpenItem> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  OutstandingInvoiceFilter get appliedFilter =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutstandingInvoicesStateCopyWith<OutstandingInvoicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoicesStateCopyWith<$Res> {
  factory $OutstandingInvoicesStateCopyWith(OutstandingInvoicesState value,
          $Res Function(OutstandingInvoicesState) then) =
      _$OutstandingInvoicesStateCopyWithImpl<$Res, OutstandingInvoicesState>;
  @useResult
  $Res call(
      {List<CustomerOpenItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      OutstandingInvoiceFilter appliedFilter,
      SearchKey searchKey});

  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$OutstandingInvoicesStateCopyWithImpl<$Res,
        $Val extends OutstandingInvoicesState>
    implements $OutstandingInvoicesStateCopyWith<$Res> {
  _$OutstandingInvoicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.appliedFilter,
        (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OutstandingInvoicesStateCopyWith<$Res>
    implements $OutstandingInvoicesStateCopyWith<$Res> {
  factory _$$_OutstandingInvoicesStateCopyWith(
          _$_OutstandingInvoicesState value,
          $Res Function(_$_OutstandingInvoicesState) then) =
      __$$_OutstandingInvoicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerOpenItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      OutstandingInvoiceFilter appliedFilter,
      SearchKey searchKey});

  @override
  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_OutstandingInvoicesStateCopyWithImpl<$Res>
    extends _$OutstandingInvoicesStateCopyWithImpl<$Res,
        _$_OutstandingInvoicesState>
    implements _$$_OutstandingInvoicesStateCopyWith<$Res> {
  __$$_OutstandingInvoicesStateCopyWithImpl(_$_OutstandingInvoicesState _value,
      $Res Function(_$_OutstandingInvoicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_OutstandingInvoicesState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_OutstandingInvoicesState extends _OutstandingInvoicesState {
  const _$_OutstandingInvoicesState(
      {required final List<CustomerOpenItem> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.searchKey})
      : _items = items,
        super._();

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;
  @override
  final OutstandingInvoiceFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'OutstandingInvoicesState(items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutstandingInvoicesState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      canLoadMore,
      appliedFilter,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutstandingInvoicesStateCopyWith<_$_OutstandingInvoicesState>
      get copyWith => __$$_OutstandingInvoicesStateCopyWithImpl<
          _$_OutstandingInvoicesState>(this, _$identity);
}

abstract class _OutstandingInvoicesState extends OutstandingInvoicesState {
  const factory _OutstandingInvoicesState(
      {required final List<CustomerOpenItem> items,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore,
      required final OutstandingInvoiceFilter appliedFilter,
      required final SearchKey searchKey}) = _$_OutstandingInvoicesState;
  const _OutstandingInvoicesState._() : super._();

  @override
  List<CustomerOpenItem> get items;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  OutstandingInvoiceFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_OutstandingInvoicesStateCopyWith<_$_OutstandingInvoicesState>
      get copyWith => throw _privateConstructorUsedError;
}
