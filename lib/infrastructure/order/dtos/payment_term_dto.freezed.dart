// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_term_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentTermDto _$PaymentTermDtoFromJson(Map<String, dynamic> json) {
  return _PaymentTermDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentTermDto {
  @JsonKey(name: 'paymentTermCode')
  String get paymentTermCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermRanking')
  int get paymentTermRanking => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermDescription')
  String get paymentTermDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermSubranking')
  int get paymentTermSubranking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentTermDtoCopyWith<PaymentTermDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermDtoCopyWith<$Res> {
  factory $PaymentTermDtoCopyWith(
          PaymentTermDto value, $Res Function(PaymentTermDto) then) =
      _$PaymentTermDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'paymentTermCode') String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking') int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription') String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking') int paymentTermSubranking});
}

/// @nodoc
class _$PaymentTermDtoCopyWithImpl<$Res>
    implements $PaymentTermDtoCopyWith<$Res> {
  _$PaymentTermDtoCopyWithImpl(this._value, this._then);

  final PaymentTermDto _value;
  // ignore: unused_field
  final $Res Function(PaymentTermDto) _then;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermRanking = freezed,
    Object? paymentTermDescription = freezed,
    Object? paymentTermSubranking = freezed,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: paymentTermRanking == freezed
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: paymentTermSubranking == freezed
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentTermDtoCopyWith<$Res>
    implements $PaymentTermDtoCopyWith<$Res> {
  factory _$$_PaymentTermDtoCopyWith(
          _$_PaymentTermDto value, $Res Function(_$_PaymentTermDto) then) =
      __$$_PaymentTermDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'paymentTermCode') String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking') int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription') String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking') int paymentTermSubranking});
}

/// @nodoc
class __$$_PaymentTermDtoCopyWithImpl<$Res>
    extends _$PaymentTermDtoCopyWithImpl<$Res>
    implements _$$_PaymentTermDtoCopyWith<$Res> {
  __$$_PaymentTermDtoCopyWithImpl(
      _$_PaymentTermDto _value, $Res Function(_$_PaymentTermDto) _then)
      : super(_value, (v) => _then(v as _$_PaymentTermDto));

  @override
  _$_PaymentTermDto get _value => super._value as _$_PaymentTermDto;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermRanking = freezed,
    Object? paymentTermDescription = freezed,
    Object? paymentTermSubranking = freezed,
  }) {
    return _then(_$_PaymentTermDto(
      paymentTermCode: paymentTermCode == freezed
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: paymentTermRanking == freezed
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: paymentTermDescription == freezed
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: paymentTermSubranking == freezed
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentTermDto extends _PaymentTermDto {
  const _$_PaymentTermDto(
      {@JsonKey(name: 'paymentTermCode')
          required this.paymentTermCode,
      @JsonKey(name: 'paymentTermRanking')
          required this.paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription')
          required this.paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking')
          required this.paymentTermSubranking})
      : super._();

  factory _$_PaymentTermDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentTermDtoFromJson(json);

  @override
  @JsonKey(name: 'paymentTermCode')
  final String paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermRanking')
  final int paymentTermRanking;
  @override
  @JsonKey(name: 'paymentTermDescription')
  final String paymentTermDescription;
  @override
  @JsonKey(name: 'paymentTermSubranking')
  final int paymentTermSubranking;

  @override
  String toString() {
    return 'PaymentTermDto(paymentTermCode: $paymentTermCode, paymentTermRanking: $paymentTermRanking, paymentTermDescription: $paymentTermDescription, paymentTermSubranking: $paymentTermSubranking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentTermDto &&
            const DeepCollectionEquality()
                .equals(other.paymentTermCode, paymentTermCode) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermRanking, paymentTermRanking) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermDescription, paymentTermDescription) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermSubranking, paymentTermSubranking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentTermCode),
      const DeepCollectionEquality().hash(paymentTermRanking),
      const DeepCollectionEquality().hash(paymentTermDescription),
      const DeepCollectionEquality().hash(paymentTermSubranking));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentTermDtoCopyWith<_$_PaymentTermDto> get copyWith =>
      __$$_PaymentTermDtoCopyWithImpl<_$_PaymentTermDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentTermDtoToJson(
      this,
    );
  }
}

abstract class _PaymentTermDto extends PaymentTermDto {
  const factory _PaymentTermDto(
      {@JsonKey(name: 'paymentTermCode')
          required final String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking')
          required final int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription')
          required final String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking')
          required final int paymentTermSubranking}) = _$_PaymentTermDto;
  const _PaymentTermDto._() : super._();

  factory _PaymentTermDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentTermDto.fromJson;

  @override
  @JsonKey(name: 'paymentTermCode')
  String get paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermRanking')
  int get paymentTermRanking;
  @override
  @JsonKey(name: 'paymentTermDescription')
  String get paymentTermDescription;
  @override
  @JsonKey(name: 'paymentTermSubranking')
  int get paymentTermSubranking;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentTermDtoCopyWith<_$_PaymentTermDto> get copyWith =>
      throw _privateConstructorUsedError;
}
