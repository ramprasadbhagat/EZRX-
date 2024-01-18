import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/widgets/return_counter_offer.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
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

import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
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
  //////////////////////Finder///////////////////////////////////////////////
  final newRequestStep2RemoveIcon =
      find.byKey(WidgetKeys.newRequestStep2RemoveIcon);
  final returnDetailsListView = find.byKey(WidgetKeys.returnDetailsListView);
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final materialBonusDetailsSection =
      find.byKey(WidgetKeys.materialBonusDetailsSection);
  final toggleIncludeBonusButton =
      find.byKey(WidgetKeys.toggleIncludeBonusButton);
  final itemTitleKey = find.byKey(WidgetKeys.itemTitleKey);
  final returnAttachmentUploadDialog =
      find.byKey(WidgetKeys.returnAttachmentUploadDialog);
  ///////////////////////////////////////////////////////////////////////////
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
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial(),
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
        ]),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
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
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          ),
        );
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
      '=> display outside return policy tag when toggle is off in salesorg config',
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
          findsNothing,
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

    testWidgets(
      '=> The counter offer field of bonus item is enabled when return material detail is not allowed to edit',
      (tester) async {
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [
              //make return material detail is not allowed to edit
              fakeReturnMaterialList.items[1].copyWith(
                balanceQuantity: IntegerValue('0'),
              )
            ],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnMaterialList.items[1].validatedItemDetails,
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final returnCounterOfferField = find.byType(ReturnCounterOfferField);
        expect(
          returnCounterOfferField,
          findsOneWidget,
        );

        expect(
          tester
              .widget<ReturnCounterOfferField>(returnCounterOfferField)
              .enabled,
          true,
        );
      },
    );

    testWidgets(
      '=> The counter offer field should accept decimal value as well as less than 1 ',
      (tester) async {
        const textLessThanOne = '0.01';
        when(() => newRequestBlocMock.state).thenReturn(
          NewRequestState.initial().copyWith(
            selectedItems: [
              //make return material detail is not allowed to edit
              fakeReturnMaterialList.items[1].copyWith(
                balanceQuantity: IntegerValue('0'),
              )
            ],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnMaterialList.items[1].validatedItemDetails,
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        await tester.enterText(
          find.byType(ReturnCounterOfferField),
          textLessThanOne,
        );
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(find.text(textLessThanOne), findsOneWidget);
      },
    );
    testWidgets(
        ' => commercial item with balance quantity 0 with bonus material balance quantity not zero bonus toggle should active and disable ',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              balanceQuantity: IntegerValue('0'),
              bonusItems: [
                fakeReturnMaterialList.items.first.copyWith(itemNumber: '2')
              ],
            ),
          ],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnMaterialList.items.first.validatedItemDetails
                    .copyWith(itemNumber: '2'),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle(const Duration(seconds: 10));
      final toggleIncludeBonusButton =
          find.byKey(WidgetKeys.toggleIncludeBonusButton);
      final bonusToggleIncludeBonusButton =
          tester.widget<Switch>(toggleIncludeBonusButton);
      expect(bonusToggleIncludeBonusButton.value, true);
      await tester.tap(toggleIncludeBonusButton);
      await tester.pumpAndSettle();
      verifyNever(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleBonusItem(
            item: fakeReturnMaterialList.items.first.copyWith(itemNumber: '2'),
            included: false,
          ),
        ),
      );
    });

    testWidgets(' => remove return Item', (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial, fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails,
              ],
            ),
          ],
        ),
      );
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [ReturnMaterial.empty()],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial, fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails,
                ],
              ),
            ],
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(ConfirmBottomSheet),
          matching: find.text('Remove item?'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(ConfirmBottomSheet),
          matching: find.text('This action cannot be undone'),
        ),
        findsOneWidget,
      );
      expect(confirmBottomSheetConfirmButton, findsOneWidget);
      await tester.tap(confirmBottomSheetConfirmButton);
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleReturnItem(
            selected: false,
            item: fakeReturnMaterial,
          ),
        ),
      ).called(1);
    });

    testWidgets(' => counter offer test', (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [ReturnMaterial.empty()],
          ),
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
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      final counterField = find.byType(CustomNumericTextField);
      expect(counterField, findsWidgets);
      await tester.enterText(
        find.byKey(
          WidgetKeys.requestCounterOfferTextField(fakeReturnMaterial.uuid),
        ),
        '100',
      );
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.updateRequestCounterOffer(
            uuid: fakeReturnMaterial.uuid,
            isChangeMaterialCounterOffer: true,
            counterOfferValue: CounterOfferValue('100'),
          ),
        ),
      ).called(1);
    });

    testWidgets(' => reason dropdown test', (WidgetTester tester) async {
      const returnReasonUsage = Usage(
        usageCode: '1',
        usageDescription: 'fake-description',
      );
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => usageCodeBlocMock.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: [returnReasonUsage],
        ),
      );
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
      final returnReasonDropdown =
          find.byKey(WidgetKeys.returnReasonDropdown(fakeReturnMaterial.uuid));
      expect(
        returnReasonDropdown,
        findsWidgets,
      );
      await tester.tap(returnReasonDropdown.first);
      await tester.pumpAndSettle();

      final dropdownOption = find.byKey(
        WidgetKeys.newRequestStepsDropdownItem(
          returnReasonUsage.usageDescription,
        ),
      );
      expect(
        dropdownOption,
        findsWidgets,
      );

      await tester.tap(dropdownOption.last);
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.additionInfoChanged(
            additionInfo: fakeReturnItemDetails.copyWith(
              returnReason: returnReasonUsage.usageCode,
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets(' => bonus details check test', (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(),
                ],
              ),
            ],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(
                    remarks: Remarks('fake-remarks'),
                  ),
                ],
              ),
            ],
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      expect(
        materialBonusDetailsSection,
        findsWidgets,
      );
    });

    testWidgets(' => Return quantity field test check',
        (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(),
                ],
              ),
            ],
          ),
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
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      await tester.pumpAndSettle();
      final returnQuantityField = find.byKey(
        WidgetKeys.returnQuantityField(fakeReturnMaterial.uuid),
      );
      expect(
        returnQuantityField,
        findsWidgets,
      );
      await tester.enterText(returnQuantityField.first, '3');
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.additionInfoChanged(
            additionInfo: fakeReturnItemDetails.copyWith(
              returnQuantity: ReturnQuantity('3'),
            ),
          ),
        ),
      ).called(1);
      expect(
        toggleIncludeBonusButton,
        findsWidgets,
      );
    });

    testWidgets(' => bonus comment check test', (WidgetTester tester) async {
      final remarks = Remarks('bonus comment');
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(),
                ],
              ),
            ],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(
                    remarks: Remarks('fake-remarks'),
                  ),
                ],
              ),
            ],
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      final bonusReturnCommentField = find.byKey(
        WidgetKeys.returnCommentField(fakeReturnMaterial.uuid),
      );
      expect(
        bonusReturnCommentField,
        findsWidgets,
      );
      await tester.enterText(
        bonusReturnCommentField.first,
        remarks.getValue(),
      );
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.additionInfoChanged(
            additionInfo: fakeReturnItemDetails.copyWith(remarks: remarks),
          ),
        ),
      ).called(1);
    });

    testWidgets(' => Material info section check', (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(),
                ],
              ),
            ],
          ),
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(
                    remarks: Remarks('fake-remarks'),
                  ),
                ],
              ),
            ],
          ),
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      expect(
        itemTitleKey,
        findsWidgets,
      );
      expect(
        find.descendant(
          of: find.byType(MaterialInfoWidget),
          matching: find.text(
            fakeReturnMaterial.materialDescription,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(MaterialInfoWidget),
          matching: find.text(
            fakeReturnMaterial.materialNumber.displayMatNo,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(MaterialInfoWidget),
          matching: find.text(
            'Batch ${fakeReturnMaterial.batch} ',
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(MaterialInfoWidget),
          matching: find.text(
            '(Expires ${fakeReturnMaterial.expiryDate.dateString})',
          ),
        ),
        findsOneWidget,
      );
    });
    testWidgets(' =>return Material details check',
        (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(
            selectedItems: [fakeReturnMaterial],
            invoiceDetails: [
              InvoiceDetails.empty().copyWith(
                returnItemDetailsList: [
                  fakeReturnItemDetails.copyWith(),
                ],
              ),
            ],
          ),
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
        ]),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(returnDetailsListView, findsOneWidget);
      expect(newRequestStep2RemoveIcon, findsOneWidget);
      await tester.tap(newRequestStep2RemoveIcon);
      await tester.pumpAndSettle();
      expect(
        find.byType(MaterialDetailsSection),
        findsWidgets,
      );

      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Principal code',
            fakeReturnMaterial.principalCode.getOrDefaultValue(''),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Principal name',
            fakeReturnMaterial.principalName.name,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Invoice number',
            fakeReturnMaterial.assignmentNumber,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(
          WidgetKeys.balanceTextRow(
            'Invoice date',
            fakeReturnMaterial.priceDate.dateString,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(' => attachment upload file', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser,
        ),
      );
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

      final returnUploadAttachmentButton = find.byKey(
        WidgetKeys.returnUploadAttachmentButton(fakeReturnMaterial.uuid),
      );
      expect(
        returnUploadAttachmentButton,
        findsWidgets,
      );
      await tester.tap(returnUploadAttachmentButton.first);
      await tester.pumpAndSettle();
      expect(
        returnAttachmentUploadDialog,
        findsWidgets,
      );
      expect(
        find.descendant(
          of: returnAttachmentUploadDialog,
          matching: find.text(
            'Upload Attachment',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: returnAttachmentUploadDialog,
          matching: find.text(
            'Choose a photo or a file',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: returnAttachmentUploadDialog,
          matching: find.text(
            'Photos',
          ),
        ),
        findsOneWidget,
      );
      final fileUploadSelectionButton = find.descendant(
        of: returnAttachmentUploadDialog,
        matching: find.text(
          'Files',
        ),
      );
      expect(
        fileUploadSelectionButton,
        findsOneWidget,
      );
      await tester.tap(fileUploadSelectionButton);
      await tester.pumpAndSettle();
      verify(
        () => returnRequestAttachmentBlocMock.add(
          ReturnRequestAttachmentEvent.uploadFile(
            returnUuid: fakeReturnMaterial.uuid,
            assignmentNumber: fakeReturnMaterial.assignmentNumber,
            uploadOptionType: UploadOptionType.file,
            user: fakeClientUser,
          ),
        ),
      ).called(1);
    });

    testWidgets(' => attachment upload photo', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser,
        ),
      );
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

      final returnUploadAttachmentButton = find.byKey(
        WidgetKeys.returnUploadAttachmentButton(fakeReturnMaterial.uuid),
      );
      expect(
        returnUploadAttachmentButton,
        findsWidgets,
      );
      await tester.tap(returnUploadAttachmentButton.first);
      await tester.pumpAndSettle();
      expect(
        returnAttachmentUploadDialog,
        findsWidgets,
      );
      expect(
        find.descendant(
          of: returnAttachmentUploadDialog,
          matching: find.text(
            'Upload Attachment',
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: returnAttachmentUploadDialog,
          matching: find.text(
            'Choose a photo or a file',
          ),
        ),
        findsOneWidget,
      );
      final photoUploadSelectionButton = find.descendant(
        of: returnAttachmentUploadDialog,
        matching: find.text(
          'Photos',
        ),
      );
      expect(
        photoUploadSelectionButton,
        findsOneWidget,
      );
      await tester.tap(photoUploadSelectionButton);
      await tester.pumpAndSettle();
      verify(
        () => returnRequestAttachmentBlocMock.add(
          ReturnRequestAttachmentEvent.uploadFile(
            returnUuid: fakeReturnMaterial.uuid,
            assignmentNumber: fakeReturnMaterial.assignmentNumber,
            uploadOptionType: UploadOptionType.gallery,
            user: fakeClientUser,
          ),
        ),
      ).called(1);
    });

    testWidgets(' => Attachment upload test success',
        (WidgetTester tester) async {
      whenListen(
        returnRequestAttachmentBlocMock,
        Stream.fromIterable([
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            returnUuid: fakeReturnMaterial.uuid,
            failureOrSuccessOption: optionOf(const Right(unit)),
          ),
        ]),
      );
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
      final returnUploadAttachmentButton = find.byKey(
        WidgetKeys.returnUploadAttachmentButton(fakeReturnMaterial.uuid),
      );
      expect(
        returnUploadAttachmentButton,
        findsWidgets,
      );
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleFiles(
            included: true,
            uuid: fakeReturnMaterial.uuid,
            files: <ReturnRequestAttachment>[],
          ),
        ),
      ).called(2);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(
            'File uploaded successfully',
          ),
        ),
        findsWidgets,
      );
    });

    testWidgets(' => Attachment upload test fail', (WidgetTester tester) async {
      const fakeError = 'fake-error';
      whenListen(
        returnRequestAttachmentBlocMock,
        Stream.fromIterable([
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            returnUuid: fakeReturnMaterial.uuid,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other(fakeError),
              ),
            ),
          ),
        ]),
      );
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
      final returnUploadAttachmentButton = find.byKey(
        WidgetKeys.returnUploadAttachmentButton(fakeReturnMaterial.uuid),
      );
      expect(
        returnUploadAttachmentButton,
        findsWidgets,
      );
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(
            fakeError,
          ),
        ),
        findsWidgets,
      );
    });
    testWidgets(' => attachment Delete test', (WidgetTester tester) async {
      final attachment = ReturnRequestAttachment(
        name: 'fake-file',
        path: 'fake-path',
        size: FileSize(1),
      );
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: [fakeReturnMaterial],
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              returnItemDetailsList: [
                fakeReturnItemDetails.copyWith(
                  uploadedFiles: [attachment],
                ),
              ],
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final file = find.text(
        '${attachment.name} - ${attachment.size.displayText}',
      );
      final fileDeleteIcon = find.byIcon(Icons.delete_outline_outlined);
      expect(file, findsWidgets);
      expect(fileDeleteIcon, findsWidgets);
      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.tap(fileDeleteIcon.last);
      await tester.pumpAndSettle();
      verify(
        () => returnRequestAttachmentBlocMock.add(
          ReturnRequestAttachmentEvent.deleteFile(
            file: attachment,
          ),
        ),
      ).called(1);
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.toggleFiles(
            included: false,
            uuid: fakeReturnMaterial.uuid,
            files: <ReturnRequestAttachment>[attachment],
          ),
        ),
      ).called(1);
    });
  });
}
