import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/returns/request_return/request_return.dart';
import 'package:ezrxmobile/presentation/returns/request_return/request_return_filter_drawer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class RequestReturnMockBloc
    extends MockBloc<RequestReturnEvent, RequestReturnState>
    implements RequestReturnBloc {}

class RequestReturnFilterMockBloc
    extends MockBloc<RequestReturnFilterEvent, RequestReturnFilterState>
    implements RequestReturnFilterBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late RequestReturnBloc requestReturnBlocMock;
  late RequestReturnFilterBloc requestReturnFilterBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  var requestReturnResponse = ReturnRequest.empty();
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    requestReturnResponse =
        await RequestReturnLocalDatasource().searchReturnMaterials();
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requestReturnBlocMock = RequestReturnMockBloc();
    salesOrgBlocMock = SalesOrgMockBloc();
    customerCodeBlocMock = CustomerCodeMockBloc();
    shipToCodeBLocMock = ShipToCodeMockBloc();
    requestReturnFilterBlocMock = RequestReturnFilterMockBloc();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => requestReturnBlocMock.state)
        .thenReturn(RequestReturnState.initial());
    when(() => requestReturnFilterBlocMock.state)
        .thenReturn(RequestReturnFilterState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBLocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<RequestReturnBloc>(
            create: (context) => requestReturnBlocMock,
          ),
          BlocProvider<RequestReturnFilterBloc>(
            create: (context) => requestReturnFilterBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBLocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const RequestReturn(),
      ),
    );
  }

  group(
    'Request Return List Page => ',
    () {
      testWidgets(
        'Refresh',
        (tester) async {
          await getWidget(tester);
          expect(find.text('Request Return'), findsOneWidget);
          expect(find.text('No Request for Return found'), findsOneWidget);
          await tester.fling(
              find.byType(CustomScrollView), const Offset(0, 300), 600);
          await tester.pumpAndSettle(const Duration(seconds: 2));
          verify(
            () => requestReturnBlocMock.add(
              RequestReturnEvent.fetch(
                shipInfo: ShipToInfo.empty().copyWith(
                  shipToName: ShipToName.empty(),
                ),
                customerCodeInfo: CustomerCodeInfo.empty(),
                requestReturnFilter: RequestReturnFilter.empty(),
                salesOrg: SalesOrganisation.empty(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets('Test while state is loading', (tester) async {
        when(() => requestReturnBlocMock.state).thenReturn(
          RequestReturnState.initial().copyWith(isLoading: true),
        );

        final expectedStates = [
          RequestReturnState.initial().copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump(const Duration(milliseconds: 100));
        final loadIndicator = find.byKey(const Key('LoaderImage'));

        expect(loadIndicator, findsOneWidget);
      });

      testWidgets('Test while have request return list', (tester) async {
        when(() => requestReturnBlocMock.state)
            .thenReturn(RequestReturnState.initial().copyWith(
          returnItemList: requestReturnResponse.items,
          canLoadMore: true,
          isLoading: false,
        ));
        final expectedStates = [
          RequestReturnState.initial().copyWith(
            isLoading: false,
            returnItemList: requestReturnResponse.items,
            failureOrSuccessOption:
                optionOf(Right(requestReturnResponse.items)),
          ),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump(const Duration(milliseconds: 100));
        final orderTemplateItem = find.byType(ListTile);
        expect(orderTemplateItem, findsAtLeastNWidgets(1));
      });

      testWidgets('Load More', (tester) async {
        when(() => requestReturnBlocMock.state).thenReturn(
          RequestReturnState.initial().copyWith(
            returnItemList: requestReturnResponse.items,
            canLoadMore: true,
            isLoading: true,
          ),
        );

        await tester.runAsync(() async {
          await getWidget(tester);
        });
        final loadIndicator = find.byKey(const Key('loadIndicator'));
        final orderTemplateItem = find.byType(ListTile);
        await tester.fling(
            find.byType(CustomScrollView), const Offset(0, -4000), 8000);
        await tester.pump(const Duration(seconds: 2));
        expect(loadIndicator, findsOneWidget);
        expect(orderTemplateItem, findsAtLeastNWidgets(1));
      });

      testWidgets('Fetch Fail', (tester) async {
        when(() => requestReturnBlocMock.state).thenReturn(
          RequestReturnState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption: none(),
          ),
        );
        whenListen(
            requestReturnBlocMock,
            Stream.fromIterable([
              RequestReturnState.initial().copyWith(
                isLoading: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('fake-error'),
                  ),
                ),
              ),
            ]));
        await tester.runAsync(() async {
          await getWidget(tester);
        });
        final noSavedOrder = find.text('No Request for Return found');
        final orderTemplateItem = find.byType(ListTile);
        expect(noSavedOrder, findsOneWidget);
        expect(orderTemplateItem, findsNothing);
        await tester.pump();
        final errorMessage = find.byKey(const Key('snackBarMessage'));
        expect(errorMessage, findsOneWidget);
      });

      testWidgets('Tap on Return Item', (tester) async {
        final returnItem = requestReturnResponse.items.first;

        final expectedStatess = [
          RequestReturnState.initial().copyWith(
            isLoading: false,
            returnItemList: [returnItem],
            failureOrSuccessOption: optionOf(
              Right(requestReturnResponse),
            ),
          ),
          RequestReturnState.initial().copyWith(
            isLoading: false,
            returnItemList: [returnItem],
            failureOrSuccessOption: none(),
          ),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStatess));
        when(() => requestReturnBlocMock.state).thenReturn(
          RequestReturnState.initial().copyWith(
            returnItemList: [returnItem],
            canLoadMore: true,
            isLoading: true,
          ),
        );

        await getWidget(tester);
        await tester.pump(const Duration(milliseconds: 100));
        final orderTemplateItem = find.byType(ListTile);
        expect(orderTemplateItem, findsOneWidget);
        await tester.tap(orderTemplateItem);
        await tester.pump();

        await tester.pump();
        //Not implemented
      });

      testWidgets('Re-Fetch', (tester) async {
        whenListen(
          requestReturnFilterBlocMock,
          Stream.fromIterable(
            [
              RequestReturnFilterState.initial().copyWith(
                isSubmitting: false,
              ),
              RequestReturnFilterState.initial().copyWith(
                isSubmitting: true,
              ),
            ],
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-sold-to-code')),
        );
        when(() => shipToCodeBLocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(shipToCustomerCode: 'fake-ship-to-code')),
        );
        await tester.runAsync(() async {
          await getWidget(tester);
        });
        verify(
          () => requestReturnBlocMock.add(
            RequestReturnEvent.fetch(
              shipInfo: ShipToInfo.empty()
                  .copyWith(shipToCustomerCode: 'fake-ship-to-code'),
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-sold-to-code'),
              requestReturnFilter: RequestReturnFilter.empty(),
              salesOrg: SalesOrganisation.empty(),
            ),
          ),
        ).called(2);
      });

      testWidgets('Open Filter Drawer', (tester) async {
        whenListen(
          requestReturnFilterBlocMock,
          Stream.fromIterable(
            [
              RequestReturnFilterState.initial().copyWith(
                isSubmitting: false,
                requestReturnFilter: RequestReturnFilter.empty(),
              ),
              RequestReturnFilterState.initial().copyWith(
                isSubmitting: true,
                requestReturnFilter: RequestReturnFilter.empty().copyWith(
                  assignmentNumber: SearchKey.searchFilter('1088002'),
                ),
              ),
            ],
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-sold-to-code')),
        );
        when(() => shipToCodeBLocMock.state).thenReturn(
          ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(shipToCustomerCode: 'fake-ship-to-code')),
        );
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        await tester.runAsync(() async {
          await getWidget(tester);
        });
        final filterButton = find.byType(FilterCountButton);
        await tester.tap(filterButton);
        await tester.pumpAndSettle(const Duration(seconds: 4));
        final drawer = find.byType(RequestReturnFilterDrawer);
        expect(drawer, findsOneWidget);
      });

      testWidgets('Sort', (tester) async {
        whenListen(
          requestReturnBlocMock,
          Stream.fromIterable(
            [
              RequestReturnState.initial().copyWith(
                isLoading: false,
                returnItemList: requestReturnResponse.items,
              ),
              RequestReturnState.initial().copyWith(
                isLoading: true,
                returnItemList: requestReturnResponse.items.reversed.toList(),
              ),
            ],
          ),
        );
        when(() => requestReturnBlocMock.state).thenReturn(
          RequestReturnState.initial().copyWith(
            returnItemList: requestReturnResponse.items,
            canLoadMore: true,
            isLoading: true,
          ),
        );
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        await tester.runAsync(() async {
          await getWidget(tester);
        });
        await tester.pump(const Duration(seconds: 4));
        final sortBy = find.byKey(const Key('orderDateFilter'));
        await tester.tap(sortBy);
        await tester.pump(const Duration(seconds: 4));
        verify(
          () => requestReturnBlocMock.add(
            const RequestReturnEvent.sortByDate(
              sortDirection: 'asc',
            ),
          ),
        ).called(1);
      });


      testWidgets('Test when at least one item is selected', (tester) async {
        whenListen(
          requestReturnBlocMock,
          Stream.fromIterable(
            [
              RequestReturnState.initial().copyWith(
                isLoading: true,
                returnItemList: [
                  ReturnItem.empty().copyWith(
                    isSelected: false,
                    materialNumber: MaterialNumber('mat0'),
                    assignmentNumber: 'ass0',
                  ),
                ],
              ),
              RequestReturnState.initial().copyWith(
                isLoading: false,
                returnItemList: [
                  ReturnItem.empty().copyWith(
                    isSelected: true,
                    materialNumber: MaterialNumber('mat1'),
                    assignmentNumber: 'ass1',
                  ),
                  ReturnItem.empty().copyWith(
                    isSelected: true,
                    materialNumber: MaterialNumber('mat2'),
                    assignmentNumber: 'ass2',
                  ),
                ],
              ),
            ],
          ),
        );
        await getWidget(tester);
        await tester.pumpAndSettle(const Duration(seconds: 4));

        final checkBox = find.byType(Checkbox);
        await tester.tap(checkBox.last);
        final goToReturnsDetailsPage = find.byKey(const Key('goToReturnsDetailsPage'));
        await tester.tap(goToReturnsDetailsPage);
        await tester.pump();
      });


      testWidgets('Test when no items selected is empty', (tester) async {
        whenListen(
          requestReturnBlocMock,
          Stream.fromIterable(
            [
              RequestReturnState.initial().copyWith(
                isLoading: true,
                returnItemList: [
                  ReturnItem.empty().copyWith(
                    isSelected: false,
                    materialNumber: MaterialNumber('mat0'),
                    assignmentNumber: 'ass0',
                  ),
                ],
              ),
              RequestReturnState.initial().copyWith(
                isLoading: false,
                returnItemList: [
                  ReturnItem.empty().copyWith(
                    isSelected: false,
                    materialNumber: MaterialNumber('mat1'),
                    assignmentNumber: 'ass1',
                  ),
                  ReturnItem.empty().copyWith(
                    isSelected: false,
                    materialNumber: MaterialNumber('mat2'),
                    assignmentNumber: 'ass2',
                  ),
                ],
              ),
            ],
          ),
        );
        await getWidget(tester);
        await tester.pumpAndSettle(const Duration(seconds: 4));

        final goToReturnsDetailsPage = find.byKey(const Key('goToReturnsDetailsPage'));
        expect(goToReturnsDetailsPage, findsNothing);
        
      });
    },
  );
}
