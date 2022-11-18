// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedOrderDto _$$_SavedOrderDtoFromJson(Map<String, dynamic> json) =>
    _$_SavedOrderDto(
      id: json['id'] as String? ?? '',
      items: json['itemlist'] == null
          ? []
          : const _OrderProductItemListConverter()
              .fromJson(json['itemlist'] as String),
      isDraftOrder: json['draftorder'] as bool? ?? false,
      billingDocument: json['BillingDocument'] as String? ?? '',
      eZRxNumber: json['eZRxNumber'] as String? ?? '',
      soldToParty: json['SoldToParty'] as String? ?? '',
      shipToParty: json['ShipToParty'] as String? ?? '',
      companyName: json['CompanyName'] as String? ?? '',
      totalOrderValue: (json['TotalOrderValue'] as num?)?.toDouble() ?? 0,
      requestedDeliveryDate: json['requestedDeliveryDate'] as String? ?? '',
      deliveryDocument: json['DeliveryDocument'] as String? ?? '',
      salesOrganization: json['SalesOrganization'] as String? ?? '',
      principal: json['Principal'] as String? ?? '',
      processingStatus: json['ProcessingStatus'] as String? ?? '',
      country: json['country'] as String? ?? '',
      postCode1: json['post_code1'] as String? ?? '',
      specialInstructions: json['orderRequest'] as String? ?? '',
      poReference: json['POReference'] as String? ?? '',
      payTerm: json['paymentTerm'] as String? ?? '',
      collectiveNo: json['collectiveNumber'] as String? ?? '',
      quantity: json['Quantity'] as int? ?? 0,
      unitPrice: (json['UnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['TotalPrice'] as num?)?.toDouble() ?? 0.0,
      address1: json['address1'] as String? ?? '',
      address2: json['address2'] as String? ?? '',
      city: json['city'] as String? ?? '',
      fax: json['fax'] as String? ?? '',
      phonenumber: json['phonenumber'] as String? ?? '',
      orderType: json['orderType'] as String? ?? '',
      orderReason: json['orderReason'] as String? ?? '',
      shippingCondition: json['shippingCondition'] as String? ?? '',
      user: json['user'] as String? ?? '',
      contactPerson: json['contactPerson'] as String? ?? '',
      referenceNotes: json['referenceNote'] as String? ?? '',
    );

Map<String, dynamic> _$$_SavedOrderDtoToJson(_$_SavedOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemlist': const _OrderProductItemListConverter().toJson(instance.items),
      'draftorder': instance.isDraftOrder,
      'BillingDocument': instance.billingDocument,
      'eZRxNumber': instance.eZRxNumber,
      'SoldToParty': instance.soldToParty,
      'ShipToParty': instance.shipToParty,
      'CompanyName': instance.companyName,
      'TotalOrderValue': instance.totalOrderValue,
      'requestedDeliveryDate': instance.requestedDeliveryDate,
      'DeliveryDocument': instance.deliveryDocument,
      'SalesOrganization': instance.salesOrganization,
      'Principal': instance.principal,
      'ProcessingStatus': instance.processingStatus,
      'country': instance.country,
      'post_code1': instance.postCode1,
      'orderRequest': instance.specialInstructions,
      'POReference': instance.poReference,
      'paymentTerm': instance.payTerm,
      'collectiveNumber': instance.collectiveNo,
      'Quantity': instance.quantity,
      'UnitPrice': instance.unitPrice,
      'TotalPrice': instance.totalPrice,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'fax': instance.fax,
      'phonenumber': instance.phonenumber,
      'orderType': instance.orderType,
      'orderReason': instance.orderReason,
      'shippingCondition': instance.shippingCondition,
      'user': instance.user,
      'contactPerson': instance.contactPerson,
      'referenceNote': instance.referenceNotes,
    };
