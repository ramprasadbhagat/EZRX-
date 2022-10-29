import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle.freezed.dart';

@freezed
class Bundle with _$Bundle {
  const Bundle._();

  const factory Bundle({
    required String bundleName,
    required String bundleCode,
    required List<BundleInfo> bundleInformation,
  }) = _Bundle;

  factory Bundle.empty() => Bundle(
        bundleName: '',
        bundleCode: '',
        bundleInformation: [BundleInfo.empty()],
      );

  List<String> bundleInfoMessage() {
    return bundleInformation
        .map((e) =>
            '${'Buy'.tr()} ${e.quantity} ${'or more'.tr()} ${e.type.isPercent() ? '${e.rate.abs()} ${e.type.getOrCrash()}' : '${e.type.getOrCrash()} ${e.rate}'}')
        .toList();
  }
}
