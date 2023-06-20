// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_history_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewByOrderHistoryFilterDto _$ViewByOrderHistoryFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _ViewByOrderHistoryFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByOrderHistoryFilterDto {
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByOrderHistoryFilterDtoCopyWith<ViewByOrderHistoryFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderHistoryFilterDtoCopyWith<$Res> {
  factory $ViewByOrderHistoryFilterDtoCopyWith(
          ViewByOrderHistoryFilterDto value,
          $Res Function(ViewByOrderHistoryFilterDto) then) =
      _$ViewByOrderHistoryFilterDtoCopyWithImpl<$Res,
          ViewByOrderHistoryFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class _$ViewByOrderHistoryFilterDtoCopyWithImpl<$Res,
        $Val extends ViewByOrderHistoryFilterDto>
    implements $ViewByOrderHistoryFilterDtoCopyWith<$Res> {
  _$ViewByOrderHistoryFilterDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ViewByOrderHistoryFilterDtoCopyWith<$Res>
    implements $ViewByOrderHistoryFilterDtoCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryFilterDtoCopyWith(
          _$_ViewByOrderHistoryFilterDto value,
          $Res Function(_$_ViewByOrderHistoryFilterDto) then) =
      __$$_ViewByOrderHistoryFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class __$$_ViewByOrderHistoryFilterDtoCopyWithImpl<$Res>
    extends _$ViewByOrderHistoryFilterDtoCopyWithImpl<$Res,
        _$_ViewByOrderHistoryFilterDto>
    implements _$$_ViewByOrderHistoryFilterDtoCopyWith<$Res> {
  __$$_ViewByOrderHistoryFilterDtoCopyWithImpl(
      _$_ViewByOrderHistoryFilterDto _value,
      $Res Function(_$_ViewByOrderHistoryFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_$_ViewByOrderHistoryFilterDto(
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
class _$_ViewByOrderHistoryFilterDto extends _ViewByOrderHistoryFilterDto {
  const _$_ViewByOrderHistoryFilterDto(
      {@JsonKey(name: 'toDate', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') required this.dateFrom})
      : super._();

  factory _$_ViewByOrderHistoryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_ViewByOrderHistoryFilterDtoFromJson(json);

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  final String dateFrom;

  @override
  String toString() {
    return 'ViewByOrderHistoryFilterDto(dateTo: $dateTo, dateFrom: $dateFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryFilterDto &&
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
  _$$_ViewByOrderHistoryFilterDtoCopyWith<_$_ViewByOrderHistoryFilterDto>
      get copyWith => __$$_ViewByOrderHistoryFilterDtoCopyWithImpl<
          _$_ViewByOrderHistoryFilterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewByOrderHistoryFilterDtoToJson(
      this,
    );
  }
}

abstract class _ViewByOrderHistoryFilterDto
    extends ViewByOrderHistoryFilterDto {
  const factory _ViewByOrderHistoryFilterDto(
      {@JsonKey(name: 'toDate', defaultValue: '')
          required final String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
          required final String dateFrom}) = _$_ViewByOrderHistoryFilterDto;
  const _ViewByOrderHistoryFilterDto._() : super._();

  factory _ViewByOrderHistoryFilterDto.fromJson(Map<String, dynamic> json) =
      _$_ViewByOrderHistoryFilterDto.fromJson;

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryFilterDtoCopyWith<_$_ViewByOrderHistoryFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}
