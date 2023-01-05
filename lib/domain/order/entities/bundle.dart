import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle.freezed.dart';

@freezed
class Bundle with _$Bundle {
  const Bundle._();

  const factory Bundle({
    required BundleName bundleName,
    required List<MaterialInfo> materials,
    required String bundleCode,
    required List<BundleInfo> bundleInformation,
  }) = _Bundle;

  factory Bundle.empty() => Bundle(
        materials: <MaterialInfo>[],
        bundleName: BundleName(''),
        bundleCode: '',
        bundleInformation: <BundleInfo>[],
      );

  List<BundleInfo> get sortedBundleInformation =>
      List<BundleInfo>.from(bundleInformation)
        ..sort(
          (a, b) => a.sequence.compareTo(b.sequence),
        );

  List<String> get bundleInfoMessage => sortedBundleInformation
      .map((e) =>
          '${'Buy'.tr()} ${e.quantity} ${'or more'.tr()} ${e.type.isPercent() ? '${e.rate.abs()} ${e.type.getOrCrash()}' : '${e.type.getOrCrash()} ${e.rate}'}')
      .toList();
}
