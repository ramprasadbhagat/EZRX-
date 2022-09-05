import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_info.freezed.dart';

@freezed
class ShipToInfo with _$ShipToInfo {
  const ShipToInfo._();

  const factory ShipToInfo({
    required String shipToCustomerCode,
  }) = _ShipToInfo;

  factory ShipToInfo.empty() => const ShipToInfo(
        shipToCustomerCode: '',
      );
}
