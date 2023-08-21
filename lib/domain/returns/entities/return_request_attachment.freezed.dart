// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnRequestAttachment {
  int get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  FileSize get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnRequestAttachmentCopyWith<ReturnRequestAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestAttachmentCopyWith<$Res> {
  factory $ReturnRequestAttachmentCopyWith(ReturnRequestAttachment value,
          $Res Function(ReturnRequestAttachment) then) =
      _$ReturnRequestAttachmentCopyWithImpl<$Res, ReturnRequestAttachment>;
  @useResult
  $Res call({int id, String path, String name, FileSize size});
}

/// @nodoc
class _$ReturnRequestAttachmentCopyWithImpl<$Res,
        $Val extends ReturnRequestAttachment>
    implements $ReturnRequestAttachmentCopyWith<$Res> {
  _$ReturnRequestAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? name = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FileSize,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestAttachmentCopyWith<$Res>
    implements $ReturnRequestAttachmentCopyWith<$Res> {
  factory _$$_ReturnRequestAttachmentCopyWith(_$_ReturnRequestAttachment value,
          $Res Function(_$_ReturnRequestAttachment) then) =
      __$$_ReturnRequestAttachmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String path, String name, FileSize size});
}

/// @nodoc
class __$$_ReturnRequestAttachmentCopyWithImpl<$Res>
    extends _$ReturnRequestAttachmentCopyWithImpl<$Res,
        _$_ReturnRequestAttachment>
    implements _$$_ReturnRequestAttachmentCopyWith<$Res> {
  __$$_ReturnRequestAttachmentCopyWithImpl(_$_ReturnRequestAttachment _value,
      $Res Function(_$_ReturnRequestAttachment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? name = null,
    Object? size = null,
  }) {
    return _then(_$_ReturnRequestAttachment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FileSize,
    ));
  }
}

/// @nodoc

class _$_ReturnRequestAttachment extends _ReturnRequestAttachment {
  _$_ReturnRequestAttachment(
      {required this.id,
      required this.path,
      required this.name,
      required this.size})
      : super._();

  @override
  final int id;
  @override
  final String path;
  @override
  final String name;
  @override
  final FileSize size;

  @override
  String toString() {
    return 'ReturnRequestAttachment(id: $id, path: $path, name: $name, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestAttachment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, path, name, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestAttachmentCopyWith<_$_ReturnRequestAttachment>
      get copyWith =>
          __$$_ReturnRequestAttachmentCopyWithImpl<_$_ReturnRequestAttachment>(
              this, _$identity);
}

abstract class _ReturnRequestAttachment extends ReturnRequestAttachment {
  factory _ReturnRequestAttachment(
      {required final int id,
      required final String path,
      required final String name,
      required final FileSize size}) = _$_ReturnRequestAttachment;
  _ReturnRequestAttachment._() : super._();

  @override
  int get id;
  @override
  String get path;
  @override
  String get name;
  @override
  FileSize get size;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestAttachmentCopyWith<_$_ReturnRequestAttachment>
      get copyWith => throw _privateConstructorUsedError;
}
