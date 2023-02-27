import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/approver_actions.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ReturnApproverBlocMock
    extends MockBloc<ReturnApproverEvent, ReturnApproverState>
    implements ReturnApproverBloc {}

class ReturnApproverFilterBlocMock
    extends MockBloc<ReturnApproverFilterEvent, ReturnApproverFilterState>
    implements ReturnApproverFilterBloc {}

class CountlyServiceMock extends Mock implements CountlyService {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ReturnApproverBloc returnApproverBlocMock;
  late ReturnApproverFilterBloc returnApproverFilterBlocMock;
  late CountlyService countlyService;
  late ShipToCodeBloc shipToCodeBlocMock;
  late List<ApproverReturnRequest> approverReturnRequestList;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ReturnApproverFilter returnApproverFilter;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
  );

  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      countlyService = CountlyServiceMock();
      locator.registerLazySingleton(() => countlyService);
      approverReturnRequestList = [
        ApproverReturnRequest.empty(),
      ];
    },
  );

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      returnApproverBlocMock = ReturnApproverBlocMock();
      returnApproverFilterBlocMock = ReturnApproverFilterBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();

      customerCodeBlocMock = CustomerCodeMockBloc();
      returnApproverFilter = ReturnApproverFilter.empty().copyWith(
        toInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(fakeToDate),
        ),
        fromInvoiceDate: DateTimeStringValue(
          getDateStringByDateTime(fakeFromDate),
        ),
      );

      autoRouterMock = locator<AppRouter>();
      when(() => returnApproverBlocMock.state)
          .thenReturn(ReturnApproverState.initial());
      when(() => returnApproverFilterBlocMock.state)
          .thenReturn(ReturnApproverFilterState.initial());
      when(
        () => countlyService.recordCountlyView('approver_actions'),
      ).thenAnswer((invocation) async => Future.value());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
    },
  );
  group('Test Action Approver Page', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ReturnApproverBloc>(
              create: (context) => returnApproverBlocMock),
          BlocProvider<ReturnApproverFilterBloc>(
            create: (context) => returnApproverFilterBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
        ],
        child: ApproverActions(),
      );
    }

    testWidgets(
      'Action Approver Empty Page',
      (tester) async {
        final expectedStates = [
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: false,
            ),
          ),
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        ];
        whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);
        expect(find.byKey(const Key('status')), findsOneWidget);
        expect(find.byIcon(Icons.arrow_drop_down_outlined), findsOneWidget);
        expect(find.byKey(const Key('filterButton')), findsOneWidget);
        expect(find.text('No Return found'.tr()), findsOneWidget);

        final statusFilterButton = find.byKey(const Key('statusFilterButton'));
        expect(statusFilterButton, findsOneWidget);
        await tester.tap(statusFilterButton);
        await tester.pump();
        expect(find.byKey(const Key('return_approver_filter_by_status')),
            findsOneWidget);
      },
    );

    testWidgets(
      'Test Action Approver Page first fetch',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );
        final expectedreturnApproverFilterState = [
          ReturnApproverFilterState.initial().copyWith(),
          ReturnApproverFilterState.initial().copyWith(
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              sortBy: FilterStatus('ALL'),
            ),
          ),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedreturnApproverFilterState),
        );
        final expectedStates = [
          ReturnApproverState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
          ),
          ReturnApproverState.initial()
              .copyWith(approverReturnRequestList: approverReturnRequestList)
        ];
        whenListen(returnApproverBlocMock, Stream.fromIterable(expectedStates));
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-sold-to-code')),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        final statusFilterButton = find.byKey(const Key('statusFilterButton'));
        expect(statusFilterButton, findsOneWidget);

        expect(find.byKey(const Key('status')), findsOneWidget);
        expect(find.byIcon(Icons.arrow_drop_down_outlined), findsOneWidget);
        expect(find.byKey(const Key('filterButton')), findsOneWidget);
        expect(find.text('No Return found'.tr()), findsNothing);

        final approverReturnRequestTile =
            find.byKey(const Key('approverReturnRequestTile'));
        expect(approverReturnRequestTile, findsOneWidget);

        await tester.tap(statusFilterButton);
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('return_approver_filter_by_status')),
            findsOneWidget);
        expect(find.text('Select Status'.tr()), findsOneWidget);
        expect(find.byKey(const Key('closeButton')), findsOneWidget);
        expect(find.text('Select Status'.tr()), findsOneWidget);
        expect(find.text('Completed'.tr()), findsOneWidget);
        expect(find.text('Pending Review'.tr()), findsOneWidget);

        final statusFilterCompleted = find.text('Completed'.tr());
        expect(statusFilterCompleted, findsOneWidget);
        await tester.tap(statusFilterCompleted);
        verify(
          () => returnApproverFilterBlocMock.add(
            ReturnApproverFilterEvent.sortByChanged(FilterStatus('COMPLETED')),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test Action Approver Filter Drawer',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );
        final expectedShipToCodeState = [
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: false,
            ),
          ),
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        ];
        whenListen(
          shipToCodeBlocMock,
          Stream.fromIterable(expectedShipToCodeState),
        );
        final expectedStates = [
          ReturnApproverState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: optionOf(
              const Right(
                ApiFailure.other('Fake-Object'),
              ),
            ),
          ),
          ReturnApproverState.initial()
              .copyWith(approverReturnRequestList: approverReturnRequestList)
        ];
        whenListen(returnApproverBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final filterButton = find.byKey(const Key('filterButton'));
        expect(filterButton, findsOneWidget);
        await tester.tap(filterButton);
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('approverReturnFilter')), findsOneWidget);
        expect(find.byKey(const Key('filterClearButton')), findsOneWidget);
      },
    );

    testWidgets(
      'Test Action Approver apply filter',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );
        final expectedShipToCodeState = [
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: false,
            ),
          ),
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        ];
        
        whenListen(
          shipToCodeBlocMock,
          Stream.fromIterable(expectedShipToCodeState),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final filterButton = find.byKey(const Key('filterButton'));
        expect(filterButton, findsOneWidget);
        await tester.tap(filterButton);
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('approverReturnFilter')), findsOneWidget);
        expect(find.byKey(const Key('filterApplyButton')), findsOneWidget);
        expect(find.byKey(const Key('filterCrossButton')), findsOneWidget);
        await tester.tap(find.byKey(const Key('filterCrossButton')));
        await tester.tap(find.byKey(const Key('filterApplyButton')));
        verify(
          () => returnApproverFilterBlocMock.add(
            const ReturnApproverFilterEvent.applyFilters(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test Action Approver Page refresh on filter change',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: 'Fake-shipTo-customer-code',
            ),
          ),
        );
        final expectedreturnApproverFilterState = [
          ReturnApproverFilterState.initial().copyWith(
              approverReturnFilter: returnApproverFilter.copyWith(
                returnId: SearchKey.searchFilter('test'),
              ),
              isSubmitting: true),
        ];
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedreturnApproverFilterState),
        );
        when(() => returnApproverBlocMock.state).thenReturn(
          ReturnApproverState.initial()
              .copyWith(approverReturnRequestList: approverReturnRequestList),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-sold-to-code')),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        verify(
          () => returnApproverBlocMock.add(
            ReturnApproverEvent.fetch(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter.copyWith(
                returnId: SearchKey.searchFilter('test'),
              ),
            ),
          ),
        ).called(1);
        expect(find.byKey(const Key('filterButton')), findsOneWidget);
        expect(find.byKey(const Key('Filter_list_not_empty')), findsOneWidget);
      },
    );

    testWidgets(
      'Test Action Approver Page sort by bottom sheet close',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );

        final expectedreturnApproverFilterState = [
          ReturnApproverFilterState.initial().copyWith(
            approverReturnFilter: ReturnApproverFilter.empty().copyWith(
              sortBy: FilterStatus('ALL'),
            ),
          ),
        ];

        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        final statusFilterButton = find.byKey(const Key('statusFilterButton'));
        expect(statusFilterButton, findsOneWidget);

        expect(find.byKey(const Key('status')), findsOneWidget);
        expect(find.byIcon(Icons.arrow_drop_down_outlined), findsOneWidget);

        await tester.tap(statusFilterButton);
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('return_approver_filter_by_status')),
            findsOneWidget);
        expect(find.text('Select Status'.tr()), findsOneWidget);
        expect(find.byKey(const Key('closeButton')), findsOneWidget);
        expect(find.text('Select Status'.tr()), findsOneWidget);
        expect(find.text('Completed'.tr()), findsOneWidget);
        expect(find.text('Pending Review'.tr()), findsOneWidget);

        await tester.tap(find.byKey(const Key('closeButton')));
        await tester.pumpAndSettle();
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('Select Status'.tr()), findsNothing);
        whenListen(
          returnApproverFilterBlocMock,
          Stream.fromIterable(expectedreturnApproverFilterState),
        );
        await tester.tap(statusFilterButton);
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Test Action Approver Page fetch error',
      (tester) async {
        final expectedStates = [
          ReturnApproverState.initial(),
          ReturnApproverState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
          ),
        ];
        whenListen(returnApproverBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        expect(find.text('Fake-error'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      'Test Action Approver Page refresh',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );
        when(() => returnApproverBlocMock.state).thenReturn(
          ReturnApproverState.initial()
              .copyWith(approverReturnRequestList: approverReturnRequestList),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        final statusFilterButton = find.byKey(const Key('statusFilterButton'));
        expect(statusFilterButton, findsOneWidget);

        final approverReturnRequestTile =
            find.byKey(const Key('approverReturnRequestTile'));
        expect(approverReturnRequestTile, findsOneWidget);

        await tester.drag(
          approverReturnRequestTile,
          const Offset(0.0, 1000.0),
        );
        await tester.pumpAndSettle();

        verify(
          () => returnApproverFilterBlocMock.add(
            const ReturnApproverFilterEvent.initialized(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test Action Approver Page loadMore',
      (tester) async {
        when(() => shipToCodeBlocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              defaultShipToAddress: true,
            ),
          ),
        );
        when(() => returnApproverBlocMock.state).thenReturn(
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              11,
              approverReturnRequestList.first,
            ),
          ),
        );
        when(() => returnApproverFilterBlocMock.state).thenReturn(
          ReturnApproverFilterState.initial().copyWith(
            approverReturnFilter: returnApproverFilter,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(const Key('actionApproverAppBar')), findsOneWidget);

        final statusFilterButton = find.byKey(const Key('statusFilterButton'));
        expect(statusFilterButton, findsOneWidget);

        final approverReturnRequestTile =
            find.byKey(const Key('approverReturnRequestTile'));
        expect(approverReturnRequestTile, findsWidgets);

        await tester.drag(
          approverReturnRequestTile.first,
          const Offset(0.0, -10000.0),
        );
        await tester.pumpAndSettle();
        verify(
          () => returnApproverBlocMock.add(
            ReturnApproverEvent.loadMore(
              approverReturnFilter: returnApproverFilter,
              user: User.empty(),
            ),
          ),
        ).called(1);
      },
    );
  });
}
