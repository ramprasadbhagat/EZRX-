// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementInfo {
  int get total => throw _privateConstructorUsedError;
  List<AnnouncementItem> get announcementList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementInfoCopyWith<AnnouncementInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementInfoCopyWith<$Res> {
  factory $AnnouncementInfoCopyWith(
          AnnouncementInfo value, $Res Function(AnnouncementInfo) then) =
      _$AnnouncementInfoCopyWithImpl<$Res, AnnouncementInfo>;
  @useResult
  $Res call({int total, List<AnnouncementItem> announcementList});
}

/// @nodoc
class _$AnnouncementInfoCopyWithImpl<$Res, $Val extends AnnouncementInfo>
    implements $AnnouncementInfoCopyWith<$Res> {
  _$AnnouncementInfoCopyWithImpl(this._value, this._then);

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
              as List<AnnouncementItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementInfoCopyWith<$Res>
    implements $AnnouncementInfoCopyWith<$Res> {
  factory _$$_AnnouncementInfoCopyWith(
          _$_AnnouncementInfo value, $Res Function(_$_AnnouncementInfo) then) =
      __$$_AnnouncementInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<AnnouncementItem> announcementList});
}

/// @nodoc
class __$$_AnnouncementInfoCopyWithImpl<$Res>
    extends _$AnnouncementInfoCopyWithImpl<$Res, _$_AnnouncementInfo>
    implements _$$_AnnouncementInfoCopyWith<$Res> {
  __$$_AnnouncementInfoCopyWithImpl(
      _$_AnnouncementInfo _value, $Res Function(_$_AnnouncementInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? announcementList = null,
  }) {
    return _then(_$_AnnouncementInfo(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementItem>,
    ));
  }
}

/// @nodoc

class _$_AnnouncementInfo extends _AnnouncementInfo {
  const _$_AnnouncementInfo(
      {required this.total,
      required final List<AnnouncementItem> announcementList})
      : _announcementList = announcementList,
        super._();

  @override
  final int total;
  final List<AnnouncementItem> _announcementList;
  @override
  List<AnnouncementItem> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementInfo(total: $total, announcementList: $announcementList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementInfo &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementInfoCopyWith<_$_AnnouncementInfo> get copyWith =>
      __$$_AnnouncementInfoCopyWithImpl<_$_AnnouncementInfo>(this, _$identity);
}

abstract class _AnnouncementInfo extends AnnouncementInfo {
  const factory _AnnouncementInfo(
          {required final int total,
          required final List<AnnouncementItem> announcementList}) =
      _$_AnnouncementInfo;
  const _AnnouncementInfo._() : super._();

  @override
  int get total;
  @override
  List<AnnouncementItem> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementInfoCopyWith<_$_AnnouncementInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  DateTimeStringValue get publishedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementItemCopyWith<AnnouncementItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementItemCopyWith<$Res> {
  factory $AnnouncementItemCopyWith(
          AnnouncementItem value, $Res Function(AnnouncementItem) then) =
      _$AnnouncementItemCopyWithImpl<$Res, AnnouncementItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      DateTimeStringValue publishedDate});
}

/// @nodoc
class _$AnnouncementItemCopyWithImpl<$Res, $Val extends AnnouncementItem>
    implements $AnnouncementItemCopyWith<$Res> {
  _$AnnouncementItemCopyWithImpl(this._value, this._then);

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
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementItemCopyWith<$Res>
    implements $AnnouncementItemCopyWith<$Res> {
  factory _$$_AnnouncementItemCopyWith(
          _$_AnnouncementItem value, $Res Function(_$_AnnouncementItem) then) =
      __$$_AnnouncementItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      DateTimeStringValue publishedDate});
}

/// @nodoc
class __$$_AnnouncementItemCopyWithImpl<$Res>
    extends _$AnnouncementItemCopyWithImpl<$Res, _$_AnnouncementItem>
    implements _$$_AnnouncementItemCopyWith<$Res> {
  __$$_AnnouncementItemCopyWithImpl(
      _$_AnnouncementItem _value, $Res Function(_$_AnnouncementItem) _then)
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
    return _then(_$_AnnouncementItem(
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
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_AnnouncementItem extends _AnnouncementItem {
  const _$_AnnouncementItem(
      {required this.id,
      required this.title,
      required this.summary,
      required this.thumbnail,
      required this.publishedDate})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String summary;
  @override
  final String thumbnail;
  @override
  final DateTimeStringValue publishedDate;

  @override
  String toString() {
    return 'AnnouncementItem(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, summary, thumbnail, publishedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementItemCopyWith<_$_AnnouncementItem> get copyWith =>
      __$$_AnnouncementItemCopyWithImpl<_$_AnnouncementItem>(this, _$identity);
}

abstract class _AnnouncementItem extends AnnouncementItem {
  const factory _AnnouncementItem(
      {required final String id,
      required final String title,
      required final String summary,
      required final String thumbnail,
      required final DateTimeStringValue publishedDate}) = _$_AnnouncementItem;
  const _AnnouncementItem._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get thumbnail;
  @override
  DateTimeStringValue get publishedDate;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementItemCopyWith<_$_AnnouncementItem> get copyWith =>
      throw _privateConstructorUsedError;
}
