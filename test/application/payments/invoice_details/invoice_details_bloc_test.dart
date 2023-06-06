import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/invoice_details/invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/invoice_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class InvoiceDetailsRepositoryMock extends Mock
    implements InvoiceDetailsRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

void main() {
  late InvoiceDetailsRepository invoiceDetailsRepository;
  late List<CustomerDocumentDetail> fakeInvoiceItems;
  late CreditAndInvoiceItem fakeInvoice;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    invoiceDetailsRepository = InvoiceDetailsRepositoryMock();
  });

  setUp(() {
    fakeInvoiceItems = [
      CustomerDocumentDetail.empty(),
    ];
    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      accountingDocument: '1080005528',
      accountingDocumentItem: '001',
    );
  });

  group(
    'Invoice Details Bloc Initialize',
    () {
      blocTest('Initialize',
          build: () => InvoiceDetailsBloc(
                invoiceDetailsRepository: invoiceDetailsRepository,
              ),
          act: (InvoiceDetailsBloc bloc) =>
              bloc.add(const InvoiceDetailsEvent.initialized()),
          expect: () => [InvoiceDetailsState.initial()]);
    },
  );

  group(
    'Invoice Details Bloc Fetch',
    () {
      blocTest(
        'fetch -> Invoice Details fetch fail',
        build: () => InvoiceDetailsBloc(
          invoiceDetailsRepository: invoiceDetailsRepository,
        ),
        setUp: () {
          when(
            () => invoiceDetailsRepository.getInvoiceDetails(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              invoiceItem: fakeInvoice,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (InvoiceDetailsBloc bloc) => bloc.add(
          InvoiceDetailsEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            invoiceItem: fakeInvoice,
          ),
        ),
        expect: () => [
          InvoiceDetailsState.initial().copyWith(
            isLoading: true,
          ),
          InvoiceDetailsState.initial().copyWith(
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
        build: () => InvoiceDetailsBloc(
          invoiceDetailsRepository: invoiceDetailsRepository,
        ),
        setUp: () {
          when(
            () => invoiceDetailsRepository.getInvoiceDetails(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              invoiceItem: fakeInvoice,
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeInvoiceItems),
          );
        },
        act: (InvoiceDetailsBloc bloc) => bloc.add(
          InvoiceDetailsEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            invoiceItem: fakeInvoice,
          ),
        ),
        expect: () => [
          InvoiceDetailsState.initial().copyWith(
            isLoading: true,
          ),
          InvoiceDetailsState.initial().copyWith(
            details: fakeInvoiceItems,
          ),
        ],
      );
    },
  );
}
