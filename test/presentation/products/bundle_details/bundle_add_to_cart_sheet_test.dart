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
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
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
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
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
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('SGD'),
            ),
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
    },
  );
}
