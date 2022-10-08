import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PaymentCustomerInfoRepoMock extends Mock
    implements PaymentCustomerInformationRepository {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PaymentCustomerInformationRepository
      paymentCustomerInformationRepositoryMock;
  late SalesOrgBloc salesOrgMockBloc;
  late CustomerCodeBloc customerCodeMockBloc;
  late PaymentCustomerInformation paymentCustomerInformationMockData;

  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: [],
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
      status: '');

  group('Payment Customer Information Bloc', () {
    setUp(() async {
      paymentCustomerInformationRepositoryMock = PaymentCustomerInfoRepoMock();
      salesOrgMockBloc = SalesOrgMockBloc();
      customerCodeMockBloc = CustomerCodeMockBloc();
      paymentCustomerInformationMockData =
          await PaymentCustomerInformationLocalDataSource()
              .getPaymentCustomerInformation();
      WidgetsFlutterBinding.ensureInitialized();
    });
    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'For Customer Information Initialized Event',
      build: () => PaymentCustomerInformationBloc(
          paymentCustomerInformationRepository:
              paymentCustomerInformationRepositoryMock,
          customerCodeBloc: customerCodeMockBloc,
          salesOrgBloc: salesOrgMockBloc),
      act: (bloc) =>
          bloc.add(const PaymentCustomerInformationEvent.initialized()),
      expect: () => [PaymentCustomerInformationState.initial()],
    );

    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'Payment Customer Information Fetch fail',
      build: () => PaymentCustomerInformationBloc(
        customerCodeBloc: customerCodeMockBloc,
        salesOrgBloc: salesOrgMockBloc,
        paymentCustomerInformationRepository:
            paymentCustomerInformationRepositoryMock,
      ),
      setUp: () {
        when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
          return SalesOrgState.initial().copyWith().copyWith(
              configs: SalesOrganisationConfigs(
                currency: Currency(''),
                hideCustomer: false,
                disableOrderType: false,
                disablePrincipals: false,
                enableGimmickMaterial: false,
                languageFilter: false,
                languageValue: '',
                principalList: [],
              ),
              salesOrganisation: fakeSaleOrg);
        });
        when(() => customerCodeMockBloc.state).thenAnswer((invocation) {
          return CustomerCodeState.initial()
              .copyWith(customeCodeInfo: customerCode);
        });
        when(() => paymentCustomerInformationRepositoryMock
            .getPaymentCustomerInformation(
                customerCodeInfo: customerCode,
                salesOrg: fakeSaleOrg.salesOrg)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(const PaymentCustomerInformationEvent.fetch()),
      expect: () => [
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation:
              const PaymentCustomerInformation(paymentTerm: ''),
          paymentCustomerInformationFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest<PaymentCustomerInformationBloc, PaymentCustomerInformationState>(
      'Payment Customer Information Fetch success',
      build: () => PaymentCustomerInformationBloc(
        customerCodeBloc: customerCodeMockBloc,
        salesOrgBloc: salesOrgMockBloc,
        paymentCustomerInformationRepository:
            paymentCustomerInformationRepositoryMock,
      ),
      setUp: () {
        when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
          return SalesOrgState.initial().copyWith().copyWith(
              configs: SalesOrganisationConfigs(
                currency: Currency(''),
                hideCustomer: false,
                disableOrderType: false,
                disablePrincipals: false,
                enableGimmickMaterial: false,
                languageFilter: false,
                languageValue: '',
                principalList: [],
              ),
              salesOrganisation: fakeSaleOrg);
        });
        when(() => customerCodeMockBloc.state).thenAnswer((invocation) {
          return CustomerCodeState.initial()
              .copyWith(customeCodeInfo: customerCode);
        });
        when(() => paymentCustomerInformationRepositoryMock
            .getPaymentCustomerInformation(
                customerCodeInfo: customerCode,
                salesOrg: SalesOrg('fake-1234'))).thenAnswer(
          (invocation) async => Right(paymentCustomerInformationMockData),
        );
      },
      act: (bloc) => bloc.add(const PaymentCustomerInformationEvent.fetch()),
      expect: () => [
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: paymentCustomerInformationMockData,
          paymentCustomerInformationFailureOrSuccessOption: none(),
        )
      ],
    );
  });
}
