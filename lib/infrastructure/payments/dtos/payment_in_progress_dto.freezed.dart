// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_in_progress_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentInProgressDto _$PaymentInProgressDtoFromJson(Map<String, dynamic> json) {
  return _PaymentInProgressDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentInProgressDto {
  @JsonKey(name: 'amount', defaultValue: '')
  String get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInProgressDtoCopyWith<PaymentInProgressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInProgressDtoCopyWith<$Res> {
  factory $PaymentInProgressDtoCopyWith(PaymentInProgressDto value,
          $Res Function(PaymentInProgressDto) then) =
      _$PaymentInProgressDtoCopyWithImpl<$Res, PaymentInProgressDto>;
  @useResult
  $Res call({@JsonKey(name: 'amount', defaultValue: '') String amount});
}

/// @nodoc
class _$PaymentInProgressDtoCopyWithImpl<$Res,
        $Val extends PaymentInProgressDto>
    implements $PaymentInProgressDtoCopyWith<$Res> {
  _$PaymentInProgressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentInProgressDtoCopyWith<$Res>
    implements $PaymentInProgressDtoCopyWith<$Res> {
  factory _$$_PaymentInProgressDtoCopyWith(_$_PaymentInProgressDto value,
          $Res Function(_$_PaymentInProgressDto) then) =
      __$$_PaymentInProgressDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'amount', defaultValue: '') String amount});
}

/// @nodoc
class __$$_PaymentInProgressDtoCopyWithImpl<$Res>
    extends _$PaymentInProgressDtoCopyWithImpl<$Res, _$_PaymentInProgressDto>
    implements _$$_PaymentInProgressDtoCopyWith<$Res> {
  __$$_PaymentInProgressDtoCopyWithImpl(_$_PaymentInProgressDto _value,
      $Res Function(_$_PaymentInProgressDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$_PaymentInProgressDto(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentInProgressDto extends _PaymentInProgressDto {
  _$_PaymentInProgressDto(
      {@JsonKey(name: 'amount', defaultValue: '') required this.amount})
      : super._();

  factory _$_PaymentInProgressDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentInProgressDtoFromJson(json);

  @override
  @JsonKey(name: 'amount', defaultValue: '')
  final String amount;

  @override
  String toString() {
    return 'PaymentInProgressDto(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentInProgressDto &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentInProgressDtoCopyWith<_$_PaymentInProgressDto> get copyWith =>
      __$$_PaymentInProgressDtoCopyWithImpl<_$_PaymentInProgressDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInProgressDtoToJson(
      this,
    );
  }
}

abstract class _PaymentInProgressDto extends PaymentInProgressDto {
  factory _PaymentInProgressDto(
      {@JsonKey(name: 'amount', defaultValue: '')
      required final String amount}) = _$_PaymentInProgressDto;
  _PaymentInProgressDto._() : super._();

  factory _PaymentInProgressDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentInProgressDto.fromJson;

  @override
  @JsonKey(name: 'amount', defaultValue: '')
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentInProgressDtoCopyWith<_$_PaymentInProgressDto> get copyWith =>
      throw _privateConstructorUsedError;
}
