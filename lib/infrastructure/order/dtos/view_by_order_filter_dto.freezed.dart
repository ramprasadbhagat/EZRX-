// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewByOrdersFilterDto _$ViewByOrdersFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _ViewByOrdersFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByOrdersFilterDto {
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByOrdersFilterDtoCopyWith<ViewByOrdersFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrdersFilterDtoCopyWith<$Res> {
  factory $ViewByOrdersFilterDtoCopyWith(ViewByOrdersFilterDto value,
          $Res Function(ViewByOrdersFilterDto) then) =
      _$ViewByOrdersFilterDtoCopyWithImpl<$Res, ViewByOrdersFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class _$ViewByOrdersFilterDtoCopyWithImpl<$Res,
        $Val extends ViewByOrdersFilterDto>
    implements $ViewByOrdersFilterDtoCopyWith<$Res> {
  _$ViewByOrdersFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_value.copyWith(
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrdersFilterDtoCopyWith<$Res>
    implements $ViewByOrdersFilterDtoCopyWith<$Res> {
  factory _$$_ViewByOrdersFilterDtoCopyWith(_$_ViewByOrdersFilterDto value,
          $Res Function(_$_ViewByOrdersFilterDto) then) =
      __$$_ViewByOrdersFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class __$$_ViewByOrdersFilterDtoCopyWithImpl<$Res>
    extends _$ViewByOrdersFilterDtoCopyWithImpl<$Res, _$_ViewByOrdersFilterDto>
    implements _$$_ViewByOrdersFilterDtoCopyWith<$Res> {
  __$$_ViewByOrdersFilterDtoCopyWithImpl(_$_ViewByOrdersFilterDto _value,
      $Res Function(_$_ViewByOrdersFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_$_ViewByOrdersFilterDto(
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewByOrdersFilterDto extends _ViewByOrdersFilterDto {
  const _$_ViewByOrdersFilterDto(
      {@JsonKey(name: 'toDate', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') required this.dateFrom})
      : super._();

  factory _$_ViewByOrdersFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_ViewByOrdersFilterDtoFromJson(json);

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  final String dateFrom;

  @override
  String toString() {
    return 'ViewByOrdersFilterDto(dateTo: $dateTo, dateFrom: $dateFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrdersFilterDto &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTo, dateFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrdersFilterDtoCopyWith<_$_ViewByOrdersFilterDto> get copyWith =>
      __$$_ViewByOrdersFilterDtoCopyWithImpl<_$_ViewByOrdersFilterDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewByOrdersFilterDtoToJson(
      this,
    );
  }
}

abstract class _ViewByOrdersFilterDto extends ViewByOrdersFilterDto {
  const factory _ViewByOrdersFilterDto(
      {@JsonKey(name: 'toDate', defaultValue: '') required final String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
      required final String dateFrom}) = _$_ViewByOrdersFilterDto;
  const _ViewByOrdersFilterDto._() : super._();

  factory _ViewByOrdersFilterDto.fromJson(Map<String, dynamic> json) =
      _$_ViewByOrdersFilterDto.fromJson;

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrdersFilterDtoCopyWith<_$_ViewByOrdersFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
