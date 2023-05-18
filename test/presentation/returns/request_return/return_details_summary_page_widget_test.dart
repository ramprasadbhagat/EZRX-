import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';
import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/presentation/returns/request_return/return_details_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class RequestReturnMockBloc
    extends MockBloc<RequestReturnEvent, RequestReturnState>
    implements RequestReturnBloc {}

class SubmitReturnMockBloc
    extends MockBloc<SubmitReturnEvent, SubmitReturnState>
    implements SubmitReturnBloc {}

class ReturnPriceMockBloc extends MockBloc<ReturnPriceEvent, ReturnPriceState>
    implements ReturnPriceBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  late RequestReturnBloc requestReturnBlocMock;
  late SubmitReturnBloc submitReturnBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late ReturnPriceBloc returnPriceBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requestReturnBlocMock = RequestReturnMockBloc();
    salesOrgBlocMock = SalesOrgMockBloc();
    submitReturnBlocMock = SubmitReturnMockBloc();
    eligibilityBlocMock = EligibilityMockBloc();
    returnPriceBlocMock = ReturnPriceMockBloc();

    when(() => requestReturnBlocMock.state)
        .thenReturn(RequestReturnState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => submitReturnBlocMock.state)
        .thenReturn(SubmitReturnState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => returnPriceBlocMock.state)
        .thenReturn(ReturnPriceState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<RequestReturnBloc>(
            create: (context) => requestReturnBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<SubmitReturnBloc>(
            create: (context) => submitReturnBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ReturnPriceBloc>(
            create: (context) => returnPriceBlocMock,
          ),
        ],
        child: const RequestReturnDetailsSummaryPage(),
      ),
    );
  }

  group('Return Details Summary Page Test', () {
    testWidgets(
      'Return details summary test',
      (tester) async {
        when(() => requestReturnBlocMock.state)
            .thenReturn(RequestReturnState.initial().copyWith(
          returnItemList: [
            ReturnItem.empty().copyWith(
              isSelected: true,
            ),
          ],
        ));

        final expectedStates = [
          SubmitReturnState.initial().copyWith(
            requestID: 'id1',
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('error'))),
          ),
          SubmitReturnState.initial().copyWith(
            requestID: 'id2',
            messages: 'fake-message',
            failureOrSuccessOption: optionOf(const Right('success')),
          ),
          SubmitReturnState.initial().copyWith(
            requestID: 'id2',
            failureOrSuccessOption: none(),
          ),
        ];

        whenListen(submitReturnBlocMock, Stream.fromIterable(expectedStates));

        final expectedStates1 = [
          ReturnPriceState.initial().copyWith(
            isFetching: true,
          ),
          ReturnPriceState.initial().copyWith(
            isFetching: false,
          ),
        ];

        whenListen(returnPriceBlocMock, Stream.fromIterable(expectedStates1));

        await getWidget(tester);
        final requestReturnDetailsText =
            find.text('Request Return Summary'.tr());
        expect(requestReturnDetailsText, findsOneWidget);
        final invoiceNumberKey = find.byKey(const Key('Invoice Number'));
        expect(invoiceNumberKey, findsOneWidget);
        final returnQuantityKey = find.byKey(const Key('Return Quantity'));
        expect(returnQuantityKey, findsOneWidget);
        final goToSubmitReturnsPage =
            find.byKey(const Key('goToSubmitReturnsPage'));
        expect(goToSubmitReturnsPage, findsOneWidget);
        await tester.tap(goToSubmitReturnsPage);
        await tester.pump();
      },
    );

    testWidgets(
      'Return details summary test when message not null',
      (tester) async {
        when(() => requestReturnBlocMock.state)
            .thenReturn(RequestReturnState.initial().copyWith(
          returnItemList: [
            ReturnItem.empty().copyWith(
              isSelected: true,
            ),
          ],
        ));

        final expectedStates = [
          SubmitReturnState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('error'))),
          ),
          SubmitReturnState.initial().copyWith(
              failureOrSuccessOption: none(), messages: 'fake-message'),
        ];

        whenListen(submitReturnBlocMock, Stream.fromIterable(expectedStates));

        final expectedStates1 = [
          ReturnPriceState.initial().copyWith(
            isFetching: false,
          ),
          ReturnPriceState.initial().copyWith(
            isFetching: true,
          ),
        ];

        whenListen(returnPriceBlocMock, Stream.fromIterable(expectedStates1));

        await getWidget(tester);
        final returnRequestNotesText = find.text('Return Request Notes');
        expect(returnRequestNotesText, findsOneWidget);
        final returnReferenceNumberText = find.text('Return Reference Number');
        expect(returnReferenceNumberText, findsOneWidget);
        final specialInstructionsText = find.text('Special Instructions');
        expect(specialInstructionsText, findsOneWidget);
        await tester.pump();
      },
    );
  });
}
