import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

part 'order_history_basic_info.freezed.dart';

@freezed
class OrderHistoryBasicInfo with _$OrderHistoryBasicInfo {
  const OrderHistoryBasicInfo._();
  factory OrderHistoryBasicInfo({
    required String soldTo,
    required String shipTo,
    required CompanyName companyName,
  }) = _OrderHistoryBasicInfo;

  factory OrderHistoryBasicInfo.empty() => OrderHistoryBasicInfo(
        soldTo: '',
        shipTo: '',
        companyName: CompanyName(''),
      );
}
