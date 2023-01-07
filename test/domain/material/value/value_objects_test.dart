import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Code value object', () {
    test('should return material code with substring when not empty', () async {
      const input = '000000000023168451';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, '23168451');
    });

    test('should return NA when empty', () async {
      const input = '';
      final materialNumber = MaterialNumber(input);
      final result = materialNumber.displayMatNo;
      expect(result, 'NA');
    });
  });

  group('Material Group 4 value object', () {
    test('should return true when material group is 6A1', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.isFOC;
      expect(result, true);
    });

    test('should return false when material group is 6GS', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.isFOC;
      expect(result, false);
    });

    test('should return ZPFC when material group type is ZPFC', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.getMaterialGroup4Type;
      expect(result, 'ZPFC');
    });

    test('should return ZPOR when material group type is ZPOR', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.four(input);
      final result = materialGroup.getMaterialGroup4Type;
      expect(result, 'ZPOR');
    });
  });

  group('Material Group 2 value object', () {
    test('should return true when material group is 6A1', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.isFOC;
      expect(result, true);
    });

    test('should return false when material group is 6GS', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.isFOC;
      expect(result, false);
    });

    test('should return ZPFC when material group type is ZPFC', () async {
      const input = '6A1';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.getMaterialGroup4Type;
      expect(result, 'ZPFC');
    });

    test('should return ZPOR when material group type is ZPOR', () async {
      const input = '6GS';
      final materialGroup = MaterialGroup.two(input);
      final result = materialGroup.getMaterialGroup4Type;
      expect(result, 'ZPOR');
    });
  });
  //TODO: Fix later in test case PR
  group('Material Price value object', () {
    //   test('should return NA if zero', () async {
    //     const input = 0.0;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'NA');
    //   });
    //
    //   test('should return NA if hide price enable', () async {
    //     const input = 10.0;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: true,
    //     );
    //     expect(result, 'NA');
    //   });
    //
    //   test('should remove trailing zero', () async {
    //     const input = 12.2000;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'FAKE-CURRENCY 12.2');
    //   });
    //
    //   test('should align currency on the right with vnd currency', () async {
    //     const input = 12.23;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('vnd'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'VND 12.23');
    //   });
    //
    //   test('should align currency on the left with other currency', () async {
    //     const input = 12.23;
    //     final price = MaterialPrice(input);
    //     final result = price.displayWithCurrency(
    //       currency: Currency('fake-currency'),
    //       hidePrice: false,
    //     );
    //     expect(result, 'FAKE-CURRENCY 12.23');
    //   });

    // test('should conform ZDP5 Rule', () async {
    //   const input = 10;
    //   final price = MaterialQty(input);
    //   final result = price.conformZDP5Rule('5');
    //   expect(result, true);
    // });
    //
    // test('should not conform when ZDP5 value is invalid', () async {
    //   const input = 10;
    //   final price = MaterialQty(input);
    //   final result = price.conformZDP5Rule('fake-value');
    //   expect(result, false);
    // });
    //
    // test('should add vatValue if isVNUser is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Full Tax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10.8');
    // });
    //
    // test('should add taxes if isVNUser is true', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: true,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Full Tax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 11');
    // });
    //
    // test('should add nothing if taxClassification is noTax', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('noTax'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if taxClassification is Exempt', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if enableTaxClassification is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: false,
    //     enableVat: true,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
    //
    // test('should add nothing if enableVat is false', () async {
    //   const input = 10.00;
    //   final price = MaterialPrice(input);
    //   final result = price.displayUnitPrice(
    //     currency: Currency('sgd'),
    //     hidePrice: false,
    //     isVNUser: false,
    //     vatValue: 8,
    //     enableTaxClassification: true,
    //     enableVat: false,
    //     taxClassification: MaterialTaxClassification('Exempt'),
    //     taxes: ['10'],
    //   );
    //   expect(result, 'SGD 10');
    // });
  });

  group('Principal Code value object', () {
    test('should return true when principal code submit allowed for client',
        () async {
      const input = '0000000000100822';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isSubmitAllowedForClient();
      expect(result, true);
    });

    test(
        'should return false when principal code submit not allowed for client',
        () async {
      const input = '0000000000150822';
      final principalCode = PrincipalCode(input);
      final result = principalCode.isSubmitAllowedForClient();
      expect(result, false);
    });
  });

  group('Tender Price value object', () {
    test('should return double value when tender price having String value',
        () async {
      const input = '5';
      final tenderPrice = TenderPrice(input);
      final result = tenderPrice.tenderPrice;
      expect(result, 5.0);
    });

    test('should return double value as 0 when tender price by pricing unit 0',
        () async {
      const input = '5';
      final tenderPrice = TenderPrice(input);
      final result = tenderPrice.tenderPriceByPricingUnit(0);
      expect(result, 0);
    });

    test('should return double value as 8 when tender price by pricing unit 2',
        () async {
      const input = '8';
      final tenderPrice = TenderPrice(input);
      final result = tenderPrice.tenderPriceByPricingUnit(2);
      expect(result, 4);
    });
  });

  group('Tender Contract Number value object', () {
    test('should return value when Tender Contract Number having valid value',
        () async {
      const input = '55';
      final tenderContractNumber =
          TenderContractNumber.tenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractNumber;
      expect(result, '55');
    });

    test('should return NA when Tender Contract Number having empty value',
        () async {
      const input = '';
      final tenderContractNumber =
          TenderContractNumber.tenderContractNumber(input);
      final result = tenderContractNumber.displayTenderContractNumber;
      expect(result, 'NA');
    });

    test('should return value if Tender Contract Item Number have valid value',
        () async {
      const input = '55';
      final tenderContractNumber =
          TenderContractNumber.tenderContractItemNumber(input);
      final result = tenderContractNumber.displayTenderContractItemNumber;
      expect(result, '55');
    });

    test('should return NA when Tender Contract Item Number having empty value',
        () async {
      const input = '';
      final tenderContractNumber =
          TenderContractNumber.tenderContractItemNumber(input);
      final result = tenderContractNumber.displayTenderContractItemNumber;
      expect(result, 'NA');
    });

    test('should return value if Tender Contract visa Number have valid value',
        () async {
      const input = '0000000124655';
      final tenderContractNumber = TenderContractNumber.tenderVisaNumber(input);
      final result = tenderContractNumber.displayTenderVisaNumber;
      expect(result, '124655');
    });

    test('should return NA if Tender Contract visa Number have empty value',
        () async {
      const input = '';
      final tenderContractNumber = TenderContractNumber.tenderVisaNumber(input);
      final result = tenderContractNumber.displayTenderVisaNumber;
      expect(result, 'NA');
    });

    test(
        'should return value if Tender Contract announcement letter Number have value',
        () async {
      const input = '0000000124655';
      final tenderContractNumber =
          TenderContractNumber.announcementLetterNumber(input);
      final result = tenderContractNumber.displayAnnouncementLetterNumber;
      expect(result, '124655');
    });

    test(
        'should return NA if Tender Contract announcement letter Number have empty value',
        () async {
      const input = '';
      final tenderContractNumber =
          TenderContractNumber.announcementLetterNumber(input);
      final result = tenderContractNumber.displayAnnouncementLetterNumber;
      expect(result, 'NA');
    });
  });

  group('Tender Contract Reason value object', () {
    test('should return true when Tender Contract Reason value is empty',
        () async {
      const input = '';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.isEmpty;
      expect(result, true);
    });

    test('should return false when Tender Contract Reason value is not empty',
        () async {
      const input = 'abc';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.isEmpty;
      expect(result, false);
    });

    test('should return value when Tender Contract Reason having valid value',
        () async {
      const input = '00000006745';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.displayTenderContractReason;
      expect(result, '6745');
    });

    test('should return NA when Tender Contract Reason value is empty',
        () async {
      const input = '';
      final tenderContractReason = TenderContractReason(input);
      final result = tenderContractReason.displayTenderContractReason;
      expect(result, 'NA');
    });
  });

  group('Tender Contract Info value object', () {
    test(
        'should return value when Tender Contract Reference value having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo =
          TenderContractInfo.tenderContractReference(input);
      final result = tenderContractInfo.displayContractReference;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Reference value having empty value',
        () async {
      const input = '';
      final tenderContractInfo =
          TenderContractInfo.tenderContractReference(input);
      final result = tenderContractInfo.displayContractReference;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract Info sales district having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo = TenderContractInfo.salesDistrict(input);
      final result = tenderContractInfo.displaySalesDistrict;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Info sales district value having empty value',
        () async {
      const input = '';
      final tenderContractInfo = TenderContractInfo.salesDistrict(input);
      final result = tenderContractInfo.displaySalesDistrict;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract Info package description having valid value',
        () async {
      const input = '124655';
      final tenderContractInfo = TenderContractInfo.packageDescription(input);
      final result = tenderContractInfo.displayTenderPackageDescription;
      expect(result, '124655');
    });

    test(
        'should return NA when Tender Contract Info package description value having empty value',
        () async {
      const input = '';
      final tenderContractInfo = TenderContractInfo.packageDescription(input);
      final result = tenderContractInfo.displayTenderPackageDescription;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract expiryDate having valid value',
        () async {
      const input = '12042015';
      final tenderContractInfo = TenderContractInfo.contractExpiryDate(input);
      final result = tenderContractInfo.displayContractExpiryDate;
      expect(result, '12042015');
    });

    test('should return NA when Tender Contract expiryDate having empty value',
        () async {
      const input = '';
      final tenderContractInfo = TenderContractInfo.contractExpiryDate(input);
      final result = tenderContractInfo.displayContractExpiryDate;
      expect(result, 'NA');
    });

    test(
        'should return value when Tender Contract paymentTerm having valid value',
        () async {
      const input = '12042015';
      final tenderContractInfo = TenderContractInfo.contractPaymentTerm(input);
      final result = tenderContractInfo.displayContractPaymentTerm;
      expect(result, '12042015');
    });

    test('should return NA when Tender Contract paymentTerm having empty value',
        () async {
      const input = '';
      final tenderContractInfo = TenderContractInfo.contractPaymentTerm(input);
      final result = tenderContractInfo.displayContractPaymentTerm;
      expect(result, 'NA');
    });
  });

  group('Contact Number value object', () {
    test('should return value when contact number value is less than 16',
        () async {
      const input = '1234567890123';
      final contactNumber = ContactNumber(input);
      final result = contactNumber.getTelephone;
      expect(result, '1234567890123');
    });

    test(
        'should return value as substing from 0 to 16 when contact number value is more than 16',
        () async {
      const input = '123456789012345678';
      final contactNumber = ContactNumber(input);
      final result = contactNumber.getTelephone;
      expect(result, '1234567890123456');
    });
  });

  group('Expiry Date value object', () {
    test('should return value when Expiry Date having valid date', () async {
      const input = '12042028';
      final tenderContractInfo = ExpiryDate(input);
      final result = tenderContractInfo.getExpiryDate;
      expect(result, '12042028');
    });

    test('should return NA when Expiry Date having empty value', () async {
      const input = '';
      final tenderContractInfo = ExpiryDate(input);
      final result = tenderContractInfo.getExpiryDate;
      expect(result, 'NA');
    });
  });
}
