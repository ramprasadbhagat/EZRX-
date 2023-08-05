import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Admin Po Attachment Filter Bloc', () {
    blocTest(
      'Initialize',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) =>
          bloc.add(const AdminPoAttachmentFilterEvent.initialized()),
      expect: () => [AdminPoAttachmentFilterState.initial()],
    );

    blocTest(
      'applyFilters when filter is valid',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) =>
          bloc.add(const AdminPoAttachmentFilterEvent.applyFilters()),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(isSubmitting: false),
        AdminPoAttachmentFilterState.initial().copyWith(isSubmitting: true),
      ],
    );

    blocTest(
      'applyFilters when filter is not valid',
      build: () => AdminPoAttachmentFilterBloc(),
      seed: () => AdminPoAttachmentFilterState.initial().copyWith(
        adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
          orderNumber: SearchKey(' '),
          exRxNo: SearchKey.searchFilter(' '),
        ),
      ),
      act: (AdminPoAttachmentFilterBloc bloc) =>
          bloc.add(const AdminPoAttachmentFilterEvent.applyFilters()),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey(' '),
            exRxNo: SearchKey.searchFilter(' '),
          ),
        ),
      ],
    );

    blocTest(
      'orderNoChanged',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) =>
          bloc.add(const AdminPoAttachmentFilterEvent.orderNoChanged('12345')),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey.searchFilter('12345'),
          ),
        ),
      ],
    );

    blocTest(
      'ezrxNoChanged',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) =>
          bloc.add(const AdminPoAttachmentFilterEvent.ezrxNoChanged('12345')),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            exRxNo: SearchKey.searchFilter('12345'),
          ),
        ),
      ],
    );

    blocTest(
      'salesOrgChanged',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) => bloc
          .add(AdminPoAttachmentFilterEvent.salesOrgChanged(SalesOrg('12345'))),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            salesOrg: SalesOrg('12345'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
      ],
    );

    blocTest(
      'soldToChanged',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) => bloc.add(
        AdminPoAttachmentFilterEvent.soldToChanged(CustomerCodeInfo.empty()),
      ),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
      ],
    );

    blocTest(
      'setOrderDate',
      build: () => AdminPoAttachmentFilterBloc(),
      act: (AdminPoAttachmentFilterBloc bloc) => bloc.add(
        AdminPoAttachmentFilterEvent.setOrderDate(
          orderDateRange: DateTimeRange(
            start: DateTime.now().subtract(const Duration(days: 28)),
            end: DateTime.now(),
          ),
        ),
      ),
      expect: () => [
        AdminPoAttachmentFilterState.initial().copyWith(
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            fromDate: DateTimeStringValue(
              getDateStringByDateTime(
                DateTime.now().subtract(
                  const Duration(days: 28),
                ),
              ),
            ),
            toDate: DateTimeStringValue(
              getDateStringByDateTime(DateTime.now()),
            ),
          ),
        ),
      ],
    );
  });
}
