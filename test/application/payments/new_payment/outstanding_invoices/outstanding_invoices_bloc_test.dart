import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

void main() {
  late NewPaymentRepository newPaymentRepository;
  late OutstandingInvoiceFilter fakeOutstandingInvoiceFilter;
  late List<CustomerOpenItem> fakeCustomerOpenItem;
  late int pageSize;
  late Config config;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    newPaymentRepository = NewPaymentRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });
  setUp(() {
    fakeOutstandingInvoiceFilter = OutstandingInvoiceFilter.empty().copyWith();
    fakeCustomerOpenItem = <CustomerOpenItem>[];
    pageSize = config.pageSize;
  });

  group(
    'Outstanding Invoices Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => OutstandingInvoicesBloc(
          newPaymentRepository: newPaymentRepository,
          config: config,
        ),
        act: (OutstandingInvoicesBloc bloc) =>
            bloc.add(const OutstandingInvoicesEvent.initialized()),
        expect: () => [OutstandingInvoicesState.initial()],
      );
    },
  );

  group('Outstanding Invoices Bloc Fetch', () {
    blocTest(
      'fetch -> Outstanding Invoices fetch fail',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.fetch(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          appliedFilter: fakeOutstandingInvoiceFilter,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetch -> Outstanding Invoices fetch Success',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeCustomerOpenItem,
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.fetch(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          appliedFilter: fakeOutstandingInvoiceFilter,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          items: fakeCustomerOpenItem,
          canLoadMore: fakeCustomerOpenItem.length >= pageSize,
        ),
      ],
    );
  });

  group('Outstanding Invoices Bloc Load More', () {
    blocTest(
      'fetch -> Outstanding Invoices Load More fail',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.loadMore(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetch -> Outstanding Invoices Load More Success',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        config: config,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeCustomerOpenItem,
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.loadMore(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          items: fakeCustomerOpenItem,
          canLoadMore: fakeCustomerOpenItem.length >= pageSize,
        ),
      ],
    );
  });
}
