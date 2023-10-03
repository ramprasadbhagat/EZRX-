import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import '../../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnItemsBlocMock extends MockBloc<ReturnItemsEvent, ReturnItemsState>
    implements ReturnItemsBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class NewRequestMockBloc extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class ReturnRequestAttachmentBlocMock
    extends MockBloc<ReturnRequestAttachmentEvent, ReturnRequestAttachmentState>
    implements ReturnRequestAttachmentBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  final salesOrgBlocMock = SalesOrgMockBloc();
  late EligibilityBloc eligibilityBlocMock;
  late NewRequestBloc newRequestBlocMock;
  final usageCodeBlocMock = UsageCodeBlocMock();
  late ReturnRequestAttachmentBloc returnRequestAttachmentBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ReturnMaterial fakeReturnMaterial;

  final fakeSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-SalesOrg'),
  );

  final sgSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('2601'),
  );

  setUpAll(() async {
    fakeReturnMaterial = ReturnMaterial.empty().copyWith(
      unitPrice: RangeValue('100'),
    );
    locator.registerLazySingleton(() => AppRouter());
  });

  group('New Request page', () {
    setUp(() {
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
      newRequestBlocMock = NewRequestMockBloc();
      announcementBlocMock = AnnouncementBlocMock();
      returnItemsBlocMock = ReturnItemsBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      returnRequestAttachmentBlocMock = ReturnRequestAttachmentBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => returnItemsBlocMock.state)
          .thenReturn(ReturnItemsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => newRequestBlocMock.state)
          .thenReturn(NewRequestState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
      when(() => returnRequestAttachmentBlocMock.state)
          .thenReturn(ReturnRequestAttachmentState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        routeName: NewRequestPageRoute.name,
        providers: [
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<ReturnItemsBloc>(
            create: (context) => returnItemsBlocMock,
          ),
          BlocProvider<NewRequestBloc>(
            create: (context) => newRequestBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<UsageCodeBloc>(create: (context) => usageCodeBlocMock),
          BlocProvider<ReturnRequestAttachmentBloc>(
            create: ((context) => returnRequestAttachmentBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: ((context) => productImageBlocMock),
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const NewRequestPage(),
      );
    }

    testWidgets(
        ' => showing invalidSelectedReturnItemError when return items are from the different principals',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-2'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final invalidSelectedReturnItemError =
          find.byKey(WidgetKeys.invalidSelectedReturnItemError);
      expect(invalidSelectedReturnItemError, findsOneWidget);
    });

    testWidgets(
        ' => [SG market] NOT showing invalidSelectedReturnItemError when return items are from the different principals',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-2'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final invalidSelectedReturnItemError =
          find.byKey(WidgetKeys.invalidSelectedReturnItemError);
      expect(invalidSelectedReturnItemError, findsNothing);
    });
    testWidgets(' => rebuild widget when selectedItems is different',
        (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial(),
          NewRequestState.initial().copyWith(
            salesOrg: sgSalesOrganisation.salesOrg,
            selectedItems: [
              fakeReturnMaterial.copyWith(
                itemNumber: '1',
                principalCode: PrincipalCode('fake-PrincipalCode-1'),
              ),
              fakeReturnMaterial.copyWith(
                itemNumber: '2',
                principalCode: PrincipalCode('fake-PrincipalCode-2'),
              ),
            ],
          ),
        ]),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final invalidSelectedReturnItemError =
          find.byKey(WidgetKeys.invalidSelectedReturnItemError);
      expect(invalidSelectedReturnItemError, findsNothing);
    });
    testWidgets('=> show the SummaryInfo when press Return for',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.newRequestReturnFor));
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.addressInfoSectionActionLabel),
        findsOneWidget,
      );
    });
  });
}
