import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

class AuthBlocBlocMock extends MockBloc<AuthEvent, AuthState>
    implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late CartBloc cartBlocMock;
  late ShipToCodeBloc shipToCodeMockBloc;
  late EligibilityBloc eligibilityMockBloc;
  final AddToCartBloc addToCartBlocMock = AddToCartBlocMock();
  late TenderContractBloc tenderContractBlocMock;
  late FavouriteBloc favouriteMockBloc;
  late AuthBlocBlocMock authBlocBlocMock;
  late UserBlocMock userBlocMock;
  late OrderDocumentTypeBlocMock orderDocumentTypeBlocMock;

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
    setupLocator();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  group('Material List Test', () {
    setUp(() {
      salesOrgBlocMock = SalesOrgMockBloc();
      materialPriceBlocMock = MaterialPriceBlocMock();
      cartBlocMock = CartBlocMock();
      eligibilityMockBloc = EligibilityMockBloc();
      shipToCodeMockBloc = ShipToCodeMockBloc();
      tenderContractBlocMock = TenderContractBlocMock();
      favouriteMockBloc = FavoriteMockBloc();
      authBlocBlocMock = AuthBlocBlocMock();
      userBlocMock = UserBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();

      autoRouterMock = locator<AppRouter>();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityMockBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => shipToCodeMockBloc.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => favouriteMockBloc.state).thenReturn(FavouriteState.initial());
      when(() => authBlocBlocMock.state).thenReturn(const AuthState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
    });

    Widget getScopedWidget(Widget child) {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
            BlocProvider<MaterialPriceBloc>(
                create: ((context) => materialPriceBlocMock)),
            BlocProvider<CartBloc>(create: ((context) => cartBlocMock)),
            BlocProvider<AddToCartBloc>(
                create: ((context) => addToCartBlocMock)),
            BlocProvider<ShipToCodeBloc>(
                create: ((context) => shipToCodeMockBloc)),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityMockBloc),
            BlocProvider<TenderContractBloc>(
                create: (context) => tenderContractBlocMock),
            BlocProvider<FavouriteBloc>(create: (context) => favouriteMockBloc),
            BlocProvider<AuthBloc>(create: (context) => authBlocBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeBlocMock),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Add to Cart zmg Discount Material', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
          ),
        ),
      );
      whenListen(
          addToCartBlocMock,
          Stream.fromIterable([
            addToCartBlocMock.state,
          ]));

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });

    testWidgets(
        'Add to Cart zmg Discount Material quantity change one quantity added',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
              price: priceAggregate.price.copyWith(
                zmgDiscount: true,
              ),
              materialInfo: MaterialInfo.empty().copyWith(
                  hasValidTenderContract: true,
                  materialNumber: MaterialNumber('0000001234'))),
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();

      final cartItemAdd = find.byKey(const Key('cartItemAdd'));
      expect(cartItemAdd, findsOneWidget);
      await tester.tap(cartItemAdd);
      await tester.pump();
      expect(find.text('2'), findsAtLeastNWidgets(1));
    });

    testWidgets(
        'Add to Cart zmg Discount Material quantity change quantity changed and one quantity removed',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
              price: priceAggregate.price.copyWith(
                zmgDiscount: false,
              ),
              materialInfo: MaterialInfo.empty().copyWith(
                  hasValidTenderContract: true,
                  materialNumber: MaterialNumber('0000001234'))),
        ),
      );

      when(() => tenderContractBlocMock.state).thenReturn(
          TenderContractState.initial().copyWith(
              selectedTenderContract: TenderContract.empty().copyWith(
                  contractNumber: TenderContractNumber.tenderContractItemNumber(
                      '0000123'))));
      whenListen(
          tenderContractBlocMock,
          Stream.fromIterable([
            tenderContractBlocMock.state,
          ]));

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();

      final cartItemText = find.byKey(const Key('item'));
      expect(cartItemText, findsOneWidget);
      await tester.enterText(cartItemText, '12');
      await tester.pump();
      expect(find.text('12'), findsAtLeastNWidgets(1));

      final cartItemDelete = find.byKey(const Key('cartItemDelete'));
      expect(cartItemDelete, findsOneWidget);
      await tester.tap(cartItemDelete);
      await tester.pump();
      expect(find.text('11'), findsAtLeastNWidgets(1));
    });

    testWidgets('Add to Cart bonus material', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
                hasValidTenderContract: true,
                materialNumber: MaterialNumber('0000001234')),
            price: priceAggregate.price.copyWith(zmgDiscount: true, bonuses: [
              PriceBonus.empty().copyWith(items: [
                PriceBonusItem.empty()
                    .copyWith(qualifyingQuantity: 2, bonusMaterials: [
                  BonusMaterial.empty().copyWith(
                      bonusQuantity: 2,
                      materialNumber: MaterialNumber('000001256')),
                ]),
                PriceBonusItem.empty()
                    .copyWith(qualifyingQuantity: 4, bonusMaterials: [
                  BonusMaterial.empty().copyWith(
                      bonusQuantity: 4,
                      materialNumber: MaterialNumber('000001257')),
                ]),
              ])
            ]),
          ),
        ),
      );
      whenListen(
          addToCartBlocMock,
          Stream.fromIterable([
            addToCartBlocMock.state,
          ]));

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();

      final bonusDetailsWidget = find.byType(BonusDetails);
      expect(bonusDetailsWidget, findsOneWidget);
      await tester.pump();

      final bonusLable = find.byKey(const Key('bonusLable'));
      expect(bonusLable, findsAtLeastNWidgets(1));

      final expandable = find.byKey(const Key('Expandable'));
      expect(expandable, findsAtLeastNWidgets(1));
      await tester.tap(expandable.first);
      await tester.pump();
      expect(find.text('1256'), findsOneWidget);
    });

    testWidgets('Add to Cart Tire Discount Material', (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
              price: priceAggregate.price.copyWith(zmgDiscount: false)),
        ),
      );

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });

    // testWidgets('Test add to cart covid material + commercial material',
    //     (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo,
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo.copyWith(
    //           isFOCMaterial: true,
    //           materialGroup4: MaterialGroup.four('6A1'),
    //         ),
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(const AddToCart(
    //     isCovid19Tab: true,
    //   )));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));

    //   const snackbarText =
    //       'Covid material cannot be combined with commercial material.';
    //   final snackbarWidget = find.text(snackbarText);

    //   expect(snackbarWidget, findsOneWidget);
    // });

    // testWidgets('Test add to cart commercial material + covid material test',
    //     (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo.copyWith(
    //           isFOCMaterial: true,
    //           materialGroup4: MaterialGroup.four('6A1'),
    //         ),
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo,
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(
    //     const AddToCart(
    //       isCovid19Tab: true,
    //     ),
    //   ));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));

    //   const snackbarText =
    //       'Commercial material cannot be combined with covid material.';
    //   final snackbarWidget = find.text(snackbarText);

    //   expect(snackbarWidget, findsOneWidget);
    // });

    // testWidgets('Test add to cart eligible items', (tester) async {
    //   when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
    //     cartItemList: [
    //       priceAggregate.copyWith(
    //         materialInfo: materialInfo,
    //       ),
    //     ],
    //   ));

    //   when(() => addToCartBlocMock.state).thenReturn(
    //     AddToCartState.initial().copyWith(
    //       cartItem: priceAggregate.copyWith(
    //         price: priceAggregate.price.copyWith(
    //           zmgDiscount: true,
    //         ),
    //         materialInfo: materialInfo,
    //       ),
    //     ),
    //   );

    //   await tester.pumpWidget(getScopedWidget(
    //     const AddToCart(
    //       isCovid19Tab: false,
    //     ),
    //   ));

    //   final button = find.text('Add to Cart');
    //   await tester.tap(button);
    //   await tester.pump(const Duration(seconds: 1));
    // });

    testWidgets('Add to Cart select tender contract fail to fetch',
        (tester) async {
      final newList = priceAggregate.copyWith(
        tenderContract: TenderContract.empty().copyWith(
          contractNumber:
              TenderContractNumber.tenderContractItemNumber('0000001234'),
          tenderOrderReason: TenderContractReason('730'),
        ),
      );
      when(() => cartBlocMock.state).thenReturn(
        CartState.initial().copyWith(
          cartItems: [CartItem.material(newList)],
          isFetching: false,
        ),
      );
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
            materialInfo: MaterialInfo.empty().copyWith(
                hasValidTenderContract: true,
                materialNumber: MaterialNumber('0000001234')),
          ),
        ),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial().copyWith(
        selectedTenderContract: TenderContract.empty().copyWith(
            contractNumber:
                TenderContractNumber.tenderContractItemNumber('0000123'),
            tenderOrderReason: TenderContractReason('750')),
        apiFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('authentication failed'))),
        isFetching: true,
      ));
      whenListen(
          tenderContractBlocMock,
          Stream.fromIterable([
            tenderContractBlocMock.state,
          ]));

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));
      await tester.pump();
      final tirePriceLable = find.byKey(const Key('priceTierLable'));

      expect(
        tirePriceLable,
        findsNWidgets(
          priceAggregate.price.tiers.first.items.length,
        ),
      );
    });

    testWidgets('Add to Cart select tender contract success to fetch',
        (tester) async {
      when(() => addToCartBlocMock.state).thenReturn(
        AddToCartState.initial().copyWith(
          cartItem: priceAggregate.copyWith(
            price: priceAggregate.price.copyWith(
              zmgDiscount: true,
            ),
            materialInfo: MaterialInfo.empty().copyWith(
                hasValidTenderContract: true,
                materialNumber: MaterialNumber('0000001234')),
          ),
        ),
      );
      when(() => tenderContractBlocMock.state).thenReturn(
          TenderContractState.initial().copyWith(
              selectedTenderContract: TenderContract.empty().copyWith(
                  contractNumber:
                      TenderContractNumber.tenderContractItemNumber('0000123')),
              apiFailureOrSuccessOption: optionOf(const Right('success')),
              isFetching: false,
              tenderContractList: [
            TenderContract.empty().copyWith(
              contractNumber:
                  TenderContractNumber.tenderContractItemNumber('0000123'),
            ),
            TenderContract.empty().copyWith(
                contractNumber:
                    TenderContractNumber.tenderContractItemNumber('0000125'),
                tenderOrderReason: TenderContractReason('730'))
          ]));
      whenListen(
          tenderContractBlocMock,
          Stream.fromIterable([
            tenderContractBlocMock.state,
          ]));

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial()
          .copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('SG'))));
      await tester.pumpWidget(getScopedWidget(const AddToCart(
        isCovid19Tab: false,
      )));

      final tenderContract = find.byKey(Key(tenderContractBlocMock
          .state
          .tenderContractList
          .first
          .contractNumber
          .displayTenderContractNumber));
      expect(tenderContract, findsOneWidget);
      await tester.tap(tenderContract);
      await tester.pump(const Duration(seconds: 1));

      final tenderContractBody = find.byKey(Key(
          'tenderContractBody${tenderContractBlocMock.state.tenderContractList.first.contractNumber.displayTenderContractNumber}'));
      expect(tenderContractBody, findsOneWidget);

      final tenderContractItem = find.byKey(Key(
          'tenderContractIcon${tenderContractBlocMock.state.tenderContractList.last.contractNumber.displayTenderContractNumber}'));
      expect(tenderContractItem, findsOneWidget);
      await tester.tap(tenderContractItem);
      await tester.pump();
    });

    testWidgets(
      'Test Disable create order - Return Admin - Add To Cart Button Hidden',
      (tester) async {
        when(
          () => addToCartBlocMock.state,
        ).thenReturn(
          AddToCartState.initial(),
        );

        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_admin'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Disable create order - Return Requestor - Add To Cart Button Hidden',
      (tester) async {
        when(
          () => addToCartBlocMock.state,
        ).thenReturn(
          AddToCartState.initial(),
        );

        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_requestor'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Disable create order - Return Approver - Add To Cart Button Hidden',
      (tester) async {
        when(
          () => addToCartBlocMock.state,
        ).thenReturn(
          AddToCartState.initial(),
        );

        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          role: Role(
            type: RoleType('return_approver'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Disable create order - disableCreateOrder true - Add To Cart Button Hidden',
      (tester) async {
        when(
          () => addToCartBlocMock.state,
        ).thenReturn(
          AddToCartState.initial(),
        );

        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          disableCreateOrder: true,
          role: Role(
            type: RoleType('fakeRole'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Disable create order - disableCreateOrder false - Add To Cart Button Hidden',
      (tester) async {
        when(
          () => addToCartBlocMock.state,
        ).thenReturn(
          AddToCartState.initial(),
        );

        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          disableCreateOrder: false,
          role: Role(
            type: RoleType('fakeRole'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsOneWidget);
      },
    );

    testWidgets(
      'Test Do not allow non-sample material when sample material is already in cart',
      (tester) async {
        when(() => addToCartBlocMock.state).thenReturn(
          AddToCartState.initial().copyWith(
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
          role: Role(
            type: RoleType('fakeRole'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump();

        const snackbarText =
            'You cannot add non-sample materials to a sample order. Please submit separate orders if you wish to proceed.';
        final snackbarWidget = find.text(snackbarText);

        expect(snackbarWidget, findsOneWidget);
      },
    );

    testWidgets(
      'Test Do not allow non-FOC material when FOC material is already in cart',
      (tester) async {
        when(() => addToCartBlocMock.state).thenReturn(
          AddToCartState.initial().copyWith(
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
          role: Role(
            type: RoleType('fakeRole'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump();

        const snackbarText =
            'You cannot add non-FOC materials to a FOC order. Please submit separate orders if you wish to proceed';
        final snackbarWidget = find.text(snackbarText);

        expect(snackbarWidget, findsOneWidget);
      },
    );

    testWidgets(
      'Test Add SAMPLE material when SAMPLE material is present in CART',
      (tester) async {
        when(() => addToCartBlocMock.state).thenReturn(
          AddToCartState.initial().copyWith(
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
          role: Role(
            type: RoleType('fakeRole'),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
        );
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;

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
      },
    );

    testWidgets(
      'Test Block adding to cart if materialWithoutPrice is false, disable ordertype is false and price is empty for salesrep user',
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
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2601')),
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
          getScopedWidget(const AddToCart(isCovid19Tab: false)),
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
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2601')),
              salesOrganisationConfigs:
                  SalesOrganisationConfigs.empty().copyWith(
                materialWithoutPrice: false,
                disableOrderType: false,
              ),
              shipToInfo: ShipToInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              isSpecialOrderType: false,
            ),
          ),
        );
      },
    );
  });
}
