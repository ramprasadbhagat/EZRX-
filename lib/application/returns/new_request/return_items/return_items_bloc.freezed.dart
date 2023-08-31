// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)
        fetch,
    required TResult Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)?
        fetch,
    TResult? Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo, ReturnItemsFilter appliedFilter)?
        fetch,
    TResult Function(ShipToInfo shipToInfo, SalesOrganisation salesOrganisation,
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
abstract class $ReturnItemsEventCopyWith<$Res> {
  factory $ReturnItemsEventCopyWith(
          ReturnItemsEvent value, $Res Function(ReturnItemsEvent) then) =
      _$ReturnItemsEventCopyWithImpl<$Res, ReturnItemsEvent>;
}

/// @nodoc
class _$ReturnItemsEventCopyWithImpl<$Res, $Val extends ReturnItemsEvent>
    implements $ReturnItemsEventCopyWith<$Res> {
  _$ReturnItemsEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$_initialized>
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
    return 'ReturnItemsEvent.initialized()';
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
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)
        fetch,
    required TResult Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
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
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)?
        fetch,
    TResult? Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo, ReturnItemsFilter appliedFilter)?
        fetch,
    TResult Function(ShipToInfo shipToInfo, SalesOrganisation salesOrganisation,
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

abstract class _initialized implements ReturnItemsEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo,
      ReturnItemsFilter appliedFilter});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
    Object? appliedFilter = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter {
    return $ReturnItemsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.shipToInfo,
      required this.customerCodeInfo,
      required this.appliedFilter});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ReturnItemsFilter appliedFilter;

  @override
  String toString() {
    return 'ReturnItemsEvent.fetch(salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo, appliedFilter: $appliedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, shipToInfo,
      customerCodeInfo, appliedFilter);

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
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)
        fetch,
    required TResult Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) {
    return fetch(
        salesOrganisation, shipToInfo, customerCodeInfo, appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)?
        fetch,
    TResult? Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return fetch?.call(
        salesOrganisation, shipToInfo, customerCodeInfo, appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo, ReturnItemsFilter appliedFilter)?
        fetch,
    TResult Function(ShipToInfo shipToInfo, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          salesOrganisation, shipToInfo, customerCodeInfo, appliedFilter);
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

abstract class _Fetch implements ReturnItemsEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final ReturnItemsFilter appliedFilter}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  CustomerCodeInfo get customerCodeInfo;
  ReturnItemsFilter get appliedFilter;
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
      {ShipToInfo shipToInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$ReturnItemsEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_LoadMore(
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore(
      {required this.shipToInfo,
      required this.salesOrganisation,
      required this.customerCodeInfo});

  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'ReturnItemsEvent.loadMore(shipToInfo: $shipToInfo, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, shipToInfo, salesOrganisation, customerCodeInfo);

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
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)
        fetch,
    required TResult Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        loadMore,
  }) {
    return loadMore(shipToInfo, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo,
            ReturnItemsFilter appliedFilter)?
        fetch,
    TResult? Function(
            ShipToInfo shipToInfo,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
  }) {
    return loadMore?.call(shipToInfo, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, ShipToInfo shipToInfo,
            CustomerCodeInfo customerCodeInfo, ReturnItemsFilter appliedFilter)?
        fetch,
    TResult Function(ShipToInfo shipToInfo, SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(shipToInfo, salesOrganisation, customerCodeInfo);
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

abstract class _LoadMore implements ReturnItemsEvent {
  const factory _LoadMore(
      {required final ShipToInfo shipToInfo,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_LoadMore;

  ShipToInfo get shipToInfo;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnItemsState {
  ReturnItemsFilter get appliedFilter => throw _privateConstructorUsedError;
  List<ReturnMaterial> get items => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, ReturnMaterialList>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnItemsStateCopyWith<ReturnItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnItemsStateCopyWith<$Res> {
  factory $ReturnItemsStateCopyWith(
          ReturnItemsState value, $Res Function(ReturnItemsState) then) =
      _$ReturnItemsStateCopyWithImpl<$Res, ReturnItemsState>;
  @useResult
  $Res call(
      {ReturnItemsFilter appliedFilter,
      List<ReturnMaterial> items,
      Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$ReturnItemsStateCopyWithImpl<$Res, $Val extends ReturnItemsState>
    implements $ReturnItemsStateCopyWith<$Res> {
  _$ReturnItemsStateCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ReturnMaterialList>>,
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
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter {
    return $ReturnItemsFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnItemsStateCopyWith<$Res>
    implements $ReturnItemsStateCopyWith<$Res> {
  factory _$$_ReturnItemsStateCopyWith(
          _$_ReturnItemsState value, $Res Function(_$_ReturnItemsState) then) =
      __$$_ReturnItemsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReturnItemsFilter appliedFilter,
      List<ReturnMaterial> items,
      Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore});

  @override
  $ReturnItemsFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$_ReturnItemsStateCopyWithImpl<$Res>
    extends _$ReturnItemsStateCopyWithImpl<$Res, _$_ReturnItemsState>
    implements _$$_ReturnItemsStateCopyWith<$Res> {
  __$$_ReturnItemsStateCopyWithImpl(
      _$_ReturnItemsState _value, $Res Function(_$_ReturnItemsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? items = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$_ReturnItemsState(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as ReturnItemsFilter,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ReturnMaterialList>>,
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

class _$_ReturnItemsState extends _ReturnItemsState {
  const _$_ReturnItemsState(
      {required this.appliedFilter,
      required final List<ReturnMaterial> items,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore})
      : _items = items,
        super._();

  @override
  final ReturnItemsFilter appliedFilter;
  final List<ReturnMaterial> _items;
  @override
  List<ReturnMaterial> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Option<Either<ApiFailure, ReturnMaterialList>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'ReturnItemsState(appliedFilter: $appliedFilter, items: $items, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnItemsState &&
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
      appliedFilter,
      const DeepCollectionEquality().hash(_items),
      failureOrSuccessOption,
      isLoading,
      canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnItemsStateCopyWith<_$_ReturnItemsState> get copyWith =>
      __$$_ReturnItemsStateCopyWithImpl<_$_ReturnItemsState>(this, _$identity);
}

abstract class _ReturnItemsState extends ReturnItemsState {
  const factory _ReturnItemsState(
      {required final ReturnItemsFilter appliedFilter,
      required final List<ReturnMaterial> items,
      required final Option<Either<ApiFailure, ReturnMaterialList>>
          failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore}) = _$_ReturnItemsState;
  const _ReturnItemsState._() : super._();

  @override
  ReturnItemsFilter get appliedFilter;
  @override
  List<ReturnMaterial> get items;
  @override
  Option<Either<ApiFailure, ReturnMaterialList>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnItemsStateCopyWith<_$_ReturnItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}
