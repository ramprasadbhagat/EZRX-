import 'package:ezrxmobile/domain/order/entities/price_bundle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_bundle_dto.freezed.dart';
part 'price_bundle_dto.g.dart';

@freezed
class PriceBundleDto with _$PriceBundleDto {
  const PriceBundleDto._();
  const factory PriceBundleDto({
    @JsonKey(name: 'BundleName', defaultValue: '') required String name,
    @JsonKey(name: 'BundleCode', defaultValue: '') required String code,
    @JsonKey(name: 'BundleInformation', defaultValue: <PriceBundleItemDto>[])
        required List<PriceBundleItemDto> information,
  }) = _PriceBundleDto;

  PriceBundle toDomain() => PriceBundle(
        name: name,
        code: code,
        information: information
            .map(
              (e) => e.toDomain(),
            )
            .toList(),
      );

  factory PriceBundleDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleDtoFromJson(json);
}

@freezed
class PriceBundleItemDto with _$PriceBundleItemDto {
  const PriceBundleItemDto._();
  const factory PriceBundleItemDto({
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'Sequence', defaultValue: 0) required int sequence,
    @JsonKey(name: 'Quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
  }) = _PriceBundleItemDto;

  PriceBundleItem toDomain() => PriceBundleItem(
        type: type,
        sequence: sequence,
        quantity: quantity,
        rate: rate,
      );

  factory PriceBundleItemDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBundleItemDtoFromJson(json);
}
