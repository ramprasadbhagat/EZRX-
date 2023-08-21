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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnRequestAttachmentDto _$ReturnRequestAttachmentDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnRequestAttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestAttachmentDto {
  @JsonKey(name: 'path', defaultValue: '')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'size', defaultValue: 0)
  int get size => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'path', defaultValue: '') String path,
      @JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'size', defaultValue: 0) int size});
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
    Object? id = null,
    Object? name = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestAttachmentDtoCopyWith<$Res>
    implements $ReturnRequestAttachmentDtoCopyWith<$Res> {
  factory _$$_ReturnRequestAttachmentDtoCopyWith(
          _$_ReturnRequestAttachmentDto value,
          $Res Function(_$_ReturnRequestAttachmentDto) then) =
      __$$_ReturnRequestAttachmentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'path', defaultValue: '') String path,
      @JsonKey(name: 'id', defaultValue: 0) int id,
      @JsonKey(name: 'name', defaultValue: '') String name,
      @JsonKey(name: 'size', defaultValue: 0) int size});
}

/// @nodoc
class __$$_ReturnRequestAttachmentDtoCopyWithImpl<$Res>
    extends _$ReturnRequestAttachmentDtoCopyWithImpl<$Res,
        _$_ReturnRequestAttachmentDto>
    implements _$$_ReturnRequestAttachmentDtoCopyWith<$Res> {
  __$$_ReturnRequestAttachmentDtoCopyWithImpl(
      _$_ReturnRequestAttachmentDto _value,
      $Res Function(_$_ReturnRequestAttachmentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? id = null,
    Object? name = null,
    Object? size = null,
  }) {
    return _then(_$_ReturnRequestAttachmentDto(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnRequestAttachmentDto extends _ReturnRequestAttachmentDto {
  const _$_ReturnRequestAttachmentDto(
      {@JsonKey(name: 'path', defaultValue: '') required this.path,
      @JsonKey(name: 'id', defaultValue: 0) required this.id,
      @JsonKey(name: 'name', defaultValue: '') required this.name,
      @JsonKey(name: 'size', defaultValue: 0) required this.size})
      : super._();

  factory _$_ReturnRequestAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnRequestAttachmentDtoFromJson(json);

  @override
  @JsonKey(name: 'path', defaultValue: '')
  final String path;
  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @override
  @JsonKey(name: 'size', defaultValue: 0)
  final int size;

  @override
  String toString() {
    return 'ReturnRequestAttachmentDto(path: $path, id: $id, name: $name, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestAttachmentDto &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, id, name, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestAttachmentDtoCopyWith<_$_ReturnRequestAttachmentDto>
      get copyWith => __$$_ReturnRequestAttachmentDtoCopyWithImpl<
          _$_ReturnRequestAttachmentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnRequestAttachmentDtoToJson(
      this,
    );
  }
}

abstract class _ReturnRequestAttachmentDto extends ReturnRequestAttachmentDto {
  const factory _ReturnRequestAttachmentDto(
          {@JsonKey(name: 'path', defaultValue: '') required final String path,
          @JsonKey(name: 'id', defaultValue: 0) required final int id,
          @JsonKey(name: 'name', defaultValue: '') required final String name,
          @JsonKey(name: 'size', defaultValue: 0) required final int size}) =
      _$_ReturnRequestAttachmentDto;
  const _ReturnRequestAttachmentDto._() : super._();

  factory _ReturnRequestAttachmentDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnRequestAttachmentDto.fromJson;

  @override
  @JsonKey(name: 'path', defaultValue: '')
  String get path;
  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(name: 'size', defaultValue: 0)
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestAttachmentDtoCopyWith<_$_ReturnRequestAttachmentDto>
      get copyWith => throw _privateConstructorUsedError;
}
