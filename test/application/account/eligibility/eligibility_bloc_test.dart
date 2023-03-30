import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  ];

  final fakeShipToInfo = ShipToInfo.empty().copyWith(building: 'fakeBuilding');
  final fakeBillToInfo =
      BillToInfo.empty().copyWith(billToCustomerCode: 'customer1234');
  final fakeCustomerInfo = CustomerCodeInfo.empty().copyWith(
      shipToInfos: [fakeShipToInfo],
      billToInfos: [fakeBillToInfo],
      customerCodeSoldTo: 'customer123');
  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );
  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeSalesOrgCustomerInfos,
  );
  final fakeSaleOrgConfig = SalesOrganisationConfigs(
    salesOrg: SalesOrg(''),
    enableIRN: false,
    enableDefaultMD: false,
    disableProcessingStatus: false,
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    languageFilter: false,
    languageValue: LanguageValue(ApiLanguageCode.english),
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableTaxClassification: false,
    enableVat: false,
    enableTaxAtTotalLevelOnly: false,
    enableZDP5: false,
    vatValue: 0,
    materialWithoutPrice: false,
    enableCollectiveNumber: false,
    enableFutureDeliveryDay: false,
    enableMobileNumber: false,
    enablePaymentTerms: false,
    enableReferenceNote: false,
    enableSpecialInstructions: false,
    futureDeliveryDay: FutureDeliveryDay(''),
    enableGMC: false,
    enableListPrice: false,
    priceOverride: false,
    disablePaymentTermsDisplay: false,
    disableDeliveryDate: false,
    enableBillTo: true,
    showPOAttachment: false,
    addOosMaterials: false,
    expiryDateDisplay: false,
    hideStockDisplay: false,
    oosValue: OosValue(0),
    enableRemarks: false,
    enableOHPrice: true,
    poNumberRequired: false,
    enableTaxDisplay: false,
    netPriceOverride: false,
    batchNumDisplay: false,
    displayOrderDiscount: false,
    minOrderAmount: '0',
    enableZDP8Override: false,
    disableReturnsAccessSR: false,
    disableReturnsAccess: false,
    enableGreenDelivery: false,
    greenDeliveryDelayInDays: 0,
    enableComboDeals: false,
    greenDeliveryUserRole: GreenDeliveryUserRole(0),
    comboDealsUserRole: ComboDealUserRole(0),
    enableGMN:false,
  );

  group('Eligibility Bloc', () {
    blocTest('Eligibility Bloc Initial',
        build: () => EligibilityBloc(),
        act: (EligibilityBloc bloc) {
          bloc.add(const EligibilityEvent.initialized());
        },
        expect: () => [EligibilityState.initial()]);

    blocTest(
      'Eligibility Update',
      build: () => EligibilityBloc(),
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.update(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSaleOrgConfig,
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeShipToInfo,
            selectedOrderType: OrderDocumentType.empty(),
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );
  });

  test(
    'Check pnpValueMaterial for eligibility state returns empty string if user role type is not SalesRep',
    () {
      final eligibilityState =
          EligibilityState.initial().copyWith(user: fakeUser);
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, '');
    },
  );

  test(
    'Check pnpValueMaterial for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, 'include');
    },
  );

  test(
    'Check pnpValueMaterial for eligibility state returns include if user role type is not SalesRep and isOrderTypeEnable is true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2900'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueMaterial;
      expect(pickAndPackValue, 'include');
    },
  );

  test(
      'Check pnpValueCovidMaterial for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
      () {
    final eligibilityState =
        EligibilityState.initial().copyWith(user: fakeUser);
    final pickAndPackValue = eligibilityState.getPNPValueCovidMaterial;
    expect(pickAndPackValue, '');
  });

  test(
    'Check pnpValueCovidMaterial for eligibility state returns `only` if user role type is SalesRep and salesOrg is not SG',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2900'),
        ),
      );
      final pickAndPackValue = eligibilityState.getPNPValueCovidMaterial;
      expect(pickAndPackValue, 'only');
    },
  );

  test(
      'Check pnpValueBonusMaterialSearch for eligibility state returns include if user role type is not SalesRep and salesOrg is SG',
      () {
    final eligibilityState =
        EligibilityState.initial().copyWith(user: fakeUser);
    final pickAndPackValue = eligibilityState.getPNPValueBonusMaterialSearch;
    expect(pickAndPackValue, '');
  });

  test(
    'Check pnpValueBonusMaterialSearch for eligibility state returns `include` if user role type is SalesRep and salesOrg is SG or MY',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('internal_sales_rep'))),
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );
      final pickAndPackValueSG =
          eligibilityState.getPNPValueBonusMaterialSearch;
      expect(pickAndPackValueSG, 'include');

      final newEligibilityState = eligibilityState.copyWith(
        salesOrganisation: fakeSaleOrg.copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );

      final pickAndPackValueMY =
          newEligibilityState.getPNPValueBonusMaterialSearch;
      expect(pickAndPackValueMY, 'include');
    },
  );

  test(
    'eligibility state isBillToInfo should return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, true);
    },
  );

  test(
    'eligibility state validateOutOfStockValue should return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final isOosValueZero = eligibilityState.validateOutOfStockValue;
      expect(isOosValueZero, true);
    },
  );

  test(
    'eligibility state doNotAllowOutOfStockMaterials should return false for sales rep user and addOosMaterials as true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
        ),
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig.copyWith(
          addOosMaterials: true,
        ),
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final doNotAllowOutOfStockMaterials =
          eligibilityState.doNotAllowOutOfStockMaterials;
      expect(doNotAllowOutOfStockMaterials, false);
    },
  );

  test(
    'eligibility state displayOrderDiscount should return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig.copyWith(
          displayOrderDiscount: true,
        ),
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final displayOrderDiscount =
          eligibilityState.salesOrgConfigs.displayOrderDiscount;
      expect(displayOrderDiscount, true);
    },
  );

  test(
    'eligibility state enableRemarks return true',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig.copyWith(
          enableRemarks: true,
        ),
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final enableRemarks = eligibilityState.salesOrgConfigs.enableRemarks;
      expect(enableRemarks, true);
    },
  );

  test(
    'eligibility state isBillToInfo should return false when customerCodeSoldTo and billToCustomerCode is same',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerCodeSoldTo: 'customer1234'),
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, false);
    },
  );

  test(
    'eligibility state isBillToInfo should return false when billToInfos is empty',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo.copyWith(
          billToInfos: [],
        ),
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, false);
    },
  );

  group(
    'Combo Deal Eligible -',
    () {
      test(
        'non eligible when salesConfig disable combo deal',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableComboDeals: false,
            ),
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );

      test(
        'non eligible when customerCode combo deal eligibility return false',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableComboDeals: true,
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: false,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );

      test(
        'eligible when salesOrg enable combo deal, customerCode eligible and combo deal role is all user',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(1),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: true,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, true);
        },
      );

      test(
        'eligible when user is non sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is customer only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(2),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: true,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, true);
        },
      );

      test(
        'non eligible when user is non sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is sale rep only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(3),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              comboEligible: true,
            ),
            shipToInfo: fakeShipToInfo,
          );

          expect(eligibilityState.comboDealEligible, false);
        },
      );
    },
  );
}
