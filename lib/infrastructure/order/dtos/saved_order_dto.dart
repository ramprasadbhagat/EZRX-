import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order_dto.freezed.dart';
part 'saved_order_dto.g.dart';

@freezed
class SavedOrderDto with _$SavedOrderDto {
  const SavedOrderDto._();

  const factory SavedOrderDto({
    @JsonKey(name: 'id', defaultValue: '')
        required String id,
    @_OrderProductItemListConverter()
    @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
        required List<MaterialItemDto> items,
    @JsonKey(name: 'draftorder', defaultValue: false)
        required bool isDraftOrder,
    @JsonKey(name: 'BillingDocument', defaultValue: '')
        required String billingDocument,
    @JsonKey(name: 'eZRxNumber', defaultValue: '')
        required String eZRxNumber,
    @JsonKey(name: 'SoldToParty', defaultValue: '')
        required String soldToParty,
    @JsonKey(name: 'ShipToParty', defaultValue: '')
        required String shipToParty,
    @JsonKey(name: 'CompanyName', defaultValue: '')
        required String companyName,
    @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
        required double totalOrderValue,
    @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
    @JsonKey(name: 'DeliveryDocument', defaultValue: '')
        required String deliveryDocument,
    @JsonKey(name: 'SalesOrganization', defaultValue: '')
        required String salesOrganization,
    @JsonKey(name: 'Principal', defaultValue: '')
        required String principal,
    @JsonKey(name: 'ProcessingStatus', defaultValue: '')
        required String processingStatus,
    @JsonKey(name: 'country', defaultValue: '')
        required String country,
    @JsonKey(name: 'post_code1', defaultValue: '')
        required String postCode1,
    @JsonKey(name: 'orderRequest', defaultValue: '')
        required String specialInstructions,
    @JsonKey(name: 'POReference', defaultValue: '')
        required String poReference,
    @JsonKey(name: 'paymentTerm', defaultValue: '')
        required String payTerm,
    @JsonKey(name: 'collectiveNumber', defaultValue: '')
        required String collectiveNo,
    @JsonKey(name: 'Quantity', defaultValue: 0)
        required int quantity,
    @JsonKey(name: 'UnitPrice', defaultValue: 0.0)
        required double unitPrice,
    @JsonKey(name: 'TotalPrice', defaultValue: 0.0)
        required double totalPrice,
    @JsonKey(name: 'address1', defaultValue: '')
        required String address1,
    @JsonKey(name: 'address2', defaultValue: '')
        required String address2,
    @JsonKey(name: 'city', defaultValue: '')
        required String city,
    @JsonKey(name: 'fax', defaultValue: '')
        required String fax,
    @JsonKey(name: 'phonenumber', defaultValue: '')
        required String phonenumber,
    @JsonKey(name: 'orderType', defaultValue: '')
        required String orderType,
    @JsonKey(name: 'orderReason', defaultValue: '')
        required String orderReason,
    @JsonKey(name: 'shippingCondition', defaultValue: '')
        required String shippingCondition,
    @JsonKey(name: 'user', defaultValue: '')
        required String user,
    @JsonKey(name: 'contactPerson', defaultValue: '')
        required String contactPerson,
    @JsonKey(name: 'referenceNote', defaultValue: '')
        required String referenceNotes,
    @_PoDocumentsListConverter()
    @JsonKey(
      name: 'POAttachent',
      defaultValue: <PoDocumentsDto>[],
    )
        required List<PoDocumentsDto> poAttachent,
  }) = _SavedOrderDto;

  SavedOrder toDomain() {
    return SavedOrder(
      id: id,
      items: items.map((e) => e.toDomain()).toList(),
      isDraftOrder: isDraftOrder,
      isSelected: false,
      isDeleted: false,
      billingDocument: billingDocument,
      eZRxNumber: eZRxNumber,
      soldToParty: SoldToParty(soldToParty),
      shipToParty: ShipToParty(shipToParty),
      companyName: CompanyName(companyName),
      totalOrderValue: totalOrderValue,
      requestedDeliveryDate: requestedDeliveryDate,
      address1: address1,
      address2: address2,
      city: city,
      collectiveNo: collectiveNo,
      contactPerson: contactPerson,
      country: country,
      referenceNotes: referenceNotes,
      deliveryDocument: deliveryDocument,
      draftorder: false,
      fax: fax,
      orderReason: orderReason,
      orderType: orderType,
      payTerm: payTerm,
      phonenumber: phonenumber,
      poReference: poReference,
      postCode1: postCode1,
      principal: principal,
      processingStatus: processingStatus,
      quantity: quantity,
      salesOrganization: salesOrganization,
      shippingCondition: ShippingCondition(shippingCondition),
      specialInstructions: specialInstructions,
      totalPrice: totalPrice,
      unitPrice: unitPrice,
      user: user,
      poAttachent: poAttachent.map((e) => e.toDomain()).toList(),
    );
  }

  factory SavedOrderDto.fromDomain(SavedOrder saveOrder) {
    return SavedOrderDto(
      address1: saveOrder.address1,
      address2: saveOrder.address2,
      billingDocument: saveOrder.billingDocument,
      city: saveOrder.city,
      collectiveNo: saveOrder.collectiveNo,
      companyName: saveOrder.companyName.getOrDefaultValue(''),
      contactPerson: saveOrder.contactPerson,
      country: saveOrder.country,
      deliveryDocument: saveOrder.deliveryDocument,
      eZRxNumber: saveOrder.eZRxNumber,
      fax: saveOrder.fax,
      id: saveOrder.id,
      isDraftOrder: saveOrder.isDraftOrder,
      orderReason: saveOrder.orderReason,
      orderType: saveOrder.orderType,
      payTerm: saveOrder.payTerm,
      phonenumber: saveOrder.phonenumber,
      poReference: saveOrder.poReference,
      postCode1: saveOrder.postCode1,
      principal: saveOrder.principal,
      processingStatus: saveOrder.processingStatus,
      quantity: saveOrder.quantity,
      referenceNotes: saveOrder.referenceNotes,
      requestedDeliveryDate: saveOrder.requestedDeliveryDate,
      salesOrganization: saveOrder.salesOrganization,
      shipToParty: saveOrder.shipToParty.getOrDefaultValue(''),
      shippingCondition: saveOrder.shippingCondition.getOrDefaultValue(''),
      soldToParty: saveOrder.soldToParty.getOrDefaultValue(''),
      specialInstructions: saveOrder.specialInstructions,
      totalOrderValue: saveOrder.totalOrderValue,
      totalPrice: saveOrder.totalPrice,
      unitPrice: saveOrder.unitPrice,
      user: saveOrder.user,
      items: saveOrder.items.map((e) => MaterialItemDto.fromDomain(e)).toList(),
      poAttachent: saveOrder.poAttachent
          .map(
            (e) => PoDocumentsDto.fromDomain(e),
          )
          .toList(),
    );
  }

  factory SavedOrderDto.fromJson(Map<String, dynamic> json) =>
      _$SavedOrderDtoFromJson(json);
}

class _OrderProductItemListConverter
    extends JsonConverter<List<MaterialItemDto>, String> {
  const _OrderProductItemListConverter();

  @override
  List<MaterialItemDto> fromJson(String json) {
    // TODO: this is not a correct approach, technically if the data is valid, we won't neeed this kind of transformation,don't do this on other places
    final data = makeResponseCamelCase(json)['value'] ?? [];

    return List.from(data).map((e) => MaterialItemDto.fromJson(e)).toList();
  }

  @override
  String toJson(List<MaterialItemDto> object) {
    return jsonEncode({
      'value': object.map((e) => e.toJson()).toList(),
    }).toString();
  }
}

class _PoDocumentsListConverter
    extends JsonConverter<List<PoDocumentsDto>, String> {
  const _PoDocumentsListConverter();

  @override
  List<PoDocumentsDto> fromJson(String json) {
    // Because API response return PODocmentList like this "POAttachent": ""[]""
    // we will need to remove 2 characters " first and let jsonDecode do the rest
    return List.from(
      jsonDecode(
        json.substring(1, json.length - 1).replaceAll('\\"', '"'),
      ),
    ).map((e) => PoDocumentsDto.fromJson(e)).toList();
  }

  @override
  String toJson(List<PoDocumentsDto> object) {
    return jsonEncode(
      object.map((e) => e.toJson()).toList(),
    ).toString();
  }
}
