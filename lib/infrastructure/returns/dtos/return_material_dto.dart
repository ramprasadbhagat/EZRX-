import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_material_dto.freezed.dart';
part 'return_material_dto.g.dart';

@freezed
class ReturnMaterialDto with _$ReturnMaterialDto {
  const ReturnMaterialDto._();

  const factory ReturnMaterialDto({
    @JsonKey(name: 'balanceQuantity', defaultValue: '')
        required String balanceQuantity,
    @JsonKey(name: 'unitPrice', defaultValue: '') required String unitPrice,
    @JsonKey(name: 'totalPrice', defaultValue: '') required String totalPrice,
    @JsonKey(name: 'material', defaultValue: '') required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'itemNumber', defaultValue: '') required String itemNumber,
    @JsonKey(name: 'batch', defaultValue: '') required String batch,
    @JsonKey(name: 'eligibleForReturn', defaultValue: false)
        required bool eligibleForReturn,
    @JsonKey(name: 'assignmentNumber', defaultValue: '')
        required String assignmentNumber,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'expiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'priceDate', defaultValue: '') required String priceDate,
    @JsonKey(name: 'bonusItem', defaultValue: <ReturnMaterialDto>[])
        required List<ReturnMaterialDto> bonusItems,
  }) = _ReturnMaterialDto;

  factory ReturnMaterialDto.fromDomain(
    ReturnMaterial data,
  ) {
    return ReturnMaterialDto(
      balanceQuantity: data.balanceQuantity.toString(),
      unitPrice: data.unitPrice.apiParameterValue,
      totalPrice: data.totalPrice.apiParameterValue,
      materialNumber: data.materialNumber.getOrCrash(),
      materialDescription: data.materialDescription,
      batch: data.batch,
      eligibleForReturn: data.eligibleForReturn,
      itemNumber: data.itemNumber,
      assignmentNumber: data.assignmentNumber,
      principalCode: data.principalCode.getOrCrash(),
      principalName: data.principalName.getOrCrash(),
      expiryDate: data.expiryDate.getOrCrash(),
      priceDate: data.priceDate.getOrCrash(),
      bonusItems: data.bonusItems
          .map((item) => ReturnMaterialDto.fromDomain(item))
          .toList(),
    );
  }

  ReturnMaterial toDomain() {
    return ReturnMaterial(
      balanceQuantity: IntegerValue(balanceQuantity),
      unitPrice: RangeValue(unitPrice),
      totalPrice: RangeValue(totalPrice),
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      batch: batch,
      eligibleForReturn: eligibleForReturn,
      itemNumber: itemNumber,
      assignmentNumber: assignmentNumber,
      principalCode: PrincipalCode(principalCode),
      principalName: PrincipalName(principalName),
      expiryDate: DateTimeStringValue(expiryDate),
      priceDate: DateTimeStringValue(priceDate),
      bonusItems: bonusItems.map((item) => item.toDomain()).toList(),
    );
  }

  factory ReturnMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnMaterialDtoFromJson(json);
}
