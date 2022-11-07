import 'package:ezrxmobile/domain/order/entities/price_bundle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'price_bundle_dto.freezed.dart';
part 'price_bundle_dto.g.dart';

@freezed
class PriceBundleDto with _$PriceBundleDto {
  const PriceBundleDto._();
  @HiveType(typeId: 13, adapterName: 'PriceBundleDtoAdapter')
  const factory PriceBundleDto({
    @JsonKey(name: 'BundleName', defaultValue: '')
    @HiveField(35)
        required String name,
    @JsonKey(name: 'BundleCode', defaultValue: '')
    @HiveField(36)
        required String code,
    @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
    @HiveField(37)
        required List<PriceBundleItemDto> information,
  }) = _PriceBundleDto;

  factory PriceBundleDto.fromDomain(PriceBundle priceBundle) {
    return PriceBundleDto(
      name: priceBundle.name,
      code: priceBundle.code,
      information: priceBundle.information
          .map((e) => PriceBundleItemDto.fromDomain(e))
          .toList(),
    );
  }

  PriceBundle toDomain() => PriceBundle(
        name: name,
        code: code,
        information: information.map((e) => e.toDomain()).toList(),
      );

  factory PriceBundleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleDtoFromJson(json);
}

@freezed
class PriceBundleItemDto with _$PriceBundleItemDto {
  const PriceBundleItemDto._();
  @HiveType(typeId: 14, adapterName: 'PriceBundleItemDtoAdapter')
  const factory PriceBundleItemDto({
    @JsonKey(name: 'Type', defaultValue: '')
    @HiveField(38)
        required String type,
    @JsonKey(name: 'Sequence', defaultValue: 0)
    @HiveField(39)
        required int sequence,
    @JsonKey(name: 'Quantity', defaultValue: 0)
    @HiveField(40)
        required int quantity,
    @JsonKey(name: 'Rate', defaultValue: 0) @HiveField(41) required double rate,
  }) = _PriceBundleItemDto;

  factory PriceBundleItemDto.fromDomain(PriceBundleItem priceBundleItem) {
    return PriceBundleItemDto(
      type: priceBundleItem.type,
      sequence: priceBundleItem.sequence,
      quantity: priceBundleItem.quantity,
      rate: priceBundleItem.rate,
    );
  }

  PriceBundleItem toDomain() => PriceBundleItem(
        type: type,
        sequence: sequence,
        quantity: quantity,
        rate: rate,
      );

  factory PriceBundleItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleItemDtoFromJson(json);
}
