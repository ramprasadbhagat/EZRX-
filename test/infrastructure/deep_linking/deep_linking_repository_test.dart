import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/deep_linking/repository/deep_linking_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeSalesOrg = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-sales-org'),
  );
  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-customer-code',
  );
  final fakeShipToCode = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-ship-to-code',
  );

  group('Extract material number', () {
    const fakeMaterialNumber = 'fake-material-number';
    test('- success', () {
      final fakeUri = Uri(
        queryParameters: {
          'salesorg': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipto': 'fake-ship-to-code',
          'material': 'fake-material-number',
        },
      );

      final result = DeepLinkingRepository().extractMaterialNumber(
        selectedSalesOrganisation: fakeSalesOrg,
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        link: fakeUri,
      );

      expect(result.isRight(), true);
      expect(result.getOrElse(() => ''), fakeMaterialNumber);
    });

    test('- failure when material query param is empty', () {
      final fakeUri = Uri(
        queryParameters: {
          'salesorg': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipto': 'fake-ship-to-code',
          'material': '',
        },
      );

      final result = DeepLinkingRepository().extractMaterialNumber(
        selectedSalesOrganisation: fakeSalesOrg,
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        link: fakeUri,
      );

      expect(result.isLeft(), true);
    });

    test('- failure when sales org is not match', () {
      final fakeUri = Uri(
        queryParameters: {
          'salesorg': 'fake-sales-org-1',
          'customer': 'fake-customer-code',
          'shipto': 'fake-ship-to-code',
          'material': 'fake-material-number',
        },
      );

      final result = DeepLinkingRepository().extractMaterialNumber(
        selectedSalesOrganisation: fakeSalesOrg,
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        link: fakeUri,
      );

      expect(result.isLeft(), true);
    });

    test('- failure when customer code is not match', () {
      final fakeUri = Uri(
        queryParameters: {
          'salesorg': 'fake-sales-org',
          'customer': 'fake-customer-code-1',
          'shipto': 'fake-ship-to-code',
          'material': 'fake-material-number',
        },
      );

      final result = DeepLinkingRepository().extractMaterialNumber(
        selectedSalesOrganisation: fakeSalesOrg,
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        link: fakeUri,
      );

      expect(result.isLeft(), true);
    });

    test('- failure when ship to code is not match', () {
      final fakeUri = Uri(
        queryParameters: {
          'salesorg': 'fake-sales-org',
          'customer': 'fake-customer-code',
          'shipto': 'fake-ship-to-code-1',
          'material': 'fake-material-number',
        },
      );

      final result = DeepLinkingRepository().extractMaterialNumber(
        selectedSalesOrganisation: fakeSalesOrg,
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
        link: fakeUri,
      );

      expect(result.isLeft(), true);
    });
  });
}
