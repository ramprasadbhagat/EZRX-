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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$PaymentInProgressDtoImplCopyWith<$Res>
    implements $PaymentInProgressDtoCopyWith<$Res> {
  factory _$$PaymentInProgressDtoImplCopyWith(_$PaymentInProgressDtoImpl value,
          $Res Function(_$PaymentInProgressDtoImpl) then) =
      __$$PaymentInProgressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'amount', defaultValue: '') String amount});
}

/// @nodoc
class __$$PaymentInProgressDtoImplCopyWithImpl<$Res>
    extends _$PaymentInProgressDtoCopyWithImpl<$Res, _$PaymentInProgressDtoImpl>
    implements _$$PaymentInProgressDtoImplCopyWith<$Res> {
  __$$PaymentInProgressDtoImplCopyWithImpl(_$PaymentInProgressDtoImpl _value,
      $Res Function(_$PaymentInProgressDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$PaymentInProgressDtoImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInProgressDtoImpl extends _PaymentInProgressDto {
  _$PaymentInProgressDtoImpl(
      {@JsonKey(name: 'amount', defaultValue: '') required this.amount})
      : super._();

  factory _$PaymentInProgressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInProgressDtoImplFromJson(json);

  @override
  @JsonKey(name: 'amount', defaultValue: '')
  final String amount;

  @override
  String toString() {
    return 'PaymentInProgressDto(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInProgressDtoImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInProgressDtoImplCopyWith<_$PaymentInProgressDtoImpl>
      get copyWith =>
          __$$PaymentInProgressDtoImplCopyWithImpl<_$PaymentInProgressDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInProgressDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInProgressDto extends PaymentInProgressDto {
  factory _PaymentInProgressDto(
      {@JsonKey(name: 'amount', defaultValue: '')
      required final String amount}) = _$PaymentInProgressDtoImpl;
  _PaymentInProgressDto._() : super._();

  factory _PaymentInProgressDto.fromJson(Map<String, dynamic> json) =
      _$PaymentInProgressDtoImpl.fromJson;

  @override
  @JsonKey(name: 'amount', defaultValue: '')
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInProgressDtoImplCopyWith<_$PaymentInProgressDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
