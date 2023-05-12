import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_schedule_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/usage.dart';

part 'return_item_dto.freezed.dart';
part 'return_item_dto.g.dart';

@freezed
class ReturnItemDto with _$ReturnItemDto {
  const ReturnItemDto._();

  const factory ReturnItemDto({
    @JsonKey(name: 'assignmentNumber', defaultValue: '')
        required String assignmentNumber,
    @JsonKey(name: 'referenceDocument', defaultValue: '')
        required String referenceDocument,
    @JsonKey(name: 'purchaseNumberC', defaultValue: '')
        required String purchaseNumberC,
    @JsonKey(name: 'poMethod', defaultValue: '') required String poMethod,
    @JsonKey(name: 'createdDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
    @JsonKey(name: 'plant', defaultValue: '') required String plant,
    @JsonKey(name: 'material', defaultValue: '') required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'itemNumber', defaultValue: '') required String itemNumber,
    @JsonKey(name: 'targetQuantity', defaultValue: '')
        required String targetQuantity,
    @JsonKey(name: 'storeLocation', defaultValue: '')
        required String storeLocation,
    @JsonKey(name: 'batch', defaultValue: '') required String batch,
    @JsonKey(name: 'highLevelItemCode', defaultValue: '')
        required String highLevelItemCode,
    @JsonKey(name: 'orderReason', defaultValue: '') required String orderReason,
    @JsonKey(name: 'priceDate', defaultValue: '') required String priceDate,
    @JsonKey(name: 'unitPrice', defaultValue: '') required String unitPrice,
    @JsonKey(name: 'totalPrice', defaultValue: '') required String totalPrice,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'expiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'eligibleForReturn', defaultValue: true)
        required bool eligibleForReturn,
    @JsonKey(name: 'schedules', defaultValue: <ReturnScheduleDto>[])
        required List<ReturnScheduleDto> schedules,
    @JsonKey(name: 'suggestedPriceOverride', defaultValue: '')
        required String suggestedPriceOverride,
    @JsonKey(name: 'balanceQuantity', defaultValue: '')
        required String balanceQuantity,
    @JsonKey(name: 'balanceValue', defaultValue: '')
        required String balanceValue,
    @JsonKey(name: 'outsidePolicy', defaultValue: false)
        required bool outsidePolicy,
  }) = _ReturnItemDto;

  factory ReturnItemDto.fromDomain(
    ReturnItem returnItem,
  ) {
    return ReturnItemDto(
      assignmentNumber: returnItem.assignmentNumber,
      referenceDocument: returnItem.referenceDocument,
      purchaseNumberC: returnItem.purchaseNumberC,
      poMethod: returnItem.poMethod,
      createdDate: returnItem.createdDate.getOrCrash(),
      currency: returnItem.currency,
      plant: returnItem.plant,
      materialNumber: returnItem.materialNumber.getOrCrash(),
      materialDescription: returnItem.materialDescription,
      itemNumber: returnItem.itemNumber,
      targetQuantity: returnItem.targetQuantity.toString(),
      storeLocation: returnItem.storeLocation,
      batch: returnItem.batch,
      highLevelItemCode: returnItem.highLevelItemCode,
      orderReason: returnItem.orderReason,
      priceDate: returnItem.priceDate.getOrCrash(),
      unitPrice: returnItem.unitPrice.toString(),
      totalPrice: returnItem.totalPrice.toString(),
      principalName:
          returnItem.principalData.principalName.getOrDefaultValue(''),
      principalCode: returnItem.principalData.principalCode.getOrCrash(),
      expiryDate: returnItem.expiryDate.getOrCrash(),
      eligibleForReturn: returnItem.eligibleForReturn,
      schedules: returnItem.schedules
          .map((schedule) => ReturnScheduleDto.fromDomain(schedule))
          .toList(),
      suggestedPriceOverride: returnItem.suggestedPriceOverride,
      balanceQuantity: returnItem.balanceQuantity.toString(),
      balanceValue: returnItem.balanceValue.toString(),
      outsidePolicy: returnItem.outsidePolicy,
    );
  }

  ReturnItem toDomain() {
    return ReturnItem(
      assignmentNumber: assignmentNumber,
      referenceDocument: referenceDocument,
      purchaseNumberC: purchaseNumberC,
      poMethod: poMethod,
      createdDate: DateTimeStringValue(createdDate),
      currency: currency,
      plant: plant,
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      itemNumber: itemNumber,
      targetQuantity: int.parse(targetQuantity),
      storeLocation: storeLocation,
      batch: batch,
      highLevelItemCode: highLevelItemCode,
      orderReason: orderReason,
      priceDate: DateTimeStringValue(priceDate),
      unitPrice: double.parse(unitPrice),
      totalPrice: double.parse(totalPrice),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      expiryDate: DateTimeStringValue(expiryDate),
      eligibleForReturn: eligibleForReturn,
      schedules: schedules.map((e) => e.toDomain()).toList(),
      suggestedPriceOverride: suggestedPriceOverride,
      balanceQuantity: int.parse(balanceQuantity),
      balanceValue: double.parse(balanceValue),
      outsidePolicy: outsidePolicy,
      poDocuments: [],
      returnQuantity: ReturnQuantity(''),
      usage: Usage.empty(),
    );
  }

  factory ReturnItemDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemDtoFromJson(json);
}
