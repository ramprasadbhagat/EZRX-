import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  late SalesOrganisationConfigs configs;

  group('sales organisation configs test', () {
    setUpAll(() {
      configs = SalesOrganisationConfigs.empty();
    });
    test('deliveryStartDate test', () {
      final currentTime = DateTime.now();
      if (currentTime.hour < configs.salesOrg.cutOffTime &&
          currentTime.weekday <= DateTime.friday) {
        expect(
          configs.deliveryStartDate,
          DateTimeUtils.getNearestWorkingDate(currentTime),
        );
        return;
      }

      if (currentTime.hour >= configs.salesOrg.cutOffTime &&
          currentTime.weekday < DateTime.friday) {
        expect(
          configs.deliveryStartDate,
          DateTimeUtils.getNearestWorkingDate(
            currentTime.add(
              const Duration(days: 1),
            ),
          ),
        );
        return;
      }

      expect(
        configs.deliveryStartDate,
        DateTimeUtils.getNearestWorkingDate(currentTime)
            .add(const Duration(days: 1)),
      );
    });

    test('deliveryEndDate test', () {
      expect(
        configs.deliveryEndDate,
        DateTimeUtils.addWorkingDay(
          configs.deliveryStartDate,
          configs.futureDeliveryDay.intValue - 1,
        ),
      );
    });

    test('Show Gov Price For TW And enableListPrice = true Test', () {
      configs = fakeTWSalesOrgConfigShowGovtListPrice;
      expect(
        configs.showGovtListPrice,
        true,
      );
    });

    test('Hide Gov Price If enableListPrice = false Test', () {
      configs = fakeTWSalesOrgConfigShowGovtListPrice.copyWith(
        enableListPrice: false,
      );
      expect(
        configs.showGovtListPrice,
        false,
      );
    });

    test('Hide Gov Price If Market Is Not TW Test', () {
      configs = fakeTWSalesOrgConfigShowGovtListPrice.copyWith(
        salesOrg: fakeSalesOrg,
      );
      expect(
        configs.showGovtListPrice,
        false,
      );
    });
  });
}
