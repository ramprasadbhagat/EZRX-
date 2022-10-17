import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

@freezed
class StockInfo with _$StockInfo {
  const StockInfo._();


  const factory StockInfo({
    required MaterialNumber materialNumber,
    required String expiryDate,
    required String batch,
    required String inStock,
    required String salesDistrict,
    
  }) = _StockInfo;

  factory StockInfo.empty() => StockInfo(
    materialNumber: MaterialNumber(''),
    expiryDate: '',
    batch: '',
    inStock: '',
    salesDistrict: '',
  );
}
