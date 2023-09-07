// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_value_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KeyValuePair {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  Key get widgetKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyValuePairCopyWith<KeyValuePair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyValuePairCopyWith<$Res> {
  factory $KeyValuePairCopyWith(
          KeyValuePair value, $Res Function(KeyValuePair) then) =
      _$KeyValuePairCopyWithImpl<$Res, KeyValuePair>;
  @useResult
  $Res call({String key, String value, Key widgetKey});
}

/// @nodoc
class _$KeyValuePairCopyWithImpl<$Res, $Val extends KeyValuePair>
    implements $KeyValuePairCopyWith<$Res> {
  _$KeyValuePairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? widgetKey = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeyValuePairCopyWith<$Res>
    implements $KeyValuePairCopyWith<$Res> {
  factory _$$_KeyValuePairCopyWith(
          _$_KeyValuePair value, $Res Function(_$_KeyValuePair) then) =
      __$$_KeyValuePairCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String value, Key widgetKey});
}

/// @nodoc
class __$$_KeyValuePairCopyWithImpl<$Res>
    extends _$KeyValuePairCopyWithImpl<$Res, _$_KeyValuePair>
    implements _$$_KeyValuePairCopyWith<$Res> {
  __$$_KeyValuePairCopyWithImpl(
      _$_KeyValuePair _value, $Res Function(_$_KeyValuePair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? widgetKey = null,
  }) {
    return _then(_$_KeyValuePair(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as Key,
    ));
  }
}

/// @nodoc

class _$_KeyValuePair extends _KeyValuePair with DiagnosticableTreeMixin {
  _$_KeyValuePair(
      {required this.key, required this.value, required this.widgetKey})
      : super._();

  @override
  final String key;
  @override
  final String value;
  @override
  final Key widgetKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeyValuePair(key: $key, value: $value, widgetKey: $widgetKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeyValuePair'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('widgetKey', widgetKey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyValuePair &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.widgetKey, widgetKey) ||
                other.widgetKey == widgetKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, value, widgetKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeyValuePairCopyWith<_$_KeyValuePair> get copyWith =>
      __$$_KeyValuePairCopyWithImpl<_$_KeyValuePair>(this, _$identity);
}

abstract class _KeyValuePair extends KeyValuePair {
  factory _KeyValuePair(
      {required final String key,
      required final String value,
      required final Key widgetKey}) = _$_KeyValuePair;
  _KeyValuePair._() : super._();

  @override
  String get key;
  @override
  String get value;
  @override
  Key get widgetKey;
  @override
  @JsonKey(ignore: true)
  _$$_KeyValuePairCopyWith<_$_KeyValuePair> get copyWith =>
      throw _privateConstructorUsedError;
}
