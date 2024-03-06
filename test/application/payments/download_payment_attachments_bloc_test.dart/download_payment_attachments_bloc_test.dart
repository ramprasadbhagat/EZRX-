import 'package:dartz/dartz.dart';
import 'package:universal_io/io.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class DownloadPaymentAttachmentRepositoryMock extends Mock
    implements DownloadPaymentAttachmentRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;
  late List<Soa> soaList;
  const fakeError = ApiFailure.other('fake-error');
  final salesOrganization = fakeMYSalesOrganisation;
  final customerCodeInfo = fakeCustomerCodeInfo;
  final file = File('fake-url');

  group('Download Payment Attachment', () {
    setUpAll(() async {
      downloadPaymentAttachmentRepository =
          DownloadPaymentAttachmentRepositoryMock();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      soaList = await SoaLocalDataSource().getSoa();
      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
    });

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          queryObject: AllInvoicesFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          queryObject: AllInvoicesFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          queryObject: AllCreditsFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          queryObject: AllCreditsFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download permission failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download file failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download full summary url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: FullSummaryFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            downloadPaymentAttachmentMockData,
          ),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
          queryObject: FullSummaryFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            Right(file),
          ),
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download full summary url failure',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: FullSummaryFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
          queryObject: FullSummaryFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.soaDownload(
            soaData: soaList.first.soaData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(
            Right(file),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.soaDownload(
            soaData: soaList.first.soaData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa storage permission failure',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download e-invoice success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadEInvoice(
          eInvoice: downloadPaymentAttachmentMockData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
          failureOrSuccessOption: optionOf(
            Right(file),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download e-invoice fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadEInvoice(
          eInvoice: downloadPaymentAttachmentMockData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download e-invoice storage permission failure',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadEInvoice(
          eInvoice: downloadPaymentAttachmentMockData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: downloadPaymentAttachmentMockData.url,
          ),
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        ),
      ],
    );
  });
}
