// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentTerm {
  String get paymentTermCode => throw _privateConstructorUsedError;
  int get paymentTermRanking => throw _privateConstructorUsedError;
  String get paymentTermDescription => throw _privateConstructorUsedError;
  int get paymentTermSubranking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentTermCopyWith<PaymentTerm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermCopyWith<$Res> {
  factory $PaymentTermCopyWith(
          PaymentTerm value, $Res Function(PaymentTerm) then) =
      _$PaymentTermCopyWithImpl<$Res>;
  $Res call(
      {String paymentTermCode,
      int paymentTermRanking,
      String paymentTermDescription,
      int paymentTermSubranking});
}

/// @nodoc
class _$PaymentTermCopyWithImpl<$Res> implements $PaymentTermCopyWith<$Res> {
  _$PaymentTermCopyWithImpl(this._value, this._then);

  final PaymentTerm _value;
  // ignore: unused_field
  final $Res Function(PaymentTerm) _then;

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
abstract class _$$_PaymentTermCopyWith<$Res>
    implements $PaymentTermCopyWith<$Res> {
  factory _$$_PaymentTermCopyWith(
          _$_PaymentTerm value, $Res Function(_$_PaymentTerm) then) =
      __$$_PaymentTermCopyWithImpl<$Res>;
  @override
  $Res call(
      {String paymentTermCode,
      int paymentTermRanking,
      String paymentTermDescription,
      int paymentTermSubranking});
}

/// @nodoc
class __$$_PaymentTermCopyWithImpl<$Res> extends _$PaymentTermCopyWithImpl<$Res>
    implements _$$_PaymentTermCopyWith<$Res> {
  __$$_PaymentTermCopyWithImpl(
      _$_PaymentTerm _value, $Res Function(_$_PaymentTerm) _then)
      : super(_value, (v) => _then(v as _$_PaymentTerm));

  @override
  _$_PaymentTerm get _value => super._value as _$_PaymentTerm;

  @override
  $Res call({
    Object? paymentTermCode = freezed,
    Object? paymentTermRanking = freezed,
    Object? paymentTermDescription = freezed,
    Object? paymentTermSubranking = freezed,
  }) {
    return _then(_$_PaymentTerm(
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

class _$_PaymentTerm extends _PaymentTerm {
  const _$_PaymentTerm(
      {required this.paymentTermCode,
      required this.paymentTermRanking,
      required this.paymentTermDescription,
      required this.paymentTermSubranking})
      : super._();

  @override
  final String paymentTermCode;
  @override
  final int paymentTermRanking;
  @override
  final String paymentTermDescription;
  @override
  final int paymentTermSubranking;

  @override
  String toString() {
    return 'PaymentTerm(paymentTermCode: $paymentTermCode, paymentTermRanking: $paymentTermRanking, paymentTermDescription: $paymentTermDescription, paymentTermSubranking: $paymentTermSubranking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentTerm &&
            const DeepCollectionEquality()
                .equals(other.paymentTermCode, paymentTermCode) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermRanking, paymentTermRanking) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermDescription, paymentTermDescription) &&
            const DeepCollectionEquality()
                .equals(other.paymentTermSubranking, paymentTermSubranking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paymentTermCode),
      const DeepCollectionEquality().hash(paymentTermRanking),
      const DeepCollectionEquality().hash(paymentTermDescription),
      const DeepCollectionEquality().hash(paymentTermSubranking));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentTermCopyWith<_$_PaymentTerm> get copyWith =>
      __$$_PaymentTermCopyWithImpl<_$_PaymentTerm>(this, _$identity);
}

abstract class _PaymentTerm extends PaymentTerm {
  const factory _PaymentTerm(
      {required final String paymentTermCode,
      required final int paymentTermRanking,
      required final String paymentTermDescription,
      required final int paymentTermSubranking}) = _$_PaymentTerm;
  const _PaymentTerm._() : super._();

  @override
  String get paymentTermCode;
  @override
  int get paymentTermRanking;
  @override
  String get paymentTermDescription;
  @override
  int get paymentTermSubranking;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentTermCopyWith<_$_PaymentTerm> get copyWith =>
      throw _privateConstructorUsedError;
}
