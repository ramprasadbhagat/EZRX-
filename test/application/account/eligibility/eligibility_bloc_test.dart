import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/repository/mixpanel_repository.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';

class ChatBotRepositoryMock extends Mock implements ChatBotRepository {}

class MixpanelRepoMock extends Mock implements MixpanelRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: [],
    ),
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
    salesOrg: SalesOrg('fake-1234'),
  );
  final fakeSaleOrgConfig = fakeSalesOrganisationConfigs.copyWith(
    salesOrg: SalesOrg('2601'),
    enableIRN: false,
    enableDefaultMD: false,
    disableProcessingStatus: false,
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
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
    disablePayment: false,
    disableDeliveryDate: false,
    enableBillTo: true,
    showPOAttachment: false,
    addOosMaterials: OosMaterial(false),
    expiryDateDisplay: false,
    hideStockDisplay: false,
    oosValue: OosValue(0),
    enableRemarks: false,
    enableOHPrice: true,
    poNumberRequired: PoNumberRequired(false),
    enableTaxDisplay: false,
    netPriceOverride: false,
    batchNumDisplay: false,
    displayOrderDiscount: false,
    minOrderAmount: 0,
    enableZDP8Override: false,
    disableReturnsAccessSR: false,
    disableReturnsAccess: false,
    enableGreenDelivery: false,
    greenDeliveryDelayInDays: 0,
    enableComboDeals: false,
    greenDeliveryUserRole: GreenDeliveryUserRole(0),
    comboDealsUserRole: ComboDealUserRole(0),
    enableGMN: false,
    displayItemTaxBreakdown: false,
    displaySubtotalTaxBreakdown: false,
    disableOverrideFieldCustomer: false,
    disableOverrideFieldSR: false,
    enablePOAttachmentRequired: false,
    hideCredit: false,
    allowReturnsOutsidePolicy: false,
  );
  final chatBotRepositoryMock = ChatBotRepositoryMock();
  final mixpanelRepositoryMock = MixpanelRepoMock();
  final customerCodeRepositoryMock = CustomerCodeRepositoryMock();
  final config = Config()..appFlavor = Flavor.mock;
  late CustomerInformation customerMockData;
  const fakePageSize = 24;

  setUpAll(() async {
    customerMockData =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });

  group('Eligibility Bloc', () {
    blocTest(
      'Eligibility Bloc Initial',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(const EligibilityEvent.initialized());
      },
      expect: () => [EligibilityState.initial()],
    );

    blocTest(
      'Eligibility Update',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => chatBotRepositoryMock.passPayloadToChatbot(
            customerCodeInfo: fakeCustomerInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSaleOrgConfig,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      seed: () => EligibilityState.initial().copyWith(
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.update(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeSaleOrgConfig,
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

    blocTest(
      'Eligibility Customer Code Selected',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
      ),
      seed: () => EligibilityState.initial().copyWith(
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        user: fakeUser,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.storeCustomerInfo(
            customerCode: fakeCustomerInfo.customerCodeSoldTo,
            shippingAddress:
                fakeCustomerInfo.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          EligibilityEvent.selectedCustomerCode(
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeCustomerInfo.shipToInfos.first,
          ),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSaleOrg,
          salesOrgConfigs: fakeSaleOrgConfig,
          user: fakeUser,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeCustomerInfo.shipToInfos.first,
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ],
    );

    test('Check if state does not have DefaultShipToInfo', () {
      final state = EligibilityState.initial();
      expect(state.haveShipTo, false);
      expect(state.shipToInfo, ShipToInfo.empty());
    });

    blocTest(
      'loadStoredCustomerCode - Customer Code Storage returns success and Get Customer Code returns success with populated list',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
      ),
      seed: () => EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
      ),
      setUp: () {
        when(
          () => customerCodeRepositoryMock.storeCustomerInfo(
            customerCode:
                customerMockData.soldToInformation.first.customerCodeSoldTo,
            shippingAddress: customerMockData
                .soldToInformation.first.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));

        when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
            .thenAnswer(
          (_) async => const Right(
            AccountSelector(
              salesOrg: 'mockSalesOrg',
              customerCode: 'mockCustomerCode',
              shippingAddress: 'mockShippingAddress',
            ),
          ),
        );

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: ['mockShippingAddress'],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(customerMockData),
        );

        when(
          () => customerCodeRepositoryMock.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: [
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (EligibilityBloc bloc) {
        bloc.add(
          const EligibilityEvent.loadStoredCustomerCode(),
        );
      },
      expect: () => [
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: true,
          preSelectShipTo: false,
        ),
        EligibilityState.initial().copyWith(
          user: fakeUser,
          salesOrganisation: fakeSaleOrg,
          isLoadingCustomerCode: false,
          customerCodeInfo: customerMockData.soldToInformation.first,
          preSelectShipTo: true,
          shipToInfo:
              customerMockData.soldToInformation.first.shipToInfos.first,
        ),
      ],
    );
  });

  blocTest(
    'loadStoredCustomerCode - Customer Code Storage returns success and offset is sent as 0 to fetch customerCodeList',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: 'mockCustomerCode',
            shippingAddress: 'mockShippingAddress',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          customerCodes: ['mockShippingAddress'],
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: fakePageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.first,
        preSelectShipTo: true,
        shipToInfo: customerMockData.soldToInformation.first.shipToInfos.first,
      ),
    ],
  );

  blocTest(
    'loadStoredCustomerCode - last saved customer code is not at the first index of customerCodeInfoList',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: '0000002011',
            shippingAddress: 'mockShippingAddress',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          customerCodes: ['mockShippingAddress'],
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: fakePageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.firstWhere(
          (element) => element.customerCodeSoldTo == '0000002011',
        ),
        preSelectShipTo: true,
        shipToInfo: customerMockData.soldToInformation.first.shipToInfos.first,
      ),
    ],
  );

  blocTest(
    'loadStoredCustomerCode - last saved customer code is not at the first index of customerCodeInfoList && shippingAddress Equals',
    build: () => EligibilityBloc(
      chatBotRepository: chatBotRepositoryMock,
      mixpanelRepository: mixpanelRepositoryMock,
      customerCodeRepository: customerCodeRepositoryMock,
      config: config,
    ),
    setUp: () {
      when(() => customerCodeRepositoryMock.getCustomerCodeStorage())
          .thenAnswer(
        (_) async => const Right(
          AccountSelector(
            salesOrg: 'mockSalesOrg',
            customerCode: '0000002011',
            shippingAddress: '0000002011',
          ),
        ),
      );

      when(
        () => customerCodeRepositoryMock.getCustomerCode(
          salesOrganisation: fakeSaleOrg,
          customerCodes: ['0000002011'],
          hideCustomer: false,
          offset: 0,
          user: fakeUser,
          pageSize: fakePageSize,
        ),
      ).thenAnswer(
        (invocation) async => Right(customerMockData),
      );
    },
    seed: () => EligibilityState.initial().copyWith(
      user: fakeUser,
      salesOrganisation: fakeSaleOrg,
      customerCodeInfo: CustomerCodeInfo.empty(),
    ),
    act: (EligibilityBloc bloc) {
      bloc.add(
        const EligibilityEvent.loadStoredCustomerCode(),
      );
    },
    expect: () => [
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: true,
        preSelectShipTo: false,
      ),
      EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        isLoadingCustomerCode: false,
        customerCodeInfo: customerMockData.soldToInformation.firstWhere(
          (element) => element.customerCodeSoldTo == '0000002011',
        ),
        preSelectShipTo: true,
        shipToInfo:
            customerMockData.soldToInformation.first.shipToInfos.firstWhere(
          (element) => element.shipToCustomerCode == '0000002011',
        ),
      ),
    ],
  );

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
        salesOrgConfigs: fakeIDSalesOrgConfigs,
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
          addOosMaterials: OosMaterial(true),
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
    'eligibility state displayOrderDiscount should return false',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final displayOrderDiscount =
          eligibilityState.salesOrgConfigs.displayOrderDiscount;
      expect(displayOrderDiscount, false);
    },
  );

  test(
    'eligibility state enableRemarks return false',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      );

      final enableRemarks = eligibilityState.salesOrgConfigs.enableRemarks;
      expect(enableRemarks, false);
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
    'isPaymentEnable',
    () {
      var eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin.copyWith(disablePaymentAccess: true),
        salesOrgConfigs: fakeKHSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientUser.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, true);

      eligibilityState = EligibilityState.initial().copyWith(
        user: fakeSalesRepUser.copyWith(disablePaymentAccess: false),
        salesOrgConfigs: fakeIDSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          paymentTerm: PaymentTermCode('C024'),
        ),
      );

      expect(eligibilityState.isPaymentEnabled, false);

      eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          paymentTerm: PaymentTermCode('A007'),
        ),
      );

      expect(eligibilityState.isPaymentEnabled, false);
    },
  );

  test(
    'disable payment for rootadmin when disablePayment on',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrgConfigs: fakeTWSalesOrgConfigs,
      );

      expect(eligibilityState.isPaymentEnabled, false);
    },
  );
  test(
    'isSalesRepAndBonusEligible',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeUser.copyWith(
          role: Role.empty().copyWith(
            type: RoleType('external_sales_rep'),
          ),
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
    'isCovidMaterialEnable for sg market',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakeSGSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerAttr7: CustomerAttr7('ZEV')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for sg market for root admin',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrganisation: fakeSaleOrg,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerAttr7: CustomerAttr7('ZEV')),
      );

      expect(eligibilityState.canOrderCovidMaterial, false);
    },
  );
  test(
    'isCovidMaterialEnable for PH market for VR',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VR')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for PH market for VP',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeClientAdmin,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VP')),
      );

      expect(eligibilityState.canOrderCovidMaterial, true);
    },
  );

  test(
    'isCovidMaterialEnable for PH market',
    () {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser,
        salesOrganisation: fakePHSalesOrganisation,
        customerCodeInfo:
            fakeCustomerInfo.copyWith(customerGrp4: CustomerGrp4('VR')),
      );

      expect(eligibilityState.canOrderCovidMaterial, false);
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
            salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
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
            salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
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
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
              comboDealsUserRole: ComboDealUserRole(1),
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
        'eligible when user is non sale rep, salesOrg enable combo deal, customerCode eligible and combo deal role is customer only',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation: fakeSaleOrg,
            salesOrgConfigs: fakeKHSalesOrgConfigs.copyWith(
              enableComboDeals: true,
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

      test(
        'Customer Code Account Suspended',
        () {
          final eligibilityState = EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('z1'),
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
              status: Status('z1'),
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
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(priceOverride: true),
        );
        expect(eligibilityState.isBonusOverrideEnable, true);
      },
    );

    test(
      'bonus override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(enableZDP8Override: true),
        );

        expect(eligibilityState.isZDP8Override, true);
      },
    );
    test(
      'isPriceOverrideEnable Override none sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(priceOverride: true),
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );

    test(
      'isPriceOverrideEnable Override sales rep ',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
            hasPriceOverride: true,
          ),
        );

        expect(eligibilityState.isPriceOverrideEnable, true);
      },
    );
  });

  group('Return', () {
    test(
      'Return disable for any user with customer config code return disable true',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          customerCodeConfig: CustomerCodeConfig.empty().copyWith(
            disableReturns: true,
          ),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
    test(
      'Return disable for any user with disableReturns',
      () {
        final eligibilityState = EligibilityState.initial()
            .copyWith(user: fakeUser.copyWith(disableReturns: true));

        expect(eligibilityState.isReturnsEnable, false);
      },
    );
    test(
      'Return disable for sales rep user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccessSR: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );

    test(
      'Return disable for customer user with disableReturnsAccessSR',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
        );

        expect(eligibilityState.isReturnsEnable, true);
      },
    );

    test(
      'Return enable',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccess: true),
        );

        expect(eligibilityState.isReturnsEnable, false);
      },
    );

    test(
      'disable returns access enable for rootadmin account',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeRootAdminUser,
          salesOrgConfigs:
              fakeSGSalesOrgConfigs.copyWith(disableReturnsAccess: true),
        );

        expect(eligibilityState.isReturnsEnable, true);
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('client_user')),
          ),
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(true),
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(true),
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
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(true),
            oosValue: OosValue(1),
          ),
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, true);
      },
    );

    test(
      'salesOrgConfigs isOutOfStockMaterialAllowed not allowed',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          ),
          salesOrgConfigs: fakeSGSalesOrgConfigs.copyWith(
            addOosMaterials: OosMaterial(false),
            oosValue: OosValue(1),
          ),
        );

        expect(eligibilityState.isOutOfStockMaterialAllowed, false);
      },
    );

    test(
      'outOfStockProductStatus- Out of stock Test',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeSalesRepUser,
        );

        expect(
          eligibilityState.outOfStockProductStatus,
          StatusType('Out of stock'),
        );
      },
    );

    test(
      'outOfStockProductStatus- OOS-Preorder',
      () {
        final eligibilityState = EligibilityState.initial().copyWith(
          user: fakeSalesRepUser,
          salesOrgConfigs: fakeIDSalesOrgConfigs,
        );

        expect(
          eligibilityState.outOfStockProductStatus,
          StatusType('OOS-Preorder'),
        );
      },
    );
  });

  group('isMarketPlaceEnabled getter', () {
    test('return false when sales org disables marketplace', () {
      final state = EligibilityState.initial()
          .copyWith(salesOrgConfigs: fakeSGSalesOrgConfigs);

      expect(state.isMarketPlaceEnabled, false);
    });

    test('return false when region disables marketplace', () {
      final state = EligibilityState.initial().copyWith(
        shipToInfo: fakeShipToInfo,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
      );

      expect(state.isMarketPlaceEnabled, false);
    });

    test('return false when role can not access marketplace', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeInternalSalesRepUser,
      );

      expect(state.isMarketPlaceEnabled, false);
    });

    test('return true when role can access marketplace', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeClientUser,
      );

      expect(state.isMarketPlaceEnabled, true);
    });
  });

  group('showMarketPlaceProduct getter', () {
    test('return false when marketplace disabled', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeInternalSalesRepUser,
      );

      expect(state.marketPlaceEligible, false);
    });

    test('return false when marketplace is enable + user not accept TnC', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeClientUser,
      );

      expect(state.marketPlaceEligible, false);
    });

    test('return true when marketplace is enable + user accept TnC', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeClientUserAccessMarketPlace,
      );

      expect(state.marketPlaceEligible, true);
    });
  });

  group('showMarketPlaceTnc getter', () {
    test('return false when user have not accepted normal TnC', () {
      final state = EligibilityState.initial().copyWith(
        user: fakeClientUser,
      );

      expect(state.showMarketPlaceTnc, false);
    });

    test('return false when accepted normal TnC and marketplace disable', () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user: fakeExternalSalesRepUser.copyWith(acceptPrivacyPolicy: true),
      );

      expect(state.showMarketPlaceTnc, false);
    });

    test(
        'return false when accepted normal TnC + marketplace enable + acceptance status is accepted/rejected',
        () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user:
            fakeClientUserAccessMarketPlace.copyWith(acceptPrivacyPolicy: true),
      );

      expect(
        state.copyWith
            .user(acceptMPTC: MarketPlaceTnCAcceptance.accept())
            .showMarketPlaceTnc,
        false,
      );

      expect(
        state.copyWith
            .user(acceptMPTC: MarketPlaceTnCAcceptance.reject())
            .showMarketPlaceTnc,
        false,
      );

      expect(
        state.copyWith
            .user(acceptMPTC: MarketPlaceTnCAcceptance(''))
            .showMarketPlaceTnc,
        false,
      );
    });

    test(
        'return false when accepted normal TnC + marketplace enable + acceptance status is unknown',
        () {
      final state = EligibilityState.initial().copyWith(
        customerCodeInfo: fakeMarketPlaceCustomerCode,
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        user:
            fakeClientUserAccessMarketPlace.copyWith(acceptPrivacyPolicy: true),
      );

      expect(
        state.copyWith
            .user(acceptMPTC: MarketPlaceTnCAcceptance.unknown())
            .showMarketPlaceTnc,
        true,
      );
    });

    blocTest(
      'Test RegisterChatBot mixpanel registerSuperProps',
      build: () => EligibilityBloc(
        chatBotRepository: chatBotRepositoryMock,
        mixpanelRepository: mixpanelRepositoryMock,
        customerCodeRepository: customerCodeRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => chatBotRepositoryMock.passPayloadToChatbot(
            customerCodeInfo: fakeCustomerInfo,
            salesOrganisation: fakeSaleOrg,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
            salesOrganisationConfigs: fakeSaleOrgConfig,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );

        when(
          () => mixpanelRepositoryMock.registerSuperProps(
            customerCodeInfo: fakeCustomerInfo,
            salesOrg: fakeSaleOrg.salesOrg,
            salesOrgConfigs: fakeSaleOrgConfig,
            shipToInfo: fakeShipToInfo,
            user: fakeUser,
          ),
        ).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      seed: () => EligibilityState.initial().copyWith(
        user: fakeUser,
        salesOrganisation: fakeSaleOrg,
        salesOrgConfigs: fakeSaleOrgConfig,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeShipToInfo,
      ),
      act: (EligibilityBloc bloc) {
        bloc.add(
          const EligibilityEvent.registerChatBot(),
        );
      },
      expect: () => [],
    );
  });
}
