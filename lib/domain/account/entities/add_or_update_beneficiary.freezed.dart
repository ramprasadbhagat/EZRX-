// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_or_update_beneficiary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddOrUpdateBeneficiary {
  String get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddOrUpdateBeneficiaryCopyWith<AddOrUpdateBeneficiary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateBeneficiaryCopyWith<$Res> {
  factory $AddOrUpdateBeneficiaryCopyWith(AddOrUpdateBeneficiary value,
          $Res Function(AddOrUpdateBeneficiary) then) =
      _$AddOrUpdateBeneficiaryCopyWithImpl<$Res, AddOrUpdateBeneficiary>;
  @useResult
  $Res call({String info});
}

/// @nodoc
class _$AddOrUpdateBeneficiaryCopyWithImpl<$Res,
        $Val extends AddOrUpdateBeneficiary>
    implements $AddOrUpdateBeneficiaryCopyWith<$Res> {
  _$AddOrUpdateBeneficiaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddOrUpdateBeneficiaryCopyWith<$Res>
    implements $AddOrUpdateBeneficiaryCopyWith<$Res> {
  factory _$$_AddOrUpdateBeneficiaryCopyWith(_$_AddOrUpdateBeneficiary value,
          $Res Function(_$_AddOrUpdateBeneficiary) then) =
      __$$_AddOrUpdateBeneficiaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String info});
}

/// @nodoc
class __$$_AddOrUpdateBeneficiaryCopyWithImpl<$Res>
    extends _$AddOrUpdateBeneficiaryCopyWithImpl<$Res,
        _$_AddOrUpdateBeneficiary>
    implements _$$_AddOrUpdateBeneficiaryCopyWith<$Res> {
  __$$_AddOrUpdateBeneficiaryCopyWithImpl(_$_AddOrUpdateBeneficiary _value,
      $Res Function(_$_AddOrUpdateBeneficiary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_AddOrUpdateBeneficiary(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddOrUpdateBeneficiary extends _AddOrUpdateBeneficiary {
  const _$_AddOrUpdateBeneficiary({required this.info}) : super._();

  @override
  final String info;

  @override
  String toString() {
    return 'AddOrUpdateBeneficiary(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOrUpdateBeneficiary &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOrUpdateBeneficiaryCopyWith<_$_AddOrUpdateBeneficiary> get copyWith =>
      __$$_AddOrUpdateBeneficiaryCopyWithImpl<_$_AddOrUpdateBeneficiary>(
          this, _$identity);
}

abstract class _AddOrUpdateBeneficiary extends AddOrUpdateBeneficiary {
  const factory _AddOrUpdateBeneficiary({required final String info}) =
      _$_AddOrUpdateBeneficiary;
  const _AddOrUpdateBeneficiary._() : super._();

  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_AddOrUpdateBeneficiaryCopyWith<_$_AddOrUpdateBeneficiary> get copyWith =>
      throw _privateConstructorUsedError;
}
