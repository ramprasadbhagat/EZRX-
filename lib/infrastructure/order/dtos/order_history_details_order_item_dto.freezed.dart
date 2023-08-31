// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) {
  return _OrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderItemDto {
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialCode => throw _privateConstructorUsedError;

  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;

  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemDtoCopyWith<OrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemDtoCopyWith<$Res> {
  factory $OrderItemDtoCopyWith(
          OrderItemDto value, $Res Function(OrderItemDto) then) =
      _$OrderItemDtoCopyWithImpl<$Res, OrderItemDto>;

  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription});
}

/// @nodoc
class _$OrderItemDtoCopyWithImpl<$Res, $Val extends OrderItemDto>
    implements $OrderItemDtoCopyWith<$Res> {
  _$OrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_value.copyWith(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderItemDtoCopyWith<$Res>
    implements $OrderItemDtoCopyWith<$Res> {
  factory _$$_OrderItemDtoCopyWith(
          _$_OrderItemDto value, $Res Function(_$_OrderItemDto) then) =
      __$$_OrderItemDtoCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription});
}

/// @nodoc
class __$$_OrderItemDtoCopyWithImpl<$Res>
    extends _$OrderItemDtoCopyWithImpl<$Res, _$_OrderItemDto>
    implements _$$_OrderItemDtoCopyWith<$Res> {
  __$$_OrderItemDtoCopyWithImpl(
      _$_OrderItemDto _value, $Res Function(_$_OrderItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialCode = null,
    Object? materialDescription = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_$_OrderItemDto(
      materialCode: null == materialCode
          ? _value.materialCode
          : materialCode // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderItemDto extends _OrderItemDto {
  const _$_OrderItemDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          required this.materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
          required this.defaultMaterialDescription})
      : super._();

  factory _$_OrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  final String materialCode;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;

  @override
  String toString() {
    return 'OrderItemDto(materialCode: $materialCode, materialDescription: $materialDescription, defaultMaterialDescription: $defaultMaterialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItemDto &&
            (identical(other.materialCode, materialCode) ||
                other.materialCode == materialCode) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialCode,
      materialDescription, defaultMaterialDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderItemDtoCopyWith<_$_OrderItemDto> get copyWith =>
      __$$_OrderItemDtoCopyWithImpl<_$_OrderItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemDtoToJson(
      this,
    );
  }
}

abstract class _OrderItemDto extends OrderItemDto {
  const factory _OrderItemDto(
      {@JsonKey(name: 'MaterialCode', defaultValue: '')
          required final String materialCode,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
          required final String defaultMaterialDescription}) = _$_OrderItemDto;

  const _OrderItemDto._() : super._();

  factory _OrderItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderItemDto.fromJson;

  @override
  @JsonKey(name: 'MaterialCode', defaultValue: '')
  String get materialCode;

  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;

  @override
  @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;

  @override
  @JsonKey(ignore: true)
  _$$_OrderItemDtoCopyWith<_$_OrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
