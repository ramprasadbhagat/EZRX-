import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_customer_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_dto.freezed.dart';
part 'submit_order_dto.g.dart';

@freezed
class SubmitOrderDto with _$SubmitOrderDto {
  const SubmitOrderDto._();
  const factory SubmitOrderDto({
    @JsonKey(
      name: 'username',
      defaultValue: '',
    )
        required String userName,
    @JsonKey(name: 'companyName', defaultValue: '')
        required String companyName,
    @JsonKey(name: 'customer')
        required SubmitOrderCustomerDto customer,
    @JsonKey(name: 'POReference', defaultValue: '')
        required String poReference,
    @JsonKey(
      name: 'materials',
      defaultValue: <SubmitMaterialInfoDto>[],
    )
        required List<SubmitMaterialInfoDto> materials,
    @JsonKey(name: 'PODate', defaultValue: '')
        required String poDate,
    @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
    @JsonKey(name: 'specialInstructions', defaultValue: '')
        required String specialInstructions,
    @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
        required String purchaseOrderType,
    @JsonKey(name: 'orderType', defaultValue: '')
        required String orderType,
    @JsonKey(name: 'orderReason', defaultValue: '')
        required String orderReason,
    @JsonKey(name: 'shippingCondition', defaultValue: '')
        required String shippingCondition,
    @JsonKey(name: 'telephone', defaultValue: '')
        required String telephone,
    @JsonKey(name: 'referenceNotes', defaultValue: '')
        required String referenceNotes,
    @JsonKey(name: 'paymentTerms', defaultValue: '')
        required String paymentTerms,
    @JsonKey(name: 'collectiveNumber', defaultValue: '')
        required String collectiveNumber,
    @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
        required bool subscribeStatusChange,
    @JsonKey(name: 'trackingLevel', defaultValue: '')
        required String trackingLevel,
    @JsonKey(name: 'blockOrder', defaultValue: false)
        required bool blockOrder,
  }) = _SubmitOrderDto;

  SubmitOrder toDomain() {
    return SubmitOrder(
      userName: userName,
      companyName: CompanyName(companyName),
      customer: customer.toDomain(),
      poReference: poReference,
      materials: materials.map((e) => e.toDomain()).toList(),
      poDate: poDate,
      requestedDeliveryDate: requestedDeliveryDate,
      specialInstructions: specialInstructions,
      purchaseOrderType: purchaseOrderType,
      orderType: orderType,
      orderReason: orderReason,
      shippingCondition: shippingCondition,
      telephone: telephone,
      referenceNotes: referenceNotes,
      paymentTerms: paymentTerms,
      collectiveNumber: collectiveNumber,
      subscribeStatusChange: subscribeStatusChange,
      trackingLevel: trackingLevel,
      blockOrder: blockOrder,
    );
  }

  factory SubmitOrderDto.fromDomain(SubmitOrder submitOrder, String currency) {
    return SubmitOrderDto(
      userName: submitOrder.userName,
      companyName: submitOrder.companyName.getOrCrash(),
      customer: SubmitOrderCustomerDto.fromDomain(submitOrder.customer),
      poReference: submitOrder.poReference,
      materials: submitOrder.materials
          .map((e) => SubmitMaterialInfoDto.fromDomain(e, currency))
          .toList(),
      poDate: submitOrder.poDate,
      requestedDeliveryDate: submitOrder.requestedDeliveryDate,
      specialInstructions: submitOrder.specialInstructions,
      purchaseOrderType: submitOrder.purchaseOrderType,
      orderType: submitOrder.orderType,
      orderReason: submitOrder.orderReason,
      shippingCondition: submitOrder.shippingCondition,
      telephone: submitOrder.telephone,
      referenceNotes: submitOrder.referenceNotes,
      paymentTerms: submitOrder.paymentTerms,
      collectiveNumber: submitOrder.collectiveNumber,
      subscribeStatusChange: submitOrder.subscribeStatusChange,
      trackingLevel: submitOrder.trackingLevel,
      blockOrder: submitOrder.blockOrder,
    );
  }

  factory SubmitOrderDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderDtoFromJson(json);
}
