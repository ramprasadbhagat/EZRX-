import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'bundle_info_dto.freezed.dart';
part 'bundle_info_dto.g.dart';

@freezed
class BundleInfoDto with _$BundleInfoDto {
  const BundleInfoDto._();
  @HiveType(typeId: 16, adapterName: 'BundleInfoDtoAdapter')
  const factory BundleInfoDto({
    @JsonKey(name: 'Sequence')
    @HiveField(21, defaultValue: 1)
        required int sequence,
    @JsonKey(name: 'Quantity')
    @HiveField(22, defaultValue: 1)
        required int quantity,
    @JsonKey(name: 'Type')
    @HiveField(23, defaultValue: '%')
        required String type,
    @JsonKey(name: 'Rate')
    @HiveField(24, defaultValue: -10)
        required double rate,
  }) = _BundleInfoDto;

  BundleInfo toDomain() {
    return BundleInfo(
      sequence: sequence,
      quantity: quantity,
      type: DiscountType(type),
      rate: rate,
    );
  }

  factory BundleInfoDto.fromDomain(BundleInfo bundleInfo) {
    return BundleInfoDto(
      sequence: bundleInfo.sequence,
      quantity: bundleInfo.quantity,
      type: bundleInfo.type.getOrCrash(),
      rate: bundleInfo.rate,
    );
  }

  factory BundleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$BundleInfoDtoFromJson(json);
}
