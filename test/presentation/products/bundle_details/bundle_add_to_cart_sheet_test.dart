import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_add_to_cart_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class BundleAddToCartBlocMock
    extends MockBloc<BundleAddToCartEvent, BundleAddToCartState>
    implements BundleAddToCartBloc {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late SalesOrgMockBloc mockSalesOrgBloc;
  late UserMockBloc userBlocMock;
  late ProductDetailsMockBloc productDetailMockBloc;
  late ProductImageMockBloc mockProductImageBloc;
  late EligibilityBlocMock eligibilityBlocMock;
  late BundleAddToCartBloc bundleAddToCartBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('root_admin'),
    ),
  );

  setUpAll(() async {
    bundleAddToCartBloc = BundleAddToCartBlocMock();
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    mockSalesOrgBloc = SalesOrgMockBloc();
    userBlocMock = UserMockBloc();
    productDetailMockBloc = ProductDetailsMockBloc();
    mockProductImageBloc = ProductImageMockBloc();
  });

  group(
    'Bundle Add To cart',
    () {
      setUp(() {
        customerCodeBlocMock = CustomerCodeBlocMock();
        cartMockBloc = CartMockBloc();
        eligibilityBlocMock = EligibilityBlocMock();

        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );
        when(() => customerCodeBlocMock.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('MY')),
          ),
        );
        when(() => productDetailMockBloc.state)
            .thenReturn(ProductDetailState.initial());
        when(() => mockProductImageBloc.state)
            .thenReturn(ProductImageState.initial());
        when(() => cartMockBloc.state).thenReturn(CartState.initial());
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial(),
        );
      });

      RouteDataScope getScopedWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<EligibilityBloc>(
              create: ((context) => eligibilityBlocMock),
            ),
            BlocProvider<ProductDetailBloc>(
              create: ((context) => productDetailMockBloc),
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => mockProductImageBloc,
            ),
            BlocProvider<CartBloc>(
              create: ((context) => cartMockBloc),
            ),
            BlocProvider<BundleAddToCartBloc>(
              create: ((context) => bundleAddToCartBloc),
            ),
          ],
          child: const Material(child: BundlesAddToCartSheet()),
        );
      }

      testWidgets('Out of stock material deactivate', (tester) async {
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
                  BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            BundleAddToCartState.initial().copyWith(
              bundle: MaterialInfo.empty().copyWith(
                bundle: Bundle.empty().copyWith(
                  bundleInformation: <BundleInfo>[
                    BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
                    BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
                  ],
                ),
              ),
              bundleMaterials: <MaterialInfo>[
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                  quantity: MaterialQty(6),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('No'),
                    )
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-2'),
                  quantity: MaterialQty(16),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('No'),
                    )
                  ],
                ),
              ],
            ),
          ],
        );

        whenListen(bundleAddToCartBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final bundleAddToCartSheet = find.byKey(
          WidgetKeys.bundleAddToCartSheet,
        );
        final bundleInputAddKey = find.byKey(
          WidgetKeys.bundleInputAddKey,
        );
        final bundleQuantity = find.byKey(
          ValueKey(
            'bundle${MaterialNumber('fake-material-1').displayMatNo}1quantity',
          ),
        );
        expect(bundleAddToCartSheet, findsOneWidget);
        expect(bundleInputAddKey, findsWidgets);
        await tester.tap(bundleInputAddKey.first);
        await tester.pumpAndSettle();
        expect(bundleQuantity, findsNothing);
      });

      testWidgets('Out of stock material active', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
                  BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );
        final expectedStates = Stream.fromIterable(
          [
            BundleAddToCartState.initial().copyWith(
              bundle: MaterialInfo.empty().copyWith(
                bundle: Bundle.empty().copyWith(
                  bundleInformation: <BundleInfo>[
                    BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
                    BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
                  ],
                ),
              ),
              bundleMaterials: <MaterialInfo>[
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                  quantity: MaterialQty(6),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('No'),
                    )
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-2'),
                  quantity: MaterialQty(16),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('No'),
                    )
                  ],
                ),
              ],
            ),
          ],
        );

        whenListen(bundleAddToCartBloc, expectedStates);
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final bundleAddToCartSheet = find.byKey(
          WidgetKeys.bundleAddToCartSheet,
        );
        final bundleQuantityTextKey = find.byKey(
          WidgetKeys.bundleQuantityTextKey,
        );

        expect(bundleAddToCartSheet, findsOneWidget);
        expect(bundleQuantityTextKey, findsWidgets);
        await tester.tap(bundleQuantityTextKey.first);
        await tester.pumpAndSettle();
        await tester.enterText(bundleQuantityTextKey.first, '1');
        await tester.pumpAndSettle();
        verify(
          () => bundleAddToCartBloc.add(
            BundleAddToCartEvent.updateQuantity(
              materialNumber: MaterialNumber('fake-material-1'),
              quantity: 1,
            ),
          ),
        ).called(1);
      });

      testWidgets('Wrong currency visible in bundle add to cart sheet',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty()
                      .copyWith(quantity: 10, sequence: 1, rate: 20),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final price = find.text('SGD 20.00 per item', findRichText: true);

        expect(price, findsOneWidget);
      });

      testWidgets('Error message - Minimum quantity does not satisfy',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty()
                      .copyWith(quantity: 10, sequence: 1, rate: 20),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );

        whenListen(
          bundleAddToCartBloc,
          Stream.fromIterable([
            bundleAddToCartBloc.state.copyWith(
              showErrorMessage: true,
            )
          ]),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final textField = find.descendant(
          of: find.byKey(WidgetKeys.bundleMaterialItem('fake-material-1')),
          matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
        );
        await tester.tap(textField);
        await tester.enterText(textField, '5');
        expect(textField, findsWidgets);
        final sheetAddToCartButton =
            find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
        await tester.tap(sheetAddToCartButton);
        await tester.pumpAndSettle();
        expect(
          find.textContaining('Minimum total purchase qty'),
          findsOneWidget,
        );
      });

      testWidgets(
          'Test CovidWarningMessageBottomSheet appeared when cart contains FOC materials',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty()
                      .copyWith(quantity: 10, sequence: 1, rate: 20),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                quantity: MaterialQty(15),
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );

        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo:
                    MaterialInfo.empty().copyWith(isFOCMaterial: true),
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final textField = find.descendant(
          of: find.byKey(WidgetKeys.bundleMaterialItem('fake-material-1')),
          matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
        );
        await tester.tap(textField);
        await tester.enterText(textField, '15');
        expect(textField, findsWidgets);
        final sheetAddToCartButton =
            find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
        await tester.tap(sheetAddToCartButton);
        await tester.pumpAndSettle();
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(addToCartErrorSection, findsOneWidget);
      });

      //TODO(Hob): Update unit test later

      // testWidgets(
      //     'expiry date displayed on bundle materials when enabled from config',
      //     (tester) async {
      //   when(() => eligibilityBlocMock.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       salesOrgConfigs: fakeSGSalesOrgConfigs,
      //     ),
      //   );
      //   when(() => bundleAddToCartBloc.state).thenReturn(
      //     BundleAddToCartState.initial().copyWith(
      //       bundle: MaterialInfo.empty().copyWith(
      //         bundle: Bundle.empty().copyWith(
      //           bundleInformation: <BundleInfo>[
      //             BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
      //             BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
      //           ],
      //         ),
      //       ),
      //       bundleMaterials: <MaterialInfo>[
      //         MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('fake-material-1'),
      //           quantity: MaterialQty(6),
      //           stockInfos: <StockInfo>[
      //             StockInfo.empty().copyWith(
      //               inStock: MaterialInStock('Yes'),
      //               expiryDate: DateTimeStringValue('20240603'),
      //             ),
      //           ],
      //         ),
      //         MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('fake-material-2'),
      //           quantity: MaterialQty(16),
      //           stockInfos: <StockInfo>[
      //             StockInfo.empty().copyWith(
      //               inStock: MaterialInStock('Yes'),
      //               expiryDate: DateTimeStringValue('20240604'),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   );
      //   await tester.pumpWidget(getScopedWidget());
      //   await tester.pump();
      //   final bundleAddToCartSheet = find.byKey(
      //     WidgetKeys.bundleAddToCartSheet,
      //   );
      //   final bundleMaterialExpiryDateFinder =
      //       find.byKey(WidgetKeys.bundleMaterialExpiryDate);

      //   expect(bundleAddToCartSheet, findsOneWidget);
      //   expect(bundleMaterialExpiryDateFinder, findsAtLeastNWidgets(2));
      // });

      testWidgets(
          'expiry date displayed on bundle materials when disabled from config',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeTHSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
                  BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(6),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue('20240603'),
                  ),
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(16),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                    expiryDate: DateTimeStringValue('20240604'),
                  )
                ],
              ),
            ],
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final bundleAddToCartSheet = find.byKey(
          WidgetKeys.bundleAddToCartSheet,
        );
        final bundleMaterialExpiryDateFinder =
            find.byKey(WidgetKeys.bundleMaterialExpiryDate);

        expect(bundleAddToCartSheet, findsOneWidget);
        expect(bundleMaterialExpiryDateFinder, findsNothing);
      });

      //TODO(Hob): Update unit test later

      // testWidgets('expiry date displayed on bundle materials Na if empty',
      //     (tester) async {
      //   when(() => eligibilityBlocMock.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       salesOrgConfigs: fakeMYSalesOrgConfigs,
      //     ),
      //   );
      //   when(() => bundleAddToCartBloc.state).thenReturn(
      //     BundleAddToCartState.initial().copyWith(
      //       bundle: MaterialInfo.empty().copyWith(
      //         bundle: Bundle.empty().copyWith(
      //           bundleInformation: <BundleInfo>[
      //             BundleInfo.empty().copyWith(quantity: 10, sequence: 1),
      //             BundleInfo.empty().copyWith(quantity: 20, sequence: 2),
      //           ],
      //         ),
      //       ),
      //       bundleMaterials: <MaterialInfo>[
      //         MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('fake-material-1'),
      //           quantity: MaterialQty(6),
      //           stockInfos: <StockInfo>[
      //             StockInfo.empty().copyWith(
      //               inStock: MaterialInStock('Yes'),
      //               expiryDate: DateTimeStringValue(''),
      //             ),
      //           ],
      //         ),
      //         MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('fake-material-2'),
      //           quantity: MaterialQty(16),
      //         ),
      //       ],
      //     ),
      //   );
      //   await tester.pumpWidget(getScopedWidget());
      //   await tester.pump();
      //   final bundleAddToCartSheet = find.byKey(
      //     WidgetKeys.bundleAddToCartSheet,
      //   );
      //   final bundleMaterialExpiryDateFinder =
      //       find.byKey(WidgetKeys.bundleMaterialExpiryDate);
      //   final expiryDateTextFinder = find.text('EXP: NA');

      //   expect(bundleAddToCartSheet, findsOneWidget);
      //   expect(bundleMaterialExpiryDateFinder, findsAtLeastNWidgets(2));
      //   expect(expiryDateTextFinder, findsAtLeastNWidgets(2));
      // });

      testWidgets(
          'Test CovidWarningMessageBottomSheet processed button tap appeared when cart contains FOC materials',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty()
                      .copyWith(quantity: 10, sequence: 1, rate: 20),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                quantity: MaterialQty(15),
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );

        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo:
                    MaterialInfo.empty().copyWith(isFOCMaterial: true),
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final textField = find.descendant(
          of: find.byKey(WidgetKeys.bundleMaterialItem('fake-material-1')),
          matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
        );
        await tester.tap(textField);
        await tester.enterText(textField, '15');
        expect(textField, findsWidgets);
        final sheetAddToCartButton =
            find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
        final addToCartErrorSectionProceed =
            find.byKey(WidgetKeys.addToCartErrorSectionProceed);
        await tester.tap(sheetAddToCartButton);
        await tester.pumpAndSettle();
        final addToCartErrorSection =
            find.byKey(WidgetKeys.addToCartErrorSection);
        expect(addToCartErrorSection, findsOneWidget);
        expect(addToCartErrorSectionProceed, findsOneWidget);
        await tester.tap(addToCartErrorSectionProceed);
        await tester.pumpAndSettle();
        verify(
          () => cartMockBloc.add(
            const CartEvent.clearCart(),
          ),
        ).called(1);
      });
      testWidgets(
          'Test CovidWarningMessageBottomSheet upsert cart call after processed button tap appeared when cart contains FOC materials',
          (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeSGSalesOrgConfigs,
          ),
        );
        when(() => bundleAddToCartBloc.state).thenReturn(
          BundleAddToCartState.initial().copyWith(
            bundle: MaterialInfo.empty().copyWith(
              bundle: Bundle.empty().copyWith(
                bundleInformation: <BundleInfo>[
                  BundleInfo.empty()
                      .copyWith(quantity: 10, sequence: 1, rate: 20),
                ],
              ),
            ),
            bundleMaterials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                quantity: MaterialQty(15),
                materialNumber: MaterialNumber('fake-material-1'),
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
              ),
            ],
          ),
        );

        when(() => cartMockBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo:
                    MaterialInfo.empty().copyWith(isFOCMaterial: true),
              )
            ],
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final textField = find.descendant(
          of: find.byKey(WidgetKeys.bundleMaterialItem('fake-material-1')),
          matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
        );
        await tester.tap(textField);
        await tester.enterText(textField, '15');
        expect(textField, findsWidgets);
        final sheetAddToCartButton =
            find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);
        whenListen(
          cartMockBloc,
          Stream.fromIterable([
            CartState.initial().copyWith(
              isClearing: true,
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo:
                      MaterialInfo.empty().copyWith(isFOCMaterial: true),
                )
              ],
            ),
            CartState.initial(),
          ]),
        );
        await tester.tap(sheetAddToCartButton);
        await tester.pumpAndSettle();
        verify(
          () => cartMockBloc.add(
            CartEvent.upsertCartItems(
              priceAggregate: PriceAggregate.empty().copyWith(
                bundle: Bundle.empty().copyWith(
                  materials: [
                    MaterialInfo.empty().copyWith(
                      quantity: MaterialQty(15),
                      materialNumber: MaterialNumber('fake-material-1'),
                    ),
                  ],
                  bundleCode: '',
                  bundleName: BundleName(''),
                ),
              ),
            ),
          ),
        ).called(1);
      });
    },
  );
}
