import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/e_invoice_repository.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';


import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class EInvoiceRepositoryMock extends Mock implements EInvoiceRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late EInvoiceRepository eInvoiceRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;
  const invoiceNumber = 'fake-invoice-number';
  const fakeError = ApiFailure.other('fake-error');
  group('Download Payment Attachment', () {
    setUpAll(() async {
      eInvoiceRepository = EInvoiceRepositoryMock();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice initialized event',
      build: () => DownloadEInvoiceBloc(
        repository: eInvoiceRepository,
      ),
      act: (bloc) => bloc.add(
        const DownloadEInvoiceEvent.initialized(),
      ),
      expect: () => [DownloadEInvoiceState.initial()],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice fetch fail',
      build: () => DownloadEInvoiceBloc(
        repository: eInvoiceRepository,
      ),
      setUp: () {
        when(
          () => eInvoiceRepository.getEInvoice(
            customerCodeInfo: fakeCustomerCodeInfo,
            invoiceNumber: invoiceNumber,
            salesOrg: fakeMYSalesOrg,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadEInvoiceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          invoiceNumber: invoiceNumber,
          salesOrg: fakeMYSalesOrg,
        ),
      ),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(
          isFetching: true,
        ),
        DownloadEInvoiceState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice fetch success',
      build: () => DownloadEInvoiceBloc(
        repository: eInvoiceRepository,
      ),
      setUp: () {
        when(
          () => eInvoiceRepository.getEInvoice(
            customerCodeInfo: fakeCustomerCodeInfo,
            invoiceNumber: invoiceNumber,
            salesOrg: fakeMYSalesOrg,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
      },
      act: (bloc) => bloc.add(
        DownloadEInvoiceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          invoiceNumber: invoiceNumber,
          salesOrg: fakeMYSalesOrg,
        ),
      ),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(
          isFetching: true,
        ),
        DownloadEInvoiceState.initial().copyWith(
          eInvoice: downloadPaymentAttachmentMockData,
        ),
      ],
    );

    test(
      'Download e invoice isEligibleForEInvoiceButton',
      () {
        final downloadEInvoiceState = DownloadEInvoiceState.initial().copyWith(
          isFetching: true,
        );
        expect(
          downloadEInvoiceState.isEligibleForEInvoiceButton,
          true,
        );
      },
    );
  });
}
