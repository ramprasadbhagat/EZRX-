import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order_material_bonus.freezed.dart';

@freezed
class SavedOrderMaterialBonus with _$SavedOrderMaterialBonus {
  const SavedOrderMaterialBonus._();

  const factory SavedOrderMaterialBonus({
    required MaterialNumber materialNumber,
    required int qty,
    required String comment,
    required String materialDescription,
    required String expiryDate,
    required String inStock,
    required int remainingQty,
  }) = _SavedOrderMaterialBonus;

  factory SavedOrderMaterialBonus.empty() => SavedOrderMaterialBonus(
        materialNumber: MaterialNumber(''),
        qty: 0,
        comment: '',
        materialDescription: '',
        expiryDate: '',
        inStock: '',
        remainingQty: 0,
      );
}
