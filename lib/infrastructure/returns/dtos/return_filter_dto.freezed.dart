// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnFilterDto _$ReturnFilterDtoFromJson(Map<String, dynamic> json) {
  return _ReturnFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnFilterDto {
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  String get refundTotalFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  String get refundTotalTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnFilterDtoCopyWith<ReturnFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnFilterDtoCopyWith<$Res> {
  factory $ReturnFilterDtoCopyWith(
          ReturnFilterDto value, $Res Function(ReturnFilterDto) then) =
      _$ReturnFilterDtoCopyWithImpl<$Res, ReturnFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '') String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      List<String> statusList});
}

/// @nodoc
class _$ReturnFilterDtoCopyWithImpl<$Res, $Val extends ReturnFilterDto>
    implements $ReturnFilterDtoCopyWith<$Res> {
  _$ReturnFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalFrom = null,
    Object? refundTotalTo = null,
    Object? statusList = null,
  }) {
    return _then(_value.copyWith(
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as String,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnFilterDtoCopyWith<$Res>
    implements $ReturnFilterDtoCopyWith<$Res> {
  factory _$$_ReturnFilterDtoCopyWith(
          _$_ReturnFilterDto value, $Res Function(_$_ReturnFilterDto) then) =
      __$$_ReturnFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dateFrom', defaultValue: '') String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '') String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      List<String> statusList});
}

/// @nodoc
class __$$_ReturnFilterDtoCopyWithImpl<$Res>
    extends _$ReturnFilterDtoCopyWithImpl<$Res, _$_ReturnFilterDto>
    implements _$$_ReturnFilterDtoCopyWith<$Res> {
  __$$_ReturnFilterDtoCopyWithImpl(
      _$_ReturnFilterDto _value, $Res Function(_$_ReturnFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = null,
    Object? dateTo = null,
    Object? refundTotalFrom = null,
    Object? refundTotalTo = null,
    Object? statusList = null,
  }) {
    return _then(_$_ReturnFilterDto(
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalFrom: null == refundTotalFrom
          ? _value.refundTotalFrom
          : refundTotalFrom // ignore: cast_nullable_to_non_nullable
              as String,
      refundTotalTo: null == refundTotalTo
          ? _value.refundTotalTo
          : refundTotalTo // ignore: cast_nullable_to_non_nullable
              as String,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnFilterDto extends _ReturnFilterDto {
  const _$_ReturnFilterDto(
      {@JsonKey(name: 'dateFrom', defaultValue: '') required this.dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      required this.refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '')
      required this.refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> statusList})
      : _statusList = statusList,
        super._();

  factory _$_ReturnFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnFilterDtoFromJson(json);

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  final String dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  final String refundTotalFrom;
  @override
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  final String refundTotalTo;
  final List<String> _statusList;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  @override
  String toString() {
    return 'ReturnFilterDto(dateFrom: $dateFrom, dateTo: $dateTo, refundTotalFrom: $refundTotalFrom, refundTotalTo: $refundTotalTo, statusList: $statusList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnFilterDto &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.refundTotalFrom, refundTotalFrom) ||
                other.refundTotalFrom == refundTotalFrom) &&
            (identical(other.refundTotalTo, refundTotalTo) ||
                other.refundTotalTo == refundTotalTo) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dateFrom,
      dateTo,
      refundTotalFrom,
      refundTotalTo,
      const DeepCollectionEquality().hash(_statusList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnFilterDtoCopyWith<_$_ReturnFilterDto> get copyWith =>
      __$$_ReturnFilterDtoCopyWithImpl<_$_ReturnFilterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnFilterDtoToJson(
      this,
    );
  }
}

abstract class _ReturnFilterDto extends ReturnFilterDto {
  const factory _ReturnFilterDto(
      {@JsonKey(name: 'dateFrom', defaultValue: '')
      required final String dateFrom,
      @JsonKey(name: 'dateTo', defaultValue: '') required final String dateTo,
      @JsonKey(name: 'refundTotalFrom', defaultValue: '')
      required final String refundTotalFrom,
      @JsonKey(name: 'refundTotalTo', defaultValue: '')
      required final String refundTotalTo,
      @JsonKey(name: 'status', defaultValue: <String>[])
      required final List<String> statusList}) = _$_ReturnFilterDto;
  const _ReturnFilterDto._() : super._();

  factory _ReturnFilterDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnFilterDto.fromJson;

  @override
  @JsonKey(name: 'dateFrom', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(name: 'dateTo', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'refundTotalFrom', defaultValue: '')
  String get refundTotalFrom;
  @override
  @JsonKey(name: 'refundTotalTo', defaultValue: '')
  String get refundTotalTo;
  @override
  @JsonKey(name: 'status', defaultValue: <String>[])
  List<String> get statusList;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnFilterDtoCopyWith<_$_ReturnFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
