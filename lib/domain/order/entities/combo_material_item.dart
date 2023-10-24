import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_material_item.freezed.dart';

@freezed
class ComboMaterialItem with _$ComboMaterialItem {
  const ComboMaterialItem._();

  const factory ComboMaterialItem({
    required MaterialNumber productId,
    required String parentId,
    required String setNo,
    required int quantity,
    required int minQty,
    required double rate,
    required String conditionNumber,
    required bool mandatory,
    required String suffix,
    required String materialDescription,
    required PrincipalName principalName,
    required double listPrice,
    required PrincipalCode principalCode,
    required bool valid,
    required String comboDealType,
    required bool isComboEligible,
    required PriceComboDeal comboDeals,
    required double finalIndividualPrice,
    required String language,
  }) = _ComboMaterialItem;

  factory ComboMaterialItem.empty() => ComboMaterialItem(
        quantity: 0,
        language: '',
        productId: MaterialNumber(''),
        parentId: '',
        setNo: '',
        minQty: 0,
        rate: 0,
        conditionNumber: '',
        mandatory: false,
        suffix: '',
        materialDescription: '',
        principalName: PrincipalName(''),
        listPrice: 0,
        principalCode: PrincipalCode(''),
        valid: false,
        comboDealType: '',
        isComboEligible: false,
        comboDeals: PriceComboDeal.empty(),
        finalIndividualPrice: 0,
      );

  String get originalPriceDisplay =>
      NumUtils.roundToPlaces(listPrice).toString();

  String get discountedPriceDisplay =>
      NumUtils.roundToPlaces(finalIndividualPrice).toString();

  double get originalSubTotal => NumUtils.roundToPlaces(listPrice * quantity);

  double get discountedSubTotal =>
      NumUtils.roundToPlaces(finalIndividualPrice * quantity);

  //TODO: calculate total with tax here
  double get discountedSubTotalWithTax => discountedSubTotal;

  //TODO: calculate total with tax here
  double get originalTotalWithTax => originalSubTotal;

  ComboDealScheme getScheme(List<ComboMaterialItem> comboMaterials) {
    switch (comboDealType) {
      case 'K1':
        return ComboDealScheme.k1;
      case 'K2':
        final haveMandatoryMaterial =
            comboMaterials.any((comboMaterial) => comboMaterial.mandatory);

        return haveMandatoryMaterial
            ? ComboDealScheme.k21
            : ComboDealScheme.k22;
      case 'K3':
        return ComboDealScheme.k3;
      case 'K4':
        return ComboDealScheme.k4;
      case 'K5':
        return ComboDealScheme.k5;
      default:
        return ComboDealScheme.k1;
    }
  }

  String get comboRateDisplay {
    final comboRate = rate.abs();
    if (comboRate == comboRate.toInt()) {
      return comboRate.toInt().toString();
    }

    return comboRate.toString();
  }
}
