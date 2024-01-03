import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompanyName value object', () {
    test(
      'should return company name when not empty',
      () async {
        const input = 'fake-company-name';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'fake-company-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final companyName = CompanyName(input);
        final result = companyName.name;
        expect(result, 'NA');
      },
    );
  });

  group('SoldToParty value object', () {
    test(
      'should return soldToPartyName when not empty',
      () async {
        const input = 'fake-sold-to-name';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'fake-sold-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final soldToParty = SoldToParty(input);
        final result = soldToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('ShipToParty value object', () {
    test(
      'should return ShipToPartyName when not empty',
      () async {
        const input = 'fake-ship-to-name';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'fake-ship-to-name');
      },
    );

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final shipToParty = ShipToParty(input);
        final result = shipToParty.name;
        expect(result, 'NA');
      },
    );
  });

  group('Principal Name Value Object', () {
    test('should return PrincipalName when not empty', () {
      const input = 'fake-principal-name';
      final principalName = PrincipalName(input);
      final result = principalName.name;
      expect(result, 'fake-principal-name');
    });

    test(
      'should return NA when empty',
      () async {
        const input = '';
        final principalName = PrincipalName(input);
        final result = principalName.name;
        expect(result, 'NA');
      },
    );
  });

  group('MaterialTaxClassification Name Value Object', () {
    test('should return true when there is no Tax', () {
      const input = 'noTax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax;
      expect(result, true);
    });

    test('should return false when there is fake Tax', () {
      const input = 'fake-Tax';
      final valObj = MaterialTaxClassification(input);
      final result = valObj.isNoTax;
      expect(result, false);
    });

    //Need to revisit when Tax Exempt will be covered in another User story
    // test('should return true when there is Exempt', () {
    //   const input = 'Exempt';
    //   final valObj = MaterialTaxClassification(input);
    //   final result = valObj.isExempt;
    //   expect(result, true);
    // });

    // test('should return false when there is not Exempt', () {
    //   const input = 'fake-data';
    //   final valObj = MaterialTaxClassification(input);
    //   final result = valObj.isExempt;
    //   expect(result, false);
    // });

    test('should return true when there is full tax', () {
      const input = 'Product : Full Tax';
      final valObj = MaterialTaxClassification(input);
      final result = !valObj.isNoTax;
      expect(result, true);
    });

    test('should return true when there is no is Special Scheme', () {
      const input = 'Special Scheme';
      final valObj = MaterialTaxClassification(input);
      final result = !valObj.isNoTax;
      expect(result, true);
    });
  });

  group('Material Number Value Object', () {
    test('should display Material Number when not empty', () {
      const input = '000034134';
      final valObj = MaterialNumber(input);
      final result = valObj.displayMatNo;
      expect(result, '34134');
    });
  });

  group('Material Price Value Object', () {
    test('should true when is empty', () {
      const input = 0.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty;
      expect(result, true);
    });

    test('should false when is not empty', () {
      const input = 5.0;
      final valObj = MaterialPrice(input);
      final result = valObj.isEmpty;
      expect(result, false);
    });
  });

  group('BonusMaterialCalculation Value Object', () {
    test(
      'should return BonusMaterialCalculationEnum.calculation911',
      () {
        const input = '911';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation911,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.calculation912',
      () {
        const input = '912';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation912,
        );
      },
    );
    test(
      'should return BonusMaterialCalculationEnum.calculation913',
      () {
        const input = '913';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation913,
        );
      },
    );
    test(
      'should return BonusMaterialCalculationEnum.calculation914',
      () {
        const input = '914';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation914,
        );
      },
    );

    test(
      'should true BonusMaterialCalculationEnum.calculation915',
      () {
        const input = '915';
        final valObj = BonusMaterialCalculation(input);
        expect(
          valObj.getCalculationEnum,
          BonusMaterialCalculationEnum.calculation915,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.apl001',
      () {
        expect(
          BonusMaterialCalculation('001').getCalculationEnum,
          BonusMaterialCalculationEnum.apl001,
        );
      },
    );

    test(
      'should return BonusMaterialCalculationEnum.apl002',
      () {
        expect(
          BonusMaterialCalculation('002').getCalculationEnum,
          BonusMaterialCalculationEnum.apl002,
        );
      },
    );
  });

  group('ShippingCondition Value Object', () {
    test(
      'isGreenDelivery is true when value is GD ',
      () {
        final valObj = ShippingCondition('GD');
        expect(
          valObj.isGreenDelivery,
          true,
        );
      },
    );
  });

  group('ComboDealCategoryType Value Object', () {
    test(
      'is material number type',
      () {
        final valObj = ComboDealCategoryType('MATNR');
        expect(
          valObj.isMaterialNumber,
          true,
        );
      },
    );

    test(
      'is principle group type',
      () {
        final valObj = ComboDealCategoryType('ZPRINC');
        expect(
          valObj.isPrinciple,
          true,
        );
      },
    );
  });

  group('BatchNumber Value Object', () {
    test(
      'BatchNumber available ',
      () {
        final valObj = BatchNumber('fake-batch');
        expect(
          valObj.selectOrGetBatch,
          'fake-batch',
        );
      },
    );

    test(
      'BatchNumber not available ',
      () {
        final valObj = BatchNumber('');
        expect(
          valObj.selectOrGetBatch,
          'Select',
        );
      },
    );
  });

  group('Counter Offer Value Object', () {
    test('Counter Offer Value is not Valid', () {
      final emptyValue = CounterOfferValue('');
      final valueObj = CounterOfferValue('0');
      expect(
        emptyValue.isValid(),
        false,
      );
      expect(
        valueObj.isValid(),
        false,
      );
    });

    test('Counter Offer Value is Valid', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.isValid(),
        true,
      );
    });

    test('Counter Offer Value double value', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.doubleValue,
        100,
      );
    });

    test('Counter Offer toPriceOverrideValue', () {
      final valueObj = CounterOfferValue('100');
      expect(
        valueObj.toPriceOverrideValue,
        PriceOverrideValue(100),
      );
    });
  });

  group('Counter Offer Discount Value Object', () {
    test('Counter Offer Discount Value is not Valid', () {
      final emptyValue = CounterOfferDiscountValue('');
      final valueObj = CounterOfferDiscountValue('0');
      final wrongValue = CounterOfferDiscountValue('100');
      expect(
        emptyValue.isValid(),
        false,
      );
      expect(
        valueObj.isValid(),
        false,
      );
      expect(
        wrongValue.isValid(),
        false,
      );
    });

    test('Counter Offer Discount Value is Valid', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.isValid(),
        true,
      );
    });

    test('Counter Offer Discount double value', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.doubleValue,
        10,
      );
    });

    test('Counter Offer Discount toZdp8OverrideValue', () {
      final valueObj = CounterOfferDiscountValue('10');
      expect(
        valueObj.toZdp8OverrideValue,
        Zdp8OverrideValue(10),
      );
    });
  });

  group('Order Step Value Object', () {
    test('Counter Offer Discount Value Get Expect Delivery Title', () {
      final notDeliveryYet = OrderStepValue('');
      final delivered = OrderStepValue('Delivered');
      expect(
        notDeliveryYet.deliveryDateTitle,
        'Expected delivery',
      );
      expect(
        delivered.deliveryDateTitle,
        'Delivered',
      );
    });
  });
}
