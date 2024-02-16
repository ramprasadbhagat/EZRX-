// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mp_remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MPRemoteConfig {
  List<String> get whiteList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MPRemoteConfigCopyWith<MPRemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPRemoteConfigCopyWith<$Res> {
  factory $MPRemoteConfigCopyWith(
          MPRemoteConfig value, $Res Function(MPRemoteConfig) then) =
      _$MPRemoteConfigCopyWithImpl<$Res, MPRemoteConfig>;
  @useResult
  $Res call({List<String> whiteList});
}

/// @nodoc
class _$MPRemoteConfigCopyWithImpl<$Res, $Val extends MPRemoteConfig>
    implements $MPRemoteConfigCopyWith<$Res> {
  _$MPRemoteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_value.copyWith(
      whiteList: null == whiteList
          ? _value.whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MPRemoteConfigCopyWith<$Res>
    implements $MPRemoteConfigCopyWith<$Res> {
  factory _$$_MPRemoteConfigCopyWith(
          _$_MPRemoteConfig value, $Res Function(_$_MPRemoteConfig) then) =
      __$$_MPRemoteConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> whiteList});
}

/// @nodoc
class __$$_MPRemoteConfigCopyWithImpl<$Res>
    extends _$MPRemoteConfigCopyWithImpl<$Res, _$_MPRemoteConfig>
    implements _$$_MPRemoteConfigCopyWith<$Res> {
  __$$_MPRemoteConfigCopyWithImpl(
      _$_MPRemoteConfig _value, $Res Function(_$_MPRemoteConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_$_MPRemoteConfig(
      whiteList: null == whiteList
          ? _value._whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_MPRemoteConfig extends _MPRemoteConfig {
  const _$_MPRemoteConfig({required final List<String> whiteList})
      : _whiteList = whiteList,
        super._();

  final List<String> _whiteList;
  @override
  List<String> get whiteList {
    if (_whiteList is EqualUnmodifiableListView) return _whiteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whiteList);
  }

  @override
  String toString() {
    return 'MPRemoteConfig(whiteList: $whiteList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MPRemoteConfig &&
            const DeepCollectionEquality()
                .equals(other._whiteList, _whiteList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_whiteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MPRemoteConfigCopyWith<_$_MPRemoteConfig> get copyWith =>
      __$$_MPRemoteConfigCopyWithImpl<_$_MPRemoteConfig>(this, _$identity);
}

abstract class _MPRemoteConfig extends MPRemoteConfig {
  const factory _MPRemoteConfig({required final List<String> whiteList}) =
      _$_MPRemoteConfig;
  const _MPRemoteConfig._() : super._();

  @override
  List<String> get whiteList;
  @override
  @JsonKey(ignore: true)
  _$$_MPRemoteConfigCopyWith<_$_MPRemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
