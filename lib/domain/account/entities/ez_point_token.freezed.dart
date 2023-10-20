// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ez_point_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EZPointToken {
  String get ezPointToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EZPointTokenCopyWith<EZPointToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EZPointTokenCopyWith<$Res> {
  factory $EZPointTokenCopyWith(
          EZPointToken value, $Res Function(EZPointToken) then) =
      _$EZPointTokenCopyWithImpl<$Res, EZPointToken>;
  @useResult
  $Res call({String ezPointToken});
}

/// @nodoc
class _$EZPointTokenCopyWithImpl<$Res, $Val extends EZPointToken>
    implements $EZPointTokenCopyWith<$Res> {
  _$EZPointTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ezPointToken = null,
  }) {
    return _then(_value.copyWith(
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EZPointTokenCopyWith<$Res>
    implements $EZPointTokenCopyWith<$Res> {
  factory _$$_EZPointTokenCopyWith(
          _$_EZPointToken value, $Res Function(_$_EZPointToken) then) =
      __$$_EZPointTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ezPointToken});
}

/// @nodoc
class __$$_EZPointTokenCopyWithImpl<$Res>
    extends _$EZPointTokenCopyWithImpl<$Res, _$_EZPointToken>
    implements _$$_EZPointTokenCopyWith<$Res> {
  __$$_EZPointTokenCopyWithImpl(
      _$_EZPointToken _value, $Res Function(_$_EZPointToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ezPointToken = null,
  }) {
    return _then(_$_EZPointToken(
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EZPointToken extends _EZPointToken {
  _$_EZPointToken({required this.ezPointToken}) : super._();

  @override
  final String ezPointToken;

  @override
  String toString() {
    return 'EZPointToken(ezPointToken: $ezPointToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EZPointToken &&
            (identical(other.ezPointToken, ezPointToken) ||
                other.ezPointToken == ezPointToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ezPointToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EZPointTokenCopyWith<_$_EZPointToken> get copyWith =>
      __$$_EZPointTokenCopyWithImpl<_$_EZPointToken>(this, _$identity);
}

abstract class _EZPointToken extends EZPointToken {
  factory _EZPointToken({required final String ezPointToken}) = _$_EZPointToken;
  _EZPointToken._() : super._();

  @override
  String get ezPointToken;
  @override
  @JsonKey(ignore: true)
  _$$_EZPointTokenCopyWith<_$_EZPointToken> get copyWith =>
      throw _privateConstructorUsedError;
}
