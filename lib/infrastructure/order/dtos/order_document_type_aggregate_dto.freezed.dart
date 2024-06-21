// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_document_type_aggregate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDocumentTypeDto _$OrderDocumentTypeDtoFromJson(Map<String, dynamic> json) {
  return _OrderDocumentTypeDto.fromJson(json);
}

/// @nodoc
mixin _$OrderDocumentTypeDto {
  @JsonKey(name: 'salesOrg')
  @HiveField(0, defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentType')
  @HiveField(1, defaultValue: '')
  String get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  @HiveField(2, defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'shippingCondition')
  @HiveField(3, defaultValue: '')
  String get shippingCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason')
  @HiveField(4, defaultValue: '')
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
      {@JsonKey(name: 'salesOrg')
      @HiveField(0, defaultValue: '')
      String salesOrg,
      @JsonKey(name: 'documentType')
      @HiveField(1, defaultValue: '')
      String documentType,
      @JsonKey(name: 'description')
      @HiveField(2, defaultValue: '')
      String description,
      @JsonKey(name: 'shippingCondition')
      @HiveField(3, defaultValue: '')
      String shippingCondition,
      @JsonKey(name: 'orderReason')
      @HiveField(4, defaultValue: '')
      String orderReason});
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
abstract class _$$OrderDocumentTypeDtoImplCopyWith<$Res>
    implements $OrderDocumentTypeDtoCopyWith<$Res> {
  factory _$$OrderDocumentTypeDtoImplCopyWith(_$OrderDocumentTypeDtoImpl value,
          $Res Function(_$OrderDocumentTypeDtoImpl) then) =
      __$$OrderDocumentTypeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg')
      @HiveField(0, defaultValue: '')
      String salesOrg,
      @JsonKey(name: 'documentType')
      @HiveField(1, defaultValue: '')
      String documentType,
      @JsonKey(name: 'description')
      @HiveField(2, defaultValue: '')
      String description,
      @JsonKey(name: 'shippingCondition')
      @HiveField(3, defaultValue: '')
      String shippingCondition,
      @JsonKey(name: 'orderReason')
      @HiveField(4, defaultValue: '')
      String orderReason});
}

/// @nodoc
class __$$OrderDocumentTypeDtoImplCopyWithImpl<$Res>
    extends _$OrderDocumentTypeDtoCopyWithImpl<$Res, _$OrderDocumentTypeDtoImpl>
    implements _$$OrderDocumentTypeDtoImplCopyWith<$Res> {
  __$$OrderDocumentTypeDtoImplCopyWithImpl(_$OrderDocumentTypeDtoImpl _value,
      $Res Function(_$OrderDocumentTypeDtoImpl) _then)
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
    return _then(_$OrderDocumentTypeDtoImpl(
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
@HiveType(typeId: 31, adapterName: 'OrderDocumentTypeDtoAdapter')
class _$OrderDocumentTypeDtoImpl extends _OrderDocumentTypeDto {
  const _$OrderDocumentTypeDtoImpl(
      {@JsonKey(name: 'salesOrg')
      @HiveField(0, defaultValue: '')
      required this.salesOrg,
      @JsonKey(name: 'documentType')
      @HiveField(1, defaultValue: '')
      required this.documentType,
      @JsonKey(name: 'description')
      @HiveField(2, defaultValue: '')
      required this.description,
      @JsonKey(name: 'shippingCondition')
      @HiveField(3, defaultValue: '')
      required this.shippingCondition,
      @JsonKey(name: 'orderReason')
      @HiveField(4, defaultValue: '')
      required this.orderReason})
      : super._();

  factory _$OrderDocumentTypeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDocumentTypeDtoImplFromJson(json);

  @override
  @JsonKey(name: 'salesOrg')
  @HiveField(0, defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'documentType')
  @HiveField(1, defaultValue: '')
  final String documentType;
  @override
  @JsonKey(name: 'description')
  @HiveField(2, defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'shippingCondition')
  @HiveField(3, defaultValue: '')
  final String shippingCondition;
  @override
  @JsonKey(name: 'orderReason')
  @HiveField(4, defaultValue: '')
  final String orderReason;

  @override
  String toString() {
    return 'OrderDocumentTypeDto(salesOrg: $salesOrg, documentType: $documentType, description: $description, shippingCondition: $shippingCondition, orderReason: $orderReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDocumentTypeDtoImpl &&
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
  _$$OrderDocumentTypeDtoImplCopyWith<_$OrderDocumentTypeDtoImpl>
      get copyWith =>
          __$$OrderDocumentTypeDtoImplCopyWithImpl<_$OrderDocumentTypeDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDocumentTypeDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderDocumentTypeDto extends OrderDocumentTypeDto {
  const factory _OrderDocumentTypeDto(
      {@JsonKey(name: 'salesOrg')
      @HiveField(0, defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'documentType')
      @HiveField(1, defaultValue: '')
      required final String documentType,
      @JsonKey(name: 'description')
      @HiveField(2, defaultValue: '')
      required final String description,
      @JsonKey(name: 'shippingCondition')
      @HiveField(3, defaultValue: '')
      required final String shippingCondition,
      @JsonKey(name: 'orderReason')
      @HiveField(4, defaultValue: '')
      required final String orderReason}) = _$OrderDocumentTypeDtoImpl;
  const _OrderDocumentTypeDto._() : super._();

  factory _OrderDocumentTypeDto.fromJson(Map<String, dynamic> json) =
      _$OrderDocumentTypeDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrg')
  @HiveField(0, defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'documentType')
  @HiveField(1, defaultValue: '')
  String get documentType;
  @override
  @JsonKey(name: 'description')
  @HiveField(2, defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'shippingCondition')
  @HiveField(3, defaultValue: '')
  String get shippingCondition;
  @override
  @JsonKey(name: 'orderReason')
  @HiveField(4, defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(ignore: true)
  _$$OrderDocumentTypeDtoImplCopyWith<_$OrderDocumentTypeDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
