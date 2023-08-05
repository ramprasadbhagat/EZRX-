import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/admin_po_attachment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AdminPoAttachmentRepositoryMock extends Mock
    implements AdminPoAttachmentRepository {}

const _defaultPageSize = 20;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final adminPoAttachmentRepository = AdminPoAttachmentRepositoryMock();

  group('Admin Po Attachment Bloc', () {
    blocTest(
      'Initialize',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      act: (AdminPoAttachmentBloc bloc) =>
          bloc.add(const AdminPoAttachmentEvent.initialized()),
      expect: () => [AdminPoAttachmentState.initial()],
    );

    blocTest(
      'Fetch Failure',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      setUp: () {
        when(
          () => adminPoAttachmentRepository.getAdminPoAttachment(
            pageSize: _defaultPageSize,
            offset: 0,
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.fetch(
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
        ),
      ),
      expect: () => [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Fetch Success',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      setUp: () {
        when(
          () => adminPoAttachmentRepository.getAdminPoAttachment(
            pageSize: _defaultPageSize,
            offset: 0,
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Right([]),
        );
      },
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.fetch(
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
        ),
      ),
      expect: () => [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: none(),
          adminPoAttachmentList: [],
          canLoadMore: [].length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Load More Failure',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      setUp: () {
        when(
          () => adminPoAttachmentRepository.getAdminPoAttachment(
            pageSize: _defaultPageSize,
            offset: 0,
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.loadMore(
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
        ),
      ),
      expect: () => [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Load More Success',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      setUp: () {
        when(
          () => adminPoAttachmentRepository.getAdminPoAttachment(
            pageSize: _defaultPageSize,
            offset: 0,
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Right([]),
        );
      },
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.loadMore(
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty(),
        ),
      ),
      expect: () => [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: none(),
          adminPoAttachmentList: [],
          canLoadMore: [].length >= _defaultPageSize,
          nextPageIndex: 1,
        ),
      ],
    );

    blocTest(
      'Select Deselect when adminPoAttachment equal',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      seed: () => AdminPoAttachmentState.initial().copyWith(
        adminPoAttachmentList: [
          AdminPoAttachment(
            salesOrg: '',
            documentUrl: '',
            createdBy: '',
            createdTime: '',
            documentName: '',
            ezrxReferenceNumber: '',
            salesOrderNumber: '',
            shipToCode: '',
            soldToCode: '',
            tempOrderNumber: '',
            isSelected: false,
          ),
        ],
      ),
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.selectDeselect(
          adminPoAttachment: AdminPoAttachment(
            salesOrg: '',
            documentUrl: '',
            createdBy: '',
            createdTime: '',
            documentName: '',
            ezrxReferenceNumber: '',
            salesOrderNumber: '',
            shipToCode: '',
            soldToCode: '',
            tempOrderNumber: '',
            isSelected: false,
          ),
        ),
      ),
      expect: () => [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: none(),
          adminPoAttachmentList: [
            AdminPoAttachment(
              salesOrg: '',
              documentUrl: '',
              createdBy: '',
              createdTime: '',
              documentName: '',
              ezrxReferenceNumber: '',
              salesOrderNumber: '',
              shipToCode: '',
              soldToCode: '',
              tempOrderNumber: '',
              isSelected: true,
            ),
          ],
          canLoadMore: true,
          nextPageIndex: 0,
        ),
      ],
    );

    blocTest(
      'Select Deselect when adminPoAttachment not equal',
      build: () =>
          AdminPoAttachmentBloc(repository: adminPoAttachmentRepository),
      seed: () => AdminPoAttachmentState.initial().copyWith(
        adminPoAttachmentList: [
          AdminPoAttachment(
            salesOrg: '',
            documentUrl: '',
            createdBy: '',
            createdTime: '',
            documentName: '',
            ezrxReferenceNumber: '',
            salesOrderNumber: '',
            shipToCode: '',
            soldToCode: '',
            tempOrderNumber: '',
            isSelected: true,
          ),
        ],
      ),
      act: (AdminPoAttachmentBloc bloc) => bloc.add(
        AdminPoAttachmentEvent.selectDeselect(
          adminPoAttachment: AdminPoAttachment(
            salesOrg: '',
            documentUrl: '',
            createdBy: '',
            createdTime: '',
            documentName: '',
            ezrxReferenceNumber: '',
            salesOrderNumber: '',
            shipToCode: '',
            soldToCode: '',
            tempOrderNumber: '',
            isSelected: false,
          ),
        ),
      ),
      expect: () => [],
    );
  });
}
