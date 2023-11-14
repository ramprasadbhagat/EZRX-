// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_invoices_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllInvoicesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AllInvoicesFilter appliedFilter) fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CreditAndInvoiceItem> invoices) fetchOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    TResult Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrder value) fetchOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrder value)? fetchOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrder value)? fetchOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllInvoicesEventCopyWith<$Res> {
  factory $AllInvoicesEventCopyWith(
          AllInvoicesEvent value, $Res Function(AllInvoicesEvent) then) =
      _$AllInvoicesEventCopyWithImpl<$Res, AllInvoicesEvent>;
}

/// @nodoc
class _$AllInvoicesEventCopyWithImpl<$Res, $Val extends AllInvoicesEvent>
    implements $AllInvoicesEventCopyWith<$Res> {
  _$AllInvoicesEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_initialized(
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

class _$_initialized implements _initialized {
  const _$_initialized(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'AllInvoicesEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_initialized &&
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
  _$$_initializedCopyWith<_$_initialized> get copyWith =>
      __$$_initializedCopyWithImpl<_$_initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AllInvoicesFilter appliedFilter) fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CreditAndInvoiceItem> invoices) fetchOrder,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    TResult Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrder value) fetchOrder,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrder value)? fetchOrder,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrder value)? fetchOrder,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements AllInvoicesEvent {
  const factory _initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_initialized;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_initializedCopyWith<_$_initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({AllInvoicesFilter appliedFilter});

  $AllInvoicesFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
  }) {
    return _then(_$_Fetch(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AllInvoicesFilterCopyWith<$Res> get appliedFilter {
    return $AllInvoicesFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.appliedFilter});

  @override
  final AllInvoicesFilter appliedFilter;

  @override
  String toString() {
    return 'AllInvoicesEvent.fetch(appliedFilter: $appliedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter);

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
    required TResult Function(AllInvoicesFilter appliedFilter) fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CreditAndInvoiceItem> invoices) fetchOrder,
  }) {
    return fetch(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
  }) {
    return fetch?.call(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    TResult Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrder value) fetchOrder,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrder value)? fetchOrder,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrder value)? fetchOrder,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AllInvoicesEvent {
  const factory _Fetch({required final AllInvoicesFilter appliedFilter}) =
      _$_Fetch;

  AllInvoicesFilter get appliedFilter;
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
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'AllInvoicesEvent.loadMore()';
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
    required TResult Function(AllInvoicesFilter appliedFilter) fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CreditAndInvoiceItem> invoices) fetchOrder,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    TResult Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrder value) fetchOrder,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrder value)? fetchOrder,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrder value)? fetchOrder,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements AllInvoicesEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_FetchOrderCopyWith<$Res> {
  factory _$$_FetchOrderCopyWith(
          _$_FetchOrder value, $Res Function(_$_FetchOrder) then) =
      __$$_FetchOrderCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CreditAndInvoiceItem> invoices});
}

/// @nodoc
class __$$_FetchOrderCopyWithImpl<$Res>
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_FetchOrder>
    implements _$$_FetchOrderCopyWith<$Res> {
  __$$_FetchOrderCopyWithImpl(
      _$_FetchOrder _value, $Res Function(_$_FetchOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
  }) {
    return _then(_$_FetchOrder(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
    ));
  }
}

/// @nodoc

class _$_FetchOrder implements _FetchOrder {
  const _$_FetchOrder({required final List<CreditAndInvoiceItem> invoices})
      : _invoices = invoices;

  final List<CreditAndInvoiceItem> _invoices;
  @override
  List<CreditAndInvoiceItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  String toString() {
    return 'AllInvoicesEvent.fetchOrder(invoices: $invoices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOrder &&
            const DeepCollectionEquality().equals(other._invoices, _invoices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_invoices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOrderCopyWith<_$_FetchOrder> get copyWith =>
      __$$_FetchOrderCopyWithImpl<_$_FetchOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AllInvoicesFilter appliedFilter) fetch,
    required TResult Function() loadMore,
    required TResult Function(List<CreditAndInvoiceItem> invoices) fetchOrder,
  }) {
    return fetchOrder(invoices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
  }) {
    return fetchOrder?.call(invoices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AllInvoicesFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    TResult Function(List<CreditAndInvoiceItem> invoices)? fetchOrder,
    required TResult orElse(),
  }) {
    if (fetchOrder != null) {
      return fetchOrder(invoices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchOrder value) fetchOrder,
  }) {
    return fetchOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchOrder value)? fetchOrder,
  }) {
    return fetchOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchOrder value)? fetchOrder,
    required TResult orElse(),
  }) {
    if (fetchOrder != null) {
      return fetchOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchOrder implements AllInvoicesEvent {
  const factory _FetchOrder(
      {required final List<CreditAndInvoiceItem> invoices}) = _$_FetchOrder;

  List<CreditAndInvoiceItem> get invoices;
  @JsonKey(ignore: true)
  _$$_FetchOrderCopyWith<_$_FetchOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AllInvoicesState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  AllInvoicesFilter get appliedFilter => throw _privateConstructorUsedError;
  List<CreditAndInvoiceItem> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllInvoicesStateCopyWith<AllInvoicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllInvoicesStateCopyWith<$Res> {
  factory $AllInvoicesStateCopyWith(
          AllInvoicesState value, $Res Function(AllInvoicesState) then) =
      _$AllInvoicesStateCopyWithImpl<$Res, AllInvoicesState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      AllInvoicesFilter appliedFilter,
      List<CreditAndInvoiceItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $AllInvoicesFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$AllInvoicesStateCopyWithImpl<$Res, $Val extends AllInvoicesState>
    implements $AllInvoicesStateCopyWith<$Res> {
  _$AllInvoicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
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
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
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
  $AllInvoicesFilterCopyWith<$Res> get appliedFilter {
    return $AllInvoicesFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllInvoicesStateCopyWith<$Res>
    implements $AllInvoicesStateCopyWith<$Res> {
  factory _$$_AllInvoicesStateCopyWith(
          _$_AllInvoicesState value, $Res Function(_$_AllInvoicesState) then) =
      __$$_AllInvoicesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      AllInvoicesFilter appliedFilter,
      List<CreditAndInvoiceItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $AllInvoicesFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_AllInvoicesStateCopyWithImpl<$Res>
    extends _$AllInvoicesStateCopyWithImpl<$Res, _$_AllInvoicesState>
    implements _$$_AllInvoicesStateCopyWith<$Res> {
  __$$_AllInvoicesStateCopyWithImpl(
      _$_AllInvoicesState _value, $Res Function(_$_AllInvoicesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$_AllInvoicesState(
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
              as AllInvoicesFilter,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
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
    ));
  }
}

/// @nodoc

class _$_AllInvoicesState extends _AllInvoicesState {
  const _$_AllInvoicesState(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.appliedFilter,
      required final List<CreditAndInvoiceItem> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore})
      : _items = items,
        super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final AllInvoicesFilter appliedFilter;
  final List<CreditAndInvoiceItem> _items;
  @override
  List<CreditAndInvoiceItem> get items {
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
  String toString() {
    return 'AllInvoicesState(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, appliedFilter: $appliedFilter, items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllInvoicesState &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customerCodeInfo,
      appliedFilter,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllInvoicesStateCopyWith<_$_AllInvoicesState> get copyWith =>
      __$$_AllInvoicesStateCopyWithImpl<_$_AllInvoicesState>(this, _$identity);
}

abstract class _AllInvoicesState extends AllInvoicesState {
  const factory _AllInvoicesState(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final AllInvoicesFilter appliedFilter,
      required final List<CreditAndInvoiceItem> items,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore}) = _$_AllInvoicesState;
  const _AllInvoicesState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  AllInvoicesFilter get appliedFilter;
  @override
  List<CreditAndInvoiceItem> get items;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$_AllInvoicesStateCopyWith<_$_AllInvoicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
