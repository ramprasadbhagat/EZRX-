// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticlesInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getArticles,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreArticles,
    required TResult Function(String searchKey) setSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getArticles,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult? Function(String searchKey)? setSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getArticles,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult Function(String searchKey)? setSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoEventCopyWith<$Res> {
  factory $ArticlesInfoEventCopyWith(
          ArticlesInfoEvent value, $Res Function(ArticlesInfoEvent) then) =
      _$ArticlesInfoEventCopyWithImpl<$Res, ArticlesInfoEvent>;
}

/// @nodoc
class _$ArticlesInfoEventCopyWithImpl<$Res, $Val extends ArticlesInfoEvent>
    implements $ArticlesInfoEventCopyWith<$Res> {
  _$ArticlesInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetArticlesCopyWith<$Res> {
  factory _$$_GetArticlesCopyWith(
          _$_GetArticles value, $Res Function(_$_GetArticles) then) =
      __$$_GetArticlesCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_GetArticlesCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$_GetArticles>
    implements _$$_GetArticlesCopyWith<$Res> {
  __$$_GetArticlesCopyWithImpl(
      _$_GetArticles _value, $Res Function(_$_GetArticles) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? user = null,
  }) {
    return _then(_$_GetArticles(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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

class _$_GetArticles implements _GetArticles {
  const _$_GetArticles({required this.salesOrg, required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final User user;

  @override
  String toString() {
    return 'ArticlesInfoEvent.getArticles(salesOrg: $salesOrg, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetArticles &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetArticlesCopyWith<_$_GetArticles> get copyWith =>
      __$$_GetArticlesCopyWithImpl<_$_GetArticles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getArticles,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreArticles,
    required TResult Function(String searchKey) setSearchKey,
  }) {
    return getArticles(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getArticles,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult? Function(String searchKey)? setSearchKey,
  }) {
    return getArticles?.call(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getArticles,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult Function(String searchKey)? setSearchKey,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles(salesOrg, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
  }) {
    return getArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
  }) {
    return getArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    required TResult orElse(),
  }) {
    if (getArticles != null) {
      return getArticles(this);
    }
    return orElse();
  }
}

abstract class _GetArticles implements ArticlesInfoEvent {
  const factory _GetArticles(
      {required final SalesOrg salesOrg,
      required final User user}) = _$_GetArticles;

  SalesOrg get salesOrg;
  User get user;
  @JsonKey(ignore: true)
  _$$_GetArticlesCopyWith<_$_GetArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreArticlesCopyWith<$Res> {
  factory _$$_LoadMoreArticlesCopyWith(
          _$_LoadMoreArticles value, $Res Function(_$_LoadMoreArticles) then) =
      __$$_LoadMoreArticlesCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoadMoreArticlesCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$_LoadMoreArticles>
    implements _$$_LoadMoreArticlesCopyWith<$Res> {
  __$$_LoadMoreArticlesCopyWithImpl(
      _$_LoadMoreArticles _value, $Res Function(_$_LoadMoreArticles) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? user = null,
  }) {
    return _then(_$_LoadMoreArticles(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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

class _$_LoadMoreArticles implements _LoadMoreArticles {
  const _$_LoadMoreArticles({required this.salesOrg, required this.user});

  @override
  final SalesOrg salesOrg;
  @override
  final User user;

  @override
  String toString() {
    return 'ArticlesInfoEvent.loadMoreArticles(salesOrg: $salesOrg, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreArticles &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreArticlesCopyWith<_$_LoadMoreArticles> get copyWith =>
      __$$_LoadMoreArticlesCopyWithImpl<_$_LoadMoreArticles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getArticles,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreArticles,
    required TResult Function(String searchKey) setSearchKey,
  }) {
    return loadMoreArticles(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getArticles,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult? Function(String searchKey)? setSearchKey,
  }) {
    return loadMoreArticles?.call(salesOrg, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getArticles,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult Function(String searchKey)? setSearchKey,
    required TResult orElse(),
  }) {
    if (loadMoreArticles != null) {
      return loadMoreArticles(salesOrg, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
  }) {
    return loadMoreArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
  }) {
    return loadMoreArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    required TResult orElse(),
  }) {
    if (loadMoreArticles != null) {
      return loadMoreArticles(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreArticles implements ArticlesInfoEvent {
  const factory _LoadMoreArticles(
      {required final SalesOrg salesOrg,
      required final User user}) = _$_LoadMoreArticles;

  SalesOrg get salesOrg;
  User get user;
  @JsonKey(ignore: true)
  _$$_LoadMoreArticlesCopyWith<_$_LoadMoreArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetSearchKeyCopyWith<$Res> {
  factory _$$_SetSearchKeyCopyWith(
          _$_SetSearchKey value, $Res Function(_$_SetSearchKey) then) =
      __$$_SetSearchKeyCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$_SetSearchKeyCopyWithImpl<$Res>
    extends _$ArticlesInfoEventCopyWithImpl<$Res, _$_SetSearchKey>
    implements _$$_SetSearchKeyCopyWith<$Res> {
  __$$_SetSearchKeyCopyWithImpl(
      _$_SetSearchKey _value, $Res Function(_$_SetSearchKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_SetSearchKey(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetSearchKey implements _SetSearchKey {
  const _$_SetSearchKey({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'ArticlesInfoEvent.setSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetSearchKey &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetSearchKeyCopyWith<_$_SetSearchKey> get copyWith =>
      __$$_SetSearchKeyCopyWithImpl<_$_SetSearchKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, User user) getArticles,
    required TResult Function(SalesOrg salesOrg, User user) loadMoreArticles,
    required TResult Function(String searchKey) setSearchKey,
  }) {
    return setSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, User user)? getArticles,
    TResult? Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult? Function(String searchKey)? setSearchKey,
  }) {
    return setSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, User user)? getArticles,
    TResult Function(SalesOrg salesOrg, User user)? loadMoreArticles,
    TResult Function(String searchKey)? setSearchKey,
    required TResult orElse(),
  }) {
    if (setSearchKey != null) {
      return setSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetArticles value) getArticles,
    required TResult Function(_LoadMoreArticles value) loadMoreArticles,
    required TResult Function(_SetSearchKey value) setSearchKey,
  }) {
    return setSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetArticles value)? getArticles,
    TResult? Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult? Function(_SetSearchKey value)? setSearchKey,
  }) {
    return setSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetArticles value)? getArticles,
    TResult Function(_LoadMoreArticles value)? loadMoreArticles,
    TResult Function(_SetSearchKey value)? setSearchKey,
    required TResult orElse(),
  }) {
    if (setSearchKey != null) {
      return setSearchKey(this);
    }
    return orElse();
  }
}

abstract class _SetSearchKey implements ArticlesInfoEvent {
  const factory _SetSearchKey({required final String searchKey}) =
      _$_SetSearchKey;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$_SetSearchKeyCopyWith<_$_SetSearchKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticlesInfoState {
  AnnouncementArticleInfo get articleInfo => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesInfoStateCopyWith<ArticlesInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoStateCopyWith<$Res> {
  factory $ArticlesInfoStateCopyWith(
          ArticlesInfoState value, $Res Function(ArticlesInfoState) then) =
      _$ArticlesInfoStateCopyWithImpl<$Res, ArticlesInfoState>;
  @useResult
  $Res call(
      {AnnouncementArticleInfo articleInfo,
      bool isFetching,
      bool canLoadMore,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo;
}

/// @nodoc
class _$ArticlesInfoStateCopyWithImpl<$Res, $Val extends ArticlesInfoState>
    implements $ArticlesInfoStateCopyWith<$Res> {
  _$ArticlesInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? searchKey = freezed,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      articleInfo: null == articleInfo
          ? _value.articleInfo
          : articleInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: freezed == searchKey
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
  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo {
    return $AnnouncementArticleInfoCopyWith<$Res>(_value.articleInfo, (value) {
      return _then(_value.copyWith(articleInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArticlesInfoStateCopyWith<$Res>
    implements $ArticlesInfoStateCopyWith<$Res> {
  factory _$$_ArticlesInfoStateCopyWith(_$_ArticlesInfoState value,
          $Res Function(_$_ArticlesInfoState) then) =
      __$$_ArticlesInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnnouncementArticleInfo articleInfo,
      bool isFetching,
      bool canLoadMore,
      SearchKey searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $AnnouncementArticleInfoCopyWith<$Res> get articleInfo;
}

/// @nodoc
class __$$_ArticlesInfoStateCopyWithImpl<$Res>
    extends _$ArticlesInfoStateCopyWithImpl<$Res, _$_ArticlesInfoState>
    implements _$$_ArticlesInfoStateCopyWith<$Res> {
  __$$_ArticlesInfoStateCopyWithImpl(
      _$_ArticlesInfoState _value, $Res Function(_$_ArticlesInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleInfo = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? searchKey = freezed,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_ArticlesInfoState(
      articleInfo: null == articleInfo
          ? _value.articleInfo
          : articleInfo // ignore: cast_nullable_to_non_nullable
              as AnnouncementArticleInfo,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: freezed == searchKey
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

class _$_ArticlesInfoState extends _ArticlesInfoState {
  const _$_ArticlesInfoState(
      {required this.articleInfo,
      required this.isFetching,
      required this.canLoadMore,
      required this.searchKey,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final AnnouncementArticleInfo articleInfo;
  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final SearchKey searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'ArticlesInfoState(articleInfo: $articleInfo, isFetching: $isFetching, canLoadMore: $canLoadMore, searchKey: $searchKey, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticlesInfoState &&
            (identical(other.articleInfo, articleInfo) ||
                other.articleInfo == articleInfo) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other.searchKey, searchKey) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      articleInfo,
      isFetching,
      canLoadMore,
      const DeepCollectionEquality().hash(searchKey),
      apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticlesInfoStateCopyWith<_$_ArticlesInfoState> get copyWith =>
      __$$_ArticlesInfoStateCopyWithImpl<_$_ArticlesInfoState>(
          this, _$identity);
}

abstract class _ArticlesInfoState extends ArticlesInfoState {
  const factory _ArticlesInfoState(
      {required final AnnouncementArticleInfo articleInfo,
      required final bool isFetching,
      required final bool canLoadMore,
      required final SearchKey searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_ArticlesInfoState;
  const _ArticlesInfoState._() : super._();

  @override
  AnnouncementArticleInfo get articleInfo;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  SearchKey get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ArticlesInfoStateCopyWith<_$_ArticlesInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
