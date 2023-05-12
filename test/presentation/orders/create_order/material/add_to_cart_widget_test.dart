import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../../utils/widget_utils.dart';
import '../../../order_history/order_history_details_widget_test.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class FavoriteMockBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;
  late ShipToCodeBloc shipToCodeMockBloc;
  late EligibilityBloc eligibilityMockBloc;
  late AddToCartBloc addToCartBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  late FavouriteBloc favouriteMockBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late UserBlocMock userBlocMock;
  late OrderDocumentTypeBlocMock orderDocumentTypeBlocMock;
  late MockFavouriteBloc mockFavouriteBloc;

  final materialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('000000000023168451'),
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName(
          'Ã¥ï¿½Â°Ã§ï¿½Â£Ã¦â€¹Å“Ã¨â‚¬Â³Ã¨â€šÂ¡Ã¤Â»Â½Ã¦Å“â€°Ã©â„¢ï¿½Ã¥â€¦Â¬Ã¥ï¿½Â¸'),
    ),
  );

  final priceAggregate = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: materialInfo,
    price: Price.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
      tiers: [
        PriceTier.empty().copyWith(
          tier: '',
          items: [PriceTierItem.empty()],
        )
      ],
      zmgDiscount: false,
      finalPrice: MaterialPrice(5200),
    ),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerLazySingleton(() => mockFavouriteBloc);
  });

  setUp(() {
    salesOrgBlocMock = SalesOrgMockBloc();
    materialPriceBlocMock = MaterialPriceBlocMock();
    cartBlocMock = CartBlocMock();
    eligibilityMockBloc = EligibilityMockBloc();
    shipToCodeMockBloc = ShipToCodeMockBloc();
    tenderContractBlocMock = TenderContractBlocMock();
    favouriteMockBloc = FavoriteMockBloc();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    userBlocMock = UserBlocMock();
    orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
    mockFavouriteBloc = MockFavouriteBloc();
    addToCartBlocMock = AddToCartBlocMock();
    autoRouterMock = locator<AppRouter>();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => materialPriceBlocMock.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityMockBloc.state)
        .thenReturn(EligibilityState.initial());
    when(() => shipToCodeMockBloc.state).thenReturn(ShipToCodeState.initial());
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial());
    when(() => favouriteMockBloc.state).thenReturn(FavouriteState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => orderDocumentTypeBlocMock.state)
        .thenReturn(OrderDocumentTypeState.initial());
    when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
    when(() => addToCartBlocMock.state).thenReturn(AddToCartState.initial());
  });

  Widget getScopedWidget(Widget child) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
        BlocProvider<MaterialPriceBloc>(
            create: ((context) => materialPriceBlocMock)),
        BlocProvider<CartBloc>(create: ((context) => cartBlocMock)),
        BlocProvider<AddToCartBloc>(create: ((context) => addToCartBlocMock)),
        BlocProvider<ShipToCodeBloc>(create: ((context) => shipToCodeMockBloc)),
        BlocProvider<EligibilityBloc>(create: (context) => eligibilityMockBloc),
        BlocProvider<TenderContractBloc>(
            create: (context) => tenderContractBlocMock),
        BlocProvider<FavouriteBloc>(create: (context) => favouriteMockBloc),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock),
        BlocProvider<UserBloc>(create: (context) => userBlocMock),
        BlocProvider<OrderDocumentTypeBloc>(
            create: (context) => orderDocumentTypeBlocMock),
        BlocProvider<FavouriteBloc>(create: ((context) => mockFavouriteBloc)),
      ],
      child: child,
    );
  }

  group('Add To Cart Route', () {
    late AddToCartBloc addToCartBloc;

    setUpAll(() {
      locator.registerSingleton<TenderContractBloc>(TenderContractBlocMock());
      locator.registerSingleton<AddToCartBloc>(AddToCartBlocMock());
      addToCartBloc = locator<AddToCartBloc>();
      when(() => addToCartBloc.state).thenReturn(AddToCartState.initial());
    });

    testWidgets('- Initilize with shortcut access', (tester) async {
      await tester.pumpWidget(getScopedWidget(WrappedRoute(
        child: AddToCart(
          isCovid19Tab: false,
          material: priceAggregate,
          isShortcutAccess: true,
        ),
      )));

      verify(
        () => addToCartBloc.add(
          AddToCartEvent.fetch(
            customerCode: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToCode: ShipToInfo.empty(),
            materialNumber: MaterialNumber('000000000023168451'),
            cartZmgQtyExcludeCurrent: 0,
            isSpecialOrderType: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('- Initilize with normal access', (tester) async {
      await tester.pumpWidget(getScopedWidget(WrappedRoute(
        child: AddToCart(
          isCovid19Tab: false,
          material: priceAggregate,
        ),
      )));

      verify(
        () => addToCartBloc.add(
          AddToCartEvent.setCartItem(priceAggregate),
        ),
      ).called(1);

      verify(
        () => addToCartBloc.add(
          const AddToCartEvent.updateQuantity(1, 0),
        ),
      ).called(1);
    });
  });
  group('Add To Cart Page', () {
    testWidgets('- did fetch when eiligible for tender contract',
        (tester) async {
      whenListen(
        addToCartBlocMock,
        Stream.fromIterable(
          [
            AddToCartState.initial(),
            AddToCartState.initial().copyWith(
              isFetching: false,
              cartItem: priceAggregate.copyWith
                  .materialInfo(hasValidTenderContract: true),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      verify(
        () => tenderContractBlocMock.add(
          TenderContractEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            materialInfo: priceAggregate.copyWith
                .materialInfo(hasValidTenderContract: true)
                .materialInfo,
            defaultSelectedTenderContract: TenderContract.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('- did nothing when not eiligible for tender contract',
        (tester) async {
      whenListen(
        addToCartBlocMock,
        Stream.fromIterable(
          [
            AddToCartState.initial(),
            AddToCartState.initial().copyWith(
              isFetching: false,
              cartItem: priceAggregate,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      verifyNever(
        () => tenderContractBlocMock.add(
          TenderContractEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            materialInfo: priceAggregate.materialInfo,
            defaultSelectedTenderContract: TenderContract.empty(),
          ),
        ),
      );
    });

    testWidgets('- did show loading shimmer when is fetching', (tester) async {
      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      expect(find.byType(CartBottomSheetShimmer), findsOneWidget);
      expect(find.text('Material Detail'), findsOneWidget);
      expect(find.byType(FavoriteButton), findsOneWidget);
      expect(find.byType(CartItemDetailWidget), findsNothing);
      expect(find.byType(AddToCartButton), findsNothing);
    });

    testWidgets('- did show material detail when is not fetching',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(isFetching: false),
      );

      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      expect(find.byType(CartBottomSheetShimmer), findsNothing);
      expect(find.text('Material Detail'), findsOneWidget);
      expect(find.byType(FavoriteButton), findsOneWidget);
      expect(find.byType(CartItemDetailWidget), findsOneWidget);
      expect(find.byType(AddToCartButton), findsOneWidget);
      expect(find.byType(SelectContract), findsNothing);
    });

    testWidgets('- did show select contract when eligible for tender contract',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith.materialInfo(
            hasValidTenderContract: true,
          ),
        ),
      );

      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      expect(find.byType(SelectContract), findsOneWidget);
    });

    testWidgets('- did call update qty event when update qty', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate,
        ),
      );

      await tester.pumpWidget(getScopedWidget(AddToCart(
        isCovid19Tab: false,
        material: priceAggregate,
      )));

      expect(find.byType(CartItemDetailWidget), findsOneWidget);
      final plusButton = find.byKey(const Key('cartItemAdd'));
      await tester.tap(plusButton);
      await tester.pump();

      verify(
        () => addToCartBlocMock.add(
          const AddToCartEvent.updateQuantity(2, 0),
        ),
      );
    });
  });
  group('Add To Cart Button', () {
    testWidgets('- hidden when user is returnRole ', (tester) async {
      when(
        () => addToCartBlocMock.state,
      ).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
        ),
      );

      final fakeUser = User.empty().copyWith(
        role: Role.empty().copyWith(
          type: RoleType('return_approver'),
        ),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );

      final addToCartButton = find.byType(AddToCartButton);
      expect(addToCartButton, findsOneWidget);
      expect(find.byKey(const Key('addMaterialToCart')), findsNothing);
    });

    testWidgets('- hidden when accessRightOrder false', (tester) async {
      when(
        () => addToCartBlocMock.state,
      ).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
        ),
      );

      final fakeUser = User.empty().copyWith(
        accessRight: AccessRight.empty().copyWith(
          orders: false,
        ),
        role: Role.empty().copyWith(type: RoleType('client_user')),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );

      final addToCartButton = find.byType(AddToCartButton);
      expect(addToCartButton, findsOneWidget);
      expect(find.byKey(const Key('addMaterialToCart')), findsNothing);
    });

    testWidgets('- hidden when disableCreateOrder true', (tester) async {
      when(
        () => addToCartBlocMock.state,
      ).thenReturn(
        AddToCartState.initial().copyWith(isFetching: false),
      );

      final fakeUser = User.empty().copyWith(
        role: Role.empty().copyWith(type: RoleType('client_user')),
        disableCreateOrder: true,
        accessRight: AccessRight.empty().copyWith(
          orders: true,
        ),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();

      final addToCartButton = find.byType(AddToCartButton);
      expect(addToCartButton, findsOneWidget);
      expect(find.byKey(const Key('addMaterialToCart')), findsNothing);
    });

    testWidgets(
        '- not allow covid material when commerical material is already in cart',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith(
            materialInfo: priceAggregate.materialInfo.copyWith(
              materialGroup4: MaterialGroup.four('6A1'),
            ),
          ),
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    isFOCMaterial: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(orders: true),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      const snackbarText =
          'Covid material cannot be combined with commercial material.';
      final snackbarWidget = find.text(snackbarText);

      expect(snackbarWidget, findsOneWidget);
    });

    testWidgets(
        '- not allow commercial material when covid material is already in cart',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              isFOCMaterial: false,
            ),
          ),
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: priceAggregate.materialInfo.copyWith(
                    materialGroup4: MaterialGroup.four('6A1'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(orders: true),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      const snackbarText =
          'Commercial material cannot be combined with covid material.';
      final snackbarWidget = find.text(snackbarText);

      expect(snackbarWidget, findsOneWidget);
    });

    testWidgets(
        '- not allow non-sample material when sample material is already in cart',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith(
            isSpecialOrderType: true,
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
            materialInfo: priceAggregate.materialInfo.copyWith(
              isFOCMaterial: true,
            ),
          ),
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    isSampleMaterial: true,
                    isFOCMaterial: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(orders: true),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      const snackbarText =
          'You cannot add non-sample materials to a sample order. Please submit separate orders if you wish to proceed.';
      final snackbarWidget = find.text(snackbarText);

      expect(snackbarWidget, findsOneWidget);
    });

    testWidgets(
        '- not allow non-FOC material when FOC material is already in cart',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith(
            isSpecialOrderType: true,
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
            materialInfo: priceAggregate.materialInfo.copyWith(
              isSampleMaterial: true,
              isFOCMaterial: false,
            ),
          ),
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    isSampleMaterial: false,
                    isFOCMaterial: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(
          orders: true,
        ),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      const snackbarText =
          'You cannot add non-FOC materials to a FOC order. Please submit separate orders if you wish to proceed';
      final snackbarWidget = find.text(snackbarText);

      expect(snackbarWidget, findsOneWidget);
    });

    testWidgets('- add SAMPLE material when SAMPLE material is present in CART',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          isFetching: false,
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
            materialInfo: priceAggregate.materialInfo.copyWith(
              isSampleMaterial: true,
            ),
          ),
        ),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    isSampleMaterial: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(
          orders: true,
        ),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      verify(
        () => cartBlocMock.add(
          CartEvent.addMaterialToCart(
            item: priceAggregate.copyWith(
              price: priceAggregate.price.copyWith(
                zmgDiscount: true,
              ),
              materialInfo: priceAggregate.materialInfo.copyWith(
                isSampleMaterial: true,
              ),
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            isSpecialOrderType: false,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        '- block adding to cart if materialWithoutPrice is false, disable ordertype is false and price is empty for salesrep user',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price
                .copyWith(zmgDiscount: true, finalPrice: MaterialPrice(0)),
            quantity: 1,
            materialInfo: priceAggregate.materialInfo.copyWith(
              isSampleMaterial: false,
            ),
          ),
        ),
      );

      when(() => eligibilityMockBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            materialWithoutPrice: false,
            disableOrderType: false,
          ),
          selectedOrderType: OrderDocumentType.defaultSelected(
            salesOrg: SalesOrg('2601'),
          ),
          user: User.empty().copyWith(
            username: Username('fakeUser'),
            disableCreateOrder: false,
            role: Role(
              type: RoleType('external_sales_rep'),
              description: '',
              id: '',
              name: '',
            ),
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            configs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: false,
              disableOrderType: false,
            )),
      );

      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [
            CartItem.materialEmpty().copyWith(
              materials: [
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    isSampleMaterial: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

      final fakeUser = User.empty().copyWith(
        username: Username('fakeUser'),
        disableCreateOrder: false,
        accessRight: AccessRight.empty().copyWith(
          orders: true,
        ),
        role: Role(
          type: RoleType('external_sales_rep'),
          description: '',
          id: '',
          name: '',
        ),
      );

      when(
        () => userBlocMock.state,
      ).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      await tester.pumpWidget(
        getScopedWidget(
            AddToCart(isCovid19Tab: false, material: priceAggregate)),
      );
      await tester.pump();
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pump();

      verifyNever(
        () => cartBlocMock.add(
          CartEvent.addMaterialToCart(
            item: priceAggregate.copyWith(
              quantity: 1,
              price: priceAggregate.price
                  .copyWith(zmgDiscount: true, finalPrice: MaterialPrice(0)),
              materialInfo: priceAggregate.materialInfo.copyWith(
                isSampleMaterial: false,
              ),
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty().copyWith(
              materialWithoutPrice: false,
              disableOrderType: false,
            ),
            shipToInfo: ShipToInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            isSpecialOrderType: false,
          ),
        ),
      );
    });
  });
}
