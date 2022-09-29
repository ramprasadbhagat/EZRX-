import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_bonus.freezed.dart';

@freezed
class MaterialItemBonus with _$MaterialItemBonus {
  const MaterialItemBonus._();

  const factory MaterialItemBonus({
    required String materialNumber,
    required int qty,
    required String comment,
    required String materialDescription,
  }) = _MaterialItemBonus;
}
