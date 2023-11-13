import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_object;

class PaymentTermsRepoMock extends Mock implements PaymentTermsRepository {}

class PaymentCustomerInfoMockBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class SalesRepMockBloc extends MockBloc<SalesRepEvent, SalesRepState>
    implements SalesRepBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentTermsRepository paymentTermsRepositoryMock;
  late List<PaymentTerm> paymentTermMockData;

  final fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-1234'),
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
    languageFilter: true,
    languageValue: const Locale(ApiLanguageCode.english),
    disableBundles: false,
    principalList: [],
    enableBatchNumber: false,
    enableZDP5: false,
    enableTaxClassification: false,
    enableVat: false,
    enableTaxAtTotalLevelOnly: false,
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
    enableBillTo: false,
    showPOAttachment: false,
    expiryDateDisplay: false,
    hideStockDisplay: false,
    addOosMaterials: OosMaterial(false),
    oosValue: OosValue(0),
    enableRemarks: false,
    enableOHPrice: true,
    poNumberRequired: PoNumberRequired(false),
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
    enableGMN: false,
    displayItemTaxBreakdown: false,
    displaySubtotalTaxBreakdown: false,
    disableOverrideFieldCustomer: false,
    disableOverrideFieldSR: false,
    enablePOAttachmentRequired: false,
    hideCredit: false,
  );

  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-1234',
  );

  const fakesalesRepInfo = SalesRepresentativeInfo(
    count: 0,
    uniquePrincipalGroup: [],
    uniquePrincipalNumber: [],
    uniqueSalesOrganisation: [],
  );

  const fakepaymentCustomerInformation = PaymentCustomerInformation(
    paymentTerm: 'fake-term',
    shipToInfoList: <ShipToInfo>[],
  );

  group('Payment Terms Bloc', () {
    setUp(() async {
      paymentTermsRepositoryMock = PaymentTermsRepoMock();
      paymentTermMockData =
          await PaymentTermLocalDataSource().getPaymentTerms();
      WidgetsFlutterBinding.ensureInitialized();
    });
    blocTest<PaymentTermBloc, PaymentTermState>(
      'For Customer Information Initialized Event',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      act: (bloc) => bloc.add(const PaymentTermEvent.initialized()),
      expect: () => [
        PaymentTermState.initial(),
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Fetch fail',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentTermsRepositoryMock.getPaymentTerms(
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeSaleOrganisation,
            salesOrgConfig: fakeSaleOrgConfig,
            paymentCustomerInfo: fakepaymentCustomerInformation,
            salesRepInfo: fakesalesRepInfo,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          salesOrganisation: fakeSaleOrganisation,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          salesRepresentativeInfo: fakesalesRepInfo,
        ),
      ),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTermsFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Fetch Success',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(
          () => paymentTermsRepositoryMock.getPaymentTerms(
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeSaleOrganisation,
            salesOrgConfig:
                fakeSaleOrgConfig, //.copyWith(languageFilter: true),
            paymentCustomerInfo: fakepaymentCustomerInformation,
            salesRepInfo: fakesalesRepInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            paymentTermMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(
        PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          salesOrganisation: fakeSaleOrganisation,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          salesRepresentativeInfo: fakesalesRepInfo,
        ),
      ),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTerms: paymentTermMockData,
          paymentTermsFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Extension Test',
      build: () => PaymentTermBloc(
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      seed: () => PaymentTermState.initial().copyWith(
        paymentTerms: paymentTermMockData,
      ),
      verify: (bloc) {
        expect(
          bloc.state.paymentTerms.displaySelected(value_object.PaymentTerm('')),
          null,
        );
        expect(
          bloc.state.paymentTerms
              .displaySelected(value_object.PaymentTerm('0001')),
          '0001-',
        );
        expect(
          bloc.state.paymentTerms.displaySelected(
            value_object.PaymentTerm('0001-Pay immediately (Standard SAP)'),
          ),
          '0001-Pay immediately (Standard SAP)',
        );
        expect(
          bloc.state.paymentTerms
              .displaySelected(value_object.PaymentTerm('0002')),
          null,
        );
      },
    );
  });
}
