// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_approver_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'ReturnApproverEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
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
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, ReturnApproverFilter approverReturnFilter});

  $UserCopyWith<$Res> get user;
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? approverReturnFilter = null,
  }) {
    return _then(_$FetchImpl(
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

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.user, required this.approverReturnFilter});

  @override
  final User user;
  @override
  final ReturnApproverFilter approverReturnFilter;

  @override
  String toString() {
    return 'ReturnApproverEvent.fetch(user: $user, approverReturnFilter: $approverReturnFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.approverReturnFilter, approverReturnFilter) ||
                other.approverReturnFilter == approverReturnFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, approverReturnFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

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
      required final ReturnApproverFilter approverReturnFilter}) = _$FetchImpl;

  User get user;
  ReturnApproverFilter get approverReturnFilter;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, ReturnApproverFilter approverReturnFilter});

  $UserCopyWith<$Res> get user;
  $ReturnApproverFilterCopyWith<$Res> get approverReturnFilter;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$ReturnApproverEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? approverReturnFilter = null,
  }) {
    return _then(_$LoadMoreImpl(
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

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl(
      {required this.user, required this.approverReturnFilter});

  @override
  final User user;
  @override
  final ReturnApproverFilter approverReturnFilter;

  @override
  String toString() {
    return 'ReturnApproverEvent.loadMore(user: $user, approverReturnFilter: $approverReturnFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.approverReturnFilter, approverReturnFilter) ||
                other.approverReturnFilter == approverReturnFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, approverReturnFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

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
          required final ReturnApproverFilter approverReturnFilter}) =
      _$LoadMoreImpl;

  User get user;
  ReturnApproverFilter get approverReturnFilter;
  @JsonKey(ignore: true)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnApproverState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<RequestInformation> get approverReturnRequestList =>
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
      List<RequestInformation> approverReturnRequestList,
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
              as List<RequestInformation>,
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
abstract class _$$ReturnApproverStateImplCopyWith<$Res>
    implements $ReturnApproverStateCopyWith<$Res> {
  factory _$$ReturnApproverStateImplCopyWith(_$ReturnApproverStateImpl value,
          $Res Function(_$ReturnApproverStateImpl) then) =
      __$$ReturnApproverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<RequestInformation> approverReturnRequestList,
      int nextPageIndex,
      bool canLoadMore});
}

/// @nodoc
class __$$ReturnApproverStateImplCopyWithImpl<$Res>
    extends _$ReturnApproverStateCopyWithImpl<$Res, _$ReturnApproverStateImpl>
    implements _$$ReturnApproverStateImplCopyWith<$Res> {
  __$$ReturnApproverStateImplCopyWithImpl(_$ReturnApproverStateImpl _value,
      $Res Function(_$ReturnApproverStateImpl) _then)
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
    return _then(_$ReturnApproverStateImpl(
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
              as List<RequestInformation>,
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

class _$ReturnApproverStateImpl implements _ReturnApproverState {
  const _$ReturnApproverStateImpl(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required final List<RequestInformation> approverReturnRequestList,
      required this.nextPageIndex,
      required this.canLoadMore})
      : _approverReturnRequestList = approverReturnRequestList;

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<RequestInformation> _approverReturnRequestList;
  @override
  List<RequestInformation> get approverReturnRequestList {
    if (_approverReturnRequestList is EqualUnmodifiableListView)
      return _approverReturnRequestList;
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnApproverStateImpl &&
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
  _$$ReturnApproverStateImplCopyWith<_$ReturnApproverStateImpl> get copyWith =>
      __$$ReturnApproverStateImplCopyWithImpl<_$ReturnApproverStateImpl>(
          this, _$identity);
}

abstract class _ReturnApproverState implements ReturnApproverState {
  const factory _ReturnApproverState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<RequestInformation> approverReturnRequestList,
      required final int nextPageIndex,
      required final bool canLoadMore}) = _$ReturnApproverStateImpl;

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<RequestInformation> get approverReturnRequestList;
  @override
  int get nextPageIndex;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$ReturnApproverStateImplCopyWith<_$ReturnApproverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
