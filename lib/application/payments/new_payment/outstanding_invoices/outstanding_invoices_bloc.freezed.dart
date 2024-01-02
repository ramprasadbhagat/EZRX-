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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CustomerOpenItem> invoices)
        fetchOrderForInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrderForInvoices value)
        fetchOrderForInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
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
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_Initialized(
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

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
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
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CustomerOpenItem> invoices)
        fetchOrderForInvoices,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrderForInvoices value)
        fetchOrderForInvoices,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OutstandingInvoicesEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Initialized;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({OutstandingInvoiceFilter appliedFilter, SearchKey searchKey});

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
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$_Fetch(
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
  $OutstandingInvoiceFilterCopyWith<$Res> get appliedFilter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.appliedFilter,
        (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.appliedFilter, required this.searchKey});

  @override
  final OutstandingInvoiceFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey)';
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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CustomerOpenItem> invoices)
        fetchOrderForInvoices,
  }) {
    return fetch(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
  }) {
    return fetch?.call(appliedFilter, searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
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
    required TResult Function(_FetchOrderForInvoices value)
        fetchOrderForInvoices,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
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
      {required final OutstandingInvoiceFilter appliedFilter,
      required final SearchKey searchKey}) = _$_Fetch;

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
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'OutstandingInvoicesEvent.loadMore()';
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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CustomerOpenItem> invoices)
        fetchOrderForInvoices,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
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
    required TResult Function(_FetchOrderForInvoices value)
        fetchOrderForInvoices,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements OutstandingInvoicesEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_FetchOrderForInvoicesCopyWith<$Res> {
  factory _$$_FetchOrderForInvoicesCopyWith(_$_FetchOrderForInvoices value,
          $Res Function(_$_FetchOrderForInvoices) then) =
      __$$_FetchOrderForInvoicesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerOpenItem> invoices});
}

/// @nodoc
class __$$_FetchOrderForInvoicesCopyWithImpl<$Res>
    extends _$OutstandingInvoicesEventCopyWithImpl<$Res,
        _$_FetchOrderForInvoices>
    implements _$$_FetchOrderForInvoicesCopyWith<$Res> {
  __$$_FetchOrderForInvoicesCopyWithImpl(_$_FetchOrderForInvoices _value,
      $Res Function(_$_FetchOrderForInvoices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
  }) {
    return _then(_$_FetchOrderForInvoices(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
    ));
  }
}

/// @nodoc

class _$_FetchOrderForInvoices implements _FetchOrderForInvoices {
  const _$_FetchOrderForInvoices(
      {required final List<CustomerOpenItem> invoices})
      : _invoices = invoices;

  final List<CustomerOpenItem> _invoices;
  @override
  List<CustomerOpenItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  String toString() {
    return 'OutstandingInvoicesEvent.fetchOrderForInvoices(invoices: $invoices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOrderForInvoices &&
            const DeepCollectionEquality().equals(other._invoices, _invoices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_invoices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOrderForInvoicesCopyWith<_$_FetchOrderForInvoices> get copyWith =>
      __$$_FetchOrderForInvoicesCopyWithImpl<_$_FetchOrderForInvoices>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)
        fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CustomerOpenItem> invoices)
        fetchOrderForInvoices,
  }) {
    return fetchOrderForInvoices(invoices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
  }) {
    return fetchOrderForInvoices?.call(invoices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            OutstandingInvoiceFilter appliedFilter, SearchKey searchKey)?
        fetch,
    TResult Function()? loadMore,
    TResult Function(List<CustomerOpenItem> invoices)? fetchOrderForInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrderForInvoices != null) {
      return fetchOrderForInvoices(invoices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrderForInvoices value)
        fetchOrderForInvoices,
  }) {
    return fetchOrderForInvoices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
  }) {
    return fetchOrderForInvoices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrderForInvoices value)? fetchOrderForInvoices,
    required TResult orElse(),
  }) {
    if (fetchOrderForInvoices != null) {
      return fetchOrderForInvoices(this);
    }
    return orElse();
  }
}

abstract class _FetchOrderForInvoices implements OutstandingInvoicesEvent {
  const factory _FetchOrderForInvoices(
          {required final List<CustomerOpenItem> invoices}) =
      _$_FetchOrderForInvoices;

  List<CustomerOpenItem> get invoices;
  @JsonKey(ignore: true)
  _$$_FetchOrderForInvoicesCopyWith<_$_FetchOrderForInvoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OutstandingInvoicesState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  List<CustomerOpenItem> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOrderFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  OutstandingInvoiceFilter get appliedFilter =>
      throw _privateConstructorUsedError;
  List<String> get orderFetchingInvoiceIdList =>
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
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      List<CustomerOpenItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool isOrderFetching,
      bool canLoadMore,
      OutstandingInvoiceFilter appliedFilter,
      List<String> orderFetchingInvoiceIdList,
      SearchKey searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? isOrderFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? orderFetchingInvoiceIdList = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
      isOrderFetching: null == isOrderFetching
          ? _value.isOrderFetching
          : isOrderFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      orderFetchingInvoiceIdList: null == orderFetchingInvoiceIdList
          ? _value.orderFetchingInvoiceIdList
          : orderFetchingInvoiceIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
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
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      List<CustomerOpenItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool isOrderFetching,
      bool canLoadMore,
      OutstandingInvoiceFilter appliedFilter,
      List<String> orderFetchingInvoiceIdList,
      SearchKey searchKey});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? isOrderFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? orderFetchingInvoiceIdList = null,
    Object? searchKey = null,
  }) {
    return _then(_$_OutstandingInvoicesState(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
      isOrderFetching: null == isOrderFetching
          ? _value.isOrderFetching
          : isOrderFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      orderFetchingInvoiceIdList: null == orderFetchingInvoiceIdList
          ? _value._orderFetchingInvoiceIdList
          : orderFetchingInvoiceIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required final List<CustomerOpenItem> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.isOrderFetching,
      required this.canLoadMore,
      required this.appliedFilter,
      required final List<String> orderFetchingInvoiceIdList,
      required this.searchKey})
      : _items = items,
        _orderFetchingInvoiceIdList = orderFetchingInvoiceIdList,
        super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
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
  final bool isOrderFetching;
  @override
  final bool canLoadMore;
  @override
  final OutstandingInvoiceFilter appliedFilter;
  final List<String> _orderFetchingInvoiceIdList;
  @override
  List<String> get orderFetchingInvoiceIdList {
    if (_orderFetchingInvoiceIdList is EqualUnmodifiableListView)
      return _orderFetchingInvoiceIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderFetchingInvoiceIdList);
  }

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'OutstandingInvoicesState(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, isOrderFetching: $isOrderFetching, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, orderFetchingInvoiceIdList: $orderFetchingInvoiceIdList, searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutstandingInvoicesState &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOrderFetching, isOrderFetching) ||
                other.isOrderFetching == isOrderFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            const DeepCollectionEquality().equals(
                other._orderFetchingInvoiceIdList,
                _orderFetchingInvoiceIdList) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customerCodeInfo,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      isOrderFetching,
      canLoadMore,
      appliedFilter,
      const DeepCollectionEquality().hash(_orderFetchingInvoiceIdList),
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
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final List<CustomerOpenItem> items,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool isOrderFetching,
      required final bool canLoadMore,
      required final OutstandingInvoiceFilter appliedFilter,
      required final List<String> orderFetchingInvoiceIdList,
      required final SearchKey searchKey}) = _$_OutstandingInvoicesState;
  const _OutstandingInvoicesState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  List<CustomerOpenItem> get items;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get isOrderFetching;
  @override
  bool get canLoadMore;
  @override
  OutstandingInvoiceFilter get appliedFilter;
  @override
  List<String> get orderFetchingInvoiceIdList;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$_OutstandingInvoicesStateCopyWith<_$_OutstandingInvoicesState>
      get copyWith => throw _privateConstructorUsedError;
}
