import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

@freezed
class StockInfo with _$StockInfo {
  const StockInfo._();

  const factory StockInfo({
    required MaterialNumber materialNumber,
    required DateTimeStringValue expiryDate,
    required BatchNumber batch,
    required MaterialInStock inStock,
    required String salesDistrict,
  }) = _StockInfo;

  factory StockInfo.empty() => StockInfo(
        materialNumber: MaterialNumber(''),
        expiryDate: DateTimeStringValue(''),
        batch: BatchNumber(''),
        inStock: MaterialInStock(''),
        salesDistrict: '',
      );

}
