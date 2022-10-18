import 'package:ezrxmobile/domain/material/entities/stock_info.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info_dto.freezed.dart';
part 'stock_info_dto.g.dart';

@freezed
class StockInfoDto with _$StockInfoDto {
  const StockInfoDto._();
  const factory StockInfoDto({
    @JsonKey(name: 'MaterialNumber') required String materialNumber,
    @JsonKey(name: 'ExpiryDate') required String expiryDate,
    @JsonKey(name: 'Batch') required String batch,
    @JsonKey(name: 'InStock') required String inStock,
    @JsonKey(name: 'SalesDistrict') required String? salesDistrict,

    
  }) = _StockInfoDto;

  factory StockInfoDto.fromDomain(StockInfo stockInfo) {
    return StockInfoDto(
      materialNumber: stockInfo.materialNumber.getOrCrash(),
      expiryDate: stockInfo.expiryDate,
      batch: stockInfo.batch,
      inStock: stockInfo.inStock,
      salesDistrict: stockInfo.salesDistrict,
    );
  }

  StockInfo toDomain() {
    return StockInfo(
      materialNumber: MaterialNumber(materialNumber),
      batch: batch,
      expiryDate: expiryDate,
      inStock: inStock,
      salesDistrict: salesDistrict ?? '',
    );
  }

  factory StockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$StockInfoDtoFromJson(json);
}
