// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_credits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllCreditsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(AllCreditsFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(AllCreditsFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(AllCreditsFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCreditsEventCopyWith<$Res> {
  factory $AllCreditsEventCopyWith(
          AllCreditsEvent value, $Res Function(AllCreditsEvent) then) =
      _$AllCreditsEventCopyWithImpl<$Res, AllCreditsEvent>;
}

/// @nodoc
class _$AllCreditsEventCopyWithImpl<$Res, $Val extends AllCreditsEvent>
    implements $AllCreditsEventCopyWith<$Res> {
  _$AllCreditsEventCopyWithImpl(this._value, this._then);

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
    extends _$AllCreditsEventCopyWithImpl<$Res, _$_initialized>
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
    return 'AllCreditsEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
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
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(AllCreditsFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(AllCreditsFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(AllCreditsFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
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
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
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

abstract class _initialized implements AllCreditsEvent {
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
abstract class _$$_AutoSearchProductCopyWith<$Res> {
  factory _$$_AutoSearchProductCopyWith(_$_AutoSearchProduct value,
          $Res Function(_$_AutoSearchProduct) then) =
      __$$_AutoSearchProductCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$_AutoSearchProductCopyWithImpl<$Res>
    extends _$AllCreditsEventCopyWithImpl<$Res, _$_AutoSearchProduct>
    implements _$$_AutoSearchProductCopyWith<$Res> {
  __$$_AutoSearchProductCopyWithImpl(
      _$_AutoSearchProduct _value, $Res Function(_$_AutoSearchProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_AutoSearchProduct(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_AutoSearchProduct implements _AutoSearchProduct {
  const _$_AutoSearchProduct({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'AllCreditsEvent.autoSearchProduct(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AutoSearchProduct &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
      __$$_AutoSearchProductCopyWithImpl<_$_AutoSearchProduct>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(AllCreditsFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return autoSearchProduct(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(AllCreditsFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return autoSearchProduct?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(AllCreditsFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return autoSearchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return autoSearchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (autoSearchProduct != null) {
      return autoSearchProduct(this);
    }
    return orElse();
  }
}

abstract class _AutoSearchProduct implements AllCreditsEvent {
  const factory _AutoSearchProduct({required final SearchKey searchKey}) =
      _$_AutoSearchProduct;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_AutoSearchProductCopyWith<_$_AutoSearchProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({AllCreditsFilter appliedFilter});

  $AllCreditsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AllCreditsEventCopyWithImpl<$Res, _$_Fetch>
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
              as AllCreditsFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AllCreditsFilterCopyWith<$Res> get appliedFilter {
    return $AllCreditsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.appliedFilter});

  @override
  final AllCreditsFilter appliedFilter;

  @override
  String toString() {
    return 'AllCreditsEvent.fetch(appliedFilter: $appliedFilter)';
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
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(AllCreditsFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return fetch(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(AllCreditsFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(AllCreditsFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
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
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
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

abstract class _Fetch implements AllCreditsEvent {
  const factory _Fetch({required final AllCreditsFilter appliedFilter}) =
      _$_Fetch;

  AllCreditsFilter get appliedFilter;
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
    extends _$AllCreditsEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'AllCreditsEvent.loadMore()';
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
    required TResult Function(SearchKey searchKey) autoSearchProduct,
    required TResult Function(AllCreditsFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(SearchKey searchKey)? autoSearchProduct,
    TResult? Function(AllCreditsFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(SearchKey searchKey)? autoSearchProduct,
    TResult Function(AllCreditsFilter appliedFilter)? fetch,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_AutoSearchProduct value) autoSearchProduct,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_AutoSearchProduct value)? autoSearchProduct,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_AutoSearchProduct value)? autoSearchProduct,
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

abstract class _LoadMore implements AllCreditsEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
mixin _$AllCreditsState {
  AllCreditsFilter get appliedFilter => throw _privateConstructorUsedError;
  List<CreditAndInvoiceItem> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllCreditsStateCopyWith<AllCreditsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllCreditsStateCopyWith<$Res> {
  factory $AllCreditsStateCopyWith(
          AllCreditsState value, $Res Function(AllCreditsState) then) =
      _$AllCreditsStateCopyWithImpl<$Res, AllCreditsState>;
  @useResult
  $Res call(
      {AllCreditsFilter appliedFilter,
      List<CreditAndInvoiceItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $AllCreditsFilterCopyWith<$Res> get appliedFilter;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$AllCreditsStateCopyWithImpl<$Res, $Val extends AllCreditsState>
    implements $AllCreditsStateCopyWith<$Res> {
  _$AllCreditsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_value.copyWith(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AllCreditsFilter,
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
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AllCreditsFilterCopyWith<$Res> get appliedFilter {
    return $AllCreditsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllCreditsStateCopyWith<$Res>
    implements $AllCreditsStateCopyWith<$Res> {
  factory _$$_AllCreditsStateCopyWith(
          _$_AllCreditsState value, $Res Function(_$_AllCreditsState) then) =
      __$$_AllCreditsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AllCreditsFilter appliedFilter,
      List<CreditAndInvoiceItem> items,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  @override
  $AllCreditsFilterCopyWith<$Res> get appliedFilter;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_AllCreditsStateCopyWithImpl<$Res>
    extends _$AllCreditsStateCopyWithImpl<$Res, _$_AllCreditsState>
    implements _$$_AllCreditsStateCopyWith<$Res> {
  __$$_AllCreditsStateCopyWithImpl(
      _$_AllCreditsState _value, $Res Function(_$_AllCreditsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_AllCreditsState(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AllCreditsFilter,
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
}

/// @nodoc

class _$_AllCreditsState extends _AllCreditsState {
  const _$_AllCreditsState(
      {required this.appliedFilter,
      required final List<CreditAndInvoiceItem> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore,
      required this.salesOrganisation,
      required this.customerCodeInfo})
      : _items = items,
        super._();

  @override
  final AllCreditsFilter appliedFilter;
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
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'AllCreditsState(appliedFilter: $appliedFilter, items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllCreditsState &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appliedFilter,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      canLoadMore,
      salesOrganisation,
      customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllCreditsStateCopyWith<_$_AllCreditsState> get copyWith =>
      __$$_AllCreditsStateCopyWithImpl<_$_AllCreditsState>(this, _$identity);
}

abstract class _AllCreditsState extends AllCreditsState {
  const factory _AllCreditsState(
      {required final AllCreditsFilter appliedFilter,
      required final List<CreditAndInvoiceItem> items,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_AllCreditsState;
  const _AllCreditsState._() : super._();

  @override
  AllCreditsFilter get appliedFilter;
  @override
  List<CreditAndInvoiceItem> get items;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_AllCreditsStateCopyWith<_$_AllCreditsState> get copyWith =>
      throw _privateConstructorUsedError;
}
