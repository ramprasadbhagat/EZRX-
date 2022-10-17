import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
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

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class PaymentCustomerInfoMockBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesRepMockBloc extends MockBloc<SalesRepEvent, SalesRepState>
    implements SalesRepBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentTermsRepository paymentTermsRepositoryMock;
  late SalesOrgBloc salesOrgMockBloc;
  late CustomerCodeBloc customerCodeMockBloc;
  late SalesRepBloc salesRepMockBloc;
  late PaymentCustomerInformationBloc paymentCustomerInformationMockBloc;
  late UserBloc userMockBloc;
  late List<PaymentTerm> paymentTermMockData;

  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: [],
  );

  final fakeSaleOrgConfig = SalesOrganisationConfigs(
    currency: Currency(''),
    hideCustomer: false,
    disableOrderType: false,
    disablePrincipals: false,
    enableGimmickMaterial: false,
    languageFilter: false,
    languageValue: '',
    principalList: [],
    enableBatchNumber: false,
  );

  const customerCode = CustomerCodeInfo(
    customerCodeSoldTo: 'fake-1234',
    billToInfos: [],
    customerAddress: CustomerAddress(
        street1: '', street2: '', street3: '', street4: '', street5: ''),
    customerClassification: '',
    customerLocalGroup: '',
    customerName: CustomerName(name1: '', name2: '', name3: '', name4: ''),
    paymentTermDescription: '',
    postalCode: '',
    shipToInfos: [],
    status: '',
  );

  const salesRepInfo = SalesRepresentativeInfo(
    count: 0,
    uniquePrincipalGroup: [],
    uniquePrincipalNumber: [],
    uniqueSalesOrganisation: [],
  );

  const paymentCustomerInformation = PaymentCustomerInformation(
    paymentTerm: 'fake-term',
  );

  group('Payment Terms Bloc', () {
    setUp(() async {
      paymentTermsRepositoryMock = PaymentTermsRepoMock();
      salesOrgMockBloc = SalesOrgMockBloc();
      customerCodeMockBloc = CustomerCodeMockBloc();
      paymentCustomerInformationMockBloc = PaymentCustomerInfoMockBloc();
      userMockBloc = UserMockBloc();
      salesRepMockBloc = SalesRepMockBloc();
      paymentTermMockData =
          await PaymentTermLocalDataSource().getPaymentTerms();
      WidgetsFlutterBinding.ensureInitialized();
    });
    blocTest<PaymentTermBloc, PaymentTermState>(
      'For Customer Information Initialized Event',
      build: () => PaymentTermBloc(
        paymentCustomerInformationBloc: paymentCustomerInformationMockBloc,
        customerCodeBloc: customerCodeMockBloc,
        salesOrgBloc: salesOrgMockBloc,
        paymentTermRepository: paymentTermsRepositoryMock,
        salesRepBloc: salesRepMockBloc,
        userBloc: userMockBloc,
      ),
      act: (bloc) => bloc.add(const PaymentTermEvent.initialized()),
      expect: () => [
        PaymentTermState.initial(),
      ],
    );

    blocTest<PaymentTermBloc, PaymentTermState>(
      'Payment Terms Fetch fail',
      build: () => PaymentTermBloc(
        customerCodeBloc: customerCodeMockBloc,
        salesOrgBloc: salesOrgMockBloc,
        paymentCustomerInformationBloc: paymentCustomerInformationMockBloc,
        salesRepBloc: salesRepMockBloc,
        userBloc: userMockBloc,
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
          return SalesOrgState.initial().copyWith().copyWith(
                configs: fakeSaleOrgConfig,
                salesOrganisation: fakeSaleOrg,
              );
        });
        when(() => customerCodeMockBloc.state).thenAnswer((invocation) {
          return CustomerCodeState.initial()
              .copyWith(customeCodeInfo: customerCode);
        });
        when(() => salesRepMockBloc.state).thenAnswer((invocation) {
          return SalesRepState.initial().copyWith(salesRepInfo: salesRepInfo);
        });
        when(() => paymentCustomerInformationMockBloc.state)
            .thenAnswer((invocation) {
          return PaymentCustomerInformationState.initial()
              .copyWith(paymentCustomerInformation: paymentCustomerInformation);
        });
        when(() => userMockBloc.state).thenAnswer((invocation) {
          return UserState.initial();
        });
        when(() => paymentTermsRepositoryMock.getPaymentTerms(
              customerCodeInfo: customerCode,
              salesOrg: fakeSaleOrg.salesOrg,
              salesOrgConfig: fakeSaleOrgConfig,
              paymentCustomerInfo: paymentCustomerInformation,
              salesRepInfo: salesRepInfo,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(const PaymentTermEvent.fetch()),
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
        customerCodeBloc: customerCodeMockBloc,
        salesOrgBloc: salesOrgMockBloc,
        paymentCustomerInformationBloc: paymentCustomerInformationMockBloc,
        salesRepBloc: salesRepMockBloc,
        userBloc: userMockBloc,
        paymentTermRepository: paymentTermsRepositoryMock,
      ),
      setUp: () {
        when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
          return SalesOrgState.initial().copyWith().copyWith(
              configs: fakeSaleOrgConfig, salesOrganisation: fakeSaleOrg);
        });
        when(() => customerCodeMockBloc.state).thenAnswer((invocation) {
          return CustomerCodeState.initial()
              .copyWith(customeCodeInfo: customerCode);
        });
        when(() => salesRepMockBloc.state).thenAnswer((invocation) {
          return SalesRepState.initial().copyWith(salesRepInfo: salesRepInfo);
        });
        when(() => paymentCustomerInformationMockBloc.state)
            .thenAnswer((invocation) {
          return PaymentCustomerInformationState.initial()
              .copyWith(paymentCustomerInformation: paymentCustomerInformation);
        });
        when(() => userMockBloc.state).thenAnswer((invocation) {
          return UserState.initial();
        });
        when(() => paymentTermsRepositoryMock.getPaymentTerms(
              customerCodeInfo: customerCode,
              salesOrg: fakeSaleOrg.salesOrg,
              salesOrgConfig: fakeSaleOrgConfig,
              paymentCustomerInfo: paymentCustomerInformation,
              salesRepInfo: salesRepInfo,
            )).thenAnswer(
          (invocation) async => Right(
            paymentTermMockData,
          ),
        );
      },
      act: (bloc) => bloc.add(const PaymentTermEvent.fetch()),
      expect: () => [
        PaymentTermState.initial().copyWith(
          paymentTerms: paymentTermMockData,
          paymentTermsFailureOrSuccessOption: none(),
        )
      ],
    );
  });
}
