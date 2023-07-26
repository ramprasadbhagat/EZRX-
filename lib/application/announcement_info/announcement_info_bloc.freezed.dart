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
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(SalesOrg salesOrg) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(SalesOrg salesOrg)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(SalesOrg salesOrg)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoEventCopyWith<AnnouncementInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoEventCopyWith<$Res> {
  factory $AnnouncementInfoEventCopyWith(AnnouncementInfoEvent value,
          $Res Function(AnnouncementInfoEvent) then) =
      _$AnnouncementInfoEventCopyWithImpl<$Res, AnnouncementInfoEvent>;
  @useResult
  $Res call({SalesOrg salesOrg});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res>
    implements $AnnouncementInfoEventCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_Fetch(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.fetch(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(SalesOrg salesOrg) loadMore,
  }) {
    return fetch(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(SalesOrg salesOrg)? loadMore,
  }) {
    return fetch?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(SalesOrg salesOrg)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _Fetch implements AnnouncementInfoEvent {
  const factory _Fetch({required final SalesOrg salesOrg}) = _$_Fetch;

  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res>
    implements $AnnouncementInfoEventCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_LoadMore(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.loadMore(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) fetch,
    required TResult Function(SalesOrg salesOrg) loadMore,
  }) {
    return loadMore(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? fetch,
    TResult? Function(SalesOrg salesOrg)? loadMore,
  }) {
    return loadMore?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? fetch,
    TResult Function(SalesOrg salesOrg)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _LoadMore implements AnnouncementInfoEvent {
  const factory _LoadMore({required final SalesOrg salesOrg}) = _$_LoadMore;

  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementInfoState {
  AnnouncementArticleInfo get announcementInfo =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
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
      {AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

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
    Object? announcementInfo = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
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
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
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
      {AnnouncementArticleInfo announcementInfo,
      bool isLoading,
      bool canLoadMore,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

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
    Object? announcementInfo = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$_AnnouncementInfoState(
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
      {required this.announcementInfo,
      required this.isLoading,
      required this.canLoadMore,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final AnnouncementArticleInfo announcementInfo;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AnnouncementInfoState(announcementInfo: $announcementInfo, isLoading: $isLoading, canLoadMore: $canLoadMore, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfoState &&
            (identical(other.announcementInfo, announcementInfo) ||
                other.announcementInfo == announcementInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, announcementInfo, isLoading,
      canLoadMore, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementInfoStateCopyWith<_$_AnnouncementInfoState> get copyWith =>
      __$$_AnnouncementInfoStateCopyWithImpl<_$_AnnouncementInfoState>(
          this, _$identity);
}

abstract class _AnnouncementInfoState extends AnnouncementInfoState {
  const factory _AnnouncementInfoState(
      {required final AnnouncementArticleInfo announcementInfo,
      required final bool isLoading,
      required final bool canLoadMore,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_AnnouncementInfoState;
  const _AnnouncementInfoState._() : super._();

  @override
  AnnouncementArticleInfo get announcementInfo;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoStateCopyWith<_$_AnnouncementInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
