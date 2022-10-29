import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_info.freezed.dart';

@freezed
class BundleInfo with _$BundleInfo {
  const BundleInfo._();

  const factory BundleInfo({
    required int sequence,
    required int quantity,
    required MaterialBundleType type,
    required double rate,
  }) = _BundleInfo;

  factory BundleInfo.empty() => BundleInfo(
        sequence: 1,
        quantity: 1,
        type: MaterialBundleType('%'),
        rate: -10,
      );
}
