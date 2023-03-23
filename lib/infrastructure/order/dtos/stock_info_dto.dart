import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'stock_info_dto.freezed.dart';
part 'stock_info_dto.g.dart';

@freezed
class StockInfoDto with _$StockInfoDto {
  const StockInfoDto._();

  @HiveType(typeId: 18, adapterName: 'StockInfoDtoAdapter')
  const factory StockInfoDto({
    @JsonKey(name: 'MaterialNumber')
    @HiveField(0, defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'ExpiryDate')
    @HiveField(1, defaultValue: '')
        required String expiryDate,
    @JsonKey(name: 'Batch')
    @HiveField(2, defaultValue: '')
        required String batch,
    @JsonKey(name: 'InStock')
    @HiveField(3, defaultValue: '')
        required String inStock,
    @JsonKey(name: 'SalesDistrict', defaultValue: '')
    @HiveField(4, defaultValue: '')
        required String salesDistrict,
  }) = _StockInfoDto;

  factory StockInfoDto.fromDomain(StockInfo stockInfo) {
    return StockInfoDto(
      materialNumber: stockInfo.materialNumber.getOrDefaultValue(''),
      expiryDate: stockInfo.expiryDate.getOrDefaultValue(''),
      batch: stockInfo.batch.getOrDefaultValue(''),
      inStock: stockInfo.inStock.getOrDefaultValue(''),
      salesDistrict: stockInfo.salesDistrict,
    );
  }

  StockInfo toDomain() {
    return StockInfo(
      materialNumber: MaterialNumber(materialNumber),
      batch: BatchNumber(batch),
      expiryDate: DateTimeStringValue(expiryDate),
      inStock: MaterialInStock(inStock),
      salesDistrict: salesDistrict,
    );
  }

  factory StockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$StockInfoDtoFromJson(json);
}
