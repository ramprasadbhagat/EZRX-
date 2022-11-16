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
      _$OrderDocumentTypeDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'salesOrg') String salesOrg,
      @JsonKey(name: 'documentType') String documentType,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'shippingCondition') String shippingCondition,
      @JsonKey(name: 'orderReason') String orderReason});
}

/// @nodoc
class _$OrderDocumentTypeDtoCopyWithImpl<$Res>
    implements $OrderDocumentTypeDtoCopyWith<$Res> {
  _$OrderDocumentTypeDtoCopyWithImpl(this._value, this._then);

  final OrderDocumentTypeDto _value;
  // ignore: unused_field
  final $Res Function(OrderDocumentTypeDto) _then;

  @override
  $Res call({
    Object? salesOrg = freezed,
    Object? documentType = freezed,
    Object? description = freezed,
    Object? shippingCondition = freezed,
    Object? orderReason = freezed,
  }) {
    return _then(_value.copyWith(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: documentType == freezed
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: shippingCondition == freezed
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: orderReason == freezed
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderDocumentTypeDtoCopyWith<$Res>
    implements $OrderDocumentTypeDtoCopyWith<$Res> {
  factory _$$_OrderDocumentTypeDtoCopyWith(_$_OrderDocumentTypeDto value,
          $Res Function(_$_OrderDocumentTypeDto) then) =
      __$$_OrderDocumentTypeDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'salesOrg') String salesOrg,
      @JsonKey(name: 'documentType') String documentType,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'shippingCondition') String shippingCondition,
      @JsonKey(name: 'orderReason') String orderReason});
}

/// @nodoc
class __$$_OrderDocumentTypeDtoCopyWithImpl<$Res>
    extends _$OrderDocumentTypeDtoCopyWithImpl<$Res>
    implements _$$_OrderDocumentTypeDtoCopyWith<$Res> {
  __$$_OrderDocumentTypeDtoCopyWithImpl(_$_OrderDocumentTypeDto _value,
      $Res Function(_$_OrderDocumentTypeDto) _then)
      : super(_value, (v) => _then(v as _$_OrderDocumentTypeDto));

  @override
  _$_OrderDocumentTypeDto get _value => super._value as _$_OrderDocumentTypeDto;

  @override
  $Res call({
    Object? salesOrg = freezed,
    Object? documentType = freezed,
    Object? description = freezed,
    Object? shippingCondition = freezed,
    Object? orderReason = freezed,
  }) {
    return _then(_$_OrderDocumentTypeDto(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      documentType: documentType == freezed
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: shippingCondition == freezed
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: orderReason == freezed
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
            const DeepCollectionEquality().equals(other.salesOrg, salesOrg) &&
            const DeepCollectionEquality()
                .equals(other.documentType, documentType) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.shippingCondition, shippingCondition) &&
            const DeepCollectionEquality()
                .equals(other.orderReason, orderReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrg),
      const DeepCollectionEquality().hash(documentType),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(shippingCondition),
      const DeepCollectionEquality().hash(orderReason));

  @JsonKey(ignore: true)
  @override
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
