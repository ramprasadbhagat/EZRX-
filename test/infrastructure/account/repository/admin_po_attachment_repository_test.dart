import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/admin_po_attachment_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class AdminPoAttachmentLocalDataSourceMock extends Mock
    implements AdminPoAttachmentLocalDataSource {}

class AdminPoAttachmentRemoteDataSourceMock extends Mock
    implements AdminPoAttachmentRemoteDataSource {}

const _kDateFormat = 'yyyyMMdd';

void main() {
  late AdminPoAttachmentRepository adminPoAttachmentRepository;
  late Config mockConfig;
  late int pageSize;
  late AdminPoAttachmentLocalDataSource adminPoAttachmentLocalDataSource;
  late AdminPoAttachmentRemoteDataSource adminPoAttachmentRemoteDataSource;
  final formDate = DateFormat(_kDateFormat).format(DateTime.now());
  final toDate = DateFormat(_kDateFormat).format(
    DateTime.now().subtract(
      const Duration(days: 7),
    ),
  );

  setUpAll(
    () {
      mockConfig = Config()..appFlavor = Flavor.mock;
      pageSize = mockConfig.pageSize;
      adminPoAttachmentLocalDataSource = AdminPoAttachmentLocalDataSourceMock();
      adminPoAttachmentRemoteDataSource =
          AdminPoAttachmentRemoteDataSourceMock();
      adminPoAttachmentRepository = AdminPoAttachmentRepository(
        config: mockConfig,
        localDataSource: adminPoAttachmentLocalDataSource,
        remoteDataSource: adminPoAttachmentRemoteDataSource,
      );
    },
  );

  group('AdminPoAttachmentRepository tests', () {
    test('get AdminPoAttachment successfully local', () async {
      when(() => adminPoAttachmentLocalDataSource.getAdminPoAttachment())
          .thenAnswer((invocation) async => <AdminPoAttachment>[]);

      final result = await adminPoAttachmentRepository.getAdminPoAttachment(
        pageSize: pageSize,
        offset: 0,
        adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get AdminPoAttachment fail local', () async {
      when(() => adminPoAttachmentLocalDataSource.getAdminPoAttachment())
          .thenThrow(MockException());

      final result = await adminPoAttachmentRepository.getAdminPoAttachment(
        pageSize: pageSize,
        offset: 0,
        adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'get AdminPoAttachment successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.dev;
        when(
          () => adminPoAttachmentRemoteDataSource.getAdminPoAttachment(
            pageSize: pageSize,
            offset: 0,
            filterQuery: {
              'orderNumber': null,
              'exRxNo': null,
              'salesOrg': null,
              'soldTo': null,
              'toDate': toDate,
              'fromDate': formDate
            },
          ),
        ).thenAnswer((_) async => <AdminPoAttachment>[]);
        final result = await adminPoAttachmentRepository.getAdminPoAttachment(
          pageSize: pageSize,
          offset: 0,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            fromDate: DateTimeStringValue(formDate),
            toDate: DateTimeStringValue(toDate),
          ),
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'get AdminPoAttachment fail remote ',
      () async {
         mockConfig.appFlavor = Flavor.dev;

        when(
          () => adminPoAttachmentRemoteDataSource.getAdminPoAttachment(
            pageSize: pageSize,
            offset: 0,
            filterQuery: {},
          ),
        ).thenThrow(MockException());
        final result = await adminPoAttachmentRepository.getAdminPoAttachment(
          pageSize: pageSize,
          offset: 0,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(),
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}
