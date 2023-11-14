// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_article_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncementArticleInfoDto _$AnnouncementArticleInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementArticleInfoDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementArticleInfoDto {
  @JsonKey(name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
  String get endCursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementArticleInfoDtoCopyWith<AnnouncementArticleInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleInfoDtoCopyWith<$Res> {
  factory $AnnouncementArticleInfoDtoCopyWith(AnnouncementArticleInfoDto value,
          $Res Function(AnnouncementArticleInfoDto) then) =
      _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
          AnnouncementArticleInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
      String endCursor,
      @JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      List<AnnouncementArticleItemDto> announcementList});
}

/// @nodoc
class _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleInfoDto>
    implements $AnnouncementArticleInfoDtoCopyWith<$Res> {
  _$AnnouncementArticleInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementArticleInfoDtoCopyWith<$Res>
    implements $AnnouncementArticleInfoDtoCopyWith<$Res> {
  factory _$$_AnnouncementArticleInfoDtoCopyWith(
          _$_AnnouncementArticleInfoDto value,
          $Res Function(_$_AnnouncementArticleInfoDto) then) =
      __$$_AnnouncementArticleInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
      String endCursor,
      @JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      List<AnnouncementArticleItemDto> announcementList});
}

/// @nodoc
class __$$_AnnouncementArticleInfoDtoCopyWithImpl<$Res>
    extends _$AnnouncementArticleInfoDtoCopyWithImpl<$Res,
        _$_AnnouncementArticleInfoDto>
    implements _$$_AnnouncementArticleInfoDtoCopyWith<$Res> {
  __$$_AnnouncementArticleInfoDtoCopyWithImpl(
      _$_AnnouncementArticleInfoDto _value,
      $Res Function(_$_AnnouncementArticleInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_$_AnnouncementArticleInfoDto(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncementArticleInfoDto extends _AnnouncementArticleInfoDto {
  const _$_AnnouncementArticleInfoDto(
      {@JsonKey(
          name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
      required this.endCursor,
      @JsonKey(name: 'total', defaultValue: 0) required this.total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
      required final List<AnnouncementArticleItemDto> announcementList})
      : _announcementList = announcementList,
        super._();

  factory _$_AnnouncementArticleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementArticleInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
  final String endCursor;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;
  final List<AnnouncementArticleItemDto> _announcementList;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementArticleInfoDto(endCursor: $endCursor, total: $total, announcementList: $announcementList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementArticleInfoDto &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endCursor, total,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementArticleInfoDtoCopyWith<_$_AnnouncementArticleInfoDto>
      get copyWith => __$$_AnnouncementArticleInfoDtoCopyWithImpl<
          _$_AnnouncementArticleInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementArticleInfoDtoToJson(
      this,
    );
  }
}

abstract class _AnnouncementArticleInfoDto extends AnnouncementArticleInfoDto {
  const factory _AnnouncementArticleInfoDto(
          {@JsonKey(
              name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
          required final String endCursor,
          @JsonKey(name: 'total', defaultValue: 0) required final int total,
          @JsonKey(
              name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
          required final List<AnnouncementArticleItemDto> announcementList}) =
      _$_AnnouncementArticleInfoDto;
  const _AnnouncementArticleInfoDto._() : super._();

  factory _AnnouncementArticleInfoDto.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementArticleInfoDto.fromJson;

  @override
  @JsonKey(name: 'pageInfo', defaultValue: '', readValue: getEndCursorValue)
  String get endCursor;
  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
  List<AnnouncementArticleItemDto> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementArticleInfoDtoCopyWith<_$_AnnouncementArticleInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}

AnnouncementArticleItemDto _$AnnouncementArticleItemDtoFromJson(
    Map<String, dynamic> json) {
  return _AnnouncementArticleItemDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementArticleItemDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', readValue: getValue)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', readValue: getValue)
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail', readValue: getSrcValue)
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'content', readValue: getContent)
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  String get publishedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch', readValue: getBranchNames)
  List<BranchAndIc4InfoDto> get branchInfo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'iC4', readValue: getIC4Names)
  List<BranchAndIc4InfoDto> get iC4Info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementArticleItemDtoCopyWith<AnnouncementArticleItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleItemDtoCopyWith<$Res> {
  factory $AnnouncementArticleItemDtoCopyWith(AnnouncementArticleItemDto value,
          $Res Function(AnnouncementArticleItemDto) then) =
      _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
          AnnouncementArticleItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'title', readValue: getValue) String title,
      @JsonKey(name: 'summary', readValue: getValue) String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue) String thumbnail,
      @JsonKey(name: 'content', readValue: getContent) String content,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
      String publishedDate,
      @JsonKey(name: 'branch', readValue: getBranchNames)
      List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: getIC4Names)
      List<BranchAndIc4InfoDto> iC4Info});
}

/// @nodoc
class _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleItemDto>
    implements $AnnouncementArticleItemDtoCopyWith<$Res> {
  _$AnnouncementArticleItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? branchInfo = null,
    Object? iC4Info = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      branchInfo: null == branchInfo
          ? _value.branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      iC4Info: null == iC4Info
          ? _value.iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementArticleItemDtoCopyWith<$Res>
    implements $AnnouncementArticleItemDtoCopyWith<$Res> {
  factory _$$_AnnouncementArticleItemDtoCopyWith(
          _$_AnnouncementArticleItemDto value,
          $Res Function(_$_AnnouncementArticleItemDto) then) =
      __$$_AnnouncementArticleItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'title', readValue: getValue) String title,
      @JsonKey(name: 'summary', readValue: getValue) String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue) String thumbnail,
      @JsonKey(name: 'content', readValue: getContent) String content,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
      String publishedDate,
      @JsonKey(name: 'branch', readValue: getBranchNames)
      List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: getIC4Names)
      List<BranchAndIc4InfoDto> iC4Info});
}

/// @nodoc
class __$$_AnnouncementArticleItemDtoCopyWithImpl<$Res>
    extends _$AnnouncementArticleItemDtoCopyWithImpl<$Res,
        _$_AnnouncementArticleItemDto>
    implements _$$_AnnouncementArticleItemDtoCopyWith<$Res> {
  __$$_AnnouncementArticleItemDtoCopyWithImpl(
      _$_AnnouncementArticleItemDto _value,
      $Res Function(_$_AnnouncementArticleItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? content = null,
    Object? publishedDate = null,
    Object? branchInfo = null,
    Object? iC4Info = null,
  }) {
    return _then(_$_AnnouncementArticleItemDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      branchInfo: null == branchInfo
          ? _value._branchInfo
          : branchInfo // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
      iC4Info: null == iC4Info
          ? _value._iC4Info
          : iC4Info // ignore: cast_nullable_to_non_nullable
              as List<BranchAndIc4InfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncementArticleItemDto extends _AnnouncementArticleItemDto {
  const _$_AnnouncementArticleItemDto(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'title', readValue: getValue) required this.title,
      @JsonKey(name: 'summary', readValue: getValue) required this.summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
      required this.thumbnail,
      @JsonKey(name: 'content', readValue: getContent) required this.content,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
      required this.publishedDate,
      @JsonKey(name: 'branch', readValue: getBranchNames)
      required final List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: getIC4Names)
      required final List<BranchAndIc4InfoDto> iC4Info})
      : _branchInfo = branchInfo,
        _iC4Info = iC4Info,
        super._();

  factory _$_AnnouncementArticleItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementArticleItemDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'title', readValue: getValue)
  final String title;
  @override
  @JsonKey(name: 'summary', readValue: getValue)
  final String summary;
  @override
  @JsonKey(name: 'thumbnail', readValue: getSrcValue)
  final String thumbnail;
  @override
  @JsonKey(name: 'content', readValue: getContent)
  final String content;
  @override
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  final String publishedDate;
  final List<BranchAndIc4InfoDto> _branchInfo;
  @override
  @JsonKey(name: 'branch', readValue: getBranchNames)
  List<BranchAndIc4InfoDto> get branchInfo {
    if (_branchInfo is EqualUnmodifiableListView) return _branchInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchInfo);
  }

  final List<BranchAndIc4InfoDto> _iC4Info;
  @override
  @JsonKey(name: 'iC4', readValue: getIC4Names)
  List<BranchAndIc4InfoDto> get iC4Info {
    if (_iC4Info is EqualUnmodifiableListView) return _iC4Info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_iC4Info);
  }

  @override
  String toString() {
    return 'AnnouncementArticleItemDto(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, content: $content, publishedDate: $publishedDate, branchInfo: $branchInfo, iC4Info: $iC4Info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementArticleItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            const DeepCollectionEquality()
                .equals(other._branchInfo, _branchInfo) &&
            const DeepCollectionEquality().equals(other._iC4Info, _iC4Info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      summary,
      thumbnail,
      content,
      publishedDate,
      const DeepCollectionEquality().hash(_branchInfo),
      const DeepCollectionEquality().hash(_iC4Info));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementArticleItemDtoCopyWith<_$_AnnouncementArticleItemDto>
      get copyWith => __$$_AnnouncementArticleItemDtoCopyWithImpl<
          _$_AnnouncementArticleItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementArticleItemDtoToJson(
      this,
    );
  }
}

abstract class _AnnouncementArticleItemDto extends AnnouncementArticleItemDto {
  const factory _AnnouncementArticleItemDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'title', readValue: getValue) required final String title,
      @JsonKey(name: 'summary', readValue: getValue)
      required final String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
      required final String thumbnail,
      @JsonKey(name: 'content', readValue: getContent)
      required final String content,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
      required final String publishedDate,
      @JsonKey(name: 'branch', readValue: getBranchNames)
      required final List<BranchAndIc4InfoDto> branchInfo,
      @JsonKey(name: 'iC4', readValue: getIC4Names)
      required final List<BranchAndIc4InfoDto>
          iC4Info}) = _$_AnnouncementArticleItemDto;
  const _AnnouncementArticleItemDto._() : super._();

  factory _AnnouncementArticleItemDto.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementArticleItemDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'title', readValue: getValue)
  String get title;
  @override
  @JsonKey(name: 'summary', readValue: getValue)
  String get summary;
  @override
  @JsonKey(name: 'thumbnail', readValue: getSrcValue)
  String get thumbnail;
  @override
  @JsonKey(name: 'content', readValue: getContent)
  String get content;
  @override
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  String get publishedDate;
  @override
  @JsonKey(name: 'branch', readValue: getBranchNames)
  List<BranchAndIc4InfoDto> get branchInfo;
  @override
  @JsonKey(name: 'iC4', readValue: getIC4Names)
  List<BranchAndIc4InfoDto> get iC4Info;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementArticleItemDtoCopyWith<_$_AnnouncementArticleItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

BranchAndIc4InfoDto _$BranchAndIc4InfoDtoFromJson(Map<String, dynamic> json) {
  return _BranchAndIc4Dto.fromJson(json);
}

/// @nodoc
mixin _$BranchAndIc4InfoDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchAndIc4InfoDtoCopyWith<BranchAndIc4InfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchAndIc4InfoDtoCopyWith<$Res> {
  factory $BranchAndIc4InfoDtoCopyWith(
          BranchAndIc4InfoDto value, $Res Function(BranchAndIc4InfoDto) then) =
      _$BranchAndIc4InfoDtoCopyWithImpl<$Res, BranchAndIc4InfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class _$BranchAndIc4InfoDtoCopyWithImpl<$Res, $Val extends BranchAndIc4InfoDto>
    implements $BranchAndIc4InfoDtoCopyWith<$Res> {
  _$BranchAndIc4InfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BranchAndIc4DtoCopyWith<$Res>
    implements $BranchAndIc4InfoDtoCopyWith<$Res> {
  factory _$$_BranchAndIc4DtoCopyWith(
          _$_BranchAndIc4Dto value, $Res Function(_$_BranchAndIc4Dto) then) =
      __$$_BranchAndIc4DtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class __$$_BranchAndIc4DtoCopyWithImpl<$Res>
    extends _$BranchAndIc4InfoDtoCopyWithImpl<$Res, _$_BranchAndIc4Dto>
    implements _$$_BranchAndIc4DtoCopyWith<$Res> {
  __$$_BranchAndIc4DtoCopyWithImpl(
      _$_BranchAndIc4Dto _value, $Res Function(_$_BranchAndIc4Dto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
  }) {
    return _then(_$_BranchAndIc4Dto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BranchAndIc4Dto extends _BranchAndIc4Dto {
  const _$_BranchAndIc4Dto(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName})
      : super._();

  factory _$_BranchAndIc4Dto.fromJson(Map<String, dynamic> json) =>
      _$$_BranchAndIc4DtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;

  @override
  String toString() {
    return 'BranchAndIc4InfoDto(id: $id, name: $name, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BranchAndIc4Dto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchAndIc4DtoCopyWith<_$_BranchAndIc4Dto> get copyWith =>
      __$$_BranchAndIc4DtoCopyWithImpl<_$_BranchAndIc4Dto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchAndIc4DtoToJson(
      this,
    );
  }
}

abstract class _BranchAndIc4Dto extends BranchAndIc4InfoDto {
  const factory _BranchAndIc4Dto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'name', defaultValue: '') required final String name,
      @JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName}) = _$_BranchAndIc4Dto;
  const _BranchAndIc4Dto._() : super._();

  factory _BranchAndIc4Dto.fromJson(Map<String, dynamic> json) =
      _$_BranchAndIc4Dto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$_BranchAndIc4DtoCopyWith<_$_BranchAndIc4Dto> get copyWith =>
      throw _privateConstructorUsedError;
}
