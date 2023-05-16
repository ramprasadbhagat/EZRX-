// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_payment_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeletePaymentMethodDto _$DeletePaymentMethodDtoFromJson(
    Map<String, dynamic> json) {
  return _DeletePaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$DeletePaymentMethodDto {
  @JsonKey(name: 'success', defaultValue: false)
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeletePaymentMethodDtoCopyWith<DeletePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletePaymentMethodDtoCopyWith<$Res> {
  factory $DeletePaymentMethodDtoCopyWith(DeletePaymentMethodDto value,
          $Res Function(DeletePaymentMethodDto) then) =
      _$DeletePaymentMethodDtoCopyWithImpl<$Res, DeletePaymentMethodDto>;
  @useResult
  $Res call({@JsonKey(name: 'success', defaultValue: false) bool success});
}

/// @nodoc
class _$DeletePaymentMethodDtoCopyWithImpl<$Res,
        $Val extends DeletePaymentMethodDto>
    implements $DeletePaymentMethodDtoCopyWith<$Res> {
  _$DeletePaymentMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeletePaymentMethodDtoCopyWith<$Res>
    implements $DeletePaymentMethodDtoCopyWith<$Res> {
  factory _$$_DeletePaymentMethodDtoCopyWith(_$_DeletePaymentMethodDto value,
          $Res Function(_$_DeletePaymentMethodDto) then) =
      __$$_DeletePaymentMethodDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'success', defaultValue: false) bool success});
}

/// @nodoc
class __$$_DeletePaymentMethodDtoCopyWithImpl<$Res>
    extends _$DeletePaymentMethodDtoCopyWithImpl<$Res,
        _$_DeletePaymentMethodDto>
    implements _$$_DeletePaymentMethodDtoCopyWith<$Res> {
  __$$_DeletePaymentMethodDtoCopyWithImpl(_$_DeletePaymentMethodDto _value,
      $Res Function(_$_DeletePaymentMethodDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$_DeletePaymentMethodDto(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeletePaymentMethodDto extends _DeletePaymentMethodDto {
  const _$_DeletePaymentMethodDto(
      {@JsonKey(name: 'success', defaultValue: false) required this.success})
      : super._();

  factory _$_DeletePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$$_DeletePaymentMethodDtoFromJson(json);

  @override
  @JsonKey(name: 'success', defaultValue: false)
  final bool success;

  @override
  String toString() {
    return 'DeletePaymentMethodDto(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletePaymentMethodDto &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletePaymentMethodDtoCopyWith<_$_DeletePaymentMethodDto> get copyWith =>
      __$$_DeletePaymentMethodDtoCopyWithImpl<_$_DeletePaymentMethodDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeletePaymentMethodDtoToJson(
      this,
    );
  }
}

abstract class _DeletePaymentMethodDto extends DeletePaymentMethodDto {
  const factory _DeletePaymentMethodDto(
      {@JsonKey(name: 'success', defaultValue: false)
          required final bool success}) = _$_DeletePaymentMethodDto;
  const _DeletePaymentMethodDto._() : super._();

  factory _DeletePaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$_DeletePaymentMethodDto.fromJson;

  @override
  @JsonKey(name: 'success', defaultValue: false)
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$_DeletePaymentMethodDtoCopyWith<_$_DeletePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}
