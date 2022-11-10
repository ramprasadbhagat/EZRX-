// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_order_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsOrderItemDto _$OrderHistoryDetailsOrderItemDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDto {
  @JsonKey(name: 'SAPStatus')
  String get sAPStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlannedDeliveryDate')
  String get plannedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PickedQuantity')
  int get pickedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Batch')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LineReferenceNotes')
  String get lineReferenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsTenderContractMaterial')
  bool get isTenderContractMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'Details')
  List<OrderHistoryDetailsOrderItemDetailsDto> get details =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TenderContractDetails')
  OrderHistoryDetailsOrderItemTenderContractDetailsDto
      get tenderContractDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemDtoCopyWith<OrderHistoryDetailsOrderItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDtoCopyWith(
          OrderHistoryDetailsOrderItemDto value,
          $Res Function(OrderHistoryDetailsOrderItemDto) then) =
      _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'SAPStatus')
          String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate')
          String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity')
          int pickedQuantity,
      @JsonKey(name: 'Batch')
          String batch,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate,
      @JsonKey(name: 'LineReferenceNotes')
          String lineReferenceNotes,
      @JsonKey(name: 'IsTenderContractMaterial')
          bool isTenderContractMaterial,
      @JsonKey(name: 'Details')
          List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(name: 'TenderContractDetails')
          OrderHistoryDetailsOrderItemTenderContractDetailsDto
              tenderContractDetails});

  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsOrderItemDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsOrderItemDto) _then;

  @override
  $Res call({
    Object? sAPStatus = freezed,
    Object? plannedDeliveryDate = freezed,
    Object? pickedQuantity = freezed,
    Object? batch = freezed,
    Object? expiryDate = freezed,
    Object? lineReferenceNotes = freezed,
    Object? isTenderContractMaterial = freezed,
    Object? details = freezed,
    Object? tenderContractDetails = freezed,
  }) {
    return _then(_value.copyWith(
      sAPStatus: sAPStatus == freezed
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: plannedDeliveryDate == freezed
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: pickedQuantity == freezed
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      lineReferenceNotes: lineReferenceNotes == freezed
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: isTenderContractMaterial == freezed
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: tenderContractDetails == freezed
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetailsDto,
    ));
  }

  @override
  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails {
    return $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>(
        _value.tenderContractDetails, (value) {
      return _then(_value.copyWith(tenderContractDetails: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemDtoCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemDtoCopyWith(
          _$_OrderHistoryDetailsOrderItemDto value,
          $Res Function(_$_OrderHistoryDetailsOrderItemDto) then) =
      __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'SAPStatus')
          String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate')
          String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity')
          int pickedQuantity,
      @JsonKey(name: 'Batch')
          String batch,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate,
      @JsonKey(name: 'LineReferenceNotes')
          String lineReferenceNotes,
      @JsonKey(name: 'IsTenderContractMaterial')
          bool isTenderContractMaterial,
      @JsonKey(name: 'Details')
          List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(name: 'TenderContractDetails')
          OrderHistoryDetailsOrderItemTenderContractDetailsDto
              tenderContractDetails});

  @override
  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res>
      get tenderContractDetails;
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsOrderItemDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemDto _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsOrderItemDto));

  @override
  _$_OrderHistoryDetailsOrderItemDto get _value =>
      super._value as _$_OrderHistoryDetailsOrderItemDto;

  @override
  $Res call({
    Object? sAPStatus = freezed,
    Object? plannedDeliveryDate = freezed,
    Object? pickedQuantity = freezed,
    Object? batch = freezed,
    Object? expiryDate = freezed,
    Object? lineReferenceNotes = freezed,
    Object? isTenderContractMaterial = freezed,
    Object? details = freezed,
    Object? tenderContractDetails = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemDto(
      sAPStatus: sAPStatus == freezed
          ? _value.sAPStatus
          : sAPStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plannedDeliveryDate: plannedDeliveryDate == freezed
          ? _value.plannedDeliveryDate
          : plannedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickedQuantity: pickedQuantity == freezed
          ? _value.pickedQuantity
          : pickedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: expiryDate == freezed
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      lineReferenceNotes: lineReferenceNotes == freezed
          ? _value.lineReferenceNotes
          : lineReferenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      isTenderContractMaterial: isTenderContractMaterial == freezed
          ? _value.isTenderContractMaterial
          : isTenderContractMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      details: details == freezed
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDetailsDto>,
      tenderContractDetails: tenderContractDetails == freezed
          ? _value.tenderContractDetails
          : tenderContractDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderItemTenderContractDetailsDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsOrderItemDto
    extends _OrderHistoryDetailsOrderItemDto {
  const _$_OrderHistoryDetailsOrderItemDto(
      {@JsonKey(name: 'SAPStatus')
          required this.sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate')
          required this.plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity')
          required this.pickedQuantity,
      @JsonKey(name: 'Batch')
          required this.batch,
      @JsonKey(name: 'ExpiryDate')
          required this.expiryDate,
      @JsonKey(name: 'LineReferenceNotes')
          required this.lineReferenceNotes,
      @JsonKey(name: 'IsTenderContractMaterial')
          required this.isTenderContractMaterial,
      @JsonKey(name: 'Details')
          required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(name: 'TenderContractDetails')
          required this.tenderContractDetails})
      : _details = details,
        super._();

  factory _$_OrderHistoryDetailsOrderItemDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsOrderItemDtoFromJson(json);

  @override
  @JsonKey(name: 'SAPStatus')
  final String sAPStatus;
  @override
  @JsonKey(name: 'PlannedDeliveryDate')
  final String plannedDeliveryDate;
  @override
  @JsonKey(name: 'PickedQuantity')
  final int pickedQuantity;
  @override
  @JsonKey(name: 'Batch')
  final String batch;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String expiryDate;
  @override
  @JsonKey(name: 'LineReferenceNotes')
  final String lineReferenceNotes;
  @override
  @JsonKey(name: 'IsTenderContractMaterial')
  final bool isTenderContractMaterial;
  final List<OrderHistoryDetailsOrderItemDetailsDto> _details;
  @override
  @JsonKey(name: 'Details')
  List<OrderHistoryDetailsOrderItemDetailsDto> get details {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  @JsonKey(name: 'TenderContractDetails')
  final OrderHistoryDetailsOrderItemTenderContractDetailsDto
      tenderContractDetails;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDto(sAPStatus: $sAPStatus, plannedDeliveryDate: $plannedDeliveryDate, pickedQuantity: $pickedQuantity, batch: $batch, expiryDate: $expiryDate, lineReferenceNotes: $lineReferenceNotes, isTenderContractMaterial: $isTenderContractMaterial, details: $details, tenderContractDetails: $tenderContractDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemDto &&
            const DeepCollectionEquality().equals(other.sAPStatus, sAPStatus) &&
            const DeepCollectionEquality()
                .equals(other.plannedDeliveryDate, plannedDeliveryDate) &&
            const DeepCollectionEquality()
                .equals(other.pickedQuantity, pickedQuantity) &&
            const DeepCollectionEquality().equals(other.batch, batch) &&
            const DeepCollectionEquality()
                .equals(other.expiryDate, expiryDate) &&
            const DeepCollectionEquality()
                .equals(other.lineReferenceNotes, lineReferenceNotes) &&
            const DeepCollectionEquality().equals(
                other.isTenderContractMaterial, isTenderContractMaterial) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            const DeepCollectionEquality()
                .equals(other.tenderContractDetails, tenderContractDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sAPStatus),
      const DeepCollectionEquality().hash(plannedDeliveryDate),
      const DeepCollectionEquality().hash(pickedQuantity),
      const DeepCollectionEquality().hash(batch),
      const DeepCollectionEquality().hash(expiryDate),
      const DeepCollectionEquality().hash(lineReferenceNotes),
      const DeepCollectionEquality().hash(isTenderContractMaterial),
      const DeepCollectionEquality().hash(_details),
      const DeepCollectionEquality().hash(tenderContractDetails));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsOrderItemDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDto>
      get copyWith => __$$_OrderHistoryDetailsOrderItemDtoCopyWithImpl<
          _$_OrderHistoryDetailsOrderItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsOrderItemDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemDto
    extends OrderHistoryDetailsOrderItemDto {
  const factory _OrderHistoryDetailsOrderItemDto(
      {@JsonKey(name: 'SAPStatus')
          required final String sAPStatus,
      @JsonKey(name: 'PlannedDeliveryDate')
          required final String plannedDeliveryDate,
      @JsonKey(name: 'PickedQuantity')
          required final int pickedQuantity,
      @JsonKey(name: 'Batch')
          required final String batch,
      @JsonKey(name: 'ExpiryDate')
          required final String expiryDate,
      @JsonKey(name: 'LineReferenceNotes')
          required final String lineReferenceNotes,
      @JsonKey(name: 'IsTenderContractMaterial')
          required final bool isTenderContractMaterial,
      @JsonKey(name: 'Details')
          required final List<OrderHistoryDetailsOrderItemDetailsDto> details,
      @JsonKey(name: 'TenderContractDetails')
          required final OrderHistoryDetailsOrderItemTenderContractDetailsDto
              tenderContractDetails}) = _$_OrderHistoryDetailsOrderItemDto;
  const _OrderHistoryDetailsOrderItemDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsOrderItemDto.fromJson;

  @override
  @JsonKey(name: 'SAPStatus')
  String get sAPStatus;
  @override
  @JsonKey(name: 'PlannedDeliveryDate')
  String get plannedDeliveryDate;
  @override
  @JsonKey(name: 'PickedQuantity')
  int get pickedQuantity;
  @override
  @JsonKey(name: 'Batch')
  String get batch;
  @override
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate;
  @override
  @JsonKey(name: 'LineReferenceNotes')
  String get lineReferenceNotes;
  @override
  @JsonKey(name: 'IsTenderContractMaterial')
  bool get isTenderContractMaterial;
  @override
  @JsonKey(name: 'Details')
  List<OrderHistoryDetailsOrderItemDetailsDto> get details;
  @override
  @JsonKey(name: 'TenderContractDetails')
  OrderHistoryDetailsOrderItemTenderContractDetailsDto
      get tenderContractDetails;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemDto>
      get copyWith => throw _privateConstructorUsedError;
}
