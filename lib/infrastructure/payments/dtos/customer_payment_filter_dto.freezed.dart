// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerPaymentFilterDto _$CustomerPaymentFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerPaymentFilterDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerPaymentFilterDto {
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  String get createdDateToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  String get createdDateYesterday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPaymentFilterDtoCopyWith<CustomerPaymentFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPaymentFilterDtoCopyWith<$Res> {
  factory $CustomerPaymentFilterDtoCopyWith(CustomerPaymentFilterDto value,
          $Res Function(CustomerPaymentFilterDto) then) =
      _$CustomerPaymentFilterDtoCopyWithImpl<$Res, CustomerPaymentFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      String createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      String createdDateYesterday});
}

/// @nodoc
class _$CustomerPaymentFilterDtoCopyWithImpl<$Res,
        $Val extends CustomerPaymentFilterDto>
    implements $CustomerPaymentFilterDtoCopyWith<$Res> {
  _$CustomerPaymentFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentBatchAdditionalInfo = null,
    Object? createdDateToday = null,
    Object? createdDateYesterday = null,
  }) {
    return _then(_value.copyWith(
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateToday: null == createdDateToday
          ? _value.createdDateToday
          : createdDateToday // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateYesterday: null == createdDateYesterday
          ? _value.createdDateYesterday
          : createdDateYesterday // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerPaymentFilterDtoCopyWith<$Res>
    implements $CustomerPaymentFilterDtoCopyWith<$Res> {
  factory _$$_CustomerPaymentFilterDtoCopyWith(
          _$_CustomerPaymentFilterDto value,
          $Res Function(_$_CustomerPaymentFilterDto) then) =
      __$$_CustomerPaymentFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      String createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      String createdDateYesterday});
}

/// @nodoc
class __$$_CustomerPaymentFilterDtoCopyWithImpl<$Res>
    extends _$CustomerPaymentFilterDtoCopyWithImpl<$Res,
        _$_CustomerPaymentFilterDto>
    implements _$$_CustomerPaymentFilterDtoCopyWith<$Res> {
  __$$_CustomerPaymentFilterDtoCopyWithImpl(_$_CustomerPaymentFilterDto _value,
      $Res Function(_$_CustomerPaymentFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentBatchAdditionalInfo = null,
    Object? createdDateToday = null,
    Object? createdDateYesterday = null,
  }) {
    return _then(_$_CustomerPaymentFilterDto(
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateToday: null == createdDateToday
          ? _value.createdDateToday
          : createdDateToday // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateYesterday: null == createdDateYesterday
          ? _value.createdDateYesterday
          : createdDateYesterday // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerPaymentFilterDto extends _CustomerPaymentFilterDto {
  const _$_CustomerPaymentFilterDto(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required this.paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      required this.createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      required this.createdDateYesterday})
      : super._();

  factory _$_CustomerPaymentFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerPaymentFilterDtoFromJson(json);

  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  final String paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  final String createdDateToday;
  @override
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  final String createdDateYesterday;

  @override
  String toString() {
    return 'CustomerPaymentFilterDto(paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, createdDateToday: $createdDateToday, createdDateYesterday: $createdDateYesterday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerPaymentFilterDto &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            (identical(other.createdDateToday, createdDateToday) ||
                other.createdDateToday == createdDateToday) &&
            (identical(other.createdDateYesterday, createdDateYesterday) ||
                other.createdDateYesterday == createdDateYesterday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentBatchAdditionalInfo,
      createdDateToday, createdDateYesterday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerPaymentFilterDtoCopyWith<_$_CustomerPaymentFilterDto>
      get copyWith => __$$_CustomerPaymentFilterDtoCopyWithImpl<
          _$_CustomerPaymentFilterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerPaymentFilterDtoToJson(
      this,
    );
  }
}

abstract class _CustomerPaymentFilterDto extends CustomerPaymentFilterDto {
  const factory _CustomerPaymentFilterDto(
          {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
          required final String paymentBatchAdditionalInfo,
          @JsonKey(name: 'createdDateToday', defaultValue: '')
          required final String createdDateToday,
          @JsonKey(name: 'createdDateYesterday', defaultValue: '')
          required final String createdDateYesterday}) =
      _$_CustomerPaymentFilterDto;
  const _CustomerPaymentFilterDto._() : super._();

  factory _CustomerPaymentFilterDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerPaymentFilterDto.fromJson;

  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  String get createdDateToday;
  @override
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  String get createdDateYesterday;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerPaymentFilterDtoCopyWith<_$_CustomerPaymentFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}
