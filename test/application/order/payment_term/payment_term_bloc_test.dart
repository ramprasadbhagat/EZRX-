import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
        when(() => paymentTermsRepositoryMock.getPaymentTerms(
              customerCodeInfo: fakeCustomerCode,
              salesOrganisation: fakeSaleOrganisation,
              salesOrgConfig: fakeSaleOrgConfig,
              paymentCustomerInfo: fakepaymentCustomerInformation,
              salesRepInfo: fakesalesRepInfo,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          salesOrganisation: fakeSaleOrganisation,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          salesRepresentativeInfo: fakesalesRepInfo)),
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
        when(() => paymentTermsRepositoryMock.getPaymentTerms(
              customerCodeInfo: fakeCustomerCode,
              salesOrganisation: fakeSaleOrganisation,
              salesOrgConfig: fakeSaleOrgConfig,
              paymentCustomerInfo: fakepaymentCustomerInformation,
              salesRepInfo: fakesalesRepInfo,
            )).thenAnswer(
          (invocation) async => Right(
            paymentTermMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(PaymentTermEvent.fetch(
          customeCodeInfo: fakeCustomerCode,
          salesOrganisation: fakeSaleOrganisation,
          paymentCustomerInformation: fakepaymentCustomerInformation,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          salesRepresentativeInfo: fakesalesRepInfo)),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTerms: paymentTermMockData,
          paymentTermsFailureOrSuccessOption: none(),
        )
      ],
    );

    // blocTest<PaymentTermBloc, PaymentTermState>(
    //   'Payment Terms Fetch Success',
    //   build: () => PaymentTermBloc(
    //     customerCodeBloc: customerCodeMockBloc,
    //     salesOrgBloc: salesOrgMockBloc,
    //     paymentCustomerInformationBloc: paymentCustomerInformationMockBloc,
    //     salesRepBloc: salesRepMockBloc,
    //     userBloc: userMockBloc,
    //     paymentTermRepository: paymentTermsRepositoryMock,
    //   ),
    //   setUp: () {
    //     when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
    //       return SalesOrgState.initial().copyWith().copyWith(
    //           configs: fakeSaleOrgConfig, salesOrganisation: fakeSaleOrg);
    //     });
    //     when(() => customerCodeMockBloc.state).thenAnswer((invocation) {
    //       return CustomerCodeState.initial()
    //           .copyWith(customeCodeInfo: customerCode);
    //     });
    //     when(() => salesRepMockBloc.state).thenAnswer((invocation) {
    //       return SalesRepState.initial().copyWith(salesRepInfo: salesRepInfo);
    //     });
    //     when(() => paymentCustomerInformationMockBloc.state)
    //         .thenAnswer((invocation) {
    //       return PaymentCustomerInformationState.initial()
    //           .copyWith(paymentCustomerInformation: paymentCustomerInformation);
    //     });
    //     when(() => userMockBloc.state).thenAnswer((invocation) {
    //       return UserState.initial();
    //     });
    //     when(() => paymentTermsRepositoryMock.getPaymentTerms(
    //           customerCodeInfo: customerCode,
    //           salesOrg: fakeSaleOrg.salesOrg,
    //           salesOrgConfig: fakeSaleOrgConfig,
    //           paymentCustomerInfo: paymentCustomerInformation,
    //           salesRepInfo: salesRepInfo,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         paymentTermMockData,
    //       ),
    //     );
    //   },
    //   act: (bloc) => bloc.add(const PaymentTermEvent.fetch()),
    //   expect: () => [
    //     PaymentTermState.initial().copyWith(
    //       paymentTerms: paymentTermMockData,
    //       paymentTermsFailureOrSuccessOption: none(),
    //     )
    //   ],
    // );
  });
}
