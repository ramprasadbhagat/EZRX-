// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'banner_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BannerDto _$BannerDtoFromJson(Map<String, dynamic> json) {
  return _BannerDto.fromJson(json);
}

/// @nodoc
mixin _$BannerDto {
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'buttonLabel')
  String get buttonLabel => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'urlLink')
  String get urlLink => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: false)
  @JsonKey(name: 'isPreSalesOrg')
  bool get isPreSalesOrg => throw _privateConstructorUsedError;
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'salesOrg')
  String get salesOrg => throw _privateConstructorUsedError;
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'serial')
  int get serial => throw _privateConstructorUsedError;
  @HiveField(9, defaultValue: false)
  @JsonKey(name: 'isCustomer')
  bool get isCustomer => throw _privateConstructorUsedError;
  @HiveField(10, defaultValue: false)
  @JsonKey(name: 'isKeyword', defaultValue: false)
  bool get isKeyword => throw _privateConstructorUsedError;
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'keyword', defaultValue: '')
  String get keyword => throw _privateConstructorUsedError;
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'category', defaultValue: '')
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerDtoCopyWith<BannerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerDtoCopyWith<$Res> {
  factory $BannerDtoCopyWith(BannerDto value, $Res Function(BannerDto) then) =
      _$BannerDtoCopyWithImpl<$Res, BannerDto>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'id')
          int id,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'url')
          String url,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'title')
          String title,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'description')
          String description,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'buttonLabel')
          String buttonLabel,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'urlLink')
          String urlLink,
      @HiveField(6, defaultValue: false)
      @JsonKey(name: 'isPreSalesOrg')
          bool isPreSalesOrg,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'salesOrg')
          String salesOrg,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'serial')
          int serial,
      @HiveField(9, defaultValue: false)
      @JsonKey(name: 'isCustomer')
          bool isCustomer,
      @HiveField(10, defaultValue: false)
      @JsonKey(name: 'isKeyword', defaultValue: false)
          bool isKeyword,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'keyword', defaultValue: '')
          String keyword,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'category', defaultValue: '')
          String category});
}

/// @nodoc
class _$BannerDtoCopyWithImpl<$Res, $Val extends BannerDto>
    implements $BannerDtoCopyWith<$Res> {
  _$BannerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? title = null,
    Object? description = null,
    Object? buttonLabel = null,
    Object? urlLink = null,
    Object? isPreSalesOrg = null,
    Object? salesOrg = null,
    Object? serial = null,
    Object? isCustomer = null,
    Object? isKeyword = null,
    Object? keyword = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      buttonLabel: null == buttonLabel
          ? _value.buttonLabel
          : buttonLabel // ignore: cast_nullable_to_non_nullable
              as String,
      urlLink: null == urlLink
          ? _value.urlLink
          : urlLink // ignore: cast_nullable_to_non_nullable
              as String,
      isPreSalesOrg: null == isPreSalesOrg
          ? _value.isPreSalesOrg
          : isPreSalesOrg // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      serial: null == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int,
      isCustomer: null == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      isKeyword: null == isKeyword
          ? _value.isKeyword
          : isKeyword // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannerDtoCopyWith<$Res> implements $BannerDtoCopyWith<$Res> {
  factory _$$_BannerDtoCopyWith(
          _$_BannerDto value, $Res Function(_$_BannerDto) then) =
      __$$_BannerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'id')
          int id,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'url')
          String url,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'title')
          String title,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'description')
          String description,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'buttonLabel')
          String buttonLabel,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'urlLink')
          String urlLink,
      @HiveField(6, defaultValue: false)
      @JsonKey(name: 'isPreSalesOrg')
          bool isPreSalesOrg,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'salesOrg')
          String salesOrg,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'serial')
          int serial,
      @HiveField(9, defaultValue: false)
      @JsonKey(name: 'isCustomer')
          bool isCustomer,
      @HiveField(10, defaultValue: false)
      @JsonKey(name: 'isKeyword', defaultValue: false)
          bool isKeyword,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'keyword', defaultValue: '')
          String keyword,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'category', defaultValue: '')
          String category});
}

/// @nodoc
class __$$_BannerDtoCopyWithImpl<$Res>
    extends _$BannerDtoCopyWithImpl<$Res, _$_BannerDto>
    implements _$$_BannerDtoCopyWith<$Res> {
  __$$_BannerDtoCopyWithImpl(
      _$_BannerDto _value, $Res Function(_$_BannerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? title = null,
    Object? description = null,
    Object? buttonLabel = null,
    Object? urlLink = null,
    Object? isPreSalesOrg = null,
    Object? salesOrg = null,
    Object? serial = null,
    Object? isCustomer = null,
    Object? isKeyword = null,
    Object? keyword = null,
    Object? category = null,
  }) {
    return _then(_$_BannerDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      buttonLabel: null == buttonLabel
          ? _value.buttonLabel
          : buttonLabel // ignore: cast_nullable_to_non_nullable
              as String,
      urlLink: null == urlLink
          ? _value.urlLink
          : urlLink // ignore: cast_nullable_to_non_nullable
              as String,
      isPreSalesOrg: null == isPreSalesOrg
          ? _value.isPreSalesOrg
          : isPreSalesOrg // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      serial: null == serial
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as int,
      isCustomer: null == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      isKeyword: null == isKeyword
          ? _value.isKeyword
          : isKeyword // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 34, adapterName: 'BannerDtoAdapter')
class _$_BannerDto extends _BannerDto {
  const _$_BannerDto(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'id')
          required this.id,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'url')
          required this.url,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'title')
          required this.title,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'description')
          required this.description,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'buttonLabel')
          required this.buttonLabel,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'urlLink')
          required this.urlLink,
      @HiveField(6, defaultValue: false)
      @JsonKey(name: 'isPreSalesOrg')
          required this.isPreSalesOrg,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'salesOrg')
          required this.salesOrg,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'serial')
          required this.serial,
      @HiveField(9, defaultValue: false)
      @JsonKey(name: 'isCustomer')
          required this.isCustomer,
      @HiveField(10, defaultValue: false)
      @JsonKey(name: 'isKeyword', defaultValue: false)
          required this.isKeyword,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'keyword', defaultValue: '')
          required this.keyword,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'category', defaultValue: '')
          required this.category})
      : super._();

  factory _$_BannerDto.fromJson(Map<String, dynamic> json) =>
      _$$_BannerDtoFromJson(json);

  @override
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'id')
  final int id;
  @override
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'url')
  final String url;
  @override
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'title')
  final String title;
  @override
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'description')
  final String description;
  @override
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'buttonLabel')
  final String buttonLabel;
  @override
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'urlLink')
  final String urlLink;
  @override
  @HiveField(6, defaultValue: false)
  @JsonKey(name: 'isPreSalesOrg')
  final bool isPreSalesOrg;
  @override
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'salesOrg')
  final String salesOrg;
  @override
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'serial')
  final int serial;
  @override
  @HiveField(9, defaultValue: false)
  @JsonKey(name: 'isCustomer')
  final bool isCustomer;
  @override
  @HiveField(10, defaultValue: false)
  @JsonKey(name: 'isKeyword', defaultValue: false)
  final bool isKeyword;
  @override
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'keyword', defaultValue: '')
  final String keyword;
  @override
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'category', defaultValue: '')
  final String category;

  @override
  String toString() {
    return 'BannerDto(id: $id, url: $url, title: $title, description: $description, buttonLabel: $buttonLabel, urlLink: $urlLink, isPreSalesOrg: $isPreSalesOrg, salesOrg: $salesOrg, serial: $serial, isCustomer: $isCustomer, isKeyword: $isKeyword, keyword: $keyword, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.buttonLabel, buttonLabel) ||
                other.buttonLabel == buttonLabel) &&
            (identical(other.urlLink, urlLink) || other.urlLink == urlLink) &&
            (identical(other.isPreSalesOrg, isPreSalesOrg) ||
                other.isPreSalesOrg == isPreSalesOrg) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.isCustomer, isCustomer) ||
                other.isCustomer == isCustomer) &&
            (identical(other.isKeyword, isKeyword) ||
                other.isKeyword == isKeyword) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      url,
      title,
      description,
      buttonLabel,
      urlLink,
      isPreSalesOrg,
      salesOrg,
      serial,
      isCustomer,
      isKeyword,
      keyword,
      category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerDtoCopyWith<_$_BannerDto> get copyWith =>
      __$$_BannerDtoCopyWithImpl<_$_BannerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannerDtoToJson(
      this,
    );
  }
}

abstract class _BannerDto extends BannerDto {
  const factory _BannerDto(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'id')
          required final int id,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'url')
          required final String url,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'title')
          required final String title,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'description')
          required final String description,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'buttonLabel')
          required final String buttonLabel,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'urlLink')
          required final String urlLink,
      @HiveField(6, defaultValue: false)
      @JsonKey(name: 'isPreSalesOrg')
          required final bool isPreSalesOrg,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'salesOrg')
          required final String salesOrg,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'serial')
          required final int serial,
      @HiveField(9, defaultValue: false)
      @JsonKey(name: 'isCustomer')
          required final bool isCustomer,
      @HiveField(10, defaultValue: false)
      @JsonKey(name: 'isKeyword', defaultValue: false)
          required final bool isKeyword,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'keyword', defaultValue: '')
          required final String keyword,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'category', defaultValue: '')
          required final String category}) = _$_BannerDto;
  const _BannerDto._() : super._();

  factory _BannerDto.fromJson(Map<String, dynamic> json) =
      _$_BannerDto.fromJson;

  @override
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'id')
  int get id;
  @override
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'url')
  String get url;
  @override
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'title')
  String get title;
  @override
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'description')
  String get description;
  @override
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'buttonLabel')
  String get buttonLabel;
  @override
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'urlLink')
  String get urlLink;
  @override
  @HiveField(6, defaultValue: false)
  @JsonKey(name: 'isPreSalesOrg')
  bool get isPreSalesOrg;
  @override
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'salesOrg')
  String get salesOrg;
  @override
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'serial')
  int get serial;
  @override
  @HiveField(9, defaultValue: false)
  @JsonKey(name: 'isCustomer')
  bool get isCustomer;
  @override
  @HiveField(10, defaultValue: false)
  @JsonKey(name: 'isKeyword', defaultValue: false)
  bool get isKeyword;
  @override
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'keyword', defaultValue: '')
  String get keyword;
  @override
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'category', defaultValue: '')
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_BannerDtoCopyWith<_$_BannerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
