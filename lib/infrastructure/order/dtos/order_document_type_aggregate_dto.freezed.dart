// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_document_type_aggregate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDocumentTypeDto _$OrderDocumentTypeDtoFromJson(Map<String, dynamic> json) {
  return _OrderDocumentTypeDto.fromJson(json);
}

/// @nodoc
mixin _$OrderDocumentTypeDto {
  @JsonKey(name: 'salesOrg')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentType')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'shippingCondition')
  String get shippingCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason')
  String get orderReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDocumentTypeDtoCopyWith<OrderDocumentTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDocumentTypeDtoCopyWith<$Res> {
  factory $OrderDocumentTypeDtoCopyWith(OrderDocumentTypeDto value,
          $Res Function(OrderDocumentTypeDto) then) =
      _$OrderDocumentTypeDtoCopyWithImpl<$Res, OrderDocumentTypeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg') String salesOrg,
      @JsonKey(name: 'documentType') String documentType,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'shippingCondition') String shippingCondition,
      @JsonKey(name: 'orderReason') String orderReason});
}

/// @nodoc
class _$OrderDocumentTypeDtoCopyWithImpl<$Res,
        $Val extends OrderDocumentTypeDto>
    implements $OrderDocumentTypeDtoCopyWith<$Res> {
  _$OrderDocumentTypeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? documentType = null,
    Object? description = null,
    Object? shippingCondition = null,
    Object? orderReason = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDocumentTypeDtoCopyWith<$Res>
    implements $OrderDocumentTypeDtoCopyWith<$Res> {
  factory _$$_OrderDocumentTypeDtoCopyWith(_$_OrderDocumentTypeDto value,
          $Res Function(_$_OrderDocumentTypeDto) then) =
      __$$_OrderDocumentTypeDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg') String salesOrg,
      @JsonKey(name: 'documentType') String documentType,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'shippingCondition') String shippingCondition,
      @JsonKey(name: 'orderReason') String orderReason});
}

/// @nodoc
class __$$_OrderDocumentTypeDtoCopyWithImpl<$Res>
    extends _$OrderDocumentTypeDtoCopyWithImpl<$Res, _$_OrderDocumentTypeDto>
    implements _$$_OrderDocumentTypeDtoCopyWith<$Res> {
  __$$_OrderDocumentTypeDtoCopyWithImpl(_$_OrderDocumentTypeDto _value,
      $Res Function(_$_OrderDocumentTypeDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? documentType = null,
    Object? description = null,
    Object? shippingCondition = null,
    Object? orderReason = null,
  }) {
    return _then(_$_OrderDocumentTypeDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDocumentTypeDto extends _OrderDocumentTypeDto {
  const _$_OrderDocumentTypeDto(
      {@JsonKey(name: 'salesOrg') required this.salesOrg,
      @JsonKey(name: 'documentType') required this.documentType,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'shippingCondition') required this.shippingCondition,
      @JsonKey(name: 'orderReason') required this.orderReason})
      : super._();

  factory _$_OrderDocumentTypeDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDocumentTypeDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg')
  final String salesOrg;
  @override
  @JsonKey(name: 'documentType')
  final String documentType;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'shippingCondition')
  final String shippingCondition;
  @override
  @JsonKey(name: 'orderReason')
  final String orderReason;

  @override
  String toString() {
    return 'OrderDocumentTypeDto(salesOrg: $salesOrg, documentType: $documentType, description: $description, shippingCondition: $shippingCondition, orderReason: $orderReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDocumentTypeDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shippingCondition, shippingCondition) ||
                other.shippingCondition == shippingCondition) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, documentType,
      description, shippingCondition, orderReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDocumentTypeDtoCopyWith<_$_OrderDocumentTypeDto> get copyWith =>
      __$$_OrderDocumentTypeDtoCopyWithImpl<_$_OrderDocumentTypeDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDocumentTypeDtoToJson(
      this,
    );
  }
}

abstract class _OrderDocumentTypeDto extends OrderDocumentTypeDto {
  const factory _OrderDocumentTypeDto(
      {@JsonKey(name: 'salesOrg')
          required final String salesOrg,
      @JsonKey(name: 'documentType')
          required final String documentType,
      @JsonKey(name: 'description')
          required final String description,
      @JsonKey(name: 'shippingCondition')
          required final String shippingCondition,
      @JsonKey(name: 'orderReason')
          required final String orderReason}) = _$_OrderDocumentTypeDto;
  const _OrderDocumentTypeDto._() : super._();

  factory _OrderDocumentTypeDto.fromJson(Map<String, dynamic> json) =
      _$_OrderDocumentTypeDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg')
  String get salesOrg;
  @override
  @JsonKey(name: 'documentType')
  String get documentType;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'shippingCondition')
  String get shippingCondition;
  @override
  @JsonKey(name: 'orderReason')
  String get orderReason;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDocumentTypeDtoCopyWith<_$_OrderDocumentTypeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
