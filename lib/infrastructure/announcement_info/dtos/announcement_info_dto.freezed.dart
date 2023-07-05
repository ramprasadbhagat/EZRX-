// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnnouncementInfoDto _$AnnouncementInfoDtoFromJson(Map<String, dynamic> json) {
  return _AnnouncementInfoDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementInfoDto {
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
  List<AnnouncementItemDto> get announcementList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementInfoDtoCopyWith<AnnouncementInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoDtoCopyWith<$Res> {
  factory $AnnouncementInfoDtoCopyWith(
          AnnouncementInfoDto value, $Res Function(AnnouncementInfoDto) then) =
      _$AnnouncementInfoDtoCopyWithImpl<$Res, AnnouncementInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total', defaultValue: 0)
          int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
          List<AnnouncementItemDto> announcementList});
}

/// @nodoc
class _$AnnouncementInfoDtoCopyWithImpl<$Res, $Val extends AnnouncementInfoDto>
    implements $AnnouncementInfoDtoCopyWith<$Res> {
  _$AnnouncementInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementInfoDtoCopyWith<$Res>
    implements $AnnouncementInfoDtoCopyWith<$Res> {
  factory _$$_AnnouncementInfoDtoCopyWith(_$_AnnouncementInfoDto value,
          $Res Function(_$_AnnouncementInfoDto) then) =
      __$$_AnnouncementInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total', defaultValue: 0)
          int total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
          List<AnnouncementItemDto> announcementList});
}

/// @nodoc
class __$$_AnnouncementInfoDtoCopyWithImpl<$Res>
    extends _$AnnouncementInfoDtoCopyWithImpl<$Res, _$_AnnouncementInfoDto>
    implements _$$_AnnouncementInfoDtoCopyWith<$Res> {
  __$$_AnnouncementInfoDtoCopyWithImpl(_$_AnnouncementInfoDto _value,
      $Res Function(_$_AnnouncementInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_$_AnnouncementInfoDto(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncementInfoDto extends _AnnouncementInfoDto {
  const _$_AnnouncementInfoDto(
      {@JsonKey(name: 'total', defaultValue: 0)
          required this.total,
      @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
          required final List<AnnouncementItemDto> announcementList})
      : _announcementList = announcementList,
        super._();

  factory _$_AnnouncementInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;
  final List<AnnouncementItemDto> _announcementList;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
  List<AnnouncementItemDto> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementInfoDto(total: $total, announcementList: $announcementList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfoDto &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementInfoDtoCopyWith<_$_AnnouncementInfoDto> get copyWith =>
      __$$_AnnouncementInfoDtoCopyWithImpl<_$_AnnouncementInfoDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementInfoDtoToJson(
      this,
    );
  }
}

abstract class _AnnouncementInfoDto extends AnnouncementInfoDto {
  const factory _AnnouncementInfoDto(
          {@JsonKey(name: 'total', defaultValue: 0)
              required final int total,
          @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
              required final List<AnnouncementItemDto> announcementList}) =
      _$_AnnouncementInfoDto;
  const _AnnouncementInfoDto._() : super._();

  factory _AnnouncementInfoDto.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementInfoDto.fromJson;

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(name: 'results', defaultValue: <AnnouncementItemDto>[])
  List<AnnouncementItemDto> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoDtoCopyWith<_$_AnnouncementInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

AnnouncementItemDto _$AnnouncementItemDtoFromJson(Map<String, dynamic> json) {
  return _AnnouncementItemDto.fromJson(json);
}

/// @nodoc
mixin _$AnnouncementItemDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title', readValue: getValue)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary', readValue: getValue)
  String get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail', readValue: getSrcValue)
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  String get publishedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnnouncementItemDtoCopyWith<AnnouncementItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementItemDtoCopyWith<$Res> {
  factory $AnnouncementItemDtoCopyWith(
          AnnouncementItemDto value, $Res Function(AnnouncementItemDto) then) =
      _$AnnouncementItemDtoCopyWithImpl<$Res, AnnouncementItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'title', readValue: getValue)
          String title,
      @JsonKey(name: 'summary', readValue: getValue)
          String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
          String thumbnail,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
          String publishedDate});
}

/// @nodoc
class _$AnnouncementItemDtoCopyWithImpl<$Res, $Val extends AnnouncementItemDto>
    implements $AnnouncementItemDtoCopyWith<$Res> {
  _$AnnouncementItemDtoCopyWithImpl(this._value, this._then);

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
    Object? publishedDate = null,
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
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementItemDtoCopyWith<$Res>
    implements $AnnouncementItemDtoCopyWith<$Res> {
  factory _$$_AnnouncementItemDtoCopyWith(_$_AnnouncementItemDto value,
          $Res Function(_$_AnnouncementItemDto) then) =
      __$$_AnnouncementItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '')
          String id,
      @JsonKey(name: 'title', readValue: getValue)
          String title,
      @JsonKey(name: 'summary', readValue: getValue)
          String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
          String thumbnail,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
          String publishedDate});
}

/// @nodoc
class __$$_AnnouncementItemDtoCopyWithImpl<$Res>
    extends _$AnnouncementItemDtoCopyWithImpl<$Res, _$_AnnouncementItemDto>
    implements _$$_AnnouncementItemDtoCopyWith<$Res> {
  __$$_AnnouncementItemDtoCopyWithImpl(_$_AnnouncementItemDto _value,
      $Res Function(_$_AnnouncementItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? summary = null,
    Object? thumbnail = null,
    Object? publishedDate = null,
  }) {
    return _then(_$_AnnouncementItemDto(
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
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnnouncementItemDto extends _AnnouncementItemDto {
  const _$_AnnouncementItemDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required this.id,
      @JsonKey(name: 'title', readValue: getValue)
          required this.title,
      @JsonKey(name: 'summary', readValue: getValue)
          required this.summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
          required this.thumbnail,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
          required this.publishedDate})
      : super._();

  factory _$_AnnouncementItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnnouncementItemDtoFromJson(json);

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
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  final String publishedDate;

  @override
  String toString() {
    return 'AnnouncementItemDto(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, summary, thumbnail, publishedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementItemDtoCopyWith<_$_AnnouncementItemDto> get copyWith =>
      __$$_AnnouncementItemDtoCopyWithImpl<_$_AnnouncementItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnnouncementItemDtoToJson(
      this,
    );
  }
}

abstract class _AnnouncementItemDto extends AnnouncementItemDto {
  const factory _AnnouncementItemDto(
      {@JsonKey(name: 'id', defaultValue: '')
          required final String id,
      @JsonKey(name: 'title', readValue: getValue)
          required final String title,
      @JsonKey(name: 'summary', readValue: getValue)
          required final String summary,
      @JsonKey(name: 'thumbnail', readValue: getSrcValue)
          required final String thumbnail,
      @JsonKey(name: 'publishedDate', readValue: getDateValue)
          required final String publishedDate}) = _$_AnnouncementItemDto;
  const _AnnouncementItemDto._() : super._();

  factory _AnnouncementItemDto.fromJson(Map<String, dynamic> json) =
      _$_AnnouncementItemDto.fromJson;

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
  @JsonKey(name: 'publishedDate', readValue: getDateValue)
  String get publishedDate;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementItemDtoCopyWith<_$_AnnouncementItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
