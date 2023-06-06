// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_advice_header_logo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentAdviceHeaderLogoDto _$PaymentAdviceHeaderLogoDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentAdviceHeaderLogoDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentAdviceHeaderLogoDto {
  @JsonKey(name: 'url', defaultValue: '')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'filename', defaultValue: '')
  String get fileName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentAdviceHeaderLogoDtoCopyWith<PaymentAdviceHeaderLogoDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAdviceHeaderLogoDtoCopyWith<$Res> {
  factory $PaymentAdviceHeaderLogoDtoCopyWith(PaymentAdviceHeaderLogoDto value,
          $Res Function(PaymentAdviceHeaderLogoDto) then) =
      _$PaymentAdviceHeaderLogoDtoCopyWithImpl<$Res,
          PaymentAdviceHeaderLogoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '') String url,
      @JsonKey(name: 'filename', defaultValue: '') String fileName});
}

/// @nodoc
class _$PaymentAdviceHeaderLogoDtoCopyWithImpl<$Res,
        $Val extends PaymentAdviceHeaderLogoDto>
    implements $PaymentAdviceHeaderLogoDtoCopyWith<$Res> {
  _$PaymentAdviceHeaderLogoDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_PaymentAdviceHeaderLogoDtoCopyWith<$Res>
    implements $PaymentAdviceHeaderLogoDtoCopyWith<$Res> {
  factory _$$_PaymentAdviceHeaderLogoDtoCopyWith(
          _$_PaymentAdviceHeaderLogoDto value,
          $Res Function(_$_PaymentAdviceHeaderLogoDto) then) =
      __$$_PaymentAdviceHeaderLogoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '') String url,
      @JsonKey(name: 'filename', defaultValue: '') String fileName});
}

/// @nodoc
class __$$_PaymentAdviceHeaderLogoDtoCopyWithImpl<$Res>
    extends _$PaymentAdviceHeaderLogoDtoCopyWithImpl<$Res,
        _$_PaymentAdviceHeaderLogoDto>
    implements _$$_PaymentAdviceHeaderLogoDtoCopyWith<$Res> {
  __$$_PaymentAdviceHeaderLogoDtoCopyWithImpl(
      _$_PaymentAdviceHeaderLogoDto _value,
      $Res Function(_$_PaymentAdviceHeaderLogoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
  }) {
    return _then(_$_PaymentAdviceHeaderLogoDto(
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
@JsonSerializable()
class _$_PaymentAdviceHeaderLogoDto extends _PaymentAdviceHeaderLogoDto {
  _$_PaymentAdviceHeaderLogoDto(
      {@JsonKey(name: 'url', defaultValue: '') required this.url,
      @JsonKey(name: 'filename', defaultValue: '') required this.fileName})
      : super._();

  factory _$_PaymentAdviceHeaderLogoDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentAdviceHeaderLogoDtoFromJson(json);

  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String url;
  @override
  @JsonKey(name: 'filename', defaultValue: '')
  final String fileName;

  @override
  String toString() {
    return 'PaymentAdviceHeaderLogoDto(url: $url, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentAdviceHeaderLogoDto &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentAdviceHeaderLogoDtoCopyWith<_$_PaymentAdviceHeaderLogoDto>
      get copyWith => __$$_PaymentAdviceHeaderLogoDtoCopyWithImpl<
          _$_PaymentAdviceHeaderLogoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentAdviceHeaderLogoDtoToJson(
      this,
    );
  }
}

abstract class _PaymentAdviceHeaderLogoDto extends PaymentAdviceHeaderLogoDto {
  factory _PaymentAdviceHeaderLogoDto(
      {@JsonKey(name: 'url', defaultValue: '')
          required final String url,
      @JsonKey(name: 'filename', defaultValue: '')
          required final String fileName}) = _$_PaymentAdviceHeaderLogoDto;
  _PaymentAdviceHeaderLogoDto._() : super._();

  factory _PaymentAdviceHeaderLogoDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentAdviceHeaderLogoDto.fromJson;

  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get url;
  @override
  @JsonKey(name: 'filename', defaultValue: '')
  String get fileName;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentAdviceHeaderLogoDtoCopyWith<_$_PaymentAdviceHeaderLogoDto>
      get copyWith => throw _privateConstructorUsedError;
}
