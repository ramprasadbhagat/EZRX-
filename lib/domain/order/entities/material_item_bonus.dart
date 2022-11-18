import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_bonus.freezed.dart';

@freezed
class MaterialItemBonus with _$MaterialItemBonus {
  const MaterialItemBonus._();

  const factory MaterialItemBonus({
    required MaterialNumber materialNumber,
    required int qty,
    required String comment,
    required String materialDescription,
    required String expiryDate,
    required String inStock,
    required int remainingQty,
  }) = _MaterialItemBonus;

  factory MaterialItemBonus.empty() => MaterialItemBonus(
        materialNumber: MaterialNumber(''),
        qty: 0,
        comment: '',
        materialDescription: '',
        expiryDate: '',
        inStock: '',
        remainingQty: 0,
      );
}
