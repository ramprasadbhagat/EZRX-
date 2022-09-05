import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_info.freezed.dart';

@freezed
class CustomerInfo with _$CustomerInfo {
  const CustomerInfo._();

  const factory CustomerInfo({
    required String customerCodeSoldTo,
    required List<ShipToInfo> shipToInfos,
  }) = _CustomerInfo;

  factory CustomerInfo.empty() => const CustomerInfo(
        customerCodeSoldTo: '',
        shipToInfos: <ShipToInfo>[],
      );
}
