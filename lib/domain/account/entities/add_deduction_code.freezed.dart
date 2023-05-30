// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_deduction_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddDeductionCode {
  bool get success => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddDeductionCodeCopyWith<AddDeductionCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeductionCodeCopyWith<$Res> {
  factory $AddDeductionCodeCopyWith(
          AddDeductionCode value, $Res Function(AddDeductionCode) then) =
      _$AddDeductionCodeCopyWithImpl<$Res, AddDeductionCode>;
  @useResult
  $Res call({bool success, String info});
}

/// @nodoc
class _$AddDeductionCodeCopyWithImpl<$Res, $Val extends AddDeductionCode>
    implements $AddDeductionCodeCopyWith<$Res> {
  _$AddDeductionCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddDeductionCodeCopyWith<$Res>
    implements $AddDeductionCodeCopyWith<$Res> {
  factory _$$_AddDeductionCodeCopyWith(
          _$_AddDeductionCode value, $Res Function(_$_AddDeductionCode) then) =
      __$$_AddDeductionCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String info});
}

/// @nodoc
class __$$_AddDeductionCodeCopyWithImpl<$Res>
    extends _$AddDeductionCodeCopyWithImpl<$Res, _$_AddDeductionCode>
    implements _$$_AddDeductionCodeCopyWith<$Res> {
  __$$_AddDeductionCodeCopyWithImpl(
      _$_AddDeductionCode _value, $Res Function(_$_AddDeductionCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? info = null,
  }) {
    return _then(_$_AddDeductionCode(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddDeductionCode extends _AddDeductionCode {
  const _$_AddDeductionCode({required this.success, required this.info})
      : super._();

  @override
  final bool success;
  @override
  final String info;

  @override
  String toString() {
    return 'AddDeductionCode(success: $success, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeductionCode &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDeductionCodeCopyWith<_$_AddDeductionCode> get copyWith =>
      __$$_AddDeductionCodeCopyWithImpl<_$_AddDeductionCode>(this, _$identity);
}

abstract class _AddDeductionCode extends AddDeductionCode {
  const factory _AddDeductionCode(
      {required final bool success,
      required final String info}) = _$_AddDeductionCode;
  const _AddDeductionCode._() : super._();

  @override
  bool get success;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_AddDeductionCodeCopyWith<_$_AddDeductionCode> get copyWith =>
      throw _privateConstructorUsedError;
}
