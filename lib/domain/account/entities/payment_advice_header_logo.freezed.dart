// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_advice_header_logo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentAdviceHeaderLogo {
  String get url => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentAdviceHeaderLogoCopyWith<PaymentAdviceHeaderLogo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAdviceHeaderLogoCopyWith<$Res> {
  factory $PaymentAdviceHeaderLogoCopyWith(PaymentAdviceHeaderLogo value,
          $Res Function(PaymentAdviceHeaderLogo) then) =
      _$PaymentAdviceHeaderLogoCopyWithImpl<$Res, PaymentAdviceHeaderLogo>;
  @useResult
  $Res call({String url, String fileName});
}

/// @nodoc
class _$PaymentAdviceHeaderLogoCopyWithImpl<$Res,
        $Val extends PaymentAdviceHeaderLogo>
    implements $PaymentAdviceHeaderLogoCopyWith<$Res> {
  _$PaymentAdviceHeaderLogoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentAdviceHeaderLogoCopyWith<$Res>
    implements $PaymentAdviceHeaderLogoCopyWith<$Res> {
  factory _$$_PaymentAdviceHeaderLogoCopyWith(_$_PaymentAdviceHeaderLogo value,
          $Res Function(_$_PaymentAdviceHeaderLogo) then) =
      __$$_PaymentAdviceHeaderLogoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String fileName});
}

/// @nodoc
class __$$_PaymentAdviceHeaderLogoCopyWithImpl<$Res>
    extends _$PaymentAdviceHeaderLogoCopyWithImpl<$Res,
        _$_PaymentAdviceHeaderLogo>
    implements _$$_PaymentAdviceHeaderLogoCopyWith<$Res> {
  __$$_PaymentAdviceHeaderLogoCopyWithImpl(_$_PaymentAdviceHeaderLogo _value,
      $Res Function(_$_PaymentAdviceHeaderLogo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
  }) {
    return _then(_$_PaymentAdviceHeaderLogo(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PaymentAdviceHeaderLogo implements _PaymentAdviceHeaderLogo {
  _$_PaymentAdviceHeaderLogo({required this.url, required this.fileName});

  @override
  final String url;
  @override
  final String fileName;

  @override
  String toString() {
    return 'PaymentAdviceHeaderLogo(url: $url, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentAdviceHeaderLogo &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentAdviceHeaderLogoCopyWith<_$_PaymentAdviceHeaderLogo>
      get copyWith =>
          __$$_PaymentAdviceHeaderLogoCopyWithImpl<_$_PaymentAdviceHeaderLogo>(
              this, _$identity);
}

abstract class _PaymentAdviceHeaderLogo implements PaymentAdviceHeaderLogo {
  factory _PaymentAdviceHeaderLogo(
      {required final String url,
      required final String fileName}) = _$_PaymentAdviceHeaderLogo;

  @override
  String get url;
  @override
  String get fileName;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentAdviceHeaderLogoCopyWith<_$_PaymentAdviceHeaderLogo>
      get copyWith => throw _privateConstructorUsedError;
}
