// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_sales_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddSalesDistrict {
  SalesDistrictMessage get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddSalesDistrictCopyWith<AddSalesDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddSalesDistrictCopyWith<$Res> {
  factory $AddSalesDistrictCopyWith(
          AddSalesDistrict value, $Res Function(AddSalesDistrict) then) =
      _$AddSalesDistrictCopyWithImpl<$Res, AddSalesDistrict>;
  @useResult
  $Res call({SalesDistrictMessage message});
}

/// @nodoc
class _$AddSalesDistrictCopyWithImpl<$Res, $Val extends AddSalesDistrict>
    implements $AddSalesDistrictCopyWith<$Res> {
  _$AddSalesDistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as SalesDistrictMessage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddSalesDistrictCopyWith<$Res>
    implements $AddSalesDistrictCopyWith<$Res> {
  factory _$$_AddSalesDistrictCopyWith(
          _$_AddSalesDistrict value, $Res Function(_$_AddSalesDistrict) then) =
      __$$_AddSalesDistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesDistrictMessage message});
}

/// @nodoc
class __$$_AddSalesDistrictCopyWithImpl<$Res>
    extends _$AddSalesDistrictCopyWithImpl<$Res, _$_AddSalesDistrict>
    implements _$$_AddSalesDistrictCopyWith<$Res> {
  __$$_AddSalesDistrictCopyWithImpl(
      _$_AddSalesDistrict _value, $Res Function(_$_AddSalesDistrict) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddSalesDistrict(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as SalesDistrictMessage,
    ));
  }
}

/// @nodoc

class _$_AddSalesDistrict extends _AddSalesDistrict {
  const _$_AddSalesDistrict({required this.message}) : super._();

  @override
  final SalesDistrictMessage message;

  @override
  String toString() {
    return 'AddSalesDistrict(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddSalesDistrict &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddSalesDistrictCopyWith<_$_AddSalesDistrict> get copyWith =>
      __$$_AddSalesDistrictCopyWithImpl<_$_AddSalesDistrict>(this, _$identity);
}

abstract class _AddSalesDistrict extends AddSalesDistrict {
  const factory _AddSalesDistrict(
      {required final SalesDistrictMessage message}) = _$_AddSalesDistrict;
  const _AddSalesDistrict._() : super._();

  @override
  SalesDistrictMessage get message;
  @override
  @JsonKey(ignore: true)
  _$$_AddSalesDistrictCopyWith<_$_AddSalesDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}
