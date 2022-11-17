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
mixin _$OrderHistoryDetailsPoDocumentsBuffer {
  Uint8List get buffer => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsPoDocumentsBufferCopyWith<
          OrderHistoryDetailsPoDocumentsBuffer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPoDocumentsBufferCopyWith<$Res> {
  factory $OrderHistoryDetailsPoDocumentsBufferCopyWith(
          OrderHistoryDetailsPoDocumentsBuffer value,
          $Res Function(OrderHistoryDetailsPoDocumentsBuffer) then) =
      _$OrderHistoryDetailsPoDocumentsBufferCopyWithImpl<$Res,
          OrderHistoryDetailsPoDocumentsBuffer>;
  @useResult
  $Res call({Uint8List buffer, String name});
}

/// @nodoc
class _$OrderHistoryDetailsPoDocumentsBufferCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsPoDocumentsBuffer>
    implements $OrderHistoryDetailsPoDocumentsBufferCopyWith<$Res> {
  _$OrderHistoryDetailsPoDocumentsBufferCopyWithImpl(this._value, this._then);

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
abstract class _$$_OrderHistoryDetailspoDocumentsBufferCopyWith<$Res>
    implements $OrderHistoryDetailsPoDocumentsBufferCopyWith<$Res> {
  factory _$$_OrderHistoryDetailspoDocumentsBufferCopyWith(
          _$_OrderHistoryDetailspoDocumentsBuffer value,
          $Res Function(_$_OrderHistoryDetailspoDocumentsBuffer) then) =
      __$$_OrderHistoryDetailspoDocumentsBufferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List buffer, String name});
}

/// @nodoc
class __$$_OrderHistoryDetailspoDocumentsBufferCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPoDocumentsBufferCopyWithImpl<$Res,
        _$_OrderHistoryDetailspoDocumentsBuffer>
    implements _$$_OrderHistoryDetailspoDocumentsBufferCopyWith<$Res> {
  __$$_OrderHistoryDetailspoDocumentsBufferCopyWithImpl(
      _$_OrderHistoryDetailspoDocumentsBuffer _value,
      $Res Function(_$_OrderHistoryDetailspoDocumentsBuffer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buffer = null,
    Object? name = null,
  }) {
    return _then(_$_OrderHistoryDetailspoDocumentsBuffer(
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

class _$_OrderHistoryDetailspoDocumentsBuffer
    extends _OrderHistoryDetailspoDocumentsBuffer with DiagnosticableTreeMixin {
  _$_OrderHistoryDetailspoDocumentsBuffer(
      {required this.buffer, required this.name})
      : super._();

  @override
  final Uint8List buffer;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderHistoryDetailsPoDocumentsBuffer(buffer: $buffer, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderHistoryDetailsPoDocumentsBuffer'))
      ..add(DiagnosticsProperty('buffer', buffer))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailspoDocumentsBuffer &&
            const DeepCollectionEquality().equals(other.buffer, buffer) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(buffer), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailspoDocumentsBufferCopyWith<
          _$_OrderHistoryDetailspoDocumentsBuffer>
      get copyWith => __$$_OrderHistoryDetailspoDocumentsBufferCopyWithImpl<
          _$_OrderHistoryDetailspoDocumentsBuffer>(this, _$identity);
}

abstract class _OrderHistoryDetailspoDocumentsBuffer
    extends OrderHistoryDetailsPoDocumentsBuffer {
  factory _OrderHistoryDetailspoDocumentsBuffer(
      {required final Uint8List buffer,
      required final String name}) = _$_OrderHistoryDetailspoDocumentsBuffer;
  _OrderHistoryDetailspoDocumentsBuffer._() : super._();

  @override
  Uint8List get buffer;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailspoDocumentsBufferCopyWith<
          _$_OrderHistoryDetailspoDocumentsBuffer>
      get copyWith => throw _privateConstructorUsedError;
}
