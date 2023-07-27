// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'announcement_article_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnnouncementArticleInfo {
  int get total => throw _privateConstructorUsedError;
  String get endCursor => throw _privateConstructorUsedError;
  List<AnnouncementArticleItem> get announcementList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementArticleInfoCopyWith<AnnouncementArticleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleInfoCopyWith<$Res> {
  factory $AnnouncementArticleInfoCopyWith(AnnouncementArticleInfo value,
          $Res Function(AnnouncementArticleInfo) then) =
      _$AnnouncementArticleInfoCopyWithImpl<$Res, AnnouncementArticleInfo>;
  @useResult
  $Res call(
      {int total,
      String endCursor,
      List<AnnouncementArticleItem> announcementList});
}

/// @nodoc
class _$AnnouncementArticleInfoCopyWithImpl<$Res,
        $Val extends AnnouncementArticleInfo>
    implements $AnnouncementArticleInfoCopyWith<$Res> {
  _$AnnouncementArticleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? endCursor = null,
    Object? announcementList = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      announcementList: null == announcementList
          ? _value.announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementArticleInfoCopyWith<$Res>
    implements $AnnouncementArticleInfoCopyWith<$Res> {
  factory _$$_AnnouncementArticleInfoCopyWith(_$_AnnouncementArticleInfo value,
          $Res Function(_$_AnnouncementArticleInfo) then) =
      __$$_AnnouncementArticleInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      String endCursor,
      List<AnnouncementArticleItem> announcementList});
}

/// @nodoc
class __$$_AnnouncementArticleInfoCopyWithImpl<$Res>
    extends _$AnnouncementArticleInfoCopyWithImpl<$Res,
        _$_AnnouncementArticleInfo>
    implements _$$_AnnouncementArticleInfoCopyWith<$Res> {
  __$$_AnnouncementArticleInfoCopyWithImpl(_$_AnnouncementArticleInfo _value,
      $Res Function(_$_AnnouncementArticleInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? endCursor = null,
    Object? announcementList = null,
  }) {
    return _then(_$_AnnouncementArticleInfo(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      announcementList: null == announcementList
          ? _value._announcementList
          : announcementList // ignore: cast_nullable_to_non_nullable
              as List<AnnouncementArticleItem>,
    ));
  }
}

/// @nodoc

class _$_AnnouncementArticleInfo extends _AnnouncementArticleInfo {
  const _$_AnnouncementArticleInfo(
      {required this.total,
      required this.endCursor,
      required final List<AnnouncementArticleItem> announcementList})
      : _announcementList = announcementList,
        super._();

  @override
  final int total;
  @override
  final String endCursor;
  final List<AnnouncementArticleItem> _announcementList;
  @override
  List<AnnouncementArticleItem> get announcementList {
    if (_announcementList is EqualUnmodifiableListView)
      return _announcementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_announcementList);
  }

  @override
  String toString() {
    return 'AnnouncementArticleInfo(total: $total, endCursor: $endCursor, announcementList: $announcementList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementArticleInfo &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            const DeepCollectionEquality()
                .equals(other._announcementList, _announcementList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, endCursor,
      const DeepCollectionEquality().hash(_announcementList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementArticleInfoCopyWith<_$_AnnouncementArticleInfo>
      get copyWith =>
          __$$_AnnouncementArticleInfoCopyWithImpl<_$_AnnouncementArticleInfo>(
              this, _$identity);
}

abstract class _AnnouncementArticleInfo extends AnnouncementArticleInfo {
  const factory _AnnouncementArticleInfo(
          {required final int total,
          required final String endCursor,
          required final List<AnnouncementArticleItem> announcementList}) =
      _$_AnnouncementArticleInfo;
  const _AnnouncementArticleInfo._() : super._();

  @override
  int get total;
  @override
  String get endCursor;
  @override
  List<AnnouncementArticleItem> get announcementList;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementArticleInfoCopyWith<_$_AnnouncementArticleInfo>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnouncementArticleItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  HtmlContent get content => throw _privateConstructorUsedError;
  DateTimeStringValue get publishedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnnouncementArticleItemCopyWith<AnnouncementArticleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnouncementArticleItemCopyWith<$Res> {
  factory $AnnouncementArticleItemCopyWith(AnnouncementArticleItem value,
          $Res Function(AnnouncementArticleItem) then) =
      _$AnnouncementArticleItemCopyWithImpl<$Res, AnnouncementArticleItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      HtmlContent content,
      DateTimeStringValue publishedDate});
}

/// @nodoc
class _$AnnouncementArticleItemCopyWithImpl<$Res,
        $Val extends AnnouncementArticleItem>
    implements $AnnouncementArticleItemCopyWith<$Res> {
  _$AnnouncementArticleItemCopyWithImpl(this._value, this._then);

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
              as HtmlContent,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnnouncementArticleItemCopyWith<$Res>
    implements $AnnouncementArticleItemCopyWith<$Res> {
  factory _$$_AnnouncementArticleItemCopyWith(_$_AnnouncementArticleItem value,
          $Res Function(_$_AnnouncementArticleItem) then) =
      __$$_AnnouncementArticleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String summary,
      String thumbnail,
      HtmlContent content,
      DateTimeStringValue publishedDate});
}

/// @nodoc
class __$$_AnnouncementArticleItemCopyWithImpl<$Res>
    extends _$AnnouncementArticleItemCopyWithImpl<$Res,
        _$_AnnouncementArticleItem>
    implements _$$_AnnouncementArticleItemCopyWith<$Res> {
  __$$_AnnouncementArticleItemCopyWithImpl(_$_AnnouncementArticleItem _value,
      $Res Function(_$_AnnouncementArticleItem) _then)
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
  }) {
    return _then(_$_AnnouncementArticleItem(
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
              as HtmlContent,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_AnnouncementArticleItem extends _AnnouncementArticleItem {
  const _$_AnnouncementArticleItem(
      {required this.id,
      required this.title,
      required this.summary,
      required this.thumbnail,
      required this.content,
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
  final HtmlContent content;
  @override
  final DateTimeStringValue publishedDate;

  @override
  String toString() {
    return 'AnnouncementArticleItem(id: $id, title: $title, summary: $summary, thumbnail: $thumbnail, content: $content, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnnouncementArticleItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, summary, thumbnail, content, publishedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnnouncementArticleItemCopyWith<_$_AnnouncementArticleItem>
      get copyWith =>
          __$$_AnnouncementArticleItemCopyWithImpl<_$_AnnouncementArticleItem>(
              this, _$identity);
}

abstract class _AnnouncementArticleItem extends AnnouncementArticleItem {
  const factory _AnnouncementArticleItem(
          {required final String id,
          required final String title,
          required final String summary,
          required final String thumbnail,
          required final HtmlContent content,
          required final DateTimeStringValue publishedDate}) =
      _$_AnnouncementArticleItem;
  const _AnnouncementArticleItem._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get summary;
  @override
  String get thumbnail;
  @override
  HtmlContent get content;
  @override
  DateTimeStringValue get publishedDate;
  @override
  @JsonKey(ignore: true)
  _$$_AnnouncementArticleItemCopyWith<_$_AnnouncementArticleItem>
      get copyWith => throw _privateConstructorUsedError;
}
