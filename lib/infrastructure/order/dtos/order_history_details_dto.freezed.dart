// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsDto _$OrderHistoryDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsDto {
  @JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
  OrderHistoryDetailsOrderHeadersDto get orderHistoryDetailsOrderHeader =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
  OrderHistoryDetailsShippingInformationDto
      get orderHistoryDetailsShippingInformation =>
          throw _privateConstructorUsedError;
  @JsonKey(
      name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get orderHistoryDetailsSpecialInstructions =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
  List<OrderHistoryDetailsPODocumentsDto> get orderHistoryDetailsPoDocuments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
  List<OrderHistoryDetailsMessagesDto> get orderHistoryDetailsMessages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsDtoCopyWith<OrderHistoryDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsDtoCopyWith(OrderHistoryDetailsDto value,
          $Res Function(OrderHistoryDetailsDto) then) =
      _$OrderHistoryDetailsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
          OrderHistoryDetailsOrderHeadersDto orderHistoryDetailsOrderHeader,
      @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
          OrderHistoryDetailsShippingInformationDto orderHistoryDetailsShippingInformation,
      @JsonKey(name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
          List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
          OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
          List<OrderHistoryDetailsPODocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
          List<OrderHistoryDetailsMessagesDto> orderHistoryDetailsMessages});

  $OrderHistoryDetailsOrderHeadersDtoCopyWith<$Res>
      get orderHistoryDetailsOrderHeader;
  $OrderHistoryDetailsShippingInformationDtoCopyWith<$Res>
      get orderHistoryDetailsShippingInformation;
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class _$OrderHistoryDetailsDtoCopyWithImpl<$Res>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryDetailsDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsDto) _then;

  @override
  $Res call({
    Object? orderHistoryDetailsOrderHeader = freezed,
    Object? orderHistoryDetailsShippingInformation = freezed,
    Object? orderHistoryDetailsOrderItem = freezed,
    Object? orderHistoryDetailsPaymentTerm = freezed,
    Object? orderHistoryDetailsSpecialInstructions = freezed,
    Object? orderHistoryDetailsPoDocuments = freezed,
    Object? orderHistoryDetailsMessages = freezed,
  }) {
    return _then(_value.copyWith(
      orderHistoryDetailsOrderHeader: orderHistoryDetailsOrderHeader == freezed
          ? _value.orderHistoryDetailsOrderHeader
          : orderHistoryDetailsOrderHeader // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderHeadersDto,
      orderHistoryDetailsShippingInformation:
          orderHistoryDetailsShippingInformation == freezed
              ? _value.orderHistoryDetailsShippingInformation
              : orderHistoryDetailsShippingInformation // ignore: cast_nullable_to_non_nullable
                  as OrderHistoryDetailsShippingInformationDto,
      orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem == freezed
          ? _value.orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: orderHistoryDetailsPaymentTerm == freezed
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions:
          orderHistoryDetailsSpecialInstructions == freezed
              ? _value.orderHistoryDetailsSpecialInstructions
              : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
                  as String,
      orderHistoryDetailsPoDocuments: orderHistoryDetailsPoDocuments == freezed
          ? _value.orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsPODocumentsDto>,
      orderHistoryDetailsMessages: orderHistoryDetailsMessages == freezed
          ? _value.orderHistoryDetailsMessages
          : orderHistoryDetailsMessages // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsMessagesDto>,
    ));
  }

  @override
  $OrderHistoryDetailsOrderHeadersDtoCopyWith<$Res>
      get orderHistoryDetailsOrderHeader {
    return $OrderHistoryDetailsOrderHeadersDtoCopyWith<$Res>(
        _value.orderHistoryDetailsOrderHeader, (value) {
      return _then(_value.copyWith(orderHistoryDetailsOrderHeader: value));
    });
  }

  @override
  $OrderHistoryDetailsShippingInformationDtoCopyWith<$Res>
      get orderHistoryDetailsShippingInformation {
    return $OrderHistoryDetailsShippingInformationDtoCopyWith<$Res>(
        _value.orderHistoryDetailsShippingInformation, (value) {
      return _then(
          _value.copyWith(orderHistoryDetailsShippingInformation: value));
    });
  }

  @override
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm {
    return $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>(
        _value.orderHistoryDetailsPaymentTerm, (value) {
      return _then(_value.copyWith(orderHistoryDetailsPaymentTerm: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsDtoCopyWith<$Res>
    implements $OrderHistoryDetailsDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsDtoCopyWith(_$_OrderHistoryDetailsDto value,
          $Res Function(_$_OrderHistoryDetailsDto) then) =
      __$$_OrderHistoryDetailsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
          OrderHistoryDetailsOrderHeadersDto orderHistoryDetailsOrderHeader,
      @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
          OrderHistoryDetailsShippingInformationDto orderHistoryDetailsShippingInformation,
      @JsonKey(name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
          List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
          OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
          List<OrderHistoryDetailsPODocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
          List<OrderHistoryDetailsMessagesDto> orderHistoryDetailsMessages});

  @override
  $OrderHistoryDetailsOrderHeadersDtoCopyWith<$Res>
      get orderHistoryDetailsOrderHeader;
  @override
  $OrderHistoryDetailsShippingInformationDtoCopyWith<$Res>
      get orderHistoryDetailsShippingInformation;
  @override
  $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res>
      get orderHistoryDetailsPaymentTerm;
}

/// @nodoc
class __$$_OrderHistoryDetailsDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryDetailsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsDtoCopyWithImpl(_$_OrderHistoryDetailsDto _value,
      $Res Function(_$_OrderHistoryDetailsDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryDetailsDto));

  @override
  _$_OrderHistoryDetailsDto get _value =>
      super._value as _$_OrderHistoryDetailsDto;

  @override
  $Res call({
    Object? orderHistoryDetailsOrderHeader = freezed,
    Object? orderHistoryDetailsShippingInformation = freezed,
    Object? orderHistoryDetailsOrderItem = freezed,
    Object? orderHistoryDetailsPaymentTerm = freezed,
    Object? orderHistoryDetailsSpecialInstructions = freezed,
    Object? orderHistoryDetailsPoDocuments = freezed,
    Object? orderHistoryDetailsMessages = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsDto(
      orderHistoryDetailsOrderHeader: orderHistoryDetailsOrderHeader == freezed
          ? _value.orderHistoryDetailsOrderHeader
          : orderHistoryDetailsOrderHeader // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsOrderHeadersDto,
      orderHistoryDetailsShippingInformation:
          orderHistoryDetailsShippingInformation == freezed
              ? _value.orderHistoryDetailsShippingInformation
              : orderHistoryDetailsShippingInformation // ignore: cast_nullable_to_non_nullable
                  as OrderHistoryDetailsShippingInformationDto,
      orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem == freezed
          ? _value._orderHistoryDetailsOrderItem
          : orderHistoryDetailsOrderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderItemDto>,
      orderHistoryDetailsPaymentTerm: orderHistoryDetailsPaymentTerm == freezed
          ? _value.orderHistoryDetailsPaymentTerm
          : orderHistoryDetailsPaymentTerm // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetailsPaymentTermDto,
      orderHistoryDetailsSpecialInstructions:
          orderHistoryDetailsSpecialInstructions == freezed
              ? _value.orderHistoryDetailsSpecialInstructions
              : orderHistoryDetailsSpecialInstructions // ignore: cast_nullable_to_non_nullable
                  as String,
      orderHistoryDetailsPoDocuments: orderHistoryDetailsPoDocuments == freezed
          ? _value._orderHistoryDetailsPoDocuments
          : orderHistoryDetailsPoDocuments // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsPODocumentsDto>,
      orderHistoryDetailsMessages: orderHistoryDetailsMessages == freezed
          ? _value._orderHistoryDetailsMessages
          : orderHistoryDetailsMessages // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsMessagesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsDto extends _OrderHistoryDetailsDto {
  const _$_OrderHistoryDetailsDto(
      {@JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
          required this.orderHistoryDetailsOrderHeader,
      @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
          required this.orderHistoryDetailsShippingInformation,
      @JsonKey(name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
          required final List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
          required this.orderHistoryDetailsPaymentTerm,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          required this.orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
          required final List<OrderHistoryDetailsPODocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
          required final List<OrderHistoryDetailsMessagesDto> orderHistoryDetailsMessages})
      : _orderHistoryDetailsOrderItem = orderHistoryDetailsOrderItem,
        _orderHistoryDetailsPoDocuments = orderHistoryDetailsPoDocuments,
        _orderHistoryDetailsMessages = orderHistoryDetailsMessages,
        super._();

  factory _$_OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
  final OrderHistoryDetailsOrderHeadersDto orderHistoryDetailsOrderHeader;
  @override
  @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
  final OrderHistoryDetailsShippingInformationDto
      orderHistoryDetailsShippingInformation;
  final List<OrderHistoryDetailsOrderItemDto> _orderHistoryDetailsOrderItem;
  @override
  @JsonKey(
      name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsOrderItem);
  }

  @override
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  final OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  final String orderHistoryDetailsSpecialInstructions;
  final List<OrderHistoryDetailsPODocumentsDto> _orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(
      name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
  List<OrderHistoryDetailsPODocumentsDto> get orderHistoryDetailsPoDocuments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsPoDocuments);
  }

  final List<OrderHistoryDetailsMessagesDto> _orderHistoryDetailsMessages;
  @override
  @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
  List<OrderHistoryDetailsMessagesDto> get orderHistoryDetailsMessages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHistoryDetailsMessages);
  }

  @override
  String toString() {
    return 'OrderHistoryDetailsDto(orderHistoryDetailsOrderHeader: $orderHistoryDetailsOrderHeader, orderHistoryDetailsShippingInformation: $orderHistoryDetailsShippingInformation, orderHistoryDetailsOrderItem: $orderHistoryDetailsOrderItem, orderHistoryDetailsPaymentTerm: $orderHistoryDetailsPaymentTerm, orderHistoryDetailsSpecialInstructions: $orderHistoryDetailsSpecialInstructions, orderHistoryDetailsPoDocuments: $orderHistoryDetailsPoDocuments, orderHistoryDetailsMessages: $orderHistoryDetailsMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsDto &&
            const DeepCollectionEquality().equals(
                other.orderHistoryDetailsOrderHeader,
                orderHistoryDetailsOrderHeader) &&
            const DeepCollectionEquality().equals(
                other.orderHistoryDetailsShippingInformation,
                orderHistoryDetailsShippingInformation) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsOrderItem,
                _orderHistoryDetailsOrderItem) &&
            const DeepCollectionEquality().equals(
                other.orderHistoryDetailsPaymentTerm,
                orderHistoryDetailsPaymentTerm) &&
            const DeepCollectionEquality().equals(
                other.orderHistoryDetailsSpecialInstructions,
                orderHistoryDetailsSpecialInstructions) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsPoDocuments,
                _orderHistoryDetailsPoDocuments) &&
            const DeepCollectionEquality().equals(
                other._orderHistoryDetailsMessages,
                _orderHistoryDetailsMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderHistoryDetailsOrderHeader),
      const DeepCollectionEquality()
          .hash(orderHistoryDetailsShippingInformation),
      const DeepCollectionEquality().hash(_orderHistoryDetailsOrderItem),
      const DeepCollectionEquality().hash(orderHistoryDetailsPaymentTerm),
      const DeepCollectionEquality()
          .hash(orderHistoryDetailsSpecialInstructions),
      const DeepCollectionEquality().hash(_orderHistoryDetailsPoDocuments),
      const DeepCollectionEquality().hash(_orderHistoryDetailsMessages));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsDtoCopyWith<_$_OrderHistoryDetailsDto> get copyWith =>
      __$$_OrderHistoryDetailsDtoCopyWithImpl<_$_OrderHistoryDetailsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsDto extends OrderHistoryDetailsDto {
  const factory _OrderHistoryDetailsDto(
      {@JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
          required final OrderHistoryDetailsOrderHeadersDto
              orderHistoryDetailsOrderHeader,
      @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
          required final OrderHistoryDetailsShippingInformationDto orderHistoryDetailsShippingInformation,
      @JsonKey(name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
          required final List<OrderHistoryDetailsOrderItemDto> orderHistoryDetailsOrderItem,
      @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
          required final OrderHistoryDetailsPaymentTermDto orderHistoryDetailsPaymentTerm,
      @JsonKey(name: 'SpecialInstructions', defaultValue: '')
          required final String orderHistoryDetailsSpecialInstructions,
      @JsonKey(name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
          required final List<OrderHistoryDetailsPODocumentsDto> orderHistoryDetailsPoDocuments,
      @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
          required final List<OrderHistoryDetailsMessagesDto> orderHistoryDetailsMessages}) = _$_OrderHistoryDetailsDto;
  const _OrderHistoryDetailsDto._() : super._();

  factory _OrderHistoryDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsDto.fromJson;

  @override
  @JsonKey(name: 'OrderHeader', readValue: orderHeaderOverride)
  OrderHistoryDetailsOrderHeadersDto get orderHistoryDetailsOrderHeader;
  @override
  @JsonKey(name: 'ShippingInformation', readValue: shippingInformationOverride)
  OrderHistoryDetailsShippingInformationDto
      get orderHistoryDetailsShippingInformation;
  @override
  @JsonKey(
      name: 'OrderItems', defaultValue: <OrderHistoryDetailsOrderItemDto>[])
  List<OrderHistoryDetailsOrderItemDto> get orderHistoryDetailsOrderItem;
  @override
  @JsonKey(name: 'PaymentTerm', readValue: paymentTermOverride)
  OrderHistoryDetailsPaymentTermDto get orderHistoryDetailsPaymentTerm;
  @override
  @JsonKey(name: 'SpecialInstructions', defaultValue: '')
  String get orderHistoryDetailsSpecialInstructions;
  @override
  @JsonKey(
      name: 'PODocuments', defaultValue: <OrderHistoryDetailsPODocumentsDto>[])
  List<OrderHistoryDetailsPODocumentsDto> get orderHistoryDetailsPoDocuments;
  @override
  @JsonKey(name: 'Messages', defaultValue: <OrderHistoryDetailsMessagesDto>[])
  List<OrderHistoryDetailsMessagesDto> get orderHistoryDetailsMessages;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsDtoCopyWith<_$_OrderHistoryDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
