// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitOrder {
  String get userName => throw _privateConstructorUsedError;
  CompanyName get companyName => throw _privateConstructorUsedError;
  SubmitOrderCustomer get customer => throw _privateConstructorUsedError;
  String get poReference => throw _privateConstructorUsedError;
  List<SubmitMaterialInfo> get products => throw _privateConstructorUsedError;
  String get poDate => throw _privateConstructorUsedError;
  String get requestedDeliveryDate => throw _privateConstructorUsedError;
  String get specialInstructions => throw _privateConstructorUsedError;
  double get orderValue => throw _privateConstructorUsedError;
  String get telephone => throw _privateConstructorUsedError;
  String get referenceNotes => throw _privateConstructorUsedError;
  String get paymentTerms => throw _privateConstructorUsedError;
  String get collectiveNumber => throw _privateConstructorUsedError;
  bool get blockOrder => throw _privateConstructorUsedError;
  List<PoDocuments> get poDocuments => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitOrderCopyWith<SubmitOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderCopyWith<$Res> {
  factory $SubmitOrderCopyWith(
          SubmitOrder value, $Res Function(SubmitOrder) then) =
      _$SubmitOrderCopyWithImpl<$Res, SubmitOrder>;
  @useResult
  $Res call(
      {String userName,
      CompanyName companyName,
      SubmitOrderCustomer customer,
      String poReference,
      List<SubmitMaterialInfo> products,
      String poDate,
      String requestedDeliveryDate,
      String specialInstructions,
      double orderValue,
      String telephone,
      String referenceNotes,
      String paymentTerms,
      String collectiveNumber,
      bool blockOrder,
      List<PoDocuments> poDocuments,
      String language,
      String paymentMethod});

  $SubmitOrderCustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$SubmitOrderCopyWithImpl<$Res, $Val extends SubmitOrder>
    implements $SubmitOrderCopyWith<$Res> {
  _$SubmitOrderCopyWithImpl(this._value, this._then);

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
    Object? products = null,
    Object? poDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstructions = null,
    Object? orderValue = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? blockOrder = null,
    Object? poDocuments = null,
    Object? language = null,
    Object? paymentMethod = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as SubmitOrderCustomer,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialInfo>,
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
      poDocuments: null == poDocuments
          ? _value.poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitOrderCustomerCopyWith<$Res> get customer {
    return $SubmitOrderCustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubmitOrderCustomerCopyWith<$Res>
    implements $SubmitOrderCopyWith<$Res> {
  factory _$$_SubmitOrderCustomerCopyWith(_$_SubmitOrderCustomer value,
          $Res Function(_$_SubmitOrderCustomer) then) =
      __$$_SubmitOrderCustomerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      CompanyName companyName,
      SubmitOrderCustomer customer,
      String poReference,
      List<SubmitMaterialInfo> products,
      String poDate,
      String requestedDeliveryDate,
      String specialInstructions,
      double orderValue,
      String telephone,
      String referenceNotes,
      String paymentTerms,
      String collectiveNumber,
      bool blockOrder,
      List<PoDocuments> poDocuments,
      String language,
      String paymentMethod});

  @override
  $SubmitOrderCustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$_SubmitOrderCustomerCopyWithImpl<$Res>
    extends _$SubmitOrderCopyWithImpl<$Res, _$_SubmitOrderCustomer>
    implements _$$_SubmitOrderCustomerCopyWith<$Res> {
  __$$_SubmitOrderCustomerCopyWithImpl(_$_SubmitOrderCustomer _value,
      $Res Function(_$_SubmitOrderCustomer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? companyName = null,
    Object? customer = null,
    Object? poReference = null,
    Object? products = null,
    Object? poDate = null,
    Object? requestedDeliveryDate = null,
    Object? specialInstructions = null,
    Object? orderValue = null,
    Object? telephone = null,
    Object? referenceNotes = null,
    Object? paymentTerms = null,
    Object? collectiveNumber = null,
    Object? blockOrder = null,
    Object? poDocuments = null,
    Object? language = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$_SubmitOrderCustomer(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as SubmitOrderCustomer,
      poReference: null == poReference
          ? _value.poReference
          : poReference // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialInfo>,
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
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitOrderCustomer extends _SubmitOrderCustomer {
  const _$_SubmitOrderCustomer(
      {required this.userName,
      required this.companyName,
      required this.customer,
      required this.poReference,
      required final List<SubmitMaterialInfo> products,
      required this.poDate,
      required this.requestedDeliveryDate,
      required this.specialInstructions,
      required this.orderValue,
      required this.telephone,
      required this.referenceNotes,
      required this.paymentTerms,
      required this.collectiveNumber,
      required this.blockOrder,
      required final List<PoDocuments> poDocuments,
      required this.language,
      required this.paymentMethod})
      : _products = products,
        _poDocuments = poDocuments,
        super._();

  @override
  final String userName;
  @override
  final CompanyName companyName;
  @override
  final SubmitOrderCustomer customer;
  @override
  final String poReference;
  final List<SubmitMaterialInfo> _products;
  @override
  List<SubmitMaterialInfo> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String poDate;
  @override
  final String requestedDeliveryDate;
  @override
  final String specialInstructions;
  @override
  final double orderValue;
  @override
  final String telephone;
  @override
  final String referenceNotes;
  @override
  final String paymentTerms;
  @override
  final String collectiveNumber;
  @override
  final bool blockOrder;
  final List<PoDocuments> _poDocuments;
  @override
  List<PoDocuments> get poDocuments {
    if (_poDocuments is EqualUnmodifiableListView) return _poDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  final String language;
  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'SubmitOrder(userName: $userName, companyName: $companyName, customer: $customer, poReference: $poReference, products: $products, poDate: $poDate, requestedDeliveryDate: $requestedDeliveryDate, specialInstructions: $specialInstructions, orderValue: $orderValue, telephone: $telephone, referenceNotes: $referenceNotes, paymentTerms: $paymentTerms, collectiveNumber: $collectiveNumber, blockOrder: $blockOrder, poDocuments: $poDocuments, language: $language, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderCustomer &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.poReference, poReference) ||
                other.poReference == poReference) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.poDate, poDate) || other.poDate == poDate) &&
            (identical(other.requestedDeliveryDate, requestedDeliveryDate) ||
                other.requestedDeliveryDate == requestedDeliveryDate) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
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
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      companyName,
      customer,
      poReference,
      const DeepCollectionEquality().hash(_products),
      poDate,
      requestedDeliveryDate,
      specialInstructions,
      orderValue,
      telephone,
      referenceNotes,
      paymentTerms,
      collectiveNumber,
      blockOrder,
      const DeepCollectionEquality().hash(_poDocuments),
      language,
      paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderCustomerCopyWith<_$_SubmitOrderCustomer> get copyWith =>
      __$$_SubmitOrderCustomerCopyWithImpl<_$_SubmitOrderCustomer>(
          this, _$identity);
}

abstract class _SubmitOrderCustomer extends SubmitOrder {
  const factory _SubmitOrderCustomer(
      {required final String userName,
      required final CompanyName companyName,
      required final SubmitOrderCustomer customer,
      required final String poReference,
      required final List<SubmitMaterialInfo> products,
      required final String poDate,
      required final String requestedDeliveryDate,
      required final String specialInstructions,
      required final double orderValue,
      required final String telephone,
      required final String referenceNotes,
      required final String paymentTerms,
      required final String collectiveNumber,
      required final bool blockOrder,
      required final List<PoDocuments> poDocuments,
      required final String language,
      required final String paymentMethod}) = _$_SubmitOrderCustomer;
  const _SubmitOrderCustomer._() : super._();

  @override
  String get userName;
  @override
  CompanyName get companyName;
  @override
  SubmitOrderCustomer get customer;
  @override
  String get poReference;
  @override
  List<SubmitMaterialInfo> get products;
  @override
  String get poDate;
  @override
  String get requestedDeliveryDate;
  @override
  String get specialInstructions;
  @override
  double get orderValue;
  @override
  String get telephone;
  @override
  String get referenceNotes;
  @override
  String get paymentTerms;
  @override
  String get collectiveNumber;
  @override
  bool get blockOrder;
  @override
  List<PoDocuments> get poDocuments;
  @override
  String get language;
  @override
  String get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderCustomerCopyWith<_$_SubmitOrderCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}
