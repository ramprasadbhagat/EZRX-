import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_objects;
// import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
    @JsonKey(name: 'PaymentTerm') required PaymentTermDto paymentTerm,
  }) = _OrderHistoryBasicInfoDto;
  factory OrderHistoryBasicInfoDto.fromDomain(
    OrderHistoryBasicInfo orderHistoryBasicInfo,
  ) {
    return OrderHistoryBasicInfoDto(
      companyName: orderHistoryBasicInfo.companyName.getOrCrash(),
      shipTo: orderHistoryBasicInfo.shipTo,
      soldTo: orderHistoryBasicInfo.soldTo,
      paymentTerm: PaymentTermDto.fromDomain(orderHistoryBasicInfo.paymentTerm),
    );
  }
  OrderHistoryBasicInfo toDomain() {
    return OrderHistoryBasicInfo(
      companyName: value_objects.CompanyName(companyName),
      shipTo: shipTo,
      soldTo: soldTo,
      paymentTerm: paymentTerm.toDomain(),
    );
  }

  factory OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryBasicInfoDtoFromJson(json);
}

@freezed
class PaymentTermDto with _$PaymentTermDto {
  const PaymentTermDto._();
  const factory PaymentTermDto({
    @JsonKey(name: 'PaymentTermCode') required String paymentTermCode,
    @JsonKey(name: 'PaymentTermDescription')
        required String paymentTermDescription,
  }) = _PaymentTermDto;
  factory PaymentTermDto.fromDomain(
    PaymentTerm paymentTerm,
  ) {
    return PaymentTermDto(
      paymentTermDescription: paymentTerm.paymentTermDescription,
      paymentTermCode: paymentTerm.paymentTermCode,
    );
  }
  PaymentTerm toDomain() {
    return PaymentTerm(
      paymentTermDescription: paymentTermDescription,
      paymentTermCode: paymentTermCode,
      paymentTermRanking: 0,
      paymentTermSubranking: 0,
    );
  }

  factory PaymentTermDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTermDtoFromJson(json);
}
