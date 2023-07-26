import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/credit_and_invoice_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CreditAndInvoiceDetailsRepositoryMock extends Mock
    implements CreditAndInvoiceDetailsRepository {}

class CustomerCodeRepositoryMock extends Mock
    implements CustomerCodeRepository {}

void main() {
  late CreditAndInvoiceDetailsRepository creditAndInvoiceDetailsRepository;
  late CreditAndInvoiceItem fakeInvoice;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsRepository = CreditAndInvoiceDetailsRepositoryMock();
  });

  setUp(() {
    fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
      bpCustomerNumber: '0030032223',
      fiscalYear: '2023',
      searchKey: '1080005528',
      accountingDocumentItem: '001',
    );
  });

  group(
    'Invoice Details Bloc Initialize',
    () {
      blocTest('Initialize',
          build: () => CreditAndInvoiceDetailsBloc(
                creditAndInvoiceDetailsRepository:
                    creditAndInvoiceDetailsRepository,
              ),
          act: (CreditAndInvoiceDetailsBloc bloc) =>
              bloc.add(const CreditAndInvoiceDetailsEvent.initialized()),
          expect: () => [CreditAndInvoiceDetailsState.initial()]);
    },
  );

  group(
    'Invoice Details Bloc Fetch',
    () {
      blocTest(
        'fetch -> Invoice Details fetch fail',
        build: () => CreditAndInvoiceDetailsBloc(
          creditAndInvoiceDetailsRepository: creditAndInvoiceDetailsRepository,
        ),
        setUp: () {
          when(
            () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
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
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            creditAndInvoiceItem: fakeInvoice,
          ),
        ),
        expect: () => [
          CreditAndInvoiceDetailsState.initial().copyWith(
            isLoading: true,
          ),
          CreditAndInvoiceDetailsState.initial().copyWith(
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
        ),
        setUp: () {
          when(
            () => creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
              salesOrganisation: SalesOrganisation.empty(),
              customerCodeInfo: CustomerCodeInfo.empty(),
              creditAndInvoiceItem: fakeInvoice,
            ),
          ).thenAnswer(
            (invocation) async => const Right(<CustomerDocumentDetail>[]),
          );
        },
        act: (CreditAndInvoiceDetailsBloc bloc) => bloc.add(
          CreditAndInvoiceDetailsEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            creditAndInvoiceItem: fakeInvoice,
          ),
        ),
        expect: () => [
          CreditAndInvoiceDetailsState.initial().copyWith(
            isLoading: true,
          ),
          CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: false,
          details: <CustomerDocumentDetail>[],
          failureOrSuccessOption:
              optionOf(const Right(<CustomerDocumentDetail>[])),
        ),
      ],
      ); 
    }
  );
}
