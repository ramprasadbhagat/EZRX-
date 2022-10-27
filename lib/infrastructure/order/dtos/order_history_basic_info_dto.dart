import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_basic_info_dto.freezed.dart';
part 'order_history_basic_info_dto.g.dart';

@freezed
class OrderHistoryBasicInfoDto with _$OrderHistoryBasicInfoDto {
  const OrderHistoryBasicInfoDto._();
  const factory OrderHistoryBasicInfoDto({
    @JsonKey(name: 'SoldTo') required String soldTo,
    @JsonKey(name: 'ShipTo') required String shipTo,
    @JsonKey(name: 'CompanyName') required String companyName,
  }) = _OrderHistoryBasicInfoDto;
  factory OrderHistoryBasicInfoDto.fromDomain(
    OrderHistoryBasicInfo orderHistoryBasicInfo,
  ) {
    return OrderHistoryBasicInfoDto(
      companyName: orderHistoryBasicInfo.companyName.getOrCrash(),
      shipTo: orderHistoryBasicInfo.shipTo,
      soldTo: orderHistoryBasicInfo.soldTo,
    );
  }
  OrderHistoryBasicInfo toDomain() {
    return OrderHistoryBasicInfo(
      companyName: CompanyName(companyName),
      shipTo: shipTo,
      soldTo: soldTo,
    );
  }

  factory OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryBasicInfoDtoFromJson(json);
}
