import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/credit_and_invoice_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class CreditAndInvoiceDetailsRepositoryMock extends Mock
    implements CreditAndInvoiceDetailsRepository {}

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

void main() {
  late CreditAndInvoiceDetailsRepository creditAndInvoiceDetailsRepository;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  late CreditAndInvoiceItem fakeInvoice;
  final fakeInitialState = CreditAndInvoiceDetailsState.initial().copyWith(
    customerCodeInfo: fakeCustomerCodeInfo,
    salesOrganisation: fakeSalesOrganisation,
  );
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsRepository = CreditAndInvoiceDetailsRepositoryMock();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepositoryMock();
  });

  setUp(() {
    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      searchKey: StringValue('1080005528'),
      accountingDocumentItem: '001',
    );
  });

  group(
    'Invoice Details Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => CreditAndInvoiceDetailsBloc(
          creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
          allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        ),
        act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
          CreditAndInvoiceDetailsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
          ),
        ),
        expect: () => [fakeInitialState],
      );
    },
  );

  group('Invoice Details Bloc Fetch', () {
    blocTest(
      'fetch -> Invoice Details fetch fail',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: fakeInvoice,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetch(
          creditAndInvoiceItem: fakeInvoice,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true, basicInfo: fakeInvoice),
        fakeInitialState.copyWith(
          basicInfo: fakeInvoice,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetch -> Invoice Details fetch success',
      build: () => CreditAndInvoiceDetailsBloc(
        creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
      ),
      seed: () => fakeInitialState,
      setUp: () {
        when(
          () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            creditAndInvoiceItem: fakeInvoice,
          ),
        ).thenAnswer(
          (invocation) async => const Right(<CustomerDocumentDetail>[]),
        );
      },
      act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
        CreditAndInvoiceDetailsEvent.fetch(
          creditAndInvoiceItem: fakeInvoice,
        ),
      ),
      expect: () => [
        fakeInitialState.copyWith(isLoading: true, basicInfo: fakeInvoice),
        fakeInitialState.copyWith(
          isLoading: false,
          basicInfo: fakeInvoice,
          itemsInfo: <CustomerDocumentDetail>[],
          failureOrSuccessOption:
              optionOf(const Right(<CustomerDocumentDetail>[])),
        ),
      ],
    );
  });
}
