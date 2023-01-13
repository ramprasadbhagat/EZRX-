import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/edi_user_continue_note.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

void main() {
  late EligibilityBloc eligibilityBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late AppRouter autoRouterMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(
          () => CountlyService(config: locator<Config>()));
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      eligibilityBlocMock = EligibilityBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();

      autoRouterMock = locator<AppRouter>();

      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
              customerCodeInfo:
                  CustomerCodeInfo.empty().copyWith(status: Status('EDI'))));
    },
  );
  group(
    'edi_user_continue_note Widget',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeBlocMock),
          ],
          child: const EdiUserContinueNote(
            maxStepsReached: true,
          ),
        );
      }

      testWidgets(
        'Display message',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('internal_sales_rep'),
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status('EDI'),
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final ediUserContinueNoteText = find.textContaining(
              '*Note: For special orders if you want to proceed please select order type inside Additional Information.'
                  .tr());
          expect(ediUserContinueNoteText, findsWidgets);
        },
      );

      testWidgets(
        'Hide message',
        (tester) async {
          final expectedStates = [
            OrderDocumentTypeState.initial().copyWith(
              selectedOrderType: OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFB (ZPFB)'),
              ),
            ),
            OrderDocumentTypeState.initial(),
          ];
          whenListen(
              orderDocumentTypeBlocMock, Stream.fromIterable(expectedStates));
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('client'),
                ),
              ),
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status('EDI'),
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final ediUserContinueNoteText = find.textContaining(
              '*Note: For special orders if you want to proceed please select order type inside Additional Information.'
                  .tr());
          expect(ediUserContinueNoteText, findsNothing);
        },
      );
    },
  );
}
