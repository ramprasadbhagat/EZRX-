// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnAttachmentDto _$ReturnAttachmentDtoFromJson(Map<String, dynamic> json) {
  return _ReturnAttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnAttachmentDto {
  @JsonKey(name: 'fileName', defaultValue: '')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileUrl', defaultValue: '')
  String get fileUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnAttachmentDtoCopyWith<ReturnAttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnAttachmentDtoCopyWith<$Res> {
  factory $ReturnAttachmentDtoCopyWith(
          ReturnAttachmentDto value, $Res Function(ReturnAttachmentDto) then) =
      _$ReturnAttachmentDtoCopyWithImpl<$Res, ReturnAttachmentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fileName', defaultValue: '') String fileName,
      @JsonKey(name: 'fileUrl', defaultValue: '') String fileUrl});
}

/// @nodoc
class _$ReturnAttachmentDtoCopyWithImpl<$Res, $Val extends ReturnAttachmentDto>
    implements $ReturnAttachmentDtoCopyWith<$Res> {
  _$ReturnAttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileUrl = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnAttachmentDtoCopyWith<$Res>
    implements $ReturnAttachmentDtoCopyWith<$Res> {
  factory _$$_ReturnAttachmentDtoCopyWith(_$_ReturnAttachmentDto value,
          $Res Function(_$_ReturnAttachmentDto) then) =
      __$$_ReturnAttachmentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fileName', defaultValue: '') String fileName,
      @JsonKey(name: 'fileUrl', defaultValue: '') String fileUrl});
}

/// @nodoc
class __$$_ReturnAttachmentDtoCopyWithImpl<$Res>
    extends _$ReturnAttachmentDtoCopyWithImpl<$Res, _$_ReturnAttachmentDto>
    implements _$$_ReturnAttachmentDtoCopyWith<$Res> {
  __$$_ReturnAttachmentDtoCopyWithImpl(_$_ReturnAttachmentDto _value,
      $Res Function(_$_ReturnAttachmentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileUrl = null,
  }) {
    return _then(_$_ReturnAttachmentDto(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnAttachmentDto extends _ReturnAttachmentDto {
  const _$_ReturnAttachmentDto(
      {@JsonKey(name: 'fileName', defaultValue: '') required this.fileName,
      @JsonKey(name: 'fileUrl', defaultValue: '') required this.fileUrl})
      : super._();

  factory _$_ReturnAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnAttachmentDtoFromJson(json);

  @override
  @JsonKey(name: 'fileName', defaultValue: '')
  final String fileName;
  @override
  @JsonKey(name: 'fileUrl', defaultValue: '')
  final String fileUrl;

  @override
  String toString() {
    return 'ReturnAttachmentDto(fileName: $fileName, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnAttachmentDto &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnAttachmentDtoCopyWith<_$_ReturnAttachmentDto> get copyWith =>
      __$$_ReturnAttachmentDtoCopyWithImpl<_$_ReturnAttachmentDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnAttachmentDtoToJson(
      this,
    );
  }
}

abstract class _ReturnAttachmentDto extends ReturnAttachmentDto {
  const factory _ReturnAttachmentDto(
      {@JsonKey(name: 'fileName', defaultValue: '')
      required final String fileName,
      @JsonKey(name: 'fileUrl', defaultValue: '')
      required final String fileUrl}) = _$_ReturnAttachmentDto;
  const _ReturnAttachmentDto._() : super._();

  factory _ReturnAttachmentDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnAttachmentDto.fromJson;

  @override
  @JsonKey(name: 'fileName', defaultValue: '')
  String get fileName;
  @override
  @JsonKey(name: 'fileUrl', defaultValue: '')
  String get fileUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnAttachmentDtoCopyWith<_$_ReturnAttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}
