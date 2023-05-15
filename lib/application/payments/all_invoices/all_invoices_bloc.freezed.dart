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
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
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
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_initialized>
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
    return 'AllInvoicesEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        loadMore,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
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

abstract class _initialized implements AllInvoicesEvent {
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
      String sortDirection});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? sortDirection = null,
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
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.sortDirection});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final String sortDirection;

  @override
  String toString() {
    return 'AllInvoicesEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, sortDirection: $sortDirection)';
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
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, customerCodeInfo, sortDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        loadMore,
  }) {
    return fetch(salesOrganisation, customerCodeInfo, sortDirection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
  }) {
    return fetch?.call(salesOrganisation, customerCodeInfo, sortDirection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customerCodeInfo, sortDirection);
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

abstract class _Fetch implements AllInvoicesEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final String sortDirection}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  String get sortDirection;
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
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      String sortDirection});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$AllInvoicesEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? sortDirection = null,
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
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.sortDirection});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final String sortDirection;

  @override
  String toString() {
    return 'AllInvoicesEvent.loadMore(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, sortDirection: $sortDirection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, customerCodeInfo, sortDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)
        loadMore,
  }) {
    return loadMore(salesOrganisation, customerCodeInfo, sortDirection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
  }) {
    return loadMore?.call(salesOrganisation, customerCodeInfo, sortDirection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String sortDirection)?
        loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(salesOrganisation, customerCodeInfo, sortDirection);
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

abstract class _LoadMore implements AllInvoicesEvent {
  const factory _LoadMore(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final String sortDirection}) = _$_LoadMore;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  String get sortDirection;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AllInvoicesState {
  List<InvoiceItem> get invoices => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  String get sortDirection => throw _privateConstructorUsedError;
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
      {List<InvoiceItem> invoices,
      int totalCount,
      String sortDirection,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});
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
    Object? invoices = null,
    Object? totalCount = null,
    Object? sortDirection = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_value.copyWith(
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
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
      {List<InvoiceItem> invoices,
      int totalCount,
      String sortDirection,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});
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
    Object? invoices = null,
    Object? totalCount = null,
    Object? sortDirection = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$_AllInvoicesState(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<InvoiceItem>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      sortDirection: null == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_AllInvoicesState implements _AllInvoicesState {
  const _$_AllInvoicesState(
      {required final List<InvoiceItem> invoices,
      required this.totalCount,
      required this.sortDirection,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore})
      : _invoices = invoices;

  final List<InvoiceItem> _invoices;
  @override
  List<InvoiceItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  final int totalCount;
  @override
  final String sortDirection;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'AllInvoicesState(invoices: $invoices, totalCount: $totalCount, sortDirection: $sortDirection, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllInvoicesState &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
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
      const DeepCollectionEquality().hash(_invoices),
      totalCount,
      sortDirection,
      failureOrSuccessOption,
      isLoading,
      canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllInvoicesStateCopyWith<_$_AllInvoicesState> get copyWith =>
      __$$_AllInvoicesStateCopyWithImpl<_$_AllInvoicesState>(this, _$identity);
}

abstract class _AllInvoicesState implements AllInvoicesState {
  const factory _AllInvoicesState(
      {required final List<InvoiceItem> invoices,
      required final int totalCount,
      required final String sortDirection,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore}) = _$_AllInvoicesState;

  @override
  List<InvoiceItem> get invoices;
  @override
  int get totalCount;
  @override
  String get sortDirection;
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
