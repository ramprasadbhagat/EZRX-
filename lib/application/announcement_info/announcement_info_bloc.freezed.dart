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
  int get pageSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, int pageSize) getAnnouncement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, int pageSize)? getAnnouncement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, int pageSize)? getAnnouncement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementInfo value) getAnnouncement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementInfo value)? getAnnouncement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementInfo value)? getAnnouncement,
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
  $Res call({SalesOrg salesOrg, int pageSize});
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
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetAnnouncementInfoCopyWith<$Res>
    implements $AnnouncementInfoEventCopyWith<$Res> {
  factory _$$_GetAnnouncementInfoCopyWith(_$_GetAnnouncementInfo value,
          $Res Function(_$_GetAnnouncementInfo) then) =
      __$$_GetAnnouncementInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg, int pageSize});
}

/// @nodoc
class __$$_GetAnnouncementInfoCopyWithImpl<$Res>
    extends _$AnnouncementInfoEventCopyWithImpl<$Res, _$_GetAnnouncementInfo>
    implements _$$_GetAnnouncementInfoCopyWith<$Res> {
  __$$_GetAnnouncementInfoCopyWithImpl(_$_GetAnnouncementInfo _value,
      $Res Function(_$_GetAnnouncementInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? pageSize = null,
  }) {
    return _then(_$_GetAnnouncementInfo(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetAnnouncementInfo implements _GetAnnouncementInfo {
  const _$_GetAnnouncementInfo(
      {required this.salesOrg, required this.pageSize});

  @override
  final SalesOrg salesOrg;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'AnnouncementInfoEvent.getAnnouncement(salesOrg: $salesOrg, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAnnouncementInfo &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAnnouncementInfoCopyWith<_$_GetAnnouncementInfo> get copyWith =>
      __$$_GetAnnouncementInfoCopyWithImpl<_$_GetAnnouncementInfo>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg, int pageSize) getAnnouncement,
  }) {
    return getAnnouncement(salesOrg, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg, int pageSize)? getAnnouncement,
  }) {
    return getAnnouncement?.call(salesOrg, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg, int pageSize)? getAnnouncement,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement(salesOrg, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAnnouncementInfo value) getAnnouncement,
  }) {
    return getAnnouncement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAnnouncementInfo value)? getAnnouncement,
  }) {
    return getAnnouncement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAnnouncementInfo value)? getAnnouncement,
    required TResult orElse(),
  }) {
    if (getAnnouncement != null) {
      return getAnnouncement(this);
    }
    return orElse();
  }
}

abstract class _GetAnnouncementInfo implements AnnouncementInfoEvent {
  const factory _GetAnnouncementInfo(
      {required final SalesOrg salesOrg,
      required final int pageSize}) = _$_GetAnnouncementInfo;

  @override
  SalesOrg get salesOrg;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_GetAnnouncementInfoCopyWith<_$_GetAnnouncementInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementInfoState {
  AnnouncementArticleInfo get announcementInfo =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

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
  $Res call({AnnouncementArticleInfo announcementInfo, bool isLoading});

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
  $Res call({AnnouncementArticleInfo announcementInfo, bool isLoading});

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
    ));
  }
}

/// @nodoc

class _$_AnnouncementInfoState extends _AnnouncementInfoState {
  const _$_AnnouncementInfoState(
      {required this.announcementInfo, required this.isLoading})
      : super._();

  @override
  final AnnouncementArticleInfo announcementInfo;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'AnnouncementInfoState(announcementInfo: $announcementInfo, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfoState &&
            (identical(other.announcementInfo, announcementInfo) ||
                other.announcementInfo == announcementInfo) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, announcementInfo, isLoading);

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
      required final bool isLoading}) = _$_AnnouncementInfoState;
  const _AnnouncementInfoState._() : super._();

  @override
  AnnouncementArticleInfo get announcementInfo;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoStateCopyWith<_$_AnnouncementInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
