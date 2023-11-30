// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get specialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderValue', defaultValue: 0)
  double get orderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTax', defaultValue: 0)
  double get totalTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Telephone', defaultValue: '')
  String get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  String get paymentTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'CollectiveNumber', defaultValue: '')
  String get collectiveNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'blockOrder', defaultValue: false)
  bool get blockOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'language', defaultValue: 'EN')
  String get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  String get purchaseOrderType => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'username', defaultValue: '') String userName,
      @JsonKey(name: 'companyName', defaultValue: '') String companyName,
      @JsonKey(name: 'customer') SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '') String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
      List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '') String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      String specialInstructions,
      @JsonKey(name: 'orderValue', defaultValue: 0) double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'Telephone', defaultValue: '') String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '') String paymentTerms,
      @JsonKey(name: 'CollectiveNumber', defaultValue: '')
      String collectiveNumber,
      @JsonKey(name: 'blockOrder', defaultValue: false) bool blockOrder,
      @JsonKey(name: 'language', defaultValue: 'EN') String language,
      @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
      String paymentMethod,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
      String purchaseOrderType,
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
    Object? orderValue = null,
    Object? totalTax = null,
    Object? orderType = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? blockOrder = null,
    Object? language = null,
    Object? paymentMethod = null,
    Object? purchaseOrderType = null,
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
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
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
      blockOrder: null == blockOrder
          ? _value.blockOrder
          : blockOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'username', defaultValue: '') String userName,
      @JsonKey(name: 'companyName', defaultValue: '') String companyName,
      @JsonKey(name: 'customer') SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '') String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
      List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '') String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      String specialInstructions,
      @JsonKey(name: 'orderValue', defaultValue: 0) double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'orderType', defaultValue: '') String orderType,
      @JsonKey(name: 'Telephone', defaultValue: '') String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '') String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '') String paymentTerms,
      @JsonKey(name: 'CollectiveNumber', defaultValue: '')
      String collectiveNumber,
      @JsonKey(name: 'blockOrder', defaultValue: false) bool blockOrder,
      @JsonKey(name: 'language', defaultValue: 'EN') String language,
      @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
      String paymentMethod,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
      String purchaseOrderType,
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
    Object? orderValue = null,
    Object? totalTax = null,
    Object? orderType = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? blockOrder = null,
    Object? language = null,
    Object? paymentMethod = null,
    Object? purchaseOrderType = null,
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
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
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
      blockOrder: null == blockOrder
          ? _value.blockOrder
          : blockOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderType: null == purchaseOrderType
          ? _value.purchaseOrderType
          : purchaseOrderType // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'username', defaultValue: '') required this.userName,
      @JsonKey(name: 'companyName', defaultValue: '') required this.companyName,
      @JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'POReference', defaultValue: '') required this.poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
      required final List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '') required this.poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required this.requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      required this.specialInstructions,
      @JsonKey(name: 'orderValue', defaultValue: 0) required this.orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0) required this.totalTax,
      @JsonKey(name: 'orderType', defaultValue: '') required this.orderType,
      @JsonKey(name: 'Telephone', defaultValue: '') required this.telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required this.referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
      required this.paymentTerms,
      @JsonKey(name: 'CollectiveNumber', defaultValue: '')
      required this.collectiveNumber,
      @JsonKey(name: 'blockOrder', defaultValue: false)
      required this.blockOrder,
      @JsonKey(name: 'language', defaultValue: 'EN') required this.language,
      @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
      required this.paymentMethod,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
      required this.purchaseOrderType,
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
    if (_materials is EqualUnmodifiableListView) return _materials;
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
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  final String specialInstructions;
  @override
  @JsonKey(name: 'orderValue', defaultValue: 0)
  final double orderValue;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0)
  final double totalTax;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  final String orderType;
  @override
  @JsonKey(name: 'Telephone', defaultValue: '')
  final String telephone;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  final String referenceNotes;
  @override
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  final String paymentTerms;
  @override
  @JsonKey(name: 'CollectiveNumber', defaultValue: '')
  final String collectiveNumber;
  @override
  @JsonKey(name: 'blockOrder', defaultValue: false)
  final bool blockOrder;
  @override
  @JsonKey(name: 'language', defaultValue: 'EN')
  final String language;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
  final String paymentMethod;
  @override
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  final String purchaseOrderType;
  final List<PoDocumentsDto> _poDocuments;
  @override
  @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poDocuments {
    if (_poDocuments is EqualUnmodifiableListView) return _poDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'SubmitOrderDto(userName: $userName, companyName: $companyName, customer: $customer, poReference: $poReference, materials: $materials, poDate: $poDate, requestedDeliveryDate: $requestedDeliveryDate, specialInstructions: $specialInstructions, orderValue: $orderValue, totalTax: $totalTax, orderType: $orderType, telephone: $telephone, referenceNotes: $referenceNotes, paymentTerms: $paymentTerms, collectiveNumber: $collectiveNumber, blockOrder: $blockOrder, language: $language, paymentMethod: $paymentMethod, purchaseOrderType: $purchaseOrderType, poDocuments: $poDocuments)';
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
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.referenceNotes, referenceNotes) ||
                other.referenceNotes == referenceNotes) &&
            (identical(other.paymentTerms, paymentTerms) ||
                other.paymentTerms == paymentTerms) &&
            (identical(other.collectiveNumber, collectiveNumber) ||
                other.collectiveNumber == collectiveNumber) &&
            (identical(other.blockOrder, blockOrder) ||
                other.blockOrder == blockOrder) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.purchaseOrderType, purchaseOrderType) ||
                other.purchaseOrderType == purchaseOrderType) &&
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
        orderValue,
        totalTax,
        orderType,
        telephone,
        referenceNotes,
        paymentTerms,
        collectiveNumber,
        blockOrder,
        language,
        paymentMethod,
        purchaseOrderType,
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
      @JsonKey(name: 'customer') required final SubmitOrderCustomerDto customer,
      @JsonKey(name: 'POReference', defaultValue: '')
      required final String poReference,
      @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
      required final List<SubmitMaterialInfoDto> materials,
      @JsonKey(name: 'PODate', defaultValue: '') required final String poDate,
      @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
      required final String requestedDeliveryDate,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
      required final String specialInstructions,
      @JsonKey(name: 'orderValue', defaultValue: 0)
      required final double orderValue,
      @JsonKey(name: 'totalTax', defaultValue: 0)
      required final double totalTax,
      @JsonKey(name: 'orderType', defaultValue: '')
      required final String orderType,
      @JsonKey(name: 'Telephone', defaultValue: '')
      required final String telephone,
      @JsonKey(name: 'referenceNotes', defaultValue: '')
      required final String referenceNotes,
      @JsonKey(name: 'paymentTerms', defaultValue: '')
      required final String paymentTerms,
      @JsonKey(name: 'CollectiveNumber', defaultValue: '')
      required final String collectiveNumber,
      @JsonKey(name: 'blockOrder', defaultValue: false)
      required final bool blockOrder,
      @JsonKey(name: 'language', defaultValue: 'EN')
      required final String language,
      @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
      required final String paymentMethod,
      @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
      required final String purchaseOrderType,
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
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get specialInstructions;
  @override
  @JsonKey(name: 'orderValue', defaultValue: 0)
  double get orderValue;
  @override
  @JsonKey(name: 'totalTax', defaultValue: 0)
  double get totalTax;
  @override
  @JsonKey(name: 'orderType', defaultValue: '')
  String get orderType;
  @override
  @JsonKey(name: 'Telephone', defaultValue: '')
  String get telephone;
  @override
  @JsonKey(name: 'referenceNotes', defaultValue: '')
  String get referenceNotes;
  @override
  @JsonKey(name: 'paymentTerms', defaultValue: '')
  String get paymentTerms;
  @override
  @JsonKey(name: 'CollectiveNumber', defaultValue: '')
  String get collectiveNumber;
  @override
  @JsonKey(name: 'blockOrder', defaultValue: false)
  bool get blockOrder;
  @override
  @JsonKey(name: 'language', defaultValue: 'EN')
  String get language;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
  String get paymentMethod;
  @override
  @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
  String get purchaseOrderType;
  @override
  @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
  List<PoDocumentsDto> get poDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderDtoCopyWith<_$_SubmitOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}
