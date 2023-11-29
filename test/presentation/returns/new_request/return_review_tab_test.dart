import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';
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
const link = 'https://www.google.com/';

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
  late String fakeUnitPriceString;
  late double fakeOverridePrice;
  late String fakeOverridePriceString;
  late int fakeBalanceQuantity;
  late int fakeReturnQuantity;
  late List<Usage> fakeUsageList;
  late ReturnMaterialList fakeReturnMaterialList;

  ///////////////////////////Finder/////////////////////////////////////////
  final specialInstructionsField =
      find.byKey(WidgetKeys.specialInstructionsField);
  final returnReferenceField = find.byKey(WidgetKeys.returnReferenceField);
  /////////////////////////////////////////////////////////////////////////

  setUpAll(() async {
    fakeUnitPrice = 8.77;
    fakeUnitPriceString = '8.77';
    fakeOverridePrice = 12;
    fakeOverridePriceString = '12.00';
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

    fakeUsageList = await UsageCodeLocalDataSource().getUsages();
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
        body: ReturnReviewTab(),
      ),
    );
  }

  group('Return Review Tab test', () {
    testWidgets(' => Body Test', (tester) async {
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
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.returnReviewTabBodyKey),
        findsOneWidget,
      );
    });

    testWidgets(' =>  Body Test - Return details section', (tester) async {
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

      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
    });

    testWidgets(' => display Unit Price for return material item',
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
      await tester.pumpAndSettle();
      final unitPrice = find.textContaining(
        fakeUnitPriceString,
        findRichText: true,
      );
      expect(unitPrice, findsWidgets);
    });

    testWidgets(' => display Override Price for return material item',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  priceOverride: CounterOfferValue(
                    fakeOverridePrice.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final overridePrice = find.textContaining(
        fakeOverridePriceString,
        findRichText: true,
      );
      expect(overridePrice, findsWidgets);
      final overridePriceNote =
          find.text('Requested return value counter offer'.tr());
      expect(overridePriceNote, findsWidgets);
    });

    testWidgets(
        ' => display Total Price for 1 return material item with no override price',
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
      await tester.pumpAndSettle();
      final totalPrice = find.textContaining(
        (fakeUnitPrice * fakeReturnQuantity).toString(),
        findRichText: true,
      );
      expect(totalPrice, findsOneWidget);
    });

    testWidgets(
        ' => display Total Price for 1 return material item with override price',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  priceOverride: CounterOfferValue(
                    fakeOverridePrice.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final totalPrice = find.textContaining(
        (fakeOverridePrice * fakeReturnQuantity).toString(),
        findRichText: true,
      );
      expect(totalPrice, findsOneWidget);
    });

    group('Return  Special Instruction', () {
      testWidgets('check Special Instruction character limit',
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

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(specialInstructionsField, findsOneWidget);
        await tester.enterText(specialInstructionsField, 'a' * 200);
        await tester.pump();
        expect(find.text('a' * 150), findsOneWidget);
      });

      testWidgets('check Special Instruction link',
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

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(specialInstructionsField, findsOneWidget);
        await tester.enterText(specialInstructionsField, link);
        await tester.pump();
        expect(find.text(link), findsNothing);
      });
    });

    group('Return reference Instruction', () {
      testWidgets('check Return reference character limit',
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

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(returnReferenceField, findsOneWidget);
        await tester.enterText(returnReferenceField, 'a' * 200);
        await tester.pump();
        expect(find.text('a' * 150), findsOneWidget);
      });

      testWidgets('check Return reference link', (WidgetTester tester) async {
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

        when(() => usageCodeBlocMock.state).thenReturn(
          UsageCodeState.initial().copyWith(
            usages: fakeUsageList,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(returnReferenceField, findsOneWidget);
        await tester.enterText(returnReferenceField, link);
        await tester.pump();
        expect(find.text(link), findsNothing);
      });

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSalesOrgConfigAllowReturnsOutsidePolicy,
            ),
          );
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: fakeReturnMaterialList.items,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cardFinder = find.byType(CustomCard);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
      testWidgets(
        '=> display outside return policy tag when toggle is off in sales org config',
        (tester) async {
          when(() => newRequestBlocMock.state).thenReturn(
            NewRequestState.initial().copyWith(
              selectedItems: fakeReturnMaterialList.items,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final cardFinder = find.byType(CustomCard);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
    });
  });
}
