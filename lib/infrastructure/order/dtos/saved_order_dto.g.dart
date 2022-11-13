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
    };
