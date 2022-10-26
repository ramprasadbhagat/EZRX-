import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_detail.freezed.dart';

@freezed
class MaterialPriceDetail with _$MaterialPriceDetail {
  const MaterialPriceDetail._();
  const factory MaterialPriceDetail({
    required Price price,
    required MaterialInfo info,
    required bool isValidMaterial,
  }) = _MaterialPriceDetail;

  factory MaterialPriceDetail.empty() => MaterialPriceDetail(
        price: Price.empty(),
        info: MaterialInfo.empty(),
        isValidMaterial: false,
      );
}
