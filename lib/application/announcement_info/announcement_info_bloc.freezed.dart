// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(String searchKey) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(String searchKey)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoEventCopyWith<$Res> {
  factory $AnnouncementInfoEventCopyWith(AnnouncementInfoEvent value,
          $Res Function(AnnouncementInfoEvent) then) =
      _$AnnouncementInfoEventCopyWithImpl<$Res, AnnouncementInfoEvent>;
}

/// @nodoc
class _$AnnouncementInfoEventCopyWithImpl<$Res,
        $Val extends AnnouncementInfoEvent>
    implements $AnnouncementInfoEventCopyWith<$Res> {
  _$AnnouncementInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, SalesOrg salesOrg});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
  }) {
    return _then(_$_Initialize(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
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

class _$_Initialize implements _Initialize {
  const _$_Initialize({required this.user, required this.salesOrg});

  @override
  final User user;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.initialize(user: $user, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialize &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      __$$_InitializeCopyWithImpl<_$_Initialize>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return initialize(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return initialize?.call(user, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(user, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AnnouncementInfoEvent {
  const factory _Initialize(
      {required final User user,
      required final SalesOrg salesOrg}) = _$_Initialize;

  User get user;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_InitializeCopyWith<_$_Initialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'AnnouncementInfoEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AnnouncementInfoEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_LoadMore>
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
    return 'AnnouncementInfoEvent.loadMore()';
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
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(String searchKey)? updateSearchKey,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements AnnouncementInfoEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_UpdateSearchKeyCopyWith<$Res> {
  factory _$$_UpdateSearchKeyCopyWith(
          _$_UpdateSearchKey value, $Res Function(_$_UpdateSearchKey) then) =
      __$$_UpdateSearchKeyCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$_UpdateSearchKeyCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_UpdateSearchKey>
    implements _$$_UpdateSearchKeyCopyWith<$Res> {
  __$$_UpdateSearchKeyCopyWithImpl(
      _$_UpdateSearchKey _value, $Res Function(_$_UpdateSearchKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_UpdateSearchKey(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSearchKey implements _UpdateSearchKey {
  const _$_UpdateSearchKey({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSearchKey &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      __$$_UpdateSearchKeyCopyWithImpl<_$_UpdateSearchKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user, SalesOrg salesOrg) initialize,
    required TResult Function() fetch,
    required TResult Function() loadMore,
    required TResult Function(String searchKey) updateSearchKey,
  }) {
    return updateSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user, SalesOrg salesOrg)? initialize,
    TResult? Function()? fetch,
    TResult? Function()? loadMore,
    TResult? Function(String searchKey)? updateSearchKey,
  }) {
    return updateSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user, SalesOrg salesOrg)? initialize,
    TResult Function()? fetch,
    TResult Function()? loadMore,
    TResult Function(String searchKey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchKey implements AnnouncementInfoEvent {
  const factory _UpdateSearchKey({required final String searchKey}) =
      _$_UpdateSearchKey;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementInfoState {
  User get user => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  AnnouncementArticleInfo get announcementInfo =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoStateCopyWith<AnnouncementInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoStateCopyWith<$Res> {
  factory $AnnouncementInfoStateCopyWith(AnnouncementInfoState value,
          $Res Function(AnnouncementInfoState) then) =
      _$AnnouncementInfoStateCopyWithImpl<$Res, AnnouncementInfoState>;
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $UserCopyWith<$Res> get user;
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo;
}

/// @nodoc
class _$AnnouncementInfoStateCopyWithImpl<$Res,
        $Val extends AnnouncementInfoState>
    implements $AnnouncementInfoStateCopyWith<$Res> {
  _$AnnouncementInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? announcementInfo = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      announcementInfo: null == announcementInfo
          ? _value.announcementInfo
          : announcementInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo {
    return $AnnouncementArticleInfoCopyWith<$Res>(_value.announcementInfo,
        (value) {
      return _then(_value.copyWith(announcementInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnnouncementInfoStateCopyWith<$Res>
    implements $AnnouncementInfoStateCopyWith<$Res> {
  factory _$$_AnnouncementInfoStateCopyWith(_$_AnnouncementInfoState value,
          $Res Function(_$_AnnouncementInfoState) then) =
      __$$_AnnouncementInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrg salesOrg,
      AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $AnnouncementArticleInfoCopyWith<$Res> get announcementInfo;
}

/// @nodoc
class __$$_AnnouncementInfoStateCopyWithImpl<$Res>
    extends _$AnnouncementInfoStateCopyWithImpl<$Res, _$_AnnouncementInfoState>
    implements _$$_AnnouncementInfoStateCopyWith<$Res> {
  __$$_AnnouncementInfoStateCopyWithImpl(_$_AnnouncementInfoState _value,
      $Res Function(_$_AnnouncementInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? announcementInfo = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? searchKey = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_AnnouncementInfoState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      announcementInfo: null == announcementInfo
          ? _value.announcementInfo
          : announcementInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AnnouncementInfoState extends _AnnouncementInfoState {
  const _$_AnnouncementInfoState(
      {required this.user,
      required this.salesOrg,
      required this.announcementInfo,
      required this.isLoading,
      required this.canLoadMore,
      required this.searchKey,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final User user;
  @override
  final SalesOrg salesOrg;
  @override
  final AnnouncementArticleInfo announcementInfo;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AnnouncementInfoState(user: $user, salesOrg: $salesOrg, announcementInfo: $announcementInfo, isLoading: $isLoading, canLoadMore: $canLoadMore, searchKey: $searchKey, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfoState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.announcementInfo, announcementInfo) ||
                other.announcementInfo == announcementInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, salesOrg, announcementInfo,
      isLoading, canLoadMore, searchKey, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementInfoStateCopyWith<_$_AnnouncementInfoState> get copyWith =>
      __$$_AnnouncementInfoStateCopyWithImpl<_$_AnnouncementInfoState>(
          this, _$identity);
}

abstract class _AnnouncementInfoState extends AnnouncementInfoState {
  const factory _AnnouncementInfoState(
      {required final User user,
      required final SalesOrg salesOrg,
      required final AnnouncementArticleInfo announcementInfo,
      required final bool isLoading,
      required final bool canLoadMore,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_AnnouncementInfoState;
  const _AnnouncementInfoState._() : super._();

  @override
  User get user;
  @override
  SalesOrg get salesOrg;
  @override
  AnnouncementArticleInfo get announcementInfo;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoStateCopyWith<_$_AnnouncementInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
