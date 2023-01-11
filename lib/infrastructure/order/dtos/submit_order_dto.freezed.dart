// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'submit_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitOrderDto _$SubmitOrderDtoFromJson(Map<String, dynamic> json) {
  return _SubmitOrderDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitOrderDto {
  @JsonKey(name: 'username', defaultValue: '')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyName', defaultValue: '')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  SubmitOrderCustomerDto get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'POReference', defaultValue: '')
  String get poReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
  List<SubmitMaterialInfoDto> get materials =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PODate', defaultValue: '')
  String get poDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  String get purchaseOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  String get shippingCondition => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephone', defaultValue: '')
  String get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  String get paymentTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  String get collectiveNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  bool get subscribeStatusChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'trackingLevel', defaultValue: '')
  String get trackingLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockOrder', defaultValue: false)
  bool get blockOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitOrderDtoCopyWith<SubmitOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderDtoCopyWith<$Res> {
  factory $SubmitOrderDtoCopyWith(
          SubmitOrderDto value, $Res Function(SubmitOrderDto) then) =
      _$SubmitOrderDtoCopyWithImpl<$Res, SubmitOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'username', defaultValue: '')
          String userName,
      @JsonKey(name: 'companyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'customer')
          SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '')
          String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
          List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '')
          String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
          String specialInstructions,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
          String purchaseOrderType,
      @JsonKey(name: 'orderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          String shippingCondition,
      @JsonKey(name: 'telephone', defaultValue: '')
          String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
          String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
          String paymentTerms,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          String collectiveNumber,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          bool subscribeStatusChange,
      @JsonKey(name: 'trackingLevel', defaultValue: '')
          String trackingLevel,
      @JsonKey(name: 'blockOrder', defaultValue: false)
          bool blockOrder,
      @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> poDocuments});

  $SubmitOrderCustomerDtoCopyWith<$Res> get customer;
}

/// @nodoc
class _$SubmitOrderDtoCopyWithImpl<$Res, $Val extends SubmitOrderDto>
    implements $SubmitOrderDtoCopyWith<$Res> {
  _$SubmitOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? companyName = null,
    Object? customer = null,
    Object? poReference = null,
    Object? materials = null,
    Object? poDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstructions = null,
    Object? purchaseOrderType = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? shippingCondition = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? subscribeStatusChange = null,
    Object? trackingLevel = null,
    Object? blockOrder = null,
    Object? poDocuments = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as SubmitOrderCustomerDto,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialInfoDto>,
      poDate: null == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerms: null == paymentTerms
          ? _value.paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as String,
      collectiveNumber: null == collectiveNumber
          ? _value.collectiveNumber
          : collectiveNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subscribeStatusChange: null == subscribeStatusChange
          ? _value.subscribeStatusChange
          : subscribeStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
      trackingLevel: null == trackingLevel
          ? _value.trackingLevel
          : trackingLevel // ignore: cast_nullable_to_non_nullable
              as String,
      blockOrder: null == blockOrder
          ? _value.blockOrder
          : blockOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      poDocuments: null == poDocuments
          ? _value.poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitOrderCustomerDtoCopyWith<$Res> get customer {
    return $SubmitOrderCustomerDtoCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubmitOrderDtoCopyWith<$Res>
    implements $SubmitOrderDtoCopyWith<$Res> {
  factory _$$_SubmitOrderDtoCopyWith(
          _$_SubmitOrderDto value, $Res Function(_$_SubmitOrderDto) then) =
      __$$_SubmitOrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'username', defaultValue: '')
          String userName,
      @JsonKey(name: 'companyName', defaultValue: '')
          String companyName,
      @JsonKey(name: 'customer')
          SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '')
          String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
          List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '')
          String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
          String specialInstructions,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
          String purchaseOrderType,
      @JsonKey(name: 'orderType', defaultValue: '')
          String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          String shippingCondition,
      @JsonKey(name: 'telephone', defaultValue: '')
          String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
          String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
          String paymentTerms,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          String collectiveNumber,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          bool subscribeStatusChange,
      @JsonKey(name: 'trackingLevel', defaultValue: '')
          String trackingLevel,
      @JsonKey(name: 'blockOrder', defaultValue: false)
          bool blockOrder,
      @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
          List<PoDocumentsDto> poDocuments});

  @override
  $SubmitOrderCustomerDtoCopyWith<$Res> get customer;
}

/// @nodoc
class __$$_SubmitOrderDtoCopyWithImpl<$Res>
    extends _$SubmitOrderDtoCopyWithImpl<$Res, _$_SubmitOrderDto>
    implements _$$_SubmitOrderDtoCopyWith<$Res> {
  __$$_SubmitOrderDtoCopyWithImpl(
      _$_SubmitOrderDto _value, $Res Function(_$_SubmitOrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? companyName = null,
    Object? customer = null,
    Object? poReference = null,
    Object? materials = null,
    Object? poDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstructions = null,
    Object? purchaseOrderType = null,
    Object? orderType = null,
    Object? orderReason = null,
    Object? shippingCondition = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? subscribeStatusChange = null,
    Object? trackingLevel = null,
    Object? blockOrder = null,
    Object? poDocuments = null,
  }) {
    return _then(_$_SubmitOrderDto(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as SubmitOrderCustomerDto,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialInfoDto>,
      poDate: null == poDate
          ? _value.poDate
          : poDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDeliveryDate: null == requestedDeliveryDate
          ? _value.requestedDeliveryDate
          : requestedDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCondition: null == shippingCondition
          ? _value.shippingCondition
          : shippingCondition // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNotes: null == referenceNotes
          ? _value.referenceNotes
          : referenceNotes // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerms: null == paymentTerms
          ? _value.paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as String,
      collectiveNumber: null == collectiveNumber
          ? _value.collectiveNumber
          : collectiveNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subscribeStatusChange: null == subscribeStatusChange
          ? _value.subscribeStatusChange
          : subscribeStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
      trackingLevel: null == trackingLevel
          ? _value.trackingLevel
          : trackingLevel // ignore: cast_nullable_to_non_nullable
              as String,
      blockOrder: null == blockOrder
          ? _value.blockOrder
          : blockOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocumentsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitOrderDto extends _SubmitOrderDto {
  const _$_SubmitOrderDto(
      {@JsonKey(name: 'username', defaultValue: '')
          required this.userName,
      @JsonKey(name: 'companyName', defaultValue: '')
          required this.companyName,
      @JsonKey(name: 'customer')
          required this.customer,
      @JsonKey(name: 'POReference', defaultValue: '')
          required this.poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
          required final List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '')
          required this.poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          required this.requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
          required this.specialInstructions,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
          required this.purchaseOrderType,
      @JsonKey(name: 'orderType', defaultValue: '')
          required this.orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          required this.orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          required this.shippingCondition,
      @JsonKey(name: 'telephone', defaultValue: '')
          required this.telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
          required this.referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
          required this.paymentTerms,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          required this.collectiveNumber,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          required this.subscribeStatusChange,
      @JsonKey(name: 'trackingLevel', defaultValue: '')
          required this.trackingLevel,
      @JsonKey(name: 'blockOrder', defaultValue: false)
          required this.blockOrder,
      @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> poDocuments})
      : _materials = materials,
        _poDocuments = poDocuments,
        super._();

  factory _$_SubmitOrderDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitOrderDtoFromJson(json);

  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String userName;
  @override
  @JsonKey(name: 'companyName', defaultValue: '')
  final String companyName;
  @override
  @JsonKey(name: 'customer')
  final SubmitOrderCustomerDto customer;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  final String poReference;
  final List<SubmitMaterialInfoDto> _materials;
  @override
  @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
  List<SubmitMaterialInfoDto> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  @JsonKey(name: 'PODate', defaultValue: '')
  final String poDate;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  final String requestedDeliveryDate;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  final String specialInstructions;
  @override
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  final String purchaseOrderType;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  final String orderReason;
  @override
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  final String shippingCondition;
  @override
  @JsonKey(name: 'telephone', defaultValue: '')
  final String telephone;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  final String referenceNotes;
  @override
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  final String paymentTerms;
  @override
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  final String collectiveNumber;
  @override
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  final bool subscribeStatusChange;
  @override
  @JsonKey(name: 'trackingLevel', defaultValue: '')
  final String trackingLevel;
  @override
  @JsonKey(name: 'blockOrder', defaultValue: false)
  final bool blockOrder;
  final List<PoDocumentsDto> _poDocuments;
  @override
  @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poDocuments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'SubmitOrderDto(userName: $userName, companyName: $companyName, customer: $customer, poReference: $poReference, materials: $materials, poDate: $poDate, requestedDeliveryDate: $requestedDeliveryDate, specialInstructions: $specialInstructions, purchaseOrderType: $purchaseOrderType, orderType: $orderType, orderReason: $orderReason, shippingCondition: $shippingCondition, telephone: $telephone, referenceNotes: $referenceNotes, paymentTerms: $paymentTerms, collectiveNumber: $collectiveNumber, subscribeStatusChange: $subscribeStatusChange, trackingLevel: $trackingLevel, blockOrder: $blockOrder, poDocuments: $poDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderDto &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.poReference, poReference) ||
                other.poReference == poReference) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.poDate, poDate) || other.poDate == poDate) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.purchaseOrderType, purchaseOrderType) ||
                other.purchaseOrderType == purchaseOrderType) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.shippingCondition, shippingCondition) ||
                other.shippingCondition == shippingCondition) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            (identical(other.paymentTerms, paymentTerms) ||
                other.paymentTerms == paymentTerms) &&
            (identical(other.collectiveNumber, collectiveNumber) ||
                other.collectiveNumber == collectiveNumber) &&
            (identical(other.subscribeStatusChange, subscribeStatusChange) ||
                other.subscribeStatusChange == subscribeStatusChange) &&
            (identical(other.trackingLevel, trackingLevel) ||
                other.trackingLevel == trackingLevel) &&
            (identical(other.blockOrder, blockOrder) ||
                other.blockOrder == blockOrder) &&
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userName,
        companyName,
        customer,
        poReference,
        const DeepCollectionEquality().hash(_materials),
        poDate,
        requestedDeliveryDate,
        specialInstructions,
        purchaseOrderType,
        orderType,
        orderReason,
        shippingCondition,
        telephone,
        referenceNotes,
        paymentTerms,
        collectiveNumber,
        subscribeStatusChange,
        trackingLevel,
        blockOrder,
        const DeepCollectionEquality().hash(_poDocuments)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderDtoCopyWith<_$_SubmitOrderDto> get copyWith =>
      __$$_SubmitOrderDtoCopyWithImpl<_$_SubmitOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitOrderDtoToJson(
      this,
    );
  }
}

abstract class _SubmitOrderDto extends SubmitOrderDto {
  const factory _SubmitOrderDto(
      {@JsonKey(name: 'username', defaultValue: '')
          required final String userName,
      @JsonKey(name: 'companyName', defaultValue: '')
          required final String companyName,
      @JsonKey(name: 'customer')
          required final SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '')
          required final String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
          required final List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '')
          required final String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
          required final String requestedDeliveryDate,
      @JsonKey(name: 'specialInstructions', defaultValue: '')
          required final String specialInstructions,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
          required final String purchaseOrderType,
      @JsonKey(name: 'orderType', defaultValue: '')
          required final String orderType,
      @JsonKey(name: 'orderReason', defaultValue: '')
          required final String orderReason,
      @JsonKey(name: 'shippingCondition', defaultValue: '')
          required final String shippingCondition,
      @JsonKey(name: 'telephone', defaultValue: '')
          required final String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
          required final String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
          required final String paymentTerms,
      @JsonKey(name: 'collectiveNumber', defaultValue: '')
          required final String collectiveNumber,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          required final bool subscribeStatusChange,
      @JsonKey(name: 'trackingLevel', defaultValue: '')
          required final String trackingLevel,
      @JsonKey(name: 'blockOrder', defaultValue: false)
          required final bool blockOrder,
      @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
          required final List<PoDocumentsDto> poDocuments}) = _$_SubmitOrderDto;
  const _SubmitOrderDto._() : super._();

  factory _SubmitOrderDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitOrderDto.fromJson;

  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get userName;
  @override
  @JsonKey(name: 'companyName', defaultValue: '')
  String get companyName;
  @override
  @JsonKey(name: 'customer')
  SubmitOrderCustomerDto get customer;
  @override
  @JsonKey(name: 'POReference', defaultValue: '')
  String get poReference;
  @override
  @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
  List<SubmitMaterialInfoDto> get materials;
  @override
  @JsonKey(name: 'PODate', defaultValue: '')
  String get poDate;
  @override
  @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
  String get requestedDeliveryDate;
  @override
  @JsonKey(name: 'specialInstructions', defaultValue: '')
  String get specialInstructions;
  @override
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  String get purchaseOrderType;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(name: 'shippingCondition', defaultValue: '')
  String get shippingCondition;
  @override
  @JsonKey(name: 'telephone', defaultValue: '')
  String get telephone;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes;
  @override
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  String get paymentTerms;
  @override
  @JsonKey(name: 'collectiveNumber', defaultValue: '')
  String get collectiveNumber;
  @override
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  bool get subscribeStatusChange;
  @override
  @JsonKey(name: 'trackingLevel', defaultValue: '')
  String get trackingLevel;
  @override
  @JsonKey(name: 'blockOrder', defaultValue: false)
  bool get blockOrder;
  @override
  @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderDtoCopyWith<_$_SubmitOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
