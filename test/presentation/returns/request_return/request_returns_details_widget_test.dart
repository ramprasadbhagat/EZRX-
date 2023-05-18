import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/presentation/returns/request_return/request_return_details.dart';
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

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PoAttachmentMockBloc
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class ReturnPriceMockBloc extends MockBloc<ReturnPriceEvent, ReturnPriceState>
    implements ReturnPriceBloc {}

class MockPoAttachmentRepository extends Mock
    implements PoAttachmentRepository {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

final locator = GetIt.instance;

void main() {
  late RequestReturnBloc requestReturnBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late ReturnPriceBloc returnPriceBlocMock;
  late AppRouter autoRouterMock;
  late MockPoAttachmentRepository mockPoAttachmentRepository;
  late UsageCodeBlocMock usageCodeMockBloc;

  setUpAll(() async {
    mockPoAttachmentRepository = MockPoAttachmentRepository();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() =>
        PoAttachmentBloc(poAttachmentRepository: mockPoAttachmentRepository));
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requestReturnBlocMock = RequestReturnMockBloc();
    salesOrgBlocMock = SalesOrgMockBloc();
    usageCodeMockBloc = UsageCodeBlocMock();
    poAttachmentBlocMock = PoAttachmentMockBloc();
    returnPriceBlocMock = ReturnPriceMockBloc();
    usageCodeMockBloc = UsageCodeBlocMock();

    when(() => requestReturnBlocMock.state)
        .thenReturn(RequestReturnState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
    when(() => returnPriceBlocMock.state)
        .thenReturn(ReturnPriceState.initial());
    when(() => usageCodeMockBloc.state)
        .thenReturn(UsageCodeState.initial().copyWith(usage: [
      Usage.empty()
          .copyWith(usageCode: 'test-1', usageDescription: 'test-description')
    ]));
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
          BlocProvider<UsageCodeBloc>(
            create: (context) => usageCodeMockBloc,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => poAttachmentBlocMock,
          ),
          BlocProvider<ReturnPriceBloc>(
            create: (context) => returnPriceBlocMock,
          ),
        ],
        child: const RequestReturnDetails(),
      ),
    );
  }

  group('Return Request Details', () {
    testWidgets(
      'At least one item is selected for return',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(
            returnItemList: [
              ReturnItem.empty().copyWith(
                materialNumber: MaterialNumber('mat-1'),
                materialDescription: 'Mat-description',
                assignmentNumber: 'fake-number',
                balanceQuantity: 2,
                unitPrice: 1,
                returnQuantity: ReturnQuantity('1'),
                isSelected: true,
                usage: const Usage(usageCode: 'test-code', usageDescription: 'test-description')
              ),
            ],
          ),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();
        final requestReturnDetailsText =
            find.text('Request Return Details'.tr());
        final returnItemList = find.byKey(const Key('selectedReturnItemsList'));
        final requestReturnNotesSection =
            find.byKey(const Key('requestReturnNotesSection'));
        final proceedButton = find.byKey(const Key('goToSubmitReturnsPage'));
        expect(requestReturnDetailsText, findsOneWidget);
        expect(returnItemList, findsOneWidget);
        expect(requestReturnNotesSection, findsOneWidget);
        expect(proceedButton, findsOneWidget);
        await tester.tap(proceedButton);

        await tester.pump();
      },
    );

    testWidgets(
      'no item is selected for return',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial(),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();
        final noReturnsItemsAddedText = find.text('No Return Items Added'.tr());
        final returnItemList = find.byKey(const Key('selectedReturnItemsList'));
        final requestReturnNotesSection =
            find.byKey(const Key('requestReturnNotesSection'));
        expect(noReturnsItemsAddedText, findsOneWidget);
        expect(returnItemList, findsNothing);
        expect(requestReturnNotesSection, findsNothing);

        await tester.pump();
      },
    );

    testWidgets(
      'find return items details section',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(returnItemList: [
            ReturnItem.empty().copyWith(
              materialNumber: MaterialNumber('mat-1'),
              materialDescription: 'Mat-description',
              assignmentNumber: 'fake-number',
              balanceQuantity: 2,
              unitPrice: 1,
              returnQuantity: ReturnQuantity('1'),
              isSelected: true,
            )
          ]),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();

        final requestReturnDetailsText =
            find.text('Request Return Details'.tr());
        final returnItemList = find.byKey(const Key('selectedReturnItemsList'));
        final requestReturnNotesSection =
            find.byKey(const Key('requestReturnNotesSection'));
        final returnType = find.byKey(const Key('radioButton'));
        final returnQuantityField =
            find.byKey(const Key('Value(Right(mat-1))fake-number'));
        final returnValueField = find.byKey(const Key('returnValue1.00'));
        final balanceQuantityField = find
            .byKey(const Key('balanceQuantityValue(Right(mat-1))fake-number'));
        final returnRequestReasonDropdown =
            find.byKey(const Key('_returnReasonKey'));
        expect(requestReturnDetailsText, findsOneWidget);
        expect(returnItemList, findsOneWidget);
        expect(requestReturnNotesSection, findsOneWidget);
        expect(returnType, findsOneWidget);
        expect(returnQuantityField, findsOneWidget);
        expect(returnValueField, findsOneWidget);
        expect(balanceQuantityField, findsOneWidget);
        expect(returnRequestReasonDropdown, findsOneWidget);

        await tester.pump();
      },
    );

    testWidgets(
      'return quantity field validation',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(returnItemList: [
            ReturnItem.empty().copyWith(
              materialNumber: MaterialNumber('mat-1'),
              materialDescription: 'Mat-description',
              assignmentNumber: 'fake-number',
              balanceQuantity: 2,
              unitPrice: 1,
              returnQuantity: ReturnQuantity('1'),
              isSelected: true,
            )
          ]),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();

        final returnQuantityField =
            find.byKey(const Key('Value(Right(mat-1))fake-number'));

        final balanceQuantityField = find
            .byKey(const Key('balanceQuantityValue(Right(mat-1))fake-number'));

        expect(returnQuantityField, findsOneWidget);

        expect(balanceQuantityField, findsOneWidget);
        //return quantity entered is less than balance quantity
        await tester.enterText(returnQuantityField, '1');
        expect(find.text('1'), findsOneWidget);

        //return quantity entered is greater than balanceQuantity. Hence return quantity
        //value reset to balanceQuantity value
        await tester.enterText(returnQuantityField, '3');
        expect(find.text('2'), findsNWidgets(2));

        await tester.pump();
      },
    );

    testWidgets(
      'select return request reason',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(returnItemList: [
            ReturnItem.empty().copyWith(
              materialNumber: MaterialNumber('mat-1'),
              materialDescription: 'Mat-description1',
              assignmentNumber: 'fake-number1',
              isSelected: true,
            ),
          ]),
        ];

        whenListen(
          requestReturnBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await getWidget(tester);
        await tester.pump();

        final returnRequestReasonDropdown =
            find.byKey(const Key('_returnReasonKey'));
        expect(returnRequestReasonDropdown, findsOneWidget);
        await tester.tap(returnRequestReasonDropdown, warnIfMissed: false);

        final dropDownVal = find.text('test-description');
        expect(dropDownVal, findsOneWidget);

        await tester.tap(dropDownVal);
        await tester.pump();
      },
    );

    testWidgets(
      'Enter special instructions',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(returnItemList: [
            ReturnItem.empty().copyWith(
              materialNumber: MaterialNumber('mat-1'),
              isSelected: true,
            )
          ]),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();

        final referenceNumber =
            find.byKey(const Key('Return Reference Number:'));
        final specialInstructions =
            find.byKey(const Key('Special Instructions:'));

        expect(referenceNumber, findsOneWidget);

        expect(specialInstructions, findsOneWidget);
        await tester.enterText(referenceNumber, 'ref-number');
        expect(find.text('ref-number'), findsOneWidget);
        await tester.enterText(specialInstructions, 'special-instructions');
        expect(find.text('special-instructions'), findsOneWidget);

        await tester.pump();
      },
    );

    testWidgets(
      'remove item from request return details page',
      (tester) async {
        final expectedStates = [
          RequestReturnState.initial().copyWith(returnItemList: [
            ReturnItem.empty().copyWith(
              materialNumber: MaterialNumber('mat-1'),
              assignmentNumber: 'fake-number',
              isSelected: true,
            ),
          ]),
        ];

        whenListen(requestReturnBlocMock, Stream.fromIterable(expectedStates));

        await getWidget(tester);
        await tester.pump();

        final deleteIcon = find.byIcon(Icons.delete);
        final returnQuantityField =
            find.byKey(const Key('Value(Right(mat-1))fake-number'));
        expect(returnQuantityField, findsOneWidget);
        expect(deleteIcon, findsOneWidget);
        await tester.tap(deleteIcon);
      },
    );
  });
}
