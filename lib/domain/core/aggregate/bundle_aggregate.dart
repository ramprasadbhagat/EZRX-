import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_aggregate.freezed.dart';

@freezed
class BundleAggregate with _$BundleAggregate {
  const BundleAggregate._();
  const factory BundleAggregate({
    required Bundle bundle,
    required List<MaterialInfo> materialInfos,
  }) = _BundleAggregate;

  factory BundleAggregate.empty() => BundleAggregate(
        bundle: Bundle.empty(),
        materialInfos: <MaterialInfo>[],
      );
}
