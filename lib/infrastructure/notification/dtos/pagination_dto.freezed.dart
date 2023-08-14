// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) {
  return _PaginationDto.fromJson(json);
}

/// @nodoc
mixin _$PaginationDto {
  @JsonKey(name: 'totalItem', defaultValue: 0)
  int get totalItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPage', defaultValue: 0)
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalUnread', defaultValue: 0)
  int get totalUnread => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationDtoCopyWith<PaginationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDtoCopyWith<$Res> {
  factory $PaginationDtoCopyWith(
          PaginationDto value, $Res Function(PaginationDto) then) =
      _$PaginationDtoCopyWithImpl<$Res, PaginationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalItem', defaultValue: 0) int totalItem,
      @JsonKey(name: 'totalPage', defaultValue: 0) int totalPage,
      @JsonKey(name: 'totalUnread', defaultValue: 0) int totalUnread});
}

/// @nodoc
class _$PaginationDtoCopyWithImpl<$Res, $Val extends PaginationDto>
    implements $PaginationDtoCopyWith<$Res> {
  _$PaginationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItem = null,
    Object? totalPage = null,
    Object? totalUnread = null,
  }) {
    return _then(_value.copyWith(
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnread: null == totalUnread
          ? _value.totalUnread
          : totalUnread // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationDtoCopyWith<$Res>
    implements $PaginationDtoCopyWith<$Res> {
  factory _$$_PaginationDtoCopyWith(
          _$_PaginationDto value, $Res Function(_$_PaginationDto) then) =
      __$$_PaginationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalItem', defaultValue: 0) int totalItem,
      @JsonKey(name: 'totalPage', defaultValue: 0) int totalPage,
      @JsonKey(name: 'totalUnread', defaultValue: 0) int totalUnread});
}

/// @nodoc
class __$$_PaginationDtoCopyWithImpl<$Res>
    extends _$PaginationDtoCopyWithImpl<$Res, _$_PaginationDto>
    implements _$$_PaginationDtoCopyWith<$Res> {
  __$$_PaginationDtoCopyWithImpl(
      _$_PaginationDto _value, $Res Function(_$_PaginationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItem = null,
    Object? totalPage = null,
    Object? totalUnread = null,
  }) {
    return _then(_$_PaginationDto(
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnread: null == totalUnread
          ? _value.totalUnread
          : totalUnread // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationDto extends _PaginationDto {
  const _$_PaginationDto(
      {@JsonKey(name: 'totalItem', defaultValue: 0) required this.totalItem,
      @JsonKey(name: 'totalPage', defaultValue: 0) required this.totalPage,
      @JsonKey(name: 'totalUnread', defaultValue: 0) required this.totalUnread})
      : super._();

  factory _$_PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationDtoFromJson(json);

  @override
  @JsonKey(name: 'totalItem', defaultValue: 0)
  final int totalItem;
  @override
  @JsonKey(name: 'totalPage', defaultValue: 0)
  final int totalPage;
  @override
  @JsonKey(name: 'totalUnread', defaultValue: 0)
  final int totalUnread;

  @override
  String toString() {
    return 'PaginationDto(totalItem: $totalItem, totalPage: $totalPage, totalUnread: $totalUnread)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationDto &&
            (identical(other.totalItem, totalItem) ||
                other.totalItem == totalItem) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.totalUnread, totalUnread) ||
                other.totalUnread == totalUnread));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalItem, totalPage, totalUnread);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationDtoCopyWith<_$_PaginationDto> get copyWith =>
      __$$_PaginationDtoCopyWithImpl<_$_PaginationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationDtoToJson(
      this,
    );
  }
}

abstract class _PaginationDto extends PaginationDto {
  const factory _PaginationDto(
      {@JsonKey(name: 'totalItem', defaultValue: 0)
      required final int totalItem,
      @JsonKey(name: 'totalPage', defaultValue: 0) required final int totalPage,
      @JsonKey(name: 'totalUnread', defaultValue: 0)
      required final int totalUnread}) = _$_PaginationDto;
  const _PaginationDto._() : super._();

  factory _PaginationDto.fromJson(Map<String, dynamic> json) =
      _$_PaginationDto.fromJson;

  @override
  @JsonKey(name: 'totalItem', defaultValue: 0)
  int get totalItem;
  @override
  @JsonKey(name: 'totalPage', defaultValue: 0)
  int get totalPage;
  @override
  @JsonKey(name: 'totalUnread', defaultValue: 0)
  int get totalUnread;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationDtoCopyWith<_$_PaginationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
