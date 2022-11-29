import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  ];

  final fakeShipToInfo = ShipToInfo.empty().copyWith(building: 'fakeBuilding');
  final fakeCustomerInfo =
      CustomerCodeInfo.empty().copyWith(shipToInfos: [fakeShipToInfo]);
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
    enableIRN: false,
    enableDefaultMD: false,
    disableProcessingStatus: false,
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    languageFilter: false,
    languageValue: '',
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableTaxClassification: false,
    enableVat: false,
    enableZDP5: false,
    vatValue: 0,
    materialWithoutPrice: false,
    enableCollectiveNumber: false,
    enableFutureDeliveryDay: false,
    enableMobileNumber: false,
    enablePaymentTerms: false,
    enableReferenceNote: false,
    enableSpecialInstructions: false,
    futureDeliveryDay: '',
    enableGMC: false,
    enableListPrice: false,
    priceOverride: false,
    disablePaymentTermsDisplay: false,
    disableDeliveryDate: false,
    enableBillTo: false,
    showPOAttachment: false,
    addOosMaterials: false,
    expiryDateDisplay: false,
    hideStockDisplay: false,
    oosValue: OosValue(0),
    enableRemarks: false,
    enableOHPrice: true,
    ponRequired: false,
    enableTaxDisplay: false,
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
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          customerCodeInfo: fakeCustomerInfo,
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
}
