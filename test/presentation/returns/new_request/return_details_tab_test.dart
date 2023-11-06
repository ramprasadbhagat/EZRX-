import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

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
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  final salesOrgBlocMock = SalesOrgMockBloc();
  late EligibilityBloc eligibilityBlocMock;
  late NewRequestBloc newRequestBlocMock;
  final usageCodeBlocMock = UsageCodeBlocMock();
  late ReturnRequestAttachmentBloc returnRequestAttachmentBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ReturnMaterial fakeReturnMaterial;
  late ReturnItemDetails fakeReturnItemDetails;
  late double fakeUnitPrice;
  late int fakeBalanceQuantity;
  late int fakeReturnQuantity;
  late ReturnMaterialList fakeReturnMaterialList;

  setUpAll(() async {
    fakeUnitPrice = 8.77;
    fakeBalanceQuantity = 5;
    fakeReturnQuantity = 2;
    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    fakeReturnMaterial = fakeReturnMaterialList.items.first.copyWith(
      unitPrice: RangeValue(fakeUnitPrice.toString()),
      balanceQuantity: IntegerValue(fakeBalanceQuantity.toString()),
      bonusItems: [fakeReturnMaterialList.items.first],
    );
    fakeReturnItemDetails = fakeReturnMaterial.validatedItemDetails.copyWith(
      returnQuantity: ReturnQuantity(fakeReturnQuantity.toString()),
    );
    locator.registerLazySingleton(() => AppRouter());
  });

  setUp(() {
    userBlocMock = UserBlocMock();
    autoRouterMock = locator<AppRouter>();
    newRequestBlocMock = NewRequestMockBloc();
    customerCodeBlocMock = CustomerCodeBlocMock();
    returnRequestAttachmentBlocMock = ReturnRequestAttachmentBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => newRequestBlocMock.state).thenReturn(NewRequestState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
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
      providers: [
        BlocProvider<UserBloc>(create: (context) => userBlocMock),
        BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
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
      child: const Scaffold(
        body: ReturnDetailsTab(),
      ),
    );
  }

  group('Return Details Tab Test', () {
    testWidgets(' => displays ListView.builder when selectedItems is not empty',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final returnDetailsListView =
          find.byKey(WidgetKeys.returnDetailsListView);
      expect(returnDetailsListView, findsOneWidget);
    });

    testWidgets(' => tap include bonus button', (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [fakeReturnItemDetails],
            )
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final toggleIncludeBonusButton =
          find.byKey(WidgetKeys.toggleIncludeBonusButton);
      expect(toggleIncludeBonusButton, findsOneWidget);
      await tester.dragUntilVisible(
        toggleIncludeBonusButton,
        find.byKey(WidgetKeys.returnDetailsListView),
        const Offset(0, 100),
      );
      await tester.pumpAndSettle();
      await tester.tap(toggleIncludeBonusButton);
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleBonusItem(
            item: fakeReturnMaterial.bonusItems.first,
            included: false,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        ' => bonus quantity is low balance hide MaterialBonusDetailsSection',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              bonusItems: [
                fakeReturnMaterial.copyWith(balanceQuantity: IntegerValue('0'))
              ],
            )
          ],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  balanceQty: IntegerValue('0'),
                )
              ],
            )
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.materialBonusDetailsSection),
        findsNothing,
      );
    });

    testWidgets(
        ' => bonus quantity is low balance show BonusLowBalanceQuantityWarning',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              bonusItems: [
                fakeReturnMaterial.copyWith(balanceQuantity: IntegerValue('0'))
              ],
            )
          ],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              salesOrg: fakeSalesOrg,
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  balanceQty: IntegerValue('0'),
                )
              ],
            )
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.text(
          'You cannot return this bonus item as there is no balance quantity.'
              .tr(),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      '=> display outside return policy tag',
      (tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterialList.items.first],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byType(CustomCard);

        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> hide outside return policy tag',
      (tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterialList.items[1]],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final cardFinder = find.byType(CustomCard);

        expect(
          find.descendant(
            of: cardFinder.first,
            matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
          ),
          findsNothing,
        );
      },
    );
  });
}
