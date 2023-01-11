// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_po_document_buffer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PoDocumentsBuffer {
  Uint8List get buffer => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoDocumentsBufferCopyWith<PoDocumentsBuffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoDocumentsBufferCopyWith<$Res> {
  factory $PoDocumentsBufferCopyWith(
          PoDocumentsBuffer value, $Res Function(PoDocumentsBuffer) then) =
      _$PoDocumentsBufferCopyWithImpl<$Res, PoDocumentsBuffer>;
  @useResult
  $Res call({Uint8List buffer, String name});
}

/// @nodoc
class _$PoDocumentsBufferCopyWithImpl<$Res, $Val extends PoDocumentsBuffer>
    implements $PoDocumentsBufferCopyWith<$Res> {
  _$PoDocumentsBufferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buffer = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      buffer: null == buffer
          ? _value.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PoDocumentsBufferCopyWith<$Res>
    implements $PoDocumentsBufferCopyWith<$Res> {
  factory _$$_PoDocumentsBufferCopyWith(_$_PoDocumentsBuffer value,
          $Res Function(_$_PoDocumentsBuffer) then) =
      __$$_PoDocumentsBufferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List buffer, String name});
}

/// @nodoc
class __$$_PoDocumentsBufferCopyWithImpl<$Res>
    extends _$PoDocumentsBufferCopyWithImpl<$Res, _$_PoDocumentsBuffer>
    implements _$$_PoDocumentsBufferCopyWith<$Res> {
  __$$_PoDocumentsBufferCopyWithImpl(
      _$_PoDocumentsBuffer _value, $Res Function(_$_PoDocumentsBuffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buffer = null,
    Object? name = null,
  }) {
    return _then(_$_PoDocumentsBuffer(
      buffer: null == buffer
          ? _value.buffer
          : buffer // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PoDocumentsBuffer extends _PoDocumentsBuffer
    with DiagnosticableTreeMixin {
  _$_PoDocumentsBuffer({required this.buffer, required this.name}) : super._();

  @override
  final Uint8List buffer;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PoDocumentsBuffer(buffer: $buffer, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PoDocumentsBuffer'))
      ..add(DiagnosticsProperty('buffer', buffer))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PoDocumentsBuffer &&
            const DeepCollectionEquality().equals(other.buffer, buffer) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(buffer), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PoDocumentsBufferCopyWith<_$_PoDocumentsBuffer> get copyWith =>
      __$$_PoDocumentsBufferCopyWithImpl<_$_PoDocumentsBuffer>(
          this, _$identity);
}

abstract class _PoDocumentsBuffer extends PoDocumentsBuffer {
  factory _PoDocumentsBuffer(
      {required final Uint8List buffer,
      required final String name}) = _$_PoDocumentsBuffer;
  _PoDocumentsBuffer._() : super._();

  @override
  Uint8List get buffer;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PoDocumentsBufferCopyWith<_$_PoDocumentsBuffer> get copyWith =>
      throw _privateConstructorUsedError;
}
