// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartHasDifferentAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartHasDifferentAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartHasDifferentAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartHasDifferentAddress value)
        cartHasDifferentAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartHasDifferentAddress value)? cartHasDifferentAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartHasDifferentAddress value)? cartHasDifferentAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartExceptionCopyWith<$Res> {
  factory $CartExceptionCopyWith(
          CartException value, $Res Function(CartException) then) =
      _$CartExceptionCopyWithImpl<$Res, CartException>;
}

/// @nodoc
class _$CartExceptionCopyWithImpl<$Res, $Val extends CartException>
    implements $CartExceptionCopyWith<$Res> {
  _$CartExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CartHasDifferentAddressCopyWith<$Res> {
  factory _$$_CartHasDifferentAddressCopyWith(_$_CartHasDifferentAddress value,
          $Res Function(_$_CartHasDifferentAddress) then) =
      __$$_CartHasDifferentAddressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CartHasDifferentAddressCopyWithImpl<$Res>
    extends _$CartExceptionCopyWithImpl<$Res, _$_CartHasDifferentAddress>
    implements _$$_CartHasDifferentAddressCopyWith<$Res> {
  __$$_CartHasDifferentAddressCopyWithImpl(_$_CartHasDifferentAddress _value,
      $Res Function(_$_CartHasDifferentAddress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CartHasDifferentAddress implements _CartHasDifferentAddress {
  const _$_CartHasDifferentAddress();

  @override
  String toString() {
    return 'CartException.cartHasDifferentAddress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartHasDifferentAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cartHasDifferentAddress,
  }) {
    return cartHasDifferentAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cartHasDifferentAddress,
  }) {
    return cartHasDifferentAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cartHasDifferentAddress,
    required TResult orElse(),
  }) {
    if (cartHasDifferentAddress != null) {
      return cartHasDifferentAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartHasDifferentAddress value)
        cartHasDifferentAddress,
  }) {
    return cartHasDifferentAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartHasDifferentAddress value)? cartHasDifferentAddress,
  }) {
    return cartHasDifferentAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartHasDifferentAddress value)? cartHasDifferentAddress,
    required TResult orElse(),
  }) {
    if (cartHasDifferentAddress != null) {
      return cartHasDifferentAddress(this);
    }
    return orElse();
  }
}

abstract class _CartHasDifferentAddress implements CartException {
  const factory _CartHasDifferentAddress() = _$_CartHasDifferentAddress;
}
