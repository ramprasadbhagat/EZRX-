// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tr_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TRObject {
  String get message => throw _privateConstructorUsedError;
  Map<String, String> get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TRObjectCopyWith<TRObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TRObjectCopyWith<$Res> {
  factory $TRObjectCopyWith(TRObject value, $Res Function(TRObject) then) =
      _$TRObjectCopyWithImpl<$Res, TRObject>;
  @useResult
  $Res call({String message, Map<String, String> arguments});
}

/// @nodoc
class _$TRObjectCopyWithImpl<$Res, $Val extends TRObject>
    implements $TRObjectCopyWith<$Res> {
  _$TRObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TRObjectCopyWith<$Res> implements $TRObjectCopyWith<$Res> {
  factory _$$_TRObjectCopyWith(
          _$_TRObject value, $Res Function(_$_TRObject) then) =
      __$$_TRObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, String> arguments});
}

/// @nodoc
class __$$_TRObjectCopyWithImpl<$Res>
    extends _$TRObjectCopyWithImpl<$Res, _$_TRObject>
    implements _$$_TRObjectCopyWith<$Res> {
  __$$_TRObjectCopyWithImpl(
      _$_TRObject _value, $Res Function(_$_TRObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? arguments = null,
  }) {
    return _then(_$_TRObject(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value._arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_TRObject extends _TRObject {
  const _$_TRObject(this.message,
      {final Map<String, String> arguments = const <String, String>{}})
      : _arguments = arguments,
        super._();

  @override
  final String message;
  final Map<String, String> _arguments;
  @override
  @JsonKey()
  Map<String, String> get arguments {
    if (_arguments is EqualUnmodifiableMapView) return _arguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_arguments);
  }

  @override
  String toString() {
    return 'TRObject(message: $message, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TRObject &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._arguments, _arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_arguments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TRObjectCopyWith<_$_TRObject> get copyWith =>
      __$$_TRObjectCopyWithImpl<_$_TRObject>(this, _$identity);
}

abstract class _TRObject extends TRObject {
  const factory _TRObject(final String message,
      {final Map<String, String> arguments}) = _$_TRObject;
  const _TRObject._() : super._();

  @override
  String get message;
  @override
  Map<String, String> get arguments;
  @override
  @JsonKey(ignore: true)
  _$$_TRObjectCopyWith<_$_TRObject> get copyWith =>
      throw _privateConstructorUsedError;
}
