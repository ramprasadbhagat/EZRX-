// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'return_approver_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnApproverEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User user, ReturnApproverFilter approverReturnFilter)
        fetch,
    required TResult Function(
            User user, ReturnApproverFilter approverReturnFilter)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
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
abstract class $ReturnApproverEventCopyWith<$Res> {
  factory $ReturnApproverEventCopyWith(
          ReturnApproverEvent value, $Res Function(ReturnApproverEvent) then) =
      _$ReturnApproverEventCopyWithImpl<$Res, ReturnApproverEvent>;
}

/// @nodoc
class _$ReturnApproverEventCopyWithImpl<$Res, $Val extends ReturnApproverEvent>
    implements $ReturnApproverEventCopyWith<$Res> {
  _$ReturnApproverEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ReturnApproverEvent.initialized()';
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
            User user, ReturnApproverFilter approverReturnFilter)
        fetch,
    required TResult Function(
            User user, ReturnApproverFilter approverReturnFilter)
        loadMore,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
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

abstract class _Initialized implements ReturnApproverEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, ReturnApproverFilter approverReturnFilter});

  $UserCopyWith<$Res> get user;
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? approverReturnFilter = null,
  }) {
    return _then(_$_Fetch(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      approverReturnFilter: null == approverReturnFilter
          ? _value.approverReturnFilter
          : approverReturnFilter // ignore: cast_nullable_to_non_nullable
              as ReturnApproverFilter,
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
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter {
    return $ReturnApproverFilterCopyWith<$Res>(_value.approverReturnFilter,
        (value) {
      return _then(_value.copyWith(approverReturnFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.user, required this.approverReturnFilter});

  @override
  final User user;
  @override
  final ReturnApproverFilter approverReturnFilter;

  @override
  String toString() {
    return 'ReturnApproverEvent.fetch(user: $user, approverReturnFilter: $approverReturnFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.approverReturnFilter, approverReturnFilter) ||
                other.approverReturnFilter == approverReturnFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, approverReturnFilter);

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
            User user, ReturnApproverFilter approverReturnFilter)
        fetch,
    required TResult Function(
            User user, ReturnApproverFilter approverReturnFilter)
        loadMore,
  }) {
    return fetch(user, approverReturnFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
  }) {
    return fetch?.call(user, approverReturnFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(user, approverReturnFilter);
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

abstract class _Fetch implements ReturnApproverEvent {
  const factory _Fetch(
      {required final User user,
      required final ReturnApproverFilter approverReturnFilter}) = _$_Fetch;

  User get user;
  ReturnApproverFilter get approverReturnFilter;
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
  $Res call({User user, ReturnApproverFilter approverReturnFilter});

  $UserCopyWith<$Res> get user;
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? approverReturnFilter = null,
  }) {
    return _then(_$_LoadMore(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      approverReturnFilter: null == approverReturnFilter
          ? _value.approverReturnFilter
          : approverReturnFilter // ignore: cast_nullable_to_non_nullable
              as ReturnApproverFilter,
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
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter {
    return $ReturnApproverFilterCopyWith<$Res>(_value.approverReturnFilter,
        (value) {
      return _then(_value.copyWith(approverReturnFilter: value));
    });
  }
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore({required this.user, required this.approverReturnFilter});

  @override
  final User user;
  @override
  final ReturnApproverFilter approverReturnFilter;

  @override
  String toString() {
    return 'ReturnApproverEvent.loadMore(user: $user, approverReturnFilter: $approverReturnFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.approverReturnFilter, approverReturnFilter) ||
                other.approverReturnFilter == approverReturnFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, approverReturnFilter);

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
            User user, ReturnApproverFilter approverReturnFilter)
        fetch,
    required TResult Function(
            User user, ReturnApproverFilter approverReturnFilter)
        loadMore,
  }) {
    return loadMore(user, approverReturnFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult? Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
  }) {
    return loadMore?.call(user, approverReturnFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        fetch,
    TResult Function(User user, ReturnApproverFilter approverReturnFilter)?
        loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(user, approverReturnFilter);
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

abstract class _LoadMore implements ReturnApproverEvent {
  const factory _LoadMore(
      {required final User user,
      required final ReturnApproverFilter approverReturnFilter}) = _$_LoadMore;

  User get user;
  ReturnApproverFilter get approverReturnFilter;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnApproverState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<ApproverReturnRequest> get approverReturnRequestList =>
      throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnApproverStateCopyWith<ReturnApproverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnApproverStateCopyWith<$Res> {
  factory $ReturnApproverStateCopyWith(
          ReturnApproverState value, $Res Function(ReturnApproverState) then) =
      _$ReturnApproverStateCopyWithImpl<$Res, ReturnApproverState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ApproverReturnRequest> approverReturnRequestList,
      int nextPageIndex,
      bool canLoadMore});
}

/// @nodoc
class _$ReturnApproverStateCopyWithImpl<$Res, $Val extends ReturnApproverState>
    implements $ReturnApproverStateCopyWith<$Res> {
  _$ReturnApproverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? approverReturnRequestList = null,
    Object? nextPageIndex = null,
    Object? canLoadMore = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      approverReturnRequestList: null == approverReturnRequestList
          ? _value.approverReturnRequestList
          : approverReturnRequestList // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequest>,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnApproverStateCopyWith<$Res>
    implements $ReturnApproverStateCopyWith<$Res> {
  factory _$$_ReturnApproverStateCopyWith(_$_ReturnApproverState value,
          $Res Function(_$_ReturnApproverState) then) =
      __$$_ReturnApproverStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<ApproverReturnRequest> approverReturnRequestList,
      int nextPageIndex,
      bool canLoadMore});
}

/// @nodoc
class __$$_ReturnApproverStateCopyWithImpl<$Res>
    extends _$ReturnApproverStateCopyWithImpl<$Res, _$_ReturnApproverState>
    implements _$$_ReturnApproverStateCopyWith<$Res> {
  __$$_ReturnApproverStateCopyWithImpl(_$_ReturnApproverState _value,
      $Res Function(_$_ReturnApproverState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? approverReturnRequestList = null,
    Object? nextPageIndex = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$_ReturnApproverState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      approverReturnRequestList: null == approverReturnRequestList
          ? _value._approverReturnRequestList
          : approverReturnRequestList // ignore: cast_nullable_to_non_nullable
              as List<ApproverReturnRequest>,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReturnApproverState implements _ReturnApproverState {
  const _$_ReturnApproverState(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required final List<ApproverReturnRequest> approverReturnRequestList,
      required this.nextPageIndex,
      required this.canLoadMore})
      : _approverReturnRequestList = approverReturnRequestList;

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<ApproverReturnRequest> _approverReturnRequestList;
  @override
  List<ApproverReturnRequest> get approverReturnRequestList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverReturnRequestList);
  }

  @override
  final int nextPageIndex;
  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'ReturnApproverState(isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, approverReturnRequestList: $approverReturnRequestList, nextPageIndex: $nextPageIndex, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnApproverState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality().equals(
                other._approverReturnRequestList, _approverReturnRequestList) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_approverReturnRequestList),
      nextPageIndex,
      canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnApproverStateCopyWith<_$_ReturnApproverState> get copyWith =>
      __$$_ReturnApproverStateCopyWithImpl<_$_ReturnApproverState>(
          this, _$identity);
}

abstract class _ReturnApproverState implements ReturnApproverState {
  const factory _ReturnApproverState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<ApproverReturnRequest> approverReturnRequestList,
      required final int nextPageIndex,
      required final bool canLoadMore}) = _$_ReturnApproverState;

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<ApproverReturnRequest> get approverReturnRequestList;
  @override
  int get nextPageIndex;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnApproverStateCopyWith<_$_ReturnApproverState> get copyWith =>
      throw _privateConstructorUsedError;
}
