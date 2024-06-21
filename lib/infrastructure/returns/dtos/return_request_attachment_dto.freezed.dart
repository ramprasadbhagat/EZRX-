// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnRequestAttachmentDto _$ReturnRequestAttachmentDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnRequestAttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestAttachmentDto {
  @JsonKey(name: 'url', defaultValue: '')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'filename', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestAttachmentDtoCopyWith<ReturnRequestAttachmentDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestAttachmentDtoCopyWith<$Res> {
  factory $ReturnRequestAttachmentDtoCopyWith(ReturnRequestAttachmentDto value,
          $Res Function(ReturnRequestAttachmentDto) then) =
      _$ReturnRequestAttachmentDtoCopyWithImpl<$Res,
          ReturnRequestAttachmentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '') String path,
      @JsonKey(name: 'filename', defaultValue: '') String name});
}

/// @nodoc
class _$ReturnRequestAttachmentDtoCopyWithImpl<$Res,
        $Val extends ReturnRequestAttachmentDto>
    implements $ReturnRequestAttachmentDtoCopyWith<$Res> {
  _$ReturnRequestAttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnRequestAttachmentDtoImplCopyWith<$Res>
    implements $ReturnRequestAttachmentDtoCopyWith<$Res> {
  factory _$$ReturnRequestAttachmentDtoImplCopyWith(
          _$ReturnRequestAttachmentDtoImpl value,
          $Res Function(_$ReturnRequestAttachmentDtoImpl) then) =
      __$$ReturnRequestAttachmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url', defaultValue: '') String path,
      @JsonKey(name: 'filename', defaultValue: '') String name});
}

/// @nodoc
class __$$ReturnRequestAttachmentDtoImplCopyWithImpl<$Res>
    extends _$ReturnRequestAttachmentDtoCopyWithImpl<$Res,
        _$ReturnRequestAttachmentDtoImpl>
    implements _$$ReturnRequestAttachmentDtoImplCopyWith<$Res> {
  __$$ReturnRequestAttachmentDtoImplCopyWithImpl(
      _$ReturnRequestAttachmentDtoImpl _value,
      $Res Function(_$ReturnRequestAttachmentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
  }) {
    return _then(_$ReturnRequestAttachmentDtoImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReturnRequestAttachmentDtoImpl extends _ReturnRequestAttachmentDto {
  const _$ReturnRequestAttachmentDtoImpl(
      {@JsonKey(name: 'url', defaultValue: '') required this.path,
      @JsonKey(name: 'filename', defaultValue: '') required this.name})
      : super._();

  factory _$ReturnRequestAttachmentDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReturnRequestAttachmentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'url', defaultValue: '')
  final String path;
  @override
  @JsonKey(name: 'filename', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'ReturnRequestAttachmentDto(path: $path, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestAttachmentDtoImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestAttachmentDtoImplCopyWith<_$ReturnRequestAttachmentDtoImpl>
      get copyWith => __$$ReturnRequestAttachmentDtoImplCopyWithImpl<
          _$ReturnRequestAttachmentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnRequestAttachmentDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnRequestAttachmentDto extends ReturnRequestAttachmentDto {
  const factory _ReturnRequestAttachmentDto(
      {@JsonKey(name: 'url', defaultValue: '') required final String path,
      @JsonKey(name: 'filename', defaultValue: '')
      required final String name}) = _$ReturnRequestAttachmentDtoImpl;
  const _ReturnRequestAttachmentDto._() : super._();

  factory _ReturnRequestAttachmentDto.fromJson(Map<String, dynamic> json) =
      _$ReturnRequestAttachmentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'url', defaultValue: '')
  String get path;
  @override
  @JsonKey(name: 'filename', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestAttachmentDtoImplCopyWith<_$ReturnRequestAttachmentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
