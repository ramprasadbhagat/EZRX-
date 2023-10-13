// ignore_for_file: unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/widgets/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class DiscountOverrideRepositoryMock extends Mock
    implements DiscountOverrideRepository {}

class DiscountOverrideBlocMock
    extends MockBloc<DiscountOverrideEvent, DiscountOverrideState>
    implements DiscountOverrideBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

final locator = GetIt.instance;

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late ProductImageBloc productImageBloc;
  late List<PriceAggregate> mockCartItemWithDataList;
  late List<PriceAggregate> mockCartItemWithDataList2;
  late List<PriceAggregate> mockCartItemBundles;
  late List<PriceAggregate> mockCartItemBundles2;
  late List<PriceAggregate> mockCartItemDiscountBundles;
  late MaterialListBloc materialListBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late DiscountOverrideBloc discountOverrideBlocMock;
  late List<PriceAggregate> mockCartItemWithDataListOverride;
  late Map<MaterialNumber, Price> mockPriceList;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  final AddToCartBloc addToCartBlocMock = AddToCartBlocMock();
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouterMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late CartItem mockCartItemWithOutBatch;
  late CartItem mockCartItemWithBatch;
  late List<StockInfo> batchStockInfoMock;
  late List<PriceAggregate> mockCartItems;
  late List<PriceAggregate> mockCartBundleItems;
  final routeData = RouteData(
    route: const RouteMatch(
      name: 'CartsPageRoute',
      segments: ['orders', 'cart'],
      path: 'orders/cart',
      stringMatch: 'orders/cart',
      key: ValueKey('CartsPageRoute'),
    ),
    router: MockAppRouter(),
    pendingChildren: [],
  );

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => DiscountOverrideRepositoryMock());
    locator.registerFactory(
      () => DiscountOverrideBloc(repository: DiscountOverrideRepositoryMock()),
    );
    locator.registerFactory(() => AppRouter());
    locator.registerFactory<AddToCartBloc>(() => addToCartBlocMock);
    locator.registerFactory<TenderContractBloc>(() => tenderContractBlocMock);
    autoRouterMock = MockAppRouter();
    mockCartBundleItems = await CartLocalDataSource().upsertCartItems();
    mockCartItems = await CartLocalDataSource().upsertCart();
  });
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      materialListBlocMock = MaterialListBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      salesOrgBloc = SalesOrgBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      userBloc = UserBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      discountOverrideBlocMock = DiscountOverrideBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = MockAppRouter();
      productImageBloc = ProductImageBlocMock();

      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );

      mockCartItemBundles2 = [
        PriceAggregate.empty().copyWith(
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('No'),
                  )
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                quantity: MaterialQty(10),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  )
                ],
              ),
            ],
            bundleInformation: [],
            bundleCode: '',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-bundle'),
            type: MaterialInfoType('bundle'),
          ),
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            addOosMaterials: OosMaterial(true),
            oosValue: OosValue(1),
          ),
        ),
      ];

      mockCartItemBundles = [
        PriceAggregate.empty().copyWith(
          quantity: 10,
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-1'),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  )
                ],
              ),
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('fake-material-2'),
                stockInfos: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  )
                ],
              ),
            ],
            bundleInformation: [],
            bundleCode: '',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('fake-bundle'),
            type: MaterialInfoType('bundle'),
          ),
        ),
      ];

      mockCartItemDiscountBundles = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            ),
          ],
          quantity: 1,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(
              100.0,
            ),
          ),
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[],
            bundleInformation: [],
            bundleCode: '123',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            )
          ],
          quantity: 1,
          bundle: Bundle.empty().copyWith(
            bundleCode: '124',
            bundleInformation: [
              BundleInfo.empty().copyWith(
                rate: -10,
              ),
            ],
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168441'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemWithDataList = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
              ),
              materialDescription: ' Mosys D',
            ),
          ],
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemWithDataList2 = [
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];
      mockCartItemWithDataListOverride = [
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            isPriceOverride: true,
          ),
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];
      mockCartItemWithOutBatch = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023168451'),
            ),
          ),
        ],
        itemType: CartItemType.material,
      );

      batchStockInfoMock = [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          inStock: MaterialInStock('Yes'),
          expiryDate: DateTimeStringValue('NA'),
          salesDistrict: '',
          batch: BatchNumber('fake-batch'),
        ),
      ];
      mockCartItemWithBatch = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023168451'),
            ),
            stockInfo: batchStockInfoMock.first,
            stockInfoList: batchStockInfoMock,
          ),
        ],
        itemType: CartItemType.material,
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      );
      when(() => materialPriceBloc.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: mockPriceList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => userBloc.state).thenReturn(UserState.initial());
      when(() => discountOverrideBlocMock.state)
          .thenReturn(DiscountOverrideState.initial());
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial().copyWith());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => salesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableReferenceNote: true,
            enableVat: true,
            enableFutureDeliveryDay: true,
            enableMobileNumber: true,
            enableSpecialInstructions: true,
            disableOrderType: false,
            enableCollectiveNumber: true,
            enablePaymentTerms: true,
            enableRemarks: true,
            priceOverride: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ),
      );
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
        ),
      );
      when(() => userBloc.state).thenReturn(
        UserState.initial()
            .copyWith(user: User.empty().copyWith(hasBonusOverride: false)),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          selectedOrderType: OrderDocumentType.empty().copyWith(
            documentType: DocumentType('Test (ZPOR)'),
          ),
        ),
      );
      when(() => priceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => autoRouterMock.currentPath).thenReturn('orders/cart');
      when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
      when(() => productImageBloc.state).thenReturn(
        ProductImageState.initial(),
      );
      when(() => autoRouterMock.pop()).thenAnswer((invocation) async => true);
    },
  );
  group(
    'Test Cart_Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBloc),
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBloc,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AddToCartBloc>(
              create: ((context) => addToCartBlocMock),
            ),
            BlocProvider<MaterialListBloc>(
              create: ((context) => materialListBlocMock),
            ),
            BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
            BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<OrderEligibilityBloc>(
              create: (context) => orderEligibilityBlocMock,
            ),
            BlocProvider<PriceOverrideBloc>(
              create: (context) => priceOverrideBloc,
            ),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBloc,
            ),
          ],
          child: const CartPage(),
        );
      }

      testWidgets(
        'Load Cart Page',
        (tester) async {
          await tester.pumpWidget(getWidget());

          await tester.pump();
          final cartPage = find.byKey(const Key('cartpage'));
          expect(cartPage, findsOneWidget);
        },
      );
      testWidgets('Test fetch fail Dynamic', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final expectedStates = [
          CartState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
              const Right(
                'No Error',
              ),
            ),
          ),
        ];

        whenListen(cartBloc, Stream.fromIterable(expectedStates));

        await tester.pumpWidget(getWidget());

        // verify(() => authBlocMock.add(const AuthEvent.authCheck()));
      });

      testWidgets('Delete item from cart by swapping', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList2,
            isFetching: true,
            isClearing: false,
            isUpserting: false,
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pump();
        final listWidget = find.byType(CartProductTile);
        expect(listWidget, findsOneWidget);
        await tester.drag(listWidget, const Offset(-500, 0));
        await tester.pump();
        final deleteIcon = find.byIcon(Icons.delete_outline);
        expect(deleteIcon, findsOneWidget);

        await tester.tap(
          deleteIcon,
          warnIfMissed: true,
        );
        await tester.pump(const Duration(seconds: 1));

        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              priceAggregate: mockCartItemWithDataList2.first,
              quantity: 0,
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Test SnackBarMessage when delete the item from cart by swapping',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList2,
            isClearing: true,
            isUpserting: true,
          ),
        );
        final expectedStates = [
          CartState.initial().copyWith(
            cartProducts: [
              ...mockCartItemWithDataList2,
              ...mockCartItemWithDataList2
            ],
            isClearing: false,
            isUpserting: false,
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());

        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        final msg = find.textContaining(
          'Item has been removed from cart.'.tr(),
        );
        expect(msg, findsOneWidget);
      });
      testWidgets('Test SnackBarMessage when delete the item from cart ',
          (tester) async {
        when(
          () => autoRouterMock.currentPath,
        ).thenReturn('orders/cart');
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isClearing: true,
          ),
        );
        final expectedStates = [
          CartState.initial().copyWith(
            cartProducts: [
              ...mockCartItemWithDataList2,
            ],
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();
        final deleteIcon = find.byIcon(
          Icons.delete_outlined,
        );
        expect(deleteIcon, findsOneWidget);

        await tester.tap(
          deleteIcon,
          warnIfMissed: true,
        );

        final closeIcon = find.widgetWithIcon(
          CustomSnackBar,
          Icons.close,
        );
        expect(closeIcon, findsOneWidget);
      });

      testWidgets('Bundle item allowed out of stock material', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemBundles2,
            config: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: true,
            ),
          ),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              addOosMaterials: OosMaterial(true),
              oosValue: OosValue(1),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        expect(find.byType(StatusLabel), findsOneWidget);
        expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
        await tester.tap(find.byKey(WidgetKeys.checkoutButton));
        await tester.pump();
        expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
        expect(
          find.byKey(const ValueKey('preOrderMaterialfake-material-1')),
          findsOneWidget,
        );
      });
      testWidgets('Test Start browsing onTap', (tester) async {
        await tester.pumpWidget(getWidget());

        await tester.pump();

        final startBrowsingButton =
            find.byKey(WidgetKeys.startBrowsingProducts);

        when(() => autoRouterMock.navigateNamed('main/products'))
            .thenAnswer((invocation) => Future(() => null));

        expect(startBrowsingButton, findsOneWidget);

        await tester.tap(
          startBrowsingButton,
        );

        await tester.pumpAndSettle();

        verify(() => autoRouterMock.navigateNamed('main/products')).called(1);
      });

      // testWidgets('Test have cart item list and Refresh', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       // selectedItemsMaterialNumber: mockMaterialItemList,
      //       cartItems: [
      //         CartItem.bundle(mockCartItemBundles),
      //         mockCartItemWithOutBatch,
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final noBundleList = find.text('No bundle found');
      //   expect(noBundleList, findsNothing);
      //   final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
      //   expect(scrollWidget, findsOneWidget);

      //   final cartBundleItemTile =
      //       find.byWidgetPredicate((w) => w is CartBundleItemTile);

      //   expect(cartBundleItemTile, findsOneWidget);
      //   final cartTile =
      //       find.byWidgetPredicate((w) => w is CartMaterialItemTile);

      //   expect(cartTile, findsOneWidget);
      //   final selectAllButton = find.byKey(const Key('selectAllButton'));

      //   expect(selectAllButton, findsOneWidget);

      //   final totalSection = find.byKey(const Key('totalSection'));

      //   expect(totalSection, findsOneWidget);

      //   await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
      //   await tester.pump();
      //   await tester.pump(const Duration(seconds: 1));
      //   await tester.pump(const Duration(seconds: 1));
      //   await tester.pump(const Duration(seconds: 1));
      //   verify(
      //     () => cartBloc.add(
      //       CartEvent.fetch(
      //         salesOrganisationConfigs:
      //     SalesOrganisationConfigs.empty().copyWith(
      //   enableReferenceNote: true,
      //   enableVat: true,
      //   enableFutureDeliveryDay: true,
      //   enableMobileNumber: true,
      //   enableSpecialInstructions: true,
      //   disableOrderType: false,
      //   enableCollectiveNumber: true,
      //   enablePaymentTerms: true,
      //   enableRemarks: true,
      //   priceOverride: true,
      // ),
      //         salesOrganisation: SalesOrganisation.empty()
      //             .copyWith(salesOrg: SalesOrg('2601')),
      //         customerCodeInfo:
      //             CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1234'),
      //         shipToInfo: ShipToInfo.empty(),
      //         doNotAllowOutOfStockMaterials: true,
      //         comboDealEligible: false,
      //         isSpecialOrderType: false,
      //       ),
      //     ),
      //   ).called(1);
      // });

      // testWidgets('Test have cart item list add and slide and remove item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final addWidget = find.byKey(Key(
      //       'cartAdd${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   await tester.tap(addWidget);
      //   await tester.pump();

      //   await tester.drag(
      //       find.byKey(const Key('slidable')), const Offset(-300, 0.0));
      //   await tester.pump();

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list add and decrease item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final addWidget = tester.widget(find.byKey(Key(
      //       'cartAdd${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(addWidget));
      //   await tester.pump();

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list decrease item', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list with one remark message',
      //     (tester) async {
      //   final mockCartItemWithRemarkDataList = [
      //     mockCartItemWithDataList2.first.copyWith(
      //       materialInfo: mockCartItemWithDataList2.first.materialInfo.copyWith(
      //         remarks: 'good product',
      //       ),
      //     ),
      //   ];

      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithRemarkDataList.first)
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //         configs: SalesOrganisationConfigs.empty().copyWith(
      //       enableRemarks: true,
      //     )),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithRemarkDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));

      //   final remarkWidget = find.byKey(Key(
      //       'remarks${mockCartItemWithRemarkDataList[0].materialInfo.remarks}'));
      //   expect(remarkWidget, findsOneWidget);
      // });

      // testWidgets('Test have cart item list and Material price loading NA',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => materialPriceBloc.state).thenReturn(
      //     MaterialPriceState.initial().copyWith(
      //       materialPrice: {},
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final finder = find.byKey(const Key('price-loading'));
      //   expect(finder, findsNothing);
      // });
      // testWidgets('Test have cart item list and Material price loading Builder',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => materialPriceBloc.state).thenReturn(
      //     MaterialPriceState.initial().copyWith(
      //       materialPrice: {},
      //       isFetching: true,
      //     ),
      //   );

      //   final expectedStates = [
      //     MaterialPriceState.initial().copyWith(
      //       isFetching: false,
      //     ),
      //   ];
      //   whenListen(materialPriceBloc, Stream.fromIterable(expectedStates));

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final finder = find.byKey(const Key('price-loading'));
      //   expect(finder, findsNothing);
      // });

      // testWidgets('Test have zmg Discount cart item', (tester) async {
      //   when(() => materialPriceBloc.state)
      //       .thenReturn(MaterialPriceState.initial().copyWith(
      //     isFetching: false,
      //     materialPrice: {
      //       MaterialNumber('000000000023168451'): Price.empty().copyWith(
      //         zmgDiscount: true,
      //         tiers: [
      //           PriceTier(
      //             tier: 'c',
      //             items: [PriceTierItem.empty()],
      //           )
      //         ],
      //       )
      //     },
      //   ));
      //   when(() => addToCartBlocMock.state).thenReturn(
      //     AddToCartState.initial().copyWith(
      //       isFetching: false,
      //       cartItem: PriceAggregate.empty().copyWith(
      //         materialInfo: MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('000000000023168451'),
      //           hasValidTenderContract: true,
      //         ),
      //         price: Price.empty().copyWith(
      //           zmgDiscount: true,
      //           tiers: [
      //             PriceTier(
      //               tier: 'c',
      //               items: [PriceTierItem.empty()],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   );
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithDataList2.first.copyWith(
      //           price: Price.empty().copyWith(
      //             zmgDiscount: true,
      //             tiers: [
      //               PriceTier(
      //                 tier: 'c',
      //                 items: [PriceTierItem.empty()],
      //               )
      //             ],
      //           ),
      //         ))
      //       ],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();
      //   final tierLabel = find.byKey(const Key('tieredPricingLogo'));
      //   expect(tierLabel, findsOneWidget);
      //   await tester.pump();
      //   await tester.tap(
      //     tierLabel,
      //   );
      //   await tester.pump();
      //   expect(autoRouter.currentPath, 'orders/update_cart');
      // });

      // testWidgets('Check if price is not overrided ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));

      //   await tester.pump();
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   final unitPrice = find.byKey(const Key('unitPrice'));

      //   expect(
      //     (tester.firstWidget(unitPrice) as Text).style!.color,
      //     ZPColors.black,
      //   );
      // });

      // testWidgets('should Price OverRide not Visible ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //         hasPriceOverride: false,
      //       ),
      //     ),
      //   );
      //   when(() => orderEligibilityBlocMock.state).thenReturn(
      //     OrderEligibilityState.initial().copyWith(
      //       configs: SalesOrganisationConfigs.empty().copyWith(
      //         disableOrderType: false,
      //       ),
      //       orderType: 'ZPFC',
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //         hasPriceOverride: false,
      //       ),
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   await tester.pump();
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   await tester.tap(priceWidget);
      //   await tester.pump();
      //   final priceSheet = find.byKey(const Key('priceSheet'));

      //   expect(priceSheet, findsNothing);
      // });

      // testWidgets('open bottom sheet to override price', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));

      //   await tester.pump();
      //   final priceWidget = find.byKey(
      //     Key('priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'),
      //   );
      //   // tester.widget(find.byKey(const Key('priceOverride')));
      //   expect(priceWidget, findsOneWidget);
      //   await tester.tap(
      //     priceWidget,
      //   );
      //   // final bottomSheet = find.byKey(
      //   //   const Key('priceSheetKey'),
      //   // );
      //   // expect(bottomSheet, findsOneWidget);
      // });
      // testWidgets('Check if price is overrided ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithDataListOverride.first)
      //       ],
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   final unitPrice = find.byKey(const Key('unitPrice'));

      //   expect(
      //     (tester.firstWidget(unitPrice) as Text).style!.color,
      //     ZPColors.red,
      //   );
      // });
      // testWidgets('Test discount override', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: true,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //       ),
      //       salesOrgConfigs: SalesOrganisationConfigs.empty()
      //           .copyWith(enableZDP8Override: true),
      //     ),
      //   );
      //   await tester.pumpWidget(getWidget());
      //   await tester.pump();

      //   final discountOverrideFinder =
      //       find.byKey(const Key('discountOverride'));
      //   expect(discountOverrideFinder, findsOneWidget);
      // });
      // testWidgets('Test have cart item list add update a bonus item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);

      //   if (salesOrgBloc.state.configs.enableRemarks) {
      //     final addRemarkButton =
      //         tester.widget(find.byKey(const Key('addRemarksBonus')));
      //     await tester.tap(find.byWidget(addRemarkButton));
      //     await tester.pump();

      //     final addRemarkDialog = find.byKey(const Key('addRemarksDialog'));
      //     expect(addRemarkDialog, findsOneWidget);

      //     const remarkText = '1234';
      //     final textField = find.byKey(const Key('remarkTextField'));
      //     await tester.enterText(textField, remarkText);

      //     final addButton = find.byKey(const Key('add'));
      //     await tester.tap(addButton);
      //     await tester.pump();

      //     verify(
      //       () => cartBloc.add(
      //         CartEvent.addRemarkToBonusItem(
      //           message: remarkText,
      //           bonusItem: mockCartItemWithDataList[0].addedBonusList[0],
      //           item: CartItem.material(mockCartItemWithDataList.first),
      //         ),
      //       ),
      //     ).called(1);
      //   }
      // });

      // testWidgets('Test have Tire Discount cart item', (tester) async {
      //   when(() => materialPriceBloc.state)
      //       .thenReturn(MaterialPriceState.initial().copyWith(
      //     isFetching: false,
      //     materialPrice: {
      //       MaterialNumber('000000000023168451'): Price.empty().copyWith(
      //         zmgDiscount: true,
      //         tiers: [
      //           PriceTier(
      //             tier: 'c',
      //             items: [PriceTierItem.empty()],
      //           )
      //         ],
      //       )
      //     },
      //   ));
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(
      //           mockCartItemWithDataList2.first.copyWith(
      //             price: Price.empty().copyWith(
      //               zmgDiscount: true,
      //               tiers: [
      //                 PriceTier(
      //                   tier: 'c',
      //                   items: [PriceTierItem.empty()],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => addToCartBlocMock.state).thenReturn(
      //     AddToCartState.initial().copyWith(
      //       isFetching: false,
      //       cartItem: PriceAggregate.empty().copyWith(
      //         price: Price.empty().copyWith(
      //           tiers: [
      //             PriceTier(
      //               tier: 'c',
      //               items: [PriceTierItem.empty()],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   );
      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();
      //   final tierDiscountLable = find.byKey(const Key('tieredPricingLogo'));
      //   expect(tierDiscountLable, findsOneWidget);
      //   await tester.tap(
      //     tierDiscountLable,
      //   );
      //   await tester.pump();
      //   expect(autoRouter.currentPath, 'orders/update_cart');
      // });

      // testWidgets('Test have Bundle Discount cart item', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemDiscountBundles
      //           .map((e) => CartItem.bundle([e]))
      //           .toList(),
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();

      //   final cartBundleItemTile = find.byType(CartBundleItemTile);
      //   expect(cartBundleItemTile, findsNWidgets(2));

      //   expect(find.byKey(const Key('cartBundleItemTotal')), findsNWidgets(2));

      //   expect(find.textContaining('Total Discount: '), findsOneWidget);
      //   expect(find.textContaining('Total Amount: '), findsOneWidget);
      // });

      // testWidgets('Test have cart item list add delete a bonus item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map(
      //             (e) => CartItem.material(e.copyWith(
      //               materialInfo: e.materialInfo.copyWith(
      //                 materialGroup4: MaterialGroup.four('none'),
      //                 hidePrice: false,
      //               ),
      //               price: e.price.copyWith(additionalBonusEligible: true),
      //             )),
      //           )
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //         user: User.empty().copyWith(
      //       role: Role.empty().copyWith(
      //         type: RoleType('external_sales_rep'),
      //       ),
      //       hasBonusOverride: true,
      //     )),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();

      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final item = find.byKey(const Key('bonusTile'));
      //   expect(item, findsOneWidget);
      //   final addWidget = tester.widget(
      //     find.byKey(
      //       const Key('addBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(addWidget),
      //   );

      //   final removeWidget = tester.widget(
      //     find.byKey(
      //       const Key('removeBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(removeWidget),
      //   );
      //   final deleteWidget = tester.widget(
      //     find.byKey(
      //       const Key('deleteBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(deleteWidget),
      //   );

      //   final addBonusButton = find.byKey(
      //     const Key('addBonusButton'),
      //   );
      //   expect(addBonusButton, findsOneWidget);
      //   await tester.tap(addBonusButton);
      //   await tester.pump();
      //   expect(autoRouter.current.name, BonusAddPageRoute.name);
      // });

      // testWidgets('Test have cart item remarks update', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );

      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //       configs: SalesOrganisationConfigs.empty().copyWith(
      //         enableRemarks: true,
      //       ),
      //     ),
      //   );
      //   final expectedStates = [
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //     ),
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //     ),
      //   ];

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);
      //   //final addRemarkDialog = find.byKey(const Key('addRemarksDialog'));
      //   final addRemarkButton =
      //       tester.widget(find.byKey(const Key('addRemarksBonus')));
      //   await tester.tap(find.byWidget(addRemarkButton));
      //   whenListen(
      //     cartBloc,
      //     Stream.fromIterable(expectedStates),
      //     initialState: CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );
      //   await tester.pump();
      // });

      // testWidgets('cart order summary ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //       // selectedItemsMaterialNumber: mockCartItemWithDataList
      //       //     .map<MaterialNumber>((e) => e.getMaterialNumber)
      //       //     .toList()
      //     ),
      //   );
      //   when(() => customerCodeBloc.state).thenReturn(
      //     CustomerCodeState.initial().copyWith(
      //       customerCodeInfo: CustomerCodeInfo.empty().copyWith(
      //         customerCodeSoldTo: '1234',
      //         billToInfos: [
      //           BillToInfo.empty().copyWith(
      //             billToCustomerCode: 'test',
      //           )
      //         ],
      //       ),
      //     ),
      //   );
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //       configs:
      //           SalesOrganisationConfigs.empty().copyWith(enableBillTo: true),
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final orderSummaryButton = find.byKey(const Key('orderSummaryButton'));
      //   expect(orderSummaryButton, findsOneWidget);
      //   await tester.tap(orderSummaryButton);
      // });

      // testWidgets('cart item radio button', (tester) async {
      //   final expectedStates = [
      //     CartState.initial().copyWith(
      //       cartItems: [],
      //       isFetching: true,
      //       apiFailureOrSuccessOption:
      //           optionOf(const Left(ApiFailure.other('Fake-Error'))),
      //     ),
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: false,
      //       apiFailureOrSuccessOption: none(),
      //     )
      //   ];
      //   whenListen(cartBloc, Stream.fromIterable(expectedStates));
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //         enableTaxAtTotalLevelOnly: true,
      //       ),
      //     ),
      //   );
      //   const taxCode = 'VAT';
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //         salesOrganisation: SalesOrganisation.empty().copyWith(
      //       salesOrg: SalesOrg(taxCode),
      //     )),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final selectAllRadioButton =
      //       find.byKey(const Key('selectAllRadioButton'));
      //   expect(selectAllRadioButton, findsOneWidget);
      //   await tester.tap(selectAllRadioButton);
      //   verify(() => cartBloc.add(
      //         const CartEvent.selectAllButtonTapped(),
      //       )).called(1);
      // });

      testWidgets('cart page Customer Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byType(AccountSuspendedBanner);
        expect(accountSuspendedBanner, findsOneWidget);
        final accountSuspendedBannerTest = find.textContaining(
          'Customer is suspended, please contact ZP Admin for support',
        );
        expect(accountSuspendedBannerTest, findsOneWidget);
      });

      testWidgets('cart page Ships To Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byType(AccountSuspendedBanner);
        expect(accountSuspendedBanner, findsOneWidget);
        final accountSuspendedBannerTest = find.textContaining(
          'Customer is suspended, please contact ZP Admin for support',
        );
        expect(accountSuspendedBannerTest, findsOneWidget);
      });

      testWidgets(
        'Do not Show tax details on material level when displayItemTaxBreakdown is disabled for vn',
        (tester) async {
          when(() => salesOrgBloc.state).thenReturn(
            SalesOrgState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('3700'),
              ),
              configs: SalesOrganisationConfigs.empty().copyWith(
                displayItemTaxBreakdown: false,
                vatValue: 5,
              ),
            ),
          );

          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
                    tax: 10,
                  ),
                  price: Price.empty().copyWith(
                    lastPrice: MaterialPrice(234.50),
                  ),
                ),
              ],
            ),
          );

          await tester.pumpWidget(getWidget());

          await tester.pump();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsNothing);
        },
      );

      testWidgets(
        'Do not Show tax details on Subtotal level when displaySubtotalTaxBreakdown is enabled for tw',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(234.50),
                  ),
                ),
              ],
              config: SalesOrganisationConfigs.empty().copyWith(
                displayItemTaxBreakdown: false,
                displaySubtotalTaxBreakdown: true,
                vatValue: 10,
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsNothing);
          expect(cartBloc.state.grandTotal, 257.95);
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for vn with material level tax',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 5,
            currency: Currency('vnd'),
          );
          final salesOrgState = SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('3700'),
            ),
            configs: salesOrgConfig,
          );
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: salesOrgConfig,
              ),
            ],
          );

          when(() => salesOrgBloc.state).thenReturn(
            salesOrgState,
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: salesOrgConfig,
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('3700'),
              ),
            ),
          );
          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text('(10% tax)');
          expect(taxPercentageFinder, findsOneWidget);
          final vatPercentageFinder = find.text('(5% tax)');
          expect(vatPercentageFinder, findsNothing);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              'VND $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for my with material level tax',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 5,
            currency: Currency('myr'),
          );
          final salesOrgState = SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            configs: salesOrgConfig,
          );
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: salesOrgConfig,
              ),
            ],
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: salesOrgConfig,
              salesOrganisation: SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('2001'),
              ),
            ),
          );
          when(() => salesOrgBloc.state).thenReturn(
            salesOrgState,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          await tester.pumpWidget(getWidget());

          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text('(10% tax)');
          expect(taxPercentageFinder, findsNothing);
          final vatPercentageFinder = find.text('(5% tax)');
          expect(vatPercentageFinder, findsOneWidget);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              'MYR $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for my with material level tax on pre-Ordermodel',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 5,
            currency: Currency('myr'),
            addOosMaterials: OosMaterial(true),
            oosValue: OosValue(1),
          );
          final salesOrgState = SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            configs: salesOrgConfig,
          );
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123456789'),
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                  tax: 10,
                ),
                stockInfoList: <StockInfo>[
                  StockInfo.empty().copyWith(
                    batch: BatchNumber('ABCD'),
                    inStock: MaterialInStock('No'),
                  ),
                ],
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: salesOrgConfig,
              ),
            ],
          );

          when(() => salesOrgBloc.state).thenReturn(
            salesOrgState,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: salesOrgConfig,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final taxLevelFinder = find.text('Total with tax:');
          expect(taxLevelFinder, findsOneWidget);
          final taxPercentageFinder = find.text('(10% tax)');
          expect(taxPercentageFinder, findsNothing);
          final vatPercentageFinder = find.text('(5% tax)');
          expect(vatPercentageFinder, findsOneWidget);
          final listPriceWithTax = cartState
              .cartProducts.first.finalPriceTotalWithTax
              .toStringAsFixed(2);
          expect(
            find.text(
              'MYR $listPriceWithTax',
              findRichText: true,
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Show out of stock tag when oos is enabled for salesrep but user is a client',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 5,
            currency: Currency('myr'),
            oosValue: OosValue(0),
            addOosMaterials: OosMaterial(true),
          );
          final salesOrgState = SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            configs: salesOrgConfig,
          );
          final cartState = CartState.initial().copyWith(
            cartProducts: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123456789'),
                  stockInfos: <StockInfo>[],
                  quantity: MaterialQty(1),
                  taxClassification:
                      MaterialTaxClassification('Product : Full Tax'),
                ),
                stockInfoList: <StockInfo>[
                  StockInfo.empty().copyWith(
                    inStock: MaterialInStock('No'),
                  )
                ],
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(234.50),
                ),
                salesOrgConfig: salesOrgConfig,
              ),
            ],
          );

          final eligibilityState = EligibilityState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('client_user'),
              ),
            ),
            salesOrgConfigs: salesOrgConfig,
          );

          when(() => salesOrgBloc.state).thenReturn(
            salesOrgState,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => eligibilityBloc.state).thenReturn(
            eligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final preOrderTag = find.text('Preorder');
          expect(preOrderTag, findsNothing);
          final oosTag = find.text('Out of stock');
          expect(oosTag, findsOneWidget);
          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          expect(
            checkoutButton,
            findsOneWidget,
          );
          await tester.pump();
          expect(
            (tester.widget(checkoutButton) as ElevatedButton).enabled,
            true,
          );
        },
      );

      //     testWidgets('Test have cart item update cart', (tester) async {
      //       final newList = [
      //         mockCartItemWithDataList.first.copyWith(
      //           materialInfo: mockCartItemWithDataList.first.materialInfo.copyWith(
      //             hasValidTenderContract: true,
      //           ),
      //           tenderContract: TenderContract.empty().copyWith(
      //             contractNumber:
      //                 TenderContractNumber.tenderContractItemNumber('0000123'),
      //             tenderOrderReason: TenderContractReason('750'),
      //           ),
      //         )
      //       ];
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.material(newList.first)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => tenderContractBlocMock.state)
      //           .thenReturn(TenderContractState.initial().copyWith(
      //               selectedTenderContract: TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000123'),
      //                 tenderOrderReason: TenderContractReason('750'),
      //               ),
      //               apiFailureOrSuccessOption: optionOf(const Right('success')),
      //               isFetching: false,
      //               tenderContractList: [
      //             TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //             ),
      //             TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000125'),
      //                 tenderOrderReason: TenderContractReason('750'))
      //           ]));
      //       when(() => addToCartBlocMock.state).thenReturn(
      //         AddToCartState.initial().copyWith(
      //           isFetching: false,
      //           cartItem: mockCartItemBundles.first.copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //                 hasValidTenderContract: true,
      //                 materialNumber: MaterialNumber('0000123')),
      //             tenderContract: TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //               tenderOrderReason: TenderContractReason('750'),
      //             ),
      //           ),
      //         ),
      //       );
      //       whenListen(tenderContractBlocMock,
      //           Stream.fromIterable([tenderContractBlocMock.state]));
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final item = find.byKey(Key(
      //           'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //       expect(item, findsOneWidget);
      //       await tester.tap(item);
      //       await tester.pump();
      //       expect(autoRouter.currentPath, 'orders/update_cart');
      //     });

      //     testWidgets('Test have cart item update cart button pressed',
      //         (tester) async {
      //       final newList = [
      //         mockCartItemWithDataList.first.copyWith(
      //           materialInfo: mockCartItemWithDataList.first.materialInfo.copyWith(
      //             hasValidTenderContract: true,
      //           ),
      //           tenderContract: TenderContract.empty().copyWith(
      //             contractNumber:
      //                 TenderContractNumber.tenderContractItemNumber('0000123'),
      //             tenderOrderReason: TenderContractReason('750'),
      //           ),
      //         )
      //       ];
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.material(newList.first)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => tenderContractBlocMock.state)
      //           .thenReturn(TenderContractState.initial().copyWith(
      //               selectedTenderContract: TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000123'),
      //                 tenderOrderReason: TenderContractReason('750'),
      //               ),
      //               apiFailureOrSuccessOption: optionOf(const Right('success')),
      //               isFetching: false,
      //               tenderContractList: [
      //             TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //             ),
      //             TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000125'),
      //                 tenderOrderReason: TenderContractReason('750'))
      //           ]));
      //       when(() => addToCartBlocMock.state).thenReturn(
      //         AddToCartState.initial().copyWith(
      //           isFetching: false,
      //           cartItem: mockCartItemBundles.first.copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //                 hasValidTenderContract: true,
      //                 materialNumber: MaterialNumber('0000123')),
      //             tenderContract: TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //               tenderOrderReason: TenderContractReason('750'),
      //             ),
      //           ),
      //         ),
      //       );
      //       whenListen(tenderContractBlocMock,
      //           Stream.fromIterable([tenderContractBlocMock.state]));
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final item = find.byKey(Key(
      //           'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //       expect(item, findsOneWidget);
      //       await tester.tap(item);
      //       await tester.pump();
      //       expect(autoRouter.currentPath, 'orders/update_cart');
      //     });

      //     testWidgets('Test to have correct GST and totalPrice', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.bundle(mockCartItemBundles2)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final taxCodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxCodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'), findsOneWidget);
      //       expect(
      //           cartBloc.state.grandTotal(
      //             isMYMarketSalesRep: false,
      //           ),
      //           108.0);
      //     });

      //     testWidgets(
      //         'Test to have correct price for special ordertype with market TH',
      //         (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [
      //             CartItem.material(
      //               mockCartItemWithDataList.first.copyWith(
      //                 price: Price.empty().copyWith(
      //                   finalPrice: MaterialPrice(108),
      //                 ),
      //               ),
      //             ),
      //           ],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => orderDocumentTypeBlocMock.state).thenReturn(
      //         OrderDocumentTypeState.initial().copyWith(
      //             isOrderTypeSelected: true,
      //             selectedOrderType: OrderDocumentType.empty().copyWith(
      //               documentType: DocumentType('ZPFB'),
      //             )),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //           salesOrganisation: SalesOrganisation.empty().copyWith(
      //             salesOrg: SalesOrg('2902'),
      //           ),
      //           selectedOrderType: OrderDocumentType.empty().copyWith(
      //             documentType: DocumentType('ZPFB'),
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //           salesOrganisation: SalesOrganisation.empty().copyWith(
      //             salesOrg: SalesOrg('2902'),
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      //       tester.binding.window.devicePixelRatioTestValue = 1.0;
      //       final taxcodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxcodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'.tr()), findsOneWidget);
      //       final txt = find.text(': NA 108');
      //       expect(txt, findsAtLeastNWidgets(1));
      //     });

      //     testWidgets('Test to have correct GST and totalPrice with Bundle',
      //         (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.bundle(mockCartItemBundles2)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => orderDocumentTypeBlocMock.state).thenReturn(
      //         OrderDocumentTypeState.initial().copyWith(
      //             isOrderTypeSelected: true,
      //             selectedOrderType: OrderDocumentType.empty().copyWith(
      //               documentType: DocumentType('ZPFB'),
      //             )),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //             currency: Currency('SGD'),
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //             currency: Currency('SGD'),
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });
      //       tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      //       tester.binding.window.devicePixelRatioTestValue = 1.0;

      //       await tester.pumpAndSettle(const Duration(seconds: 5));
      //       final taxCodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxCodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'), findsOneWidget);
      //       final txt = find.text(': SGD 108');
      //       expect(txt, findsAtLeastNWidgets(1));
      //       expect(
      //           cartBloc.state.grandTotal(
      //             isMYMarketSalesRep: false,
      //           ),
      //           108.0);
      //     });

      //     testWidgets('cart Item with no valid batch valid ', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [mockCartItemWithOutBatch],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             enableBatchNumber: true,
      //           ),
      //         ),
      //       );

      //       await tester.pumpWidget(getWidget());
      //       await tester.pump();

      //       final batchNumber = find.byKey(ValueKey(
      //           'batchNumber_${mockCartItemWithOutBatch.materials.first.materialNumberString}'));
      //       expect(batchNumber, findsOneWidget);
      //     });

      //     testWidgets('cart Item with valid batch valid ', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [mockCartItemWithBatch],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             enableBatchNumber: true,
      //           ),
      //         ),
      //       );

      //       await tester.pumpWidget(getWidget());
      //       await tester.pump();

      //       final batchNumber = find.byKey(ValueKey(
      //           'batchNumber_${mockCartItemWithBatch.materials.first.materialNumberString}'));
      //       expect(batchNumber, findsOneWidget);
      //     });

      testWidgets('Grand total check', (tester) async {
        final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
        );

        final salesOrgState = SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          configs: salesOrgConfig,
        );

        final mockCartProductList = [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            price: Price.empty().copyWith(finalPrice: MaterialPrice(100.00)),
            materialInfo: MaterialInfo.empty().copyWith(
              hidePrice: false,
              type: MaterialInfoType('material'),
              materialNumber: MaterialNumber('000000000023168451'),
              materialDescription: ' Triglyceride Mosys D',
              principalData: PrincipalData.empty().copyWith(
                principalName: PrincipalName('台灣拜耳股份有限公司'),
              ),
              remarks: '',
            ),
            stockInfo: StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
            ),
          ),
          PriceAggregate.empty().copyWith(
            bundle: Bundle.empty().copyWith(
              materials: <MaterialInfo>[
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-1'),
                  quantity: MaterialQty(10),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('yes'),
                    )
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('fake-material-2'),
                  quantity: MaterialQty(10),
                  stockInfos: <StockInfo>[
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('Yes'),
                    )
                  ],
                ),
              ],
              bundleInformation: [BundleInfo.empty().copyWith(rate: 10)],
              bundleCode: '1234',
              bundleName: BundleName('test'),
            ),
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-bundle'),
              type: MaterialInfoType('bundle'),
            ),
            salesOrgConfig: salesOrgConfig,
          ),
        ];

        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartProductList,
        );

        when(() => salesOrgBloc.state).thenReturn(
          salesOrgState,
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrgConfig,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final grandTotal = find.byKey(WidgetKeys.grandTotalKey);
        expect(grandTotal, findsOneWidget);
        expect(
          find.text(
            'Grand total: MYR 300.00',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'Display cart page price message when material price is zero',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            materialWithoutPrice: true,
          );

          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                type: MaterialInfoType('material'),
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(0),
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: salesOrgConfig,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.cartPagePriceMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Display cart page price message for hide price material',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            materialWithoutPrice: true,
          );
          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                taxClassification:
                    MaterialTaxClassification('Product : Full Tax'),
                type: MaterialInfoType('material'),
                hidePrice: true,
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(354.60),
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: salesOrgConfig,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.cartPagePriceMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets(
        'Display cart page price message for isFoc material',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            materialWithoutPrice: true,
          );

          final cartProducts = <PriceAggregate>[
            PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('123456789'),
                quantity: MaterialQty(1),
                type: MaterialInfoType('material'),
                isFOCMaterial: true,
              ),
            ),
          ];
          final cartState = CartState.initial().copyWith(
            cartProducts: cartProducts,
          );

          final orderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            configs: salesOrgConfig,
            cartItems: cartProducts,
          );

          when(() => cartBloc.state).thenReturn(
            cartState,
          );

          when(() => orderEligibilityBlocMock.state).thenReturn(
            orderEligibilityState,
          );

          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final checkoutButton =
              find.widgetWithText(ElevatedButton, 'Check out');

          final priceMessageWidgetFinder =
              find.byKey(WidgetKeys.cartPagePriceMessageWidget);
          final priceMessageFinder = find.text(
            'Price is not available for at least one item. Grand total reflected may not be accurate.'
                .tr(),
          );
          expect(priceMessageWidgetFinder, findsOneWidget);
          expect(priceMessageFinder, findsOneWidget);
          expect(checkoutButton, findsOneWidget);
        },
      );

      testWidgets('Checkout button on pressed when shimmer is visible',
          (tester) async {
        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: true,
          ),
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                  materialGroup4: MaterialGroup.four('6A1'),
                ),
              )
            ],
            isUpserting: true,
            isUpdatingStock: true,
            isFetchingCartProductDetail: true,
            isMappingPrice: true,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                  materialGroup4: MaterialGroup.four('6A1'),
                ),
              )
            ],
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        verifyNever(
          () => orderEligibilityBlocMock.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          ),
        );
      });

      testWidgets('Test invalid banner when cart consist suspended material',
          (tester) async {
        final suspendedMaterial = mockCartItems[1].copyWith(
          materialInfo: mockCartItems[1].materialInfo.copyWith(
                type: MaterialInfoType('material'),
              ),
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[suspendedMaterial],
          isClearing: false,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedMaterial],
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Suspended material');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        final invalidItemMessageFinder = find.text('Material Suspended');
        expect(invalidItemMessageFinder, findsNWidgets(1));
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);

        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[suspendedMaterial.materialInfo],
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Test invalid banner when cart consist material without price',
          (tester) async {
        final materialWithoutPrice = mockCartItems.first.copyWith(
          materialInfo: mockCartItems.first.materialInfo.copyWith(
            type: MaterialInfoType('material'),
          ),
          price: mockCartItems.first.price.copyWith(
            finalPrice: MaterialPrice(0),
            lastPrice: MaterialPrice(0),
          ),
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[materialWithoutPrice],
          isClearing: false,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[materialWithoutPrice],
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Material without price');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                materialWithoutPrice.materialInfo
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets('Test invalid banner when cart consist out of stock material',
          (tester) async {
        final oosMaterial = mockCartItems.first.copyWith(
          materialInfo: mockCartItems.first.materialInfo.copyWith(
            type: MaterialInfoType('material'),
          ),
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[oosMaterial],
          isClearing: false,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[oosMaterial],
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Out of stock material');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        final invalidItemMessageFinder = find.text('Material out of stock');
        expect(invalidItemMessageFinder, findsOneWidget);
        expect(invalidItemBannerFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[oosMaterial.materialInfo],
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Test invalid banner when cart consist out of stock bundle materials',
          (tester) async {
        final cartState = CartState.initial().copyWith(
          cartProducts: mockCartBundleItems,
          isClearing: false,
        );

        final invalidBundleList = mockCartBundleItems.first.bundle.materials
            .map(
              (e) => e.copyWith(
                quantity: MaterialQty(0),
                parentID: mockCartBundleItems.first.bundle.bundleCode,
              ),
            )
            .toList();

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: mockCartBundleItems,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidOosMessageFinder = find.text('Out of stock material');

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidOosMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: invalidBundleList,
            ),
          ),
        ).called(1);
      });

      testWidgets('Test MOV warning visibility when account is suspended',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              )
            ],
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              )
            ],
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('MYR'),
              minOrderAmount: '100',
            ),
          ),
        );

        final expectedStates = [
          OrderEligibilityState.initial().copyWith(
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('1234'),
                ),
              )
            ],
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
            showErrorMessage: true,
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpAndSettle();

        await tester.pumpWidget(getWidget());

        await tester.pump();

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
        verify(
          () => orderEligibilityBlocMock
              .add(const OrderEligibilityEvent.validateOrderEligibility()),
        ).called(1);

        final movWarning = find.text(
          'Please ensure that the order value satisfies the minimum order value of MYR 100.00',
        );

        expect(movWarning, findsNothing);
      });

      testWidgets(
          'Test invalid banner when cart consist suspended principal material',
          (tester) async {
        final suspendedPrincipalMaterial = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('material'),
          ),
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[suspendedPrincipalMaterial],
          isClearing: false,
        );

        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedPrincipalMaterial],
          ),
        ];

        whenListen(
          orderEligibilityBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());

        await tester.pumpAndSettle();

        final invalidItemBannerFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBanner);
        final invalidMessageFinder = find.text('Principle suspended material');
        final invalidItemMessageFinder =
            find.text('Temporarily suspended by principle');
        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);

        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidItemMessageFinder, findsOneWidget);
        expect(invalidMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                suspendedPrincipalMaterial.materialInfo
              ],
            ),
          ),
        ).called(1);
      });

      testWidgets('Test invalid banner remove button', (tester) async {
        final suspendedPrincipalMaterial = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('material'),
          ),
        );

        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[suspendedPrincipalMaterial],
          isClearing: false,
        );

        final expectedCartStates = [
          cartState,
          cartState.copyWith(
            isClearing: true,
          )
        ];

        whenListen(
          cartBloc,
          Stream.fromIterable(expectedCartStates),
        );

        when(() => orderEligibilityBlocMock.state).thenReturn(
          OrderEligibilityState.initial().copyWith(
            cartItems: <PriceAggregate>[suspendedPrincipalMaterial],
          ),
        );

        await tester.pumpWidget(getWidget());

        await tester.pump();

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.removeInvalidProducts(
              invalidCartItems: <MaterialInfo>[
                suspendedPrincipalMaterial.materialInfo
              ],
            ),
          ),
        ).called(1);
      });
    },
  );
}
