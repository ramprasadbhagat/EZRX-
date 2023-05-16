// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_payment_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EditPaymentMethodDto _$EditPaymentMethodDtoFromJson(Map<String, dynamic> json) {
  return _EditPaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$EditPaymentMethodDto {
  @JsonKey(name: 'success', defaultValue: false)
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'action', defaultValue: '')
  String get action => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditPaymentMethodDtoCopyWith<EditPaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditPaymentMethodDtoCopyWith<$Res> {
  factory $EditPaymentMethodDtoCopyWith(EditPaymentMethodDto value,
          $Res Function(EditPaymentMethodDto) then) =
      _$EditPaymentMethodDtoCopyWithImpl<$Res, EditPaymentMethodDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'action', defaultValue: '') String action});
}

/// @nodoc
class _$EditPaymentMethodDtoCopyWithImpl<$Res,
        $Val extends EditPaymentMethodDto>
    implements $EditPaymentMethodDtoCopyWith<$Res> {
  _$EditPaymentMethodDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_EditPaymentMethodDtoCopyWith<$Res>
    implements $EditPaymentMethodDtoCopyWith<$Res> {
  factory _$$_EditPaymentMethodDtoCopyWith(_$_EditPaymentMethodDto value,
          $Res Function(_$_EditPaymentMethodDto) then) =
      __$$_EditPaymentMethodDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'action', defaultValue: '') String action});
}

/// @nodoc
class __$$_EditPaymentMethodDtoCopyWithImpl<$Res>
    extends _$EditPaymentMethodDtoCopyWithImpl<$Res, _$_EditPaymentMethodDto>
    implements _$$_EditPaymentMethodDtoCopyWith<$Res> {
  __$$_EditPaymentMethodDtoCopyWithImpl(_$_EditPaymentMethodDto _value,
      $Res Function(_$_EditPaymentMethodDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? action = null,
  }) {
    return _then(_$_EditPaymentMethodDto(
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
@JsonSerializable()
class _$_EditPaymentMethodDto extends _EditPaymentMethodDto {
  const _$_EditPaymentMethodDto(
      {@JsonKey(name: 'success', defaultValue: false) required this.success,
      @JsonKey(name: 'action', defaultValue: '') required this.action})
      : super._();

  factory _$_EditPaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$$_EditPaymentMethodDtoFromJson(json);

  @override
  @JsonKey(name: 'success', defaultValue: false)
  final bool success;
  @override
  @JsonKey(name: 'action', defaultValue: '')
  final String action;

  @override
  String toString() {
    return 'EditPaymentMethodDto(success: $success, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPaymentMethodDto &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPaymentMethodDtoCopyWith<_$_EditPaymentMethodDto> get copyWith =>
      __$$_EditPaymentMethodDtoCopyWithImpl<_$_EditPaymentMethodDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EditPaymentMethodDtoToJson(
      this,
    );
  }
}

abstract class _EditPaymentMethodDto extends EditPaymentMethodDto {
  const factory _EditPaymentMethodDto(
      {@JsonKey(name: 'success', defaultValue: false)
          required final bool success,
      @JsonKey(name: 'action', defaultValue: '')
          required final String action}) = _$_EditPaymentMethodDto;
  const _EditPaymentMethodDto._() : super._();

  factory _EditPaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$_EditPaymentMethodDto.fromJson;

  @override
  @JsonKey(name: 'success', defaultValue: false)
  bool get success;
  @override
  @JsonKey(name: 'action', defaultValue: '')
  String get action;
  @override
  @JsonKey(ignore: true)
  _$$_EditPaymentMethodDtoCopyWith<_$_EditPaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}
