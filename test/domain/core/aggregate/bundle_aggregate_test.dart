import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bundle Aggregate Test', () {
    test('should return correct bundle aggregate object', () {
      final bundle = Bundle.empty();
      final materialInfos = [MaterialInfo.empty()];
      final bundleAggregate = BundleAggregate(
        bundle: bundle,
        materialInfos: materialInfos,
      );

      expect(bundleAggregate.bundle, bundle);
      expect(bundleAggregate.materialInfos, materialInfos);
    });

    test('Empty BundleAggregate', () {
      final emptyBundle = Bundle.empty();
      final emptyMaterialInfos = [];
      final bundleAggregate = BundleAggregate.empty();

      expect(bundleAggregate.bundle, emptyBundle);
      expect(bundleAggregate.materialInfos, emptyMaterialInfos);
    });
  });
}
