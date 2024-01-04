import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/repository/mixpanel_repository.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ChatBotRepositoryMock extends Mock implements ChatBotRepository {}

class MixpanelRepoMock extends Mock implements MixpanelRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: [],
    )
  ];

  final fakeShipToInfo = ShipToInfo.empty()
      .copyWith(building: 'fakeBuilding', shipToCustomerCode: '123');
  final fakeBillToInfo =
      BillToInfo.empty().copyWith(billToCustomerCode: 'customer1234');
  final fakeCustomerInfo = CustomerCodeInfo.empty().copyWith(
    shipToInfos: [fakeShipToInfo],
    billToInfos: [fakeBillToInfo],
    customerCodeSoldTo: 'customer123',
  );
  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client_admin'),
    ),
    enableOrderType: true,
  );
  final fakeSaleOrg = fakeSGSalesOrganisation.copyWith(
    customerInfos: fakeSalesOrgCustomerInfos,
  );
  final chatBotRepositoryMock = ChatBotRepositoryMock();
  final mixpanelRepositoryMock = MixpanelRepoMock();

  group('Eligibility Bloc', () {
    blocTest(
      'Eligibility Bloc Initial',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.initialized());
      },
      expect: () => [EligibilityState.initial()],
    );

    blocTest(
      'Eligibility Update fail',
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
      ),
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
      ),
      setUp: () {
        when(
          () => chatBotRepositoryMock.passPayloadToChatbot(
            customerCodeInfo: fakeCustomerInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSGSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
            locale: fakeUser.preferredLanguage.locale,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.update(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
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
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
          isLoading: true,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
        ),
      ],
    );

    blocTest(
      'Eligibility Update',
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
      ),
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
      ),
      setUp: () {
        when(
          () => chatBotRepositoryMock.passPayloadToChatbot(
            customerCodeInfo: fakeCustomerInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSGSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
            locale: fakeUser.preferredLanguage.locale,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.update(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSGSalesOrgConfigs,
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
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
          failureOrSuccessOption: const None(),
          isLoading: true,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeShipToInfo,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake Error'),
            ),
          ),
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
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
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
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
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
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
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
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        ),
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
        salesOrgConfigs: fakeSGSalesOrgConfigs,
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
        salesOrgConfigs: fakeSGSalesOrgConfigs,
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
        salesOrgConfigs: fakeSGSalesOrgConfigs,
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
        salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
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
        salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
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
        salesOrgConfigs: fakeSGSalesOrgConfigs,
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
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo.copyWith(
          billToInfos: [],
        ),
        shipToInfo: fakeShipToInfo,
      );

      final showBillToInfo = eligibilityState.isBillToInfo;
      expect(showBillToInfo, false);
    },
  );

  test(
    'isPaymentTermDescriptionEnable',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
      );

      expect(eligibilityState.isPaymentTermDescriptionEnable, true);
    },
  );

  test(
    'isSalesRepAndBonusEligible',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeExternalSalesRepUser.copyWith(
          hasBonusOverride: true,
        ),
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2001'),
        ),
      );

      expect(eligibilityState.isSalesRepAndBonusEligible, true);
    },
  );

  test(
    'isBundleMaterialEnable',
    () {
      final eligibilityState = EligibilityState.initial();

      expect(eligibilityState.isBundleMaterialEnable, true);
    },
  );

  test(
    'isOrderSummaryPPEDisclaimerEnable',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      );

      expect(eligibilityState.isOrderSummaryPPEDisclaimerEnable, true);
    },
  );

  test(
    'isCovidMaterialEnable',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('client_user'),
          ),
        ),
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerAttr7: CustomerAttr7('ZEV')),
      );

      expect(eligibilityState.isCovidMaterialEnable, true);
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
            salesOrgConfigs: fakeSGSalesOrgConfigs,
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
            salesOrgConfigs: fakeSGSalesOrgConfigs,
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
            salesOrgConfigs: fakeKHSalesOrgConfigs,
            customerCodeInfo: fakeCustomerInfo.copyWith(
              salesDeals: [SalesDealNumber('0000000000')],
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
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              comboDealsUserRole: ComboDealUserRole(2),
            ),
            customerCodeInfo: fakeCustomerInfo.copyWith(
              salesDeals: [SalesDealNumber('0000000000')],
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
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
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

      test(
        'Customer Code Account Suspended',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('Z1'),
            ),
          );

          expect(eligibilityState.isAccountSuspended, true);
        },
      );
      test(
        'ShipsTo Code Account Suspended',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              status: Status('Z1'),
            ),
          );

          expect(eligibilityState.isAccountSuspended, true);
        },
      );
    },
  );

  group('Override ', () {
    test(
      'bonus override none sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        );
        expect(eligibilityState.isBonusOverrideEnable, true);
      },
    );

    test(
      'bonus override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser.copyWith(
            hasBonusOverride: true,
          ),
        );

        expect(eligibilityState.isBonusOverrideEnable, true);
      },
    );

    test(
      'ZDP8Override Override',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        );

        expect(eligibilityState.isZDP8Override, true);
      },
    );
    test(
      'isPriceOverrideEnable Override none sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );

    test(
      'isPriceOverrideEnable Override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser.copyWith(
            hasPriceOverride: true,
          ),
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );
  });

  group('Return', () {
    test(
      'Return disable for any user with disableReturns',
      () {
        final eligibilityState = EligibilityState.initial()
            .copyWith(user: fakeClientUser.copyWith(disableReturns: true));

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
    test(
      'Return disable for sales rep user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs:
              fakeSGSalesOrgConfigs
              .copyWith(disableReturnsAccessSR: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );

    test(
      'Return disable for customer user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeClientUser,
        );

        expect(eligibilityState.isReturnsEnable, true);
      },
    );

    test(
      'Return enable',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeClientUser,
          salesOrgConfigs:
              fakeSGSalesOrgConfigs
              .copyWith(disableReturnsAccess: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
  });

  group('showGreenDeliveryBox', () {
    test(
      'showGreenDeliveryBox salesOrgConfigs disable',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: false,
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, false);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole all user',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(1),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole customer',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeClientUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(2),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'salesOrgConfigs gdEligibleRole sales rep',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            enableGreenDelivery: true,
            greenDeliveryUserRole: GreenDeliveryUserRole(3),
          ),
        );

        expect(eligibilityState.showGreenDeliveryBox, true);
      },
    );

    test(
      'salesOrgConfigs isOutOfStockMaterialAllowed for all',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            oosValue: OosValue(0),
          ),
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, true);
      },
    );
    test(
      'salesOrgConfigs isOutOfStockMaterialAllowed for all',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            oosValue: OosValue(0),
          ),
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, true);
      },
    );

    test(
      'salesOrgConfigs isOutOfStockMaterialAllowed for sales rep',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, true);
      },
    );

    test(
      'salesOrgConfigs isOutOfStockMaterialAllowed not allowed',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(false),
          ),
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, false);
      },
    );
  });
}
