// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentSummaryFilterDto _$PaymentSummaryFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentSummaryFilterDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentSummaryFilterDto {
  @JsonKey(name: 'createdDateFrom', defaultValue: '')
  String get createdDateFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateTo', defaultValue: '')
  String get createdDateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  String get amountValueFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  String get amountValueTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  String get filterStatuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentSummaryFilterDtoCopyWith<PaymentSummaryFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryFilterDtoCopyWith<$Res> {
  factory $PaymentSummaryFilterDtoCopyWith(PaymentSummaryFilterDto value,
          $Res Function(PaymentSummaryFilterDto) then) =
      _$PaymentSummaryFilterDtoCopyWithImpl<$Res, PaymentSummaryFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'createdDateFrom', defaultValue: '')
      String createdDateFrom,
      @JsonKey(name: 'createdDateTo', defaultValue: '') String createdDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '') String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      String filterStatuses});
}

/// @nodoc
class _$PaymentSummaryFilterDtoCopyWithImpl<$Res,
        $Val extends PaymentSummaryFilterDto>
    implements $PaymentSummaryFilterDtoCopyWith<$Res> {
  _$PaymentSummaryFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDateFrom = null,
    Object? createdDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
  }) {
    return _then(_value.copyWith(
      createdDateFrom: null == createdDateFrom
          ? _value.createdDateFrom
          : createdDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTo: null == createdDateTo
          ? _value.createdDateTo
          : createdDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryFilterDtoCopyWith<$Res>
    implements $PaymentSummaryFilterDtoCopyWith<$Res> {
  factory _$$_PaymentSummaryFilterDtoCopyWith(_$_PaymentSummaryFilterDto value,
          $Res Function(_$_PaymentSummaryFilterDto) then) =
      __$$_PaymentSummaryFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'createdDateFrom', defaultValue: '')
      String createdDateFrom,
      @JsonKey(name: 'createdDateTo', defaultValue: '') String createdDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '') String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      String filterStatuses});
}

/// @nodoc
class __$$_PaymentSummaryFilterDtoCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterDtoCopyWithImpl<$Res,
        _$_PaymentSummaryFilterDto>
    implements _$$_PaymentSummaryFilterDtoCopyWith<$Res> {
  __$$_PaymentSummaryFilterDtoCopyWithImpl(_$_PaymentSummaryFilterDto _value,
      $Res Function(_$_PaymentSummaryFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdDateFrom = null,
    Object? createdDateTo = null,
    Object? amountValueFrom = null,
    Object? amountValueTo = null,
    Object? filterStatuses = null,
  }) {
    return _then(_$_PaymentSummaryFilterDto(
      createdDateFrom: null == createdDateFrom
          ? _value.createdDateFrom
          : createdDateFrom // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTo: null == createdDateTo
          ? _value.createdDateTo
          : createdDateTo // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueFrom: null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
      amountValueTo: null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatuses: null == filterStatuses
          ? _value.filterStatuses
          : filterStatuses // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentSummaryFilterDto extends _PaymentSummaryFilterDto {
  const _$_PaymentSummaryFilterDto(
      {@JsonKey(name: 'createdDateFrom', defaultValue: '')
      required this.createdDateFrom,
      @JsonKey(name: 'createdDateTo', defaultValue: '')
      required this.createdDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      required this.amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '')
      required this.amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      required this.filterStatuses})
      : super._();

  factory _$_PaymentSummaryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentSummaryFilterDtoFromJson(json);

  @override
  @JsonKey(name: 'createdDateFrom', defaultValue: '')
  final String createdDateFrom;
  @override
  @JsonKey(name: 'createdDateTo', defaultValue: '')
  final String createdDateTo;
  @override
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  final String amountValueFrom;
  @override
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  final String amountValueTo;
  @override
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  final String filterStatuses;

  @override
  String toString() {
    return 'PaymentSummaryFilterDto(createdDateFrom: $createdDateFrom, createdDateTo: $createdDateTo, amountValueFrom: $amountValueFrom, amountValueTo: $amountValueTo, filterStatuses: $filterStatuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryFilterDto &&
            (identical(other.createdDateFrom, createdDateFrom) ||
                other.createdDateFrom == createdDateFrom) &&
            (identical(other.createdDateTo, createdDateTo) ||
                other.createdDateTo == createdDateTo) &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom) &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo) &&
            (identical(other.filterStatuses, filterStatuses) ||
                other.filterStatuses == filterStatuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdDateFrom, createdDateTo,
      amountValueFrom, amountValueTo, filterStatuses);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryFilterDtoCopyWith<_$_PaymentSummaryFilterDto>
      get copyWith =>
          __$$_PaymentSummaryFilterDtoCopyWithImpl<_$_PaymentSummaryFilterDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentSummaryFilterDtoToJson(
      this,
    );
  }
}

abstract class _PaymentSummaryFilterDto extends PaymentSummaryFilterDto {
  const factory _PaymentSummaryFilterDto(
      {@JsonKey(name: 'createdDateFrom', defaultValue: '')
      required final String createdDateFrom,
      @JsonKey(name: 'createdDateTo', defaultValue: '')
      required final String createdDateTo,
      @JsonKey(name: 'amountValueFrom', defaultValue: '')
      required final String amountValueFrom,
      @JsonKey(name: 'amountValueTo', defaultValue: '')
      required final String amountValueTo,
      @JsonKey(name: 'filterStatuses', defaultValue: '')
      required final String filterStatuses}) = _$_PaymentSummaryFilterDto;
  const _PaymentSummaryFilterDto._() : super._();

  factory _PaymentSummaryFilterDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentSummaryFilterDto.fromJson;

  @override
  @JsonKey(name: 'createdDateFrom', defaultValue: '')
  String get createdDateFrom;
  @override
  @JsonKey(name: 'createdDateTo', defaultValue: '')
  String get createdDateTo;
  @override
  @JsonKey(name: 'amountValueFrom', defaultValue: '')
  String get amountValueFrom;
  @override
  @JsonKey(name: 'amountValueTo', defaultValue: '')
  String get amountValueTo;
  @override
  @JsonKey(name: 'filterStatuses', defaultValue: '')
  String get filterStatuses;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryFilterDtoCopyWith<_$_PaymentSummaryFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}
