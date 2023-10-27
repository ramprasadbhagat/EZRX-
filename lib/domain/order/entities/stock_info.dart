import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

@freezed
class MaterialStockInfo with _$MaterialStockInfo {
  const MaterialStockInfo._();

  const factory MaterialStockInfo({
    required MaterialNumber materialNumber,
    required List<StockInfo> stockInfos,
  }) = _MaterialStockInfo;

  factory MaterialStockInfo.empty() => MaterialStockInfo(
        materialNumber: MaterialNumber(''),
        stockInfos: <StockInfo>[],
      );
}

@freezed
class StockInfo with _$StockInfo {
  const StockInfo._();

  const factory StockInfo({
    required MaterialNumber materialNumber,
    required DateTimeStringValue expiryDate,
    required BatchNumber batch,
    required MaterialInStock inStock,
    required String salesDistrict,
    required int stockQuantity,
  }) = _StockInfo;

  factory StockInfo.empty() => StockInfo(
        materialNumber: MaterialNumber(''),
        expiryDate: DateTimeStringValue(''),
        batch: BatchNumber(''),
        inStock: MaterialInStock(''),
        salesDistrict: '',
        stockQuantity: 0,
      );

  bool get batchExpiryDateAvailable => batch.isValid() || expiryDate.isValid();
}
