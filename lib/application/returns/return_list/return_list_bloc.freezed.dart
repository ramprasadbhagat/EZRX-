// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        fetchByItems,
    required TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)
        loadMoreFetchByItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchByItems value) fetchByItems,
    required TResult Function(_LoadMoreFetchByItems value) loadMoreFetchByItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchByItems value)? fetchByItems,
    TResult? Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchByItems value)? fetchByItems,
    TResult Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListEventCopyWith<$Res> {
  factory $ReturnListEventCopyWith(
          ReturnListEvent value, $Res Function(ReturnListEvent) then) =
      _$ReturnListEventCopyWithImpl<$Res, ReturnListEvent>;
}

/// @nodoc
class _$ReturnListEventCopyWithImpl<$Res, $Val extends ReturnListEvent>
    implements $ReturnListEventCopyWith<$Res> {
  _$ReturnListEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnListEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ReturnListEvent.initialized()';
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
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        fetchByItems,
    required TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)
        loadMoreFetchByItems,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
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
    required TResult Function(_FetchByItems value) fetchByItems,
    required TResult Function(_LoadMoreFetchByItems value) loadMoreFetchByItems,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchByItems value)? fetchByItems,
    TResult? Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchByItems value)? fetchByItems,
    TResult Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnListEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchByItemsCopyWith<$Res> {
  factory _$$_FetchByItemsCopyWith(
          _$_FetchByItems value, $Res Function(_$_FetchByItems) then) =
      __$$_FetchByItemsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo,
      User user});

  $ShipToInfoCopyWith<$Res> get shipInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_FetchByItemsCopyWithImpl<$Res>
    extends _$ReturnListEventCopyWithImpl<$Res, _$_FetchByItems>
    implements _$$_FetchByItemsCopyWith<$Res> {
  __$$_FetchByItemsCopyWithImpl(
      _$_FetchByItems _value, $Res Function(_$_FetchByItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$_FetchByItems(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value));
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_FetchByItems implements _FetchByItems {
  const _$_FetchByItems(
      {required this.salesOrg,
      required this.shipInfo,
      required this.customerCodeInfo,
      required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'ReturnListEvent.fetchByItems(salesOrg: $salesOrg, shipInfo: $shipInfo, customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchByItems &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, shipInfo, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchByItemsCopyWith<_$_FetchByItems> get copyWith =>
      __$$_FetchByItemsCopyWithImpl<_$_FetchByItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        fetchByItems,
    required TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)
        loadMoreFetchByItems,
  }) {
    return fetchByItems(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
  }) {
    return fetchByItems?.call(salesOrg, shipInfo, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
    required TResult orElse(),
  }) {
    if (fetchByItems != null) {
      return fetchByItems(salesOrg, shipInfo, customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchByItems value) fetchByItems,
    required TResult Function(_LoadMoreFetchByItems value) loadMoreFetchByItems,
  }) {
    return fetchByItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchByItems value)? fetchByItems,
    TResult? Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
  }) {
    return fetchByItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchByItems value)? fetchByItems,
    TResult Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
    required TResult orElse(),
  }) {
    if (fetchByItems != null) {
      return fetchByItems(this);
    }
    return orElse();
  }
}

abstract class _FetchByItems implements ReturnListEvent {
  const factory _FetchByItems(
      {required final SalesOrg salesOrg,
      required final ShipToInfo shipInfo,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$_FetchByItems;

  SalesOrg get salesOrg;
  ShipToInfo get shipInfo;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_FetchByItemsCopyWith<_$_FetchByItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreFetchByItemsCopyWith<$Res> {
  factory _$$_LoadMoreFetchByItemsCopyWith(_$_LoadMoreFetchByItems value,
          $Res Function(_$_LoadMoreFetchByItems) then) =
      __$$_LoadMoreFetchByItemsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      ShipToInfo shipInfo,
      CustomerCodeInfo customerCodeInfo});

  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_LoadMoreFetchByItemsCopyWithImpl<$Res>
    extends _$ReturnListEventCopyWithImpl<$Res, _$_LoadMoreFetchByItems>
    implements _$$_LoadMoreFetchByItemsCopyWith<$Res> {
  __$$_LoadMoreFetchByItemsCopyWithImpl(_$_LoadMoreFetchByItems _value,
      $Res Function(_$_LoadMoreFetchByItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? shipInfo = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_LoadMoreFetchByItems(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value));
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

class _$_LoadMoreFetchByItems implements _LoadMoreFetchByItems {
  const _$_LoadMoreFetchByItems(
      {required this.user,
      required this.salesOrg,
      required this.shipInfo,
      required this.customerCodeInfo});

  @override
  final User user;
  @override
  final SalesOrg salesOrg;
  @override
  final ShipToInfo shipInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'ReturnListEvent.loadMoreFetchByItems(user: $user, salesOrg: $salesOrg, shipInfo: $shipInfo, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreFetchByItems &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, salesOrg, shipInfo, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreFetchByItemsCopyWith<_$_LoadMoreFetchByItems> get copyWith =>
      __$$_LoadMoreFetchByItemsCopyWithImpl<_$_LoadMoreFetchByItems>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)
        fetchByItems,
    required TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)
        loadMoreFetchByItems,
  }) {
    return loadMoreFetchByItems(user, salesOrg, shipInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult? Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
  }) {
    return loadMoreFetchByItems?.call(
        user, salesOrg, shipInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo, User user)?
        fetchByItems,
    TResult Function(User user, SalesOrg salesOrg, ShipToInfo shipInfo,
            CustomerCodeInfo customerCodeInfo)?
        loadMoreFetchByItems,
    required TResult orElse(),
  }) {
    if (loadMoreFetchByItems != null) {
      return loadMoreFetchByItems(user, salesOrg, shipInfo, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchByItems value) fetchByItems,
    required TResult Function(_LoadMoreFetchByItems value) loadMoreFetchByItems,
  }) {
    return loadMoreFetchByItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchByItems value)? fetchByItems,
    TResult? Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
  }) {
    return loadMoreFetchByItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchByItems value)? fetchByItems,
    TResult Function(_LoadMoreFetchByItems value)? loadMoreFetchByItems,
    required TResult orElse(),
  }) {
    if (loadMoreFetchByItems != null) {
      return loadMoreFetchByItems(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreFetchByItems implements ReturnListEvent {
  const factory _LoadMoreFetchByItems(
          {required final User user,
          required final SalesOrg salesOrg,
          required final ShipToInfo shipInfo,
          required final CustomerCodeInfo customerCodeInfo}) =
      _$_LoadMoreFetchByItems;

  User get user;
  SalesOrg get salesOrg;
  ShipToInfo get shipInfo;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_LoadMoreFetchByItemsCopyWith<_$_LoadMoreFetchByItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnListState {
  List<ReturnItemGroup> get returnItemGroupList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isSmallFab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnListStateCopyWith<ReturnListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnListStateCopyWith<$Res> {
  factory $ReturnListStateCopyWith(
          ReturnListState value, $Res Function(ReturnListState) then) =
      _$ReturnListStateCopyWithImpl<$Res, ReturnListState>;
  @useResult
  $Res call(
      {List<ReturnItemGroup> returnItemGroupList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      bool isSmallFab});
}

/// @nodoc
class _$ReturnListStateCopyWithImpl<$Res, $Val extends ReturnListState>
    implements $ReturnListStateCopyWith<$Res> {
  _$ReturnListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnItemGroupList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? isSmallFab = null,
  }) {
    return _then(_value.copyWith(
      returnItemGroupList: null == returnItemGroupList
          ? _value.returnItemGroupList
          : returnItemGroupList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemGroup>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSmallFab: null == isSmallFab
          ? _value.isSmallFab
          : isSmallFab // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnListStateCopyWith<$Res>
    implements $ReturnListStateCopyWith<$Res> {
  factory _$$_ReturnListStateCopyWith(
          _$_ReturnListState value, $Res Function(_$_ReturnListState) then) =
      __$$_ReturnListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReturnItemGroup> returnItemGroupList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isFetching,
      bool canLoadMore,
      bool isSmallFab});
}

/// @nodoc
class __$$_ReturnListStateCopyWithImpl<$Res>
    extends _$ReturnListStateCopyWithImpl<$Res, _$_ReturnListState>
    implements _$$_ReturnListStateCopyWith<$Res> {
  __$$_ReturnListStateCopyWithImpl(
      _$_ReturnListState _value, $Res Function(_$_ReturnListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnItemGroupList = null,
    Object? failureOrSuccessOption = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? isSmallFab = null,
  }) {
    return _then(_$_ReturnListState(
      returnItemGroupList: null == returnItemGroupList
          ? _value._returnItemGroupList
          : returnItemGroupList // ignore: cast_nullable_to_non_nullable
              as List<ReturnItemGroup>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSmallFab: null == isSmallFab
          ? _value.isSmallFab
          : isSmallFab // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReturnListState extends _ReturnListState {
  const _$_ReturnListState(
      {required final List<ReturnItemGroup> returnItemGroupList,
      required this.failureOrSuccessOption,
      required this.isFetching,
      required this.canLoadMore,
      required this.isSmallFab})
      : _returnItemGroupList = returnItemGroupList,
        super._();

  final List<ReturnItemGroup> _returnItemGroupList;
  @override
  List<ReturnItemGroup> get returnItemGroupList {
    if (_returnItemGroupList is EqualUnmodifiableListView)
      return _returnItemGroupList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnItemGroupList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final bool isSmallFab;

  @override
  String toString() {
    return 'ReturnListState(returnItemGroupList: $returnItemGroupList, failureOrSuccessOption: $failureOrSuccessOption, isFetching: $isFetching, canLoadMore: $canLoadMore, isSmallFab: $isSmallFab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnListState &&
            const DeepCollectionEquality()
                .equals(other._returnItemGroupList, _returnItemGroupList) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isSmallFab, isSmallFab) ||
                other.isSmallFab == isSmallFab));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_returnItemGroupList),
      failureOrSuccessOption,
      isFetching,
      canLoadMore,
      isSmallFab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnListStateCopyWith<_$_ReturnListState> get copyWith =>
      __$$_ReturnListStateCopyWithImpl<_$_ReturnListState>(this, _$identity);
}

abstract class _ReturnListState extends ReturnListState {
  const factory _ReturnListState(
      {required final List<ReturnItemGroup> returnItemGroupList,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isFetching,
      required final bool canLoadMore,
      required final bool isSmallFab}) = _$_ReturnListState;
  const _ReturnListState._() : super._();

  @override
  List<ReturnItemGroup> get returnItemGroupList;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  bool get isSmallFab;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnListStateCopyWith<_$_ReturnListState> get copyWith =>
      throw _privateConstructorUsedError;
}
