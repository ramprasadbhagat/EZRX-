// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_payment_attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DownloadPaymentAttachmentDto _$DownloadPaymentAttachmentDtoFromJson(
    Map<String, dynamic> json) {
  return _DownloadPaymentAttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$DownloadPaymentAttachmentDto {
  @JsonKey(name: 'url', defaultValue: '')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadPaymentAttachmentDtoCopyWith<DownloadPaymentAttachmentDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadPaymentAttachmentDtoCopyWith<$Res> {
  factory $DownloadPaymentAttachmentDtoCopyWith(
          DownloadPaymentAttachmentDto value,
          $Res Function(DownloadPaymentAttachmentDto) then) =
      _$DownloadPaymentAttachmentDtoCopyWithImpl<$Res,
          DownloadPaymentAttachmentDto>;
  @useResult
  $Res call({@JsonKey(name: 'url', defaultValue: '') String url});
}

/// @nodoc
class _$DownloadPaymentAttachmentDtoCopyWithImpl<$Res,
        $Val extends DownloadPaymentAttachmentDto>
    implements $DownloadPaymentAttachmentDtoCopyWith<$Res> {
  _$DownloadPaymentAttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DownloadPaymentAttachmentDtoCopyWith<$Res>
    implements $DownloadPaymentAttachmentDtoCopyWith<$Res> {
  factory _$$_DownloadPaymentAttachmentDtoCopyWith(
          _$_DownloadPaymentAttachmentDto value,
          $Res Function(_$_DownloadPaymentAttachmentDto) then) =
      __$$_DownloadPaymentAttachmentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'url', defaultValue: '') String url});
}

/// @nodoc
class __$$_DownloadPaymentAttachmentDtoCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentDtoCopyWithImpl<$Res,
        _$_DownloadPaymentAttachmentDto>
    implements _$$_DownloadPaymentAttachmentDtoCopyWith<$Res> {
  __$$_DownloadPaymentAttachmentDtoCopyWithImpl(
      _$_DownloadPaymentAttachmentDto _value,
      $Res Function(_$_DownloadPaymentAttachmentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_DownloadPaymentAttachmentDto(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DownloadPaymentAttachmentDto extends _DownloadPaymentAttachmentDto {
  const _$_DownloadPaymentAttachmentDto(
      {@JsonKey(name: 'url', defaultValue: '') required this.url})
      : super._();

  factory _$_DownloadPaymentAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$$_DownloadPaymentAttachmentDtoFromJson(json);

  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentDto(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadPaymentAttachmentDto &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadPaymentAttachmentDtoCopyWith<_$_DownloadPaymentAttachmentDto>
      get copyWith => __$$_DownloadPaymentAttachmentDtoCopyWithImpl<
          _$_DownloadPaymentAttachmentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DownloadPaymentAttachmentDtoToJson(
      this,
    );
  }
}

abstract class _DownloadPaymentAttachmentDto
    extends DownloadPaymentAttachmentDto {
  const factory _DownloadPaymentAttachmentDto(
          {@JsonKey(name: 'url', defaultValue: '') required final String url}) =
      _$_DownloadPaymentAttachmentDto;
  const _DownloadPaymentAttachmentDto._() : super._();

  factory _DownloadPaymentAttachmentDto.fromJson(Map<String, dynamic> json) =
      _$_DownloadPaymentAttachmentDto.fromJson;

  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadPaymentAttachmentDtoCopyWith<_$_DownloadPaymentAttachmentDto>
      get copyWith => throw _privateConstructorUsedError;
}
