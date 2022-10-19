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
}
