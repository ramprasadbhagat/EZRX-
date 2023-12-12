import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

part 'bonus_sample_item.freezed.dart';

@freezed
class BonusSampleItem with _$BonusSampleItem {
  const BonusSampleItem._();

  const factory BonusSampleItem({
    required MaterialQty qty,
    required MaterialNumber materialNumber,
    required StringValue itemId,
    required String materialDescription,
    required PrincipalData principalData,
    required MaterialInfoType type,
    required MaterialInStock inStock,
  }) = _BonusSampleItem;

  factory BonusSampleItem.empty() => BonusSampleItem(
        qty: MaterialQty(0),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        itemId: StringValue(''),
        principalData: PrincipalData.empty(),
        type: MaterialInfoType(''),
        inStock: MaterialInStock(''),
      );
}
