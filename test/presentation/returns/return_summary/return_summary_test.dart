import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_items.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/returns/return_summary/return_summary.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class ReturnSummaryBlocMock
    extends MockBloc<ReturnSummaryEvent, ReturnSummaryState>
    implements ReturnSummaryBloc {}

class ReturnSummaryFilterBlocMock
    extends MockBloc<ReturnSummaryFilterEvent, ReturnSummaryFilterState>
    implements ReturnSummaryFilterBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ReturnSummaryDetailsBlocMock
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late ReturnSummaryBloc returnSummaryBlocMock;
  late ReturnSummaryFilterBloc returnSummaryFilterBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late ReturnSummaryDetailsBloc returnSummaryDetailsBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnSummaryBlocMock = ReturnSummaryBlocMock();
    returnSummaryFilterBlocMock = ReturnSummaryFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    shipToCodeBlocMock = ShipToCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => returnSummaryBlocMock.state)
        .thenReturn(ReturnSummaryState.initial());
    when(() => returnSummaryFilterBlocMock.state)
        .thenReturn(ReturnSummaryFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => shipToCodeBlocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => returnSummaryDetailsBlocMock.state)
        .thenReturn(ReturnSummaryDetailsState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ReturnSummaryBloc>(
            create: (context) => returnSummaryBlocMock,
          ),
          BlocProvider<ReturnSummaryFilterBloc>(
            create: (context) => returnSummaryFilterBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<ReturnSummaryDetailsBloc>(
            create: (context) => returnSummaryDetailsBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: ReturnSummary(),
      ),
    );
  }

  group('Return Summary Screen', () {
    testWidgets('=> AppBar Test', (tester) async {
      when(() => returnSummaryBlocMock.state)
          .thenReturn(ReturnSummaryState.initial().copyWith(
        isLoading: true,
      ));
      final expectedState = [
        ReturnSummaryFilterState.initial(),
        ReturnSummaryFilterState.initial().copyWith(
          isSubmitting: true,
        ),
        ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: ReturnSummaryFilter.empty()
              .copyWith(sortBy: ReturnSummaryStatus('Active')),
        ),
      ];
      whenListen(
          returnSummaryFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
      final filterButton = find.byType(FilterCountButton);
      expect(filterButton, findsOneWidget);
      await tester.tap(filterButton);
      final returnSummaryText = find.text('Return Summary'.tr());
      expect(returnSummaryText, findsOneWidget);

      final statusText = find.text('Status'.tr());
      expect(statusText, findsOneWidget);
      await tester.tap(statusText, warnIfMissed: false);
      await tester.pump();
    });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: 'mock-customerCodeSoldTo',
        ),
      ));
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial().copyWith(
        shipToInfo: ShipToInfo.empty().copyWith(
          shipToCustomerCode: 'mock-shipToCustomerCode',
        ),
      ));
      when(() => returnSummaryBlocMock.state)
          .thenReturn(ReturnSummaryState.initial().copyWith(
        isLoading: true,
      ));

      final expectedState = [
        ReturnSummaryFilterState.initial().copyWith(
          isSubmitting: true,
        ),
        ReturnSummaryFilterState.initial().copyWith(
          isSubmitting: true,
          returnSummaryFilter: ReturnSummaryFilter.empty()
              .copyWith(sortBy: ReturnSummaryStatus('Active')),
        ),
      ];
      whenListen(
          returnSummaryFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(const Key('LoaderImage'));
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => returnSummaryBlocMock.state)
          .thenReturn(ReturnSummaryState.initial().copyWith(
        isLoading: false,
      ));
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial().copyWith(
        shipToInfo: ShipToInfo(
          defaultShipToAddress: true,
          shipToCustomerCode: '',
          shipToName: ShipToName.empty(),
          shipToAddress: ShipToAddress.empty(),
          status: Status(''),
          building: '',
          city1: '',
          city2: '',
          postalCode: '',
          houseNumber1: '',
          telephoneNumber: '',
          region: '',
          floor: '',
          plant: '',
          licenses: [],
        ),
      ));

      final expectedState = [
        ReturnSummaryState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
        ReturnSummaryState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption: none(),
        ),
        ReturnSummaryState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption: optionOf(const Right('')),
            returnSummaryList: [
              ReturnSummaryRequest.empty().copyWith(
                returnId: '123456',
                requestStatus: ReturnSummaryStatus('PENDING'),
                submitDate: DateTimeStringValue('2023-02-21'),
                items: [
                  ReturnSummaryRequestItems.empty().copyWith(
                    materialName: '123456',
                  ),
                ],
              ),
            ]),
      ];
      whenListen(returnSummaryBlocMock, Stream.fromIterable(expectedState));

      final handle = tester.ensureSemantics();
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      await tester.drag(
        find.text('123456'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation

      handle.dispose();
      await tester.pump();
    });

    testWidgets('=> Body Test onLoadMore', (tester) async {
      when(() => returnSummaryFilterBlocMock.state)
          .thenReturn(ReturnSummaryFilterState.initial().copyWith(
        returnSummaryFilter: ReturnSummaryFilter.empty()
            .copyWith(sortBy: ReturnSummaryStatus('Active')),
      ));
      when(() => returnSummaryBlocMock.state).thenReturn(
        ReturnSummaryState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          returnSummaryList: [
            ReturnSummaryRequest.empty().copyWith(
              returnId: '123456',
              requestStatus: ReturnSummaryStatus('PENDING'),
              submitDate: DateTimeStringValue('2023-02-21'),
              items: [
                ReturnSummaryRequestItems.empty().copyWith(
                  materialName: '123456',
                ),
              ],
            ),
            ReturnSummaryRequest.empty().copyWith(
              returnId: '123456',
              requestStatus: ReturnSummaryStatus('PENDING'),
              submitDate: DateTimeStringValue('2023-02-21'),
              items: [
                ReturnSummaryRequestItems.empty().copyWith(
                  materialName: '123456',
                ),
              ],
            ),
            ReturnSummaryRequest.empty().copyWith(
              returnId: '123456',
              requestStatus: ReturnSummaryStatus('PENDING'),
              submitDate: DateTimeStringValue('2023-02-21'),
              items: [
                ReturnSummaryRequestItems.empty().copyWith(
                  materialName: '123456',
                ),
              ],
            ),
            ReturnSummaryRequest.empty().copyWith(
              returnId: '123456',
              requestStatus: ReturnSummaryStatus('PENDING'),
              submitDate: DateTimeStringValue('2023-02-21'),
              items: [
                ReturnSummaryRequestItems.empty().copyWith(
                  materialName: '123456',
                ),
              ],
            ),
          ],
        ),
      );

      await getWidget(tester);
      await tester.drag(
        find.text('123456').last,
        const Offset(0.0, -1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation
      await tester.pump();
    });

    testWidgets('=> Return Summary Filter By Status Test', (tester) async {
      when(() => returnSummaryBlocMock.state)
          .thenReturn(ReturnSummaryState.initial().copyWith(
        isLoading: true,
      ));
      final expectedState = [
        ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
            sortBy: ReturnSummaryStatus('All'),
          ),
        ),
        ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
            sortBy: ReturnSummaryStatus('Active'),
          ),
        ),
      ];

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findStatusText = find.text('Status'.tr());
      expect(findStatusText, findsOneWidget);
      await tester.tap(findStatusText);
      await tester.pump();

      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Select Status'.tr()), findsOneWidget);

      final findRadioListText = find.text('Active');
      await tester.tap(findRadioListText);
      await tester.pump();

      final closeButton = find.byKey(const Key('closeButton'));
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);

      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      whenListen(
        returnSummaryFilterBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.tap(findStatusText);
      await tester.pump();
    });
  });
}
