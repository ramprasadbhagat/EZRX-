// ignore_for_file: unused_local_variable

import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/presentation/core/covid_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
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

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
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

class ComboDealListBlocMock
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MockMixpanelService extends Mock implements MixpanelService {}

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
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouterMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late ComboDealListBloc comboDealListBlocMock;
  // late CartItem mockCartItemWithOutBatch;
  // late CartItem mockCartItemWithBatch;
  late List<StockInfo> batchStockInfoMock;
  late List<PriceAggregate> mockCartItems;
  late List<PriceAggregate> mockCartBundleItems;
  late List<ComboMaterialItem> fakeComboMaterialItems;
  late AplSimulatorOrder aplSimulatorOrder;
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
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
    locator.registerLazySingleton(() => DiscountOverrideRepositoryMock());
    locator.registerFactory(
      () => DiscountOverrideBloc(repository: DiscountOverrideRepositoryMock()),
    );
    locator.registerFactory(() => AppRouter());
    locator.registerFactory<TenderContractBloc>(() => tenderContractBlocMock);
    autoRouterMock = MockAppRouter();
    mockCartBundleItems = await CartLocalDataSource().upsertCartItems();
    mockCartItems = await CartLocalDataSource().upsertCart();
    fakeComboMaterialItems =
        (await CartLocalDataSource().upsertCartItemsWithComboOffers())
            .comboMaterialItemList;
    aplSimulatorOrder = await CartLocalDataSource().aplGetTotalPrice();
  });
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      materialListBlocMock = MaterialListBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      comboDealListBlocMock = ComboDealListBlocMock();
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
            type: MaterialInfoType('material'),
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
      // mockCartItemWithOutBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );

      batchStockInfoMock = [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          inStock: MaterialInStock('Yes'),
          expiryDate: DateTimeStringValue('NA'),
          salesDistrict: '',
          batch: BatchNumber('fake-batch'),
        ),
      ];
      // mockCartItemWithBatch = CartItem(
      //   materials: [
      //     PriceAggregate.empty().copyWith(
      //       quantity: 1,
      //       materialInfo: MaterialInfo.empty().copyWith(
      //         materialNumber: MaterialNumber('000000000023168451'),
      //       ),
      //       stockInfo: batchStockInfoMock.first,
      //       stockInfoList: batchStockInfoMock,
      //     ),
      //   ],
      //   itemType: CartItemType.material,
      // );
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
      ).thenReturn(OrderEligibilityState.initial());
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
      when(() => comboDealListBlocMock.state)
          .thenReturn(ComboDealListState.initial());
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
            BlocProvider<ComboDealListBloc>(
              create: (context) => comboDealListBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
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
          'Cart has been emptied.'.tr(),
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
        final msg = find.textContaining(
          'Cart has been emptied.'.tr(),
        );
        expect(msg, findsOneWidget);
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
                    taxClassification:
                        MaterialTaxClassification('Product : Full Tax'),
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
          expect(cartBloc.state.grandTotalHidePriceMaterial, 257.95);
        },
      );

      testWidgets(
        'Show tax details on material level when displayItemTaxBreakdown is enabled for vn with material level tax',
        (tester) async {
          final salesOrgConfig = SalesOrganisationConfigs.empty().copyWith(
            displayItemTaxBreakdown: true,
            vatValue: 5,
            currency: Currency('vnd'),
            salesOrg: fakeVNSalesOrg,
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
                  type: MaterialInfoType('material'),
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
                  type: MaterialInfoType('material'),
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
                  type: MaterialInfoType('material'),
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
                  type: MaterialInfoType('material'),
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

        when(() => salesOrgBloc.state).thenReturn(
          salesOrgState,
        );

        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrgConfig,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartProductList,
            isAplProductLoading: false,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final grandTotal = find.byKey(WidgetKeys.checkoutStickyGrandTotal);
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

      testWidgets(
          'Cart Bundle disable when any bundle not Satisfying Minimum value ',
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

        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
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

      testWidgets(
          'Should fetch material deal for the first time if at least 1 products is belonged to a combo',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('MATNR')),
        );
        final cartItems = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItems],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => comboDealListBlocMock.add(
            ComboDealListEvent.fetchMaterialDeal(
              salesOrganisation: EligibilityState.initial().salesOrganisation,
              customerCodeInfo: EligibilityState.initial().customerCodeInfo,
              priceComboDeal: priceComboDeal,
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Should fetch principle group deal for the first time if at least 1 products is Principle',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('ZPRINC')),
        );
        final cartItems = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItems],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => comboDealListBlocMock.add(
            ComboDealListEvent.fetchPrincipleGroupDeal(
              salesOrganisation: EligibilityState.initial().salesOrganisation,
              customerCodeInfo: EligibilityState.initial().customerCodeInfo,
              priceComboDeal: priceComboDeal,
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Should fetch Price For ZDP5Materials if at least 1 product has Zdp5Validation',
          (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
          price: Price.empty().copyWith(zdp5RemainingQuota: ZDP5Info('1')),
          quantity: 2,
          salesOrgConfig: salesOrgConfigEnabledZDP5,
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: salesOrgConfigEnabledZDP5,
          ),
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => materialPriceBloc.add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: mockCartItems.last.materialInfo,
            ),
          ),
        ).called(1);
      });
      testWidgets('Should update price product when material price is fetched',
          (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        whenListen(
          materialPriceBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(isFetching: true),
            MaterialPriceState.initial()
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        verify(
          () => cartBloc.add(
            const CartEvent.updatePriceProduct(
              priceProducts: {},
            ),
          ),
        ).called(1);
      });
      testWidgets('Should show snackbar when buy again', (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );
        whenListen(
          materialPriceBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(isFetching: true),
            MaterialPriceState.initial()
          ]),
        );
        whenListen(
          cartBloc,
          Stream.fromIterable([
            cartState.copyWith(isBuyAgain: true),
            cartState,
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(
          find.byKey(WidgetKeys.materialDetailsAddToCartSnackBar),
          findsOneWidget,
        );
      });
      testWidgets(
          'Should re-initialize AdditionalDetailsBloc when update cart or clear cart',
          (tester) async {
        final cartItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo,
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartItem],
          isClearing: true,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial(),
        );
        whenListen(
          materialPriceBloc,
          Stream.fromIterable([
            MaterialPriceState.initial().copyWith(isFetching: true),
            MaterialPriceState.initial()
          ]),
        );
        whenListen(
          cartBloc,
          Stream.fromIterable([
            cartState,
            CartState.initial(),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        verify(
          () => additionalDetailsBlocMock.add(
            AdditionalDetailsEvent.initialized(
              config: fakeEmptySalesConfigs,
              customerCodeInfo: fakeEmptyCustomerCodeInfo,
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Should show price summary bottom sheet when tap on grand total',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            isAplProductLoading: false,
            cartProducts: mockCartItems,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.checkoutStickyGrandTotal);
        expect(grandTotal, findsOneWidget);
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.orderPriceSummarySheet), findsOneWidget);
      });

      testWidgets('Covid material test', (tester) async {
        final cartProduct = [
          mockCartItems.first.copyWith(
            materialInfo: mockCartItems.first.materialInfo.copyWith(
              isFOCMaterial: true,
              type: MaterialInfoType.material(),
            ),
            price: Price.empty(),
          )
        ];
        final orderEligibilityState = OrderEligibilityState.initial().copyWith(
          configs: fakePHSalesOrganisationConfigsMaterialWithoutPrice,
          cartItems: cartProduct,
        );
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: cartProduct,
          ),
        );
        when(() => orderEligibilityBlocMock.state).thenReturn(
          orderEligibilityState,
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final covidTag = find.byType(CovidTag);
        expect(covidTag, findsOneWidget);
        final priceText = find.byKey(WidgetKeys.cartItemProductTotalPrice);
        expect(priceText, findsOneWidget);
        final cartPagePriceMessageWidget =
            find.byKey(WidgetKeys.cartPagePriceMessageWidget);
        expect(cartPagePriceMessageWidget, findsOneWidget);
        final cartPagePriceMessage = find.text(
          'Price is not available for at least one item. Grand total reflected may not be accurate.',
        );
        expect(cartPagePriceMessage, findsOneWidget);
      });

      testWidgets(
          'Should show price summary bottom sheet when tap on grand total test small order fee',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            salesOrgConfigs: fakeSalesOrganisationConfigsTaxBreakdown,
          ),
        );

        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            cartProducts: mockCartItems,
            aplSimulatorOrder: aplSimulatorOrder,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final grandTotal = find.byKey(WidgetKeys.checkoutStickyGrandTotal);
        expect(grandTotal, findsOneWidget);
        await tester.tap(grandTotal);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.orderPriceSummarySheet), findsOneWidget);
        expect(find.byKey(WidgetKeys.checkoutSummarySubTotal), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.checkoutSummarySmallOrderFee),
          findsOneWidget,
        );
        expect(
          find.byKey(WidgetKeys.checkoutSummaryTax),
          findsOneWidget,
        );
        final checkoutSummaryTaxPrice =
            find.byKey(WidgetKeys.checkoutSummaryTaxPrice);
        final checkoutSummaryGrandTotalPrice =
            find.byKey(WidgetKeys.checkoutSummaryGrandTotalPrice);
        final checkoutSummarySmallOrderFeePrice =
            find.byKey(WidgetKeys.checkoutSummarySmallOrderFeePrice);
        expect(
          (tester.widget(checkoutSummarySmallOrderFeePrice) as PriceComponent)
              .price,
          aplSimulatorOrder.smallOrderFee.toString(),
        );
        expect(
          (tester.widget(checkoutSummaryTaxPrice) as PriceComponent).price,
          aplSimulatorOrder.totalTax.toString(),
        );
        expect(
          (tester.widget(checkoutSummaryGrandTotalPrice) as PriceComponent)
              .price,
          aplSimulatorOrder.grandTotal.toString(),
        );
      });

      testWidgets(
          'Test invalid banner when cart consist combo suspended and disable combo deal on saleorg',
          (tester) async {
        final priceComboDeal = PriceComboDeal.empty().copyWith(
          category: PriceComboDealCategory.empty()
              .copyWith(type: ComboDealCategoryType('MATNR')),
        );
        final cartComboItem = mockCartItems.last.copyWith(
          materialInfo: mockCartItems.last.materialInfo.copyWith(
            type: MaterialInfoType('combo'),
          ),
          comboMaterials: [
            fakeComboMaterialItems.first.copyWith(
              comboDeals: priceComboDeal,
            ),
          ],
        );
        final cartState = CartState.initial().copyWith(
          cartProducts: <PriceAggregate>[cartComboItem],
        );
        when(() => cartBloc.state).thenReturn(
          cartState,
        );

        final expectedStates = [
          OrderEligibilityState.initial(),
          OrderEligibilityState.initial().copyWith(
            cartItems: [cartComboItem],
            configs: salesOrgConfigDisableMaterialWithoutPriceAndCombo,
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
        final invalidComboMessageFinder = find.text('Suspended combo');

        final invalidItemBannerButtonFinder =
            find.byKey(WidgetKeys.cartPageInvalidItemsBannerButton);
        expect(invalidItemBannerFinder, findsOneWidget);
        expect(invalidComboMessageFinder, findsOneWidget);
        expect(invalidItemBannerButtonFinder, findsOneWidget);
        final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
        expect(checkoutButton, findsOneWidget);
        await tester.tap(checkoutButton);
        await tester.pump();
        verifyNever(
          () => orderEligibilityBlocMock
              .add(const OrderEligibilityEvent.validateOrderEligibility()),
        );

        await tester.tap(invalidItemBannerButtonFinder);
        verify(
          () => cartBloc.add(
            CartEvent.upsertCartItemsWithComboOffers(
              priceAggregates:
                  cartComboItem.convertComboItemToPriceAggregateList
                      .map(
                        (priceAggregate) => priceAggregate.copyWith(
                          quantity: 0,
                          price: priceAggregate.price.copyWith(
                            comboDeal: priceAggregate.price.comboDeal
                                .copyWith(isEligible: false),
                          ),
                        ),
                      )
                      .toList(),
              isDeleteCombo: true,
            ),
          ),
        ).called(1);
      });

      testWidgets(
        '=> test Pre Order Modal Bottom section Cancel Button',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    tax: 10,
                    type: MaterialInfoType.material(),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(234.50),
                  ),
                  salesOrgConfig: fakeMYSalesOrgConfigWithOOSPreOrder,
                ),
              ],
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSalesOrgConfigWithOOSPreOrderValue,
            ),
          );
          when(() => salesOrgBloc.state).thenReturn(
            SalesOrgState.initial().copyWith(
              configs: fakeSalesOrgConfigWithOOSPreOrderValue,
            ),
          );
          await tester.pumpWidget(getWidget());

          await tester.pump();
          expect(find.byType(StatusLabel), findsOneWidget);
          expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.checkoutButton));
          await tester.pump();
          expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
          final preOrderModalCancelButton =
              find.byKey(WidgetKeys.preOrderModalCancelButton);
          expect(preOrderModalCancelButton, findsOneWidget);
          await tester.tap(preOrderModalCancelButton);
          await tester.pumpAndSettle();
        },
      );
      testWidgets(
        '=> test Pre Order Modal Bottom section Continue Button',
        (tester) async {
          when(() => cartBloc.state).thenReturn(
            CartState.initial().copyWith(
              cartProducts: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                    quantity: MaterialQty(1),
                    tax: 10,
                    type: MaterialInfoType.material(),
                  ),
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(234.50),
                  ),
                  salesOrgConfig: fakeMYSalesOrgConfigWithOOSPreOrder,
                ),
              ],
            ),
          );
          when(() => eligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSalesOrgConfigWithOOSPreOrderValue,
            ),
          );
          when(() => salesOrgBloc.state).thenReturn(
            SalesOrgState.initial().copyWith(
              configs: fakeSalesOrgConfigWithOOSPreOrderValue,
            ),
          );
          await tester.pumpWidget(getWidget());

          await tester.pump();
          expect(find.byType(StatusLabel), findsOneWidget);
          expect(find.byKey(WidgetKeys.checkoutButton), findsOneWidget);
          await tester.tap(find.byKey(WidgetKeys.checkoutButton));
          await tester.pump();
          expect(find.byKey(WidgetKeys.preOrderModel), findsOneWidget);
          final preOrderModalContinueButton =
              find.byKey(WidgetKeys.preOrderModalContinueButton);
          expect(preOrderModalContinueButton, findsOneWidget);
          await tester.tap(preOrderModalContinueButton);
          await tester.pumpAndSettle();
        },
      );
    },
  );
}
