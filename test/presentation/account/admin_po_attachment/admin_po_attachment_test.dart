import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/admin_po_attachment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class AdminPoAttachmentBlocMock
    extends MockBloc<AdminPoAttachmentEvent, AdminPoAttachmentState>
    implements AdminPoAttachmentBloc {}

class AdminPoAttachmentFilterBlocMock
    extends MockBloc<AdminPoAttachmentFilterEvent, AdminPoAttachmentFilterState>
    implements AdminPoAttachmentFilterBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

const _pageSize = 20;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  late AppRouter autoRouterMock;
  late AdminPoAttachmentBloc mockAdminPoAttachmentBloc;
  late AdminPoAttachmentFilterBloc mockAdminPoAttachmentFilterBloc;
  late PoAttachmentBloc mockPoAttachmentBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => mockAdminPoAttachmentBloc);
    locator.registerLazySingleton(() => mockAdminPoAttachmentFilterBloc);
    locator.registerLazySingleton(() => mockPoAttachmentBloc);
  });

  group('admin po attachment', () {
    setUp(() {
      mockAdminPoAttachmentBloc = AdminPoAttachmentBlocMock();
      when(() => mockAdminPoAttachmentBloc.state)
          .thenReturn(AdminPoAttachmentState.initial());
      mockAdminPoAttachmentFilterBloc = AdminPoAttachmentFilterBlocMock();
      when(() => mockAdminPoAttachmentFilterBloc.state)
          .thenReturn(AdminPoAttachmentFilterState.initial());
      mockPoAttachmentBloc = PoAttachmentBlocMock();
      when(() => mockPoAttachmentBloc.state)
          .thenReturn(PoAttachmentState.initial());
    });

    Widget getWUT() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<AdminPoAttachmentBloc>(
              create: (context) => mockAdminPoAttachmentBloc,
            ),
            BlocProvider<AdminPoAttachmentFilterBloc>(
              create: (context) => mockAdminPoAttachmentFilterBloc,
            ),
            BlocProvider<PoAttachmentBloc>(
              create: (context) => mockPoAttachmentBloc,
            ),
          ],
          child: Material(child: AdminPoAttachmentPage()),
        ),
      );
    }

    testWidgets('admin po attachment test', (tester) async {
      when(() => mockAdminPoAttachmentBloc.state).thenReturn(
        AdminPoAttachmentState.initial().copyWith(
          adminPoAttachmentList: [
            AdminPoAttachment(
              salesOrderNumber: 'orderNumber',
              ezrxReferenceNumber: 'refNumber',
              createdBy: '',
              createdTime: '',
              documentUrl: '',
              documentName: '',
              salesOrg: '',
              soldToCode: '',
              shipToCode: '',
              tempOrderNumber: '',
              isSelected: true,
            ),
          ],
        ),
      );

      final expectedStates = [
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey('searchKey1'),
            exRxNo: SearchKey('ezRxNo1'),
            salesOrg: SalesOrg('salesOrg'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey(''),
            exRxNo: SearchKey(''),
            salesOrg: SalesOrg(''),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
      ];
      whenListen(
        mockAdminPoAttachmentFilterBloc,
        Stream.fromIterable(expectedStates),
      );

      final expectedStates1 = [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Right('success'),
          ),
          adminPoAttachmentList: List.filled(
            _pageSize,
            AdminPoAttachment(
              salesOrderNumber: 'fake-orderNumber',
              ezrxReferenceNumber: 'fake-refNumber',
              createdBy: '',
              createdTime: '',
              documentUrl: '',
              documentName: '',
              salesOrg: '',
              soldToCode: '',
              shipToCode: '',
              tempOrderNumber: '',
              isSelected: true,
            ),
          ),
        ),
      ];

      whenListen(
        mockAdminPoAttachmentBloc,
        Stream.fromIterable(expectedStates1),
      );

      final expectedStates2 = [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
        ),
        PoAttachmentState.initial().copyWith(
          isFetching: false,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: optionOf(
            const Right('success'),
          ),
        ),
      ];
      whenListen(mockPoAttachmentBloc, Stream.fromIterable(expectedStates2));

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final poAttachmentText = find.text('PO Attachments'.tr());
      expect(poAttachmentText, findsOneWidget);
      final downloadText = find.text('Download'.tr());
      expect(downloadText, findsOneWidget);
      final downloadButton =
          find.ancestor(of: downloadText, matching: find.byType(TextButton));
      await tester.tap(downloadButton);
      final adminPoAttachmentFilterCount =
          find.byKey(const Key('adminPoAttachmentFilterCount'));
      await tester.tap(adminPoAttachmentFilterCount);
      final onlyFifteenText =
          find.text('Only 15 items can be download at time'.tr());
      expect(onlyFifteenText, findsOneWidget);

      final checkBox = find.byType(Checkbox);
      await tester.tap(checkBox.first);

      await tester.pump();
    });

    testWidgets('on refresh', (tester) async {
      when(() => mockAdminPoAttachmentBloc.state).thenReturn(
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
          adminPoAttachmentList: [],
        ),
      );

      final expectedStates = [
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey('searchKey1'),
            exRxNo: SearchKey('ezRxNo1'),
            salesOrg: SalesOrg('salesOrg'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey(''),
            exRxNo: SearchKey(''),
            salesOrg: SalesOrg(''),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
      ];
      whenListen(
        mockAdminPoAttachmentFilterBloc,
        Stream.fromIterable(expectedStates),
      );

      final expectedStates1 = [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
          adminPoAttachmentList: [],
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Right('success'),
          ),
          adminPoAttachmentList: List.filled(
            _pageSize,
            AdminPoAttachment(
              salesOrderNumber: 'fake-orderNumber',
              ezrxReferenceNumber: 'fake-refNumber',
              createdBy: '',
              createdTime: '',
              documentUrl: '',
              documentName: '',
              salesOrg: '',
              soldToCode: '',
              shipToCode: '',
              tempOrderNumber: '',
              isSelected: true,
            ),
          ),
        ),
      ];
      whenListen(
        mockAdminPoAttachmentBloc,
        Stream.fromIterable(expectedStates1),
      );

      final expectedStates2 = [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
        ),
        PoAttachmentState.initial().copyWith(
          isFetching: false,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
        ),
      ];
      whenListen(mockPoAttachmentBloc, Stream.fromIterable(expectedStates2));

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adminPoAttachmentKey = find.byKey(const Key('adminPoAttachment'));
      expect(adminPoAttachmentKey, findsOneWidget);

      await tester.drag(
        adminPoAttachmentKey,
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(
        const Duration(seconds: 1),
      );
      await tester.pump(const Duration(seconds: 1));

      await tester.pump();
    });

    testWidgets('on load more', (tester) async {
      final expectedStates = [
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey('searchKey1'),
            exRxNo: SearchKey('ezRxNo1'),
            salesOrg: SalesOrg('salesOrg'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey(''),
            exRxNo: SearchKey(''),
            salesOrg: SalesOrg(''),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
      ];
      whenListen(
        mockAdminPoAttachmentFilterBloc,
        Stream.fromIterable(expectedStates),
      );

      final expectedStates1 = [
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
          adminPoAttachmentList: [],
        ),
        AdminPoAttachmentState.initial().copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Right('success'),
          ),
          adminPoAttachmentList: List.filled(
            _pageSize,
            AdminPoAttachment(
              salesOrderNumber: 'fake-orderNumber',
              ezrxReferenceNumber: 'fake-refNumber',
              createdBy: '',
              createdTime: '',
              documentUrl: '',
              documentName: '',
              salesOrg: '',
              soldToCode: '',
              shipToCode: '',
              tempOrderNumber: '',
              isSelected: true,
            ),
          ),
        ),
      ];
      whenListen(
        mockAdminPoAttachmentBloc,
        Stream.fromIterable(expectedStates1),
      );

      final expectedStates2 = [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
        ),
        PoAttachmentState.initial().copyWith(
          isFetching: false,
          fileOperationMode: FileOperationMode.download,
          failureOrSuccessOption: none(),
        ),
      ];
      whenListen(mockPoAttachmentBloc, Stream.fromIterable(expectedStates2));

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final adminPoAttachmentKey = find.byKey(const Key('adminPoAttachment'));
      expect(adminPoAttachmentKey, findsOneWidget);

      await tester.drag(
        adminPoAttachmentKey,
        const Offset(0.0, -4000.0),
      );
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(
        const Duration(seconds: 1),
      );
      await tester.pump(
        const Duration(seconds: 1),
      );

      verify(
        () => mockAdminPoAttachmentBloc.add(
          AdminPoAttachmentEvent.loadMore(
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
              orderNumber: SearchKey(''),
              exRxNo: SearchKey(''),
              salesOrg: SalesOrg(''),
              soldTo: CustomerCodeInfo.empty(),
            ),
          ),
        ),
      ).called(1);
      await tester.pump();
    });
  });
}
