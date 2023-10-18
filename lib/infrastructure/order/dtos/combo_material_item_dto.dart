import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'combo_material_item_dto.freezed.dart';
part 'combo_material_item_dto.g.dart';

@freezed
class ComboMaterialItemDto with _$ComboMaterialItemDto {
  const ComboMaterialItemDto._();

  const factory ComboMaterialItemDto({
    @JsonKey(name: 'productID', defaultValue: '') required String productId,
    @JsonKey(name: 'parentID', defaultValue: '') required String parentId,
    @JsonKey(name: 'setNo', defaultValue: '') required String setNo,
    @JsonKey(name: 'quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
        required String itemSource,
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'mandatory', defaultValue: false) required bool mandatory,
    @JsonKey(name: 'suffix', defaultValue: '') required String suffix,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principleName,
    @JsonKey(name: 'listPrice', defaultValue: 0.0) required double listPrice,
    @JsonKey(name: 'ttemCheck', defaultValue: false) required bool itemCheck,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'valid', defaultValue: false) required bool valid,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'comboDealType', defaultValue: '')
        required String comboDealType,
    @JsonKey(name: 'isComboEligible', defaultValue: false)
        required bool isComboEligible,
    @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
        required double finalIndividualPrice,
    @JsonKey(name: 'language', defaultValue: '') required String language,
    @JsonKey(name: 'materialNumber', defaultValue: 'EN')
        required String materialNumber,
    @JsonKey(name: 'taxM1', defaultValue: '') required String taxM1,
    @JsonKey(name: 'taxes', defaultValue: <String>[])
        required List<String> taxes,
  }) = _ComboMaterialItemDto;

  ComboMaterialItem toDomain(
    PriceComboDealDto comboDeal,
  ) {
    return ComboMaterialItem(
      comboDeals: comboDeal.toDomain,
      isComboEligible: isComboEligible,
      valid: valid,
      quantity: quantity,
      listPrice: listPrice,
      finalIndividualPrice: finalIndividualPrice,
      productId: MaterialNumber(productId),
      principalName: PrincipalName(principleName),
      principalCode: PrincipalCode(principalCode),
      materialDescription: materialDescription,
      minQty: 0,
      conditionNumber: conditionNumber,
      mandatory: mandatory,
      rate: rate,
      suffix: suffix,
      setNo: setNo,
      comboDealType: comboDealType,
      language: language,
      parentId: parentId,
    );
  }

  factory ComboMaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$ComboMaterialItemDtoFromJson(json);
}
