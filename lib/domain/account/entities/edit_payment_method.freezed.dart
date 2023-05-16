// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditPaymentMethod {
  bool get success => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditPaymentMethodCopyWith<EditPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPaymentMethodCopyWith<$Res> {
  factory $EditPaymentMethodCopyWith(
          EditPaymentMethod value, $Res Function(EditPaymentMethod) then) =
      _$EditPaymentMethodCopyWithImpl<$Res, EditPaymentMethod>;
  @useResult
  $Res call({bool success, String action});
}

/// @nodoc
class _$EditPaymentMethodCopyWithImpl<$Res, $Val extends EditPaymentMethod>
    implements $EditPaymentMethodCopyWith<$Res> {
  _$EditPaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditPaymentMethodCopyWith<$Res>
    implements $EditPaymentMethodCopyWith<$Res> {
  factory _$$_EditPaymentMethodCopyWith(_$_EditPaymentMethod value,
          $Res Function(_$_EditPaymentMethod) then) =
      __$$_EditPaymentMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String action});
}

/// @nodoc
class __$$_EditPaymentMethodCopyWithImpl<$Res>
    extends _$EditPaymentMethodCopyWithImpl<$Res, _$_EditPaymentMethod>
    implements _$$_EditPaymentMethodCopyWith<$Res> {
  __$$_EditPaymentMethodCopyWithImpl(
      _$_EditPaymentMethod _value, $Res Function(_$_EditPaymentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? action = null,
  }) {
    return _then(_$_EditPaymentMethod(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditPaymentMethod extends _EditPaymentMethod {
  const _$_EditPaymentMethod({required this.success, required this.action})
      : super._();

  @override
  final bool success;
  @override
  final String action;

  @override
  String toString() {
    return 'EditPaymentMethod(success: $success, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPaymentMethod &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPaymentMethodCopyWith<_$_EditPaymentMethod> get copyWith =>
      __$$_EditPaymentMethodCopyWithImpl<_$_EditPaymentMethod>(
          this, _$identity);
}

abstract class _EditPaymentMethod extends EditPaymentMethod {
  const factory _EditPaymentMethod(
      {required final bool success,
      required final String action}) = _$_EditPaymentMethod;
  const _EditPaymentMethod._() : super._();

  @override
  bool get success;
  @override
  String get action;
  @override
  @JsonKey(ignore: true)
  _$$_EditPaymentMethodCopyWith<_$_EditPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
