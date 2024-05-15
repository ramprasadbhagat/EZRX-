// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerCodeConfigDto _$CustomerCodeConfigDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerCodeConfigDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerCodeConfigDto {
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturns', defaultValue: false)
  bool get disableReturns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCodeConfigDtoCopyWith<CustomerCodeConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeConfigDtoCopyWith<$Res> {
  factory $CustomerCodeConfigDtoCopyWith(CustomerCodeConfigDto value,
          $Res Function(CustomerCodeConfigDto) then) =
      _$CustomerCodeConfigDtoCopyWithImpl<$Res, CustomerCodeConfigDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      bool disableReturns});
}

/// @nodoc
class _$CustomerCodeConfigDtoCopyWithImpl<$Res,
        $Val extends CustomerCodeConfigDto>
    implements $CustomerCodeConfigDtoCopyWith<$Res> {
  _$CustomerCodeConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? disableReturns = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerCodeConfigDtoImplCopyWith<$Res>
    implements $CustomerCodeConfigDtoCopyWith<$Res> {
  factory _$$CustomerCodeConfigDtoImplCopyWith(
          _$CustomerCodeConfigDtoImpl value,
          $Res Function(_$CustomerCodeConfigDtoImpl) then) =
      __$$CustomerCodeConfigDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      bool disableReturns});
}

/// @nodoc
class __$$CustomerCodeConfigDtoImplCopyWithImpl<$Res>
    extends _$CustomerCodeConfigDtoCopyWithImpl<$Res,
        _$CustomerCodeConfigDtoImpl>
    implements _$$CustomerCodeConfigDtoImplCopyWith<$Res> {
  __$$CustomerCodeConfigDtoImplCopyWithImpl(_$CustomerCodeConfigDtoImpl _value,
      $Res Function(_$CustomerCodeConfigDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? disableReturns = null,
  }) {
    return _then(_$CustomerCodeConfigDtoImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCodeConfigDtoImpl extends _CustomerCodeConfigDto {
  _$CustomerCodeConfigDtoImpl(
      {@JsonKey(name: 'customerCode', defaultValue: '')
      required this.customerCode,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      required this.disableReturns})
      : super._();

  factory _$CustomerCodeConfigDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCodeConfigDtoImplFromJson(json);

  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'disableReturns', defaultValue: false)
  final bool disableReturns;

  @override
  String toString() {
    return 'CustomerCodeConfigDto(customerCode: $customerCode, disableReturns: $disableReturns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCodeConfigDtoImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.disableReturns, disableReturns) ||
                other.disableReturns == disableReturns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerCode, disableReturns);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCodeConfigDtoImplCopyWith<_$CustomerCodeConfigDtoImpl>
      get copyWith => __$$CustomerCodeConfigDtoImplCopyWithImpl<
          _$CustomerCodeConfigDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCodeConfigDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerCodeConfigDto extends CustomerCodeConfigDto {
  factory _CustomerCodeConfigDto(
      {@JsonKey(name: 'customerCode', defaultValue: '')
      required final String customerCode,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      required final bool disableReturns}) = _$CustomerCodeConfigDtoImpl;
  _CustomerCodeConfigDto._() : super._();

  factory _CustomerCodeConfigDto.fromJson(Map<String, dynamic> json) =
      _$CustomerCodeConfigDtoImpl.fromJson;

  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'disableReturns', defaultValue: false)
  bool get disableReturns;
  @override
  @JsonKey(ignore: true)
  _$$CustomerCodeConfigDtoImplCopyWith<_$CustomerCodeConfigDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
