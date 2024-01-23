import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_order_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/new_payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class NewPaymentRepositoryMock extends Mock implements NewPaymentRepository {}

class AllCreditsAndInvoicesRepositoryMock extends Mock
    implements AllCreditsAndInvoicesRepository {}

void main() {
  late NewPaymentRepository newPaymentRepository;
  late AllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  late OutstandingInvoiceFilter fakeOutstandingInvoiceFilter;
  late SearchKey fakeSearchKey;
  late List<CustomerOpenItem> fakeCustomerOpenItem;
  late int pageSize;
  late Config config;
  late CustomerCodeInfo mockCustomerCodeInfo;

  late SalesOrg mockSalesOrg;
  late SalesOrganisation mockSalesOrganisation;
  late List<InvoiceOrderItem> fakeInvoiceOrder;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    newPaymentRepository = NewPaymentRepositoryMock();
    allCreditsAndInvoicesRepository = AllCreditsAndInvoicesRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;

    mockCustomerCodeInfo =
        (await CustomerCodeLocalDataSource().getCustomerCodeList())
            .soldToInformation
            .first;
    fakeCustomerOpenItem =
        await NewPaymentLocalDataSource().getCustomerOpenItems();
    fakeInvoiceOrder =
        await AllCreditsAndInvoicesLocalDataSource().getOrderForInvoice();
    mockSalesOrg = (await SalesOrgLocalDataSource().getConfig()).salesOrg;
    mockSalesOrganisation =
        SalesOrganisation.empty().copyWith(salesOrg: mockSalesOrg);
  });

  setUp(() {
    fakeOutstandingInvoiceFilter = OutstandingInvoiceFilter.empty();
    fakeSearchKey = SearchKey.searchFilter('ab');
    pageSize = config.pageSize;
  });

  group(
    'Outstanding Invoices Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => OutstandingInvoicesBloc(
          newPaymentRepository: newPaymentRepository,
          allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
          config: config,
        ),
        act: (OutstandingInvoicesBloc bloc) => bloc.add(
          OutstandingInvoicesEvent.initialized(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
          ),
        ),
        expect: () => [
          OutstandingInvoicesState.initial().copyWith(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            appliedFilter: OutstandingInvoiceFilter.init(),
          )
        ],
      );
    },
  );

  group('Outstanding Invoices Bloc Fetch', () {
    blocTest(
      'fetch -> Outstanding Invoices fetch fail',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            searchKey: fakeSearchKey,
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
          appliedFilter: fakeOutstandingInvoiceFilter,
          searchKey: fakeSearchKey,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
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
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            searchKey: fakeSearchKey,
            offset: 0,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeCustomerOpenItem,
          ),
        );
        when(
          () => allCreditsAndInvoicesRepository.fetchOrder(
            invoiceIds:
                fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            <String, StringValue>{},
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.fetch(
          appliedFilter: fakeOutstandingInvoiceFilter,
          searchKey: fakeSearchKey,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          items: fakeCustomerOpenItem,
          searchKey: fakeSearchKey,
          canLoadMore: fakeCustomerOpenItem.length >= pageSize,
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          items: fakeCustomerOpenItem,
          searchKey: fakeSearchKey,
          canLoadMore: fakeCustomerOpenItem.length >= pageSize,
          isOrderFetching: true,
          orderFetchingInvoiceIdList:
              fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          items: fakeCustomerOpenItem,
          searchKey: fakeSearchKey,
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
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        items: fakeCustomerOpenItem,
        searchKey: fakeSearchKey,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            searchKey: fakeSearchKey,
            offset: fakeCustomerOpenItem.length,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        const OutstandingInvoicesEvent.loadMore(),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          items: fakeCustomerOpenItem,
          isLoading: true,
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          items: fakeCustomerOpenItem,
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
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        searchKey: fakeSearchKey,
        items: fakeCustomerOpenItem,
      ),
      setUp: () {
        when(
          () => newPaymentRepository.getOutstandingInvoices(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            pageSize: pageSize,
            appliedFilter: fakeOutstandingInvoiceFilter,
            searchKey: fakeSearchKey,
            offset: fakeCustomerOpenItem.length,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeCustomerOpenItem,
          ),
        );
        when(
          () => allCreditsAndInvoicesRepository.fetchOrder(
            invoiceIds:
                fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            <String, StringValue>{},
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        const OutstandingInvoicesEvent.loadMore(),
      ),
      expect: () {
        final newList = [
          ...fakeCustomerOpenItem,
          ...fakeCustomerOpenItem,
        ];
        return [
          OutstandingInvoicesState.initial().copyWith(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            searchKey: fakeSearchKey,
            items: fakeCustomerOpenItem,
            isLoading: true,
          ),
          OutstandingInvoicesState.initial().copyWith(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            items: newList,
            searchKey: fakeSearchKey,
            canLoadMore: fakeCustomerOpenItem.length >= pageSize,
          ),
          OutstandingInvoicesState.initial().copyWith(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            items: newList,
            searchKey: fakeSearchKey,
            canLoadMore: fakeCustomerOpenItem.length >= pageSize,
            isOrderFetching: true,
            orderFetchingInvoiceIdList:
                fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
          ),
          OutstandingInvoicesState.initial().copyWith(
            salesOrganisation: mockSalesOrganisation,
            customerCodeInfo: mockCustomerCodeInfo,
            items: newList,
            searchKey: fakeSearchKey,
            canLoadMore: fakeCustomerOpenItem.length >= pageSize,
          ),
        ];
      },
    );
  });

  group('Outstanding Invoices Bloc Fetch Order For Invoice', () {
    blocTest(
      'Fetch Success',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        searchKey: fakeSearchKey,
        items: fakeCustomerOpenItem,
      ),
      setUp: () {
        when(
          () => allCreditsAndInvoicesRepository.fetchOrder(
            invoiceIds:
                fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeInvoiceOrder.toMap,
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.fetchOrderForInvoices(
          invoices: fakeCustomerOpenItem,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          items: fakeCustomerOpenItem,
          isOrderFetching: true,
          orderFetchingInvoiceIdList:
              fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          items: fakeCustomerOpenItem
              .map(
                (e) => e.copyWith(
                  orderId: fakeInvoiceOrder.toMap[e.accountingDocument] ??
                      StringValue(''),
                ),
              )
              .toList(),
        ),
      ],
    );

    blocTest(
      'Fetch Failure',
      build: () => OutstandingInvoicesBloc(
        newPaymentRepository: newPaymentRepository,
        allCreditsAndInvoicesRepository: allCreditsAndInvoicesRepository,
        config: config,
      ),
      seed: () => OutstandingInvoicesState.initial().copyWith(
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        searchKey: fakeSearchKey,
        items: fakeCustomerOpenItem,
      ),
      setUp: () {
        when(
          () => allCreditsAndInvoicesRepository.fetchOrder(
            invoiceIds:
                fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OutstandingInvoicesBloc bloc) => bloc.add(
        OutstandingInvoicesEvent.fetchOrderForInvoices(
          invoices: fakeCustomerOpenItem,
        ),
      ),
      expect: () => [
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          items: fakeCustomerOpenItem,
          isOrderFetching: true,
          orderFetchingInvoiceIdList:
              fakeCustomerOpenItem.map((e) => e.billingDocument).toList(),
        ),
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: mockSalesOrganisation,
          customerCodeInfo: mockCustomerCodeInfo,
          searchKey: fakeSearchKey,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          items: fakeCustomerOpenItem,
        ),
      ],
    );
  });
}
