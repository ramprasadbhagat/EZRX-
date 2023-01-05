import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/remarks_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_material_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';

import '../../../utils/widget_utils.dart';

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CountlyServiceMock extends Mock implements CountlyService {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class PriceOverrideMockBloc
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

void main() {
  late TenderContractBloc tenderContractBlocMock;
  late SalesOrgBloc salesOrgBloc;
  late EligibilityBloc eligibilityBloc;
  late CustomerCodeBloc customerCodeBloc;
  late ShipToCodeBloc shipToCodeBloc;
  late CountlyService countlyService;
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late Map<MaterialNumber, Price> mockPriceList;
  late List<PriceAggregate> priceAggregates;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late AddToCartBloc addToCartBlocMock;
  late PriceOverrideBloc priceOverrideMockBloc;
  late AppRouter autoRouter;


  setUpAll(() {
    countlyService = CountlyServiceMock();
    locator.registerLazySingleton(() => countlyService);
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
  });
  
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      tenderContractBlocMock = TenderContractBlocMock();
      salesOrgBloc = SalesOrgBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      shipToCodeBloc = ShipToBlocMock();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      priceOverrideMockBloc = PriceOverrideMockBloc();

      mockPriceList = {
        MaterialNumber('000000000023168451'): Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      };
      addToCartBlocMock = AddToCartBlocMock();
      when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );
      when(() => shipToCodeBloc.state).thenReturn(ShipToCodeState.initial());
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => cartBloc.state).thenReturn(CartState.initial().copyWith(
        isFetching: false,
      ));
      when(() => materialPriceBloc.state)
          .thenReturn(MaterialPriceState.initial().copyWith(
        isFetching: false,
        materialPrice: mockPriceList,
      ));
      when(() => orderEligibilityBlocMock.state).thenReturn(
        OrderEligibilityState.initial(),
      );
      when(() => addToCartBlocMock.state).thenReturn(AddToCartState.initial());
      when(() => priceOverrideMockBloc.state).thenReturn(
        PriceOverrideState.initial(),
      );
      priceAggregates = <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: '台灣拜耳股份有限公司',
            ),
          ),
        ),
      ];
    },
  );
  group('Cart Item Tile Test', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        providers: [
          BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBlocMock),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<ShipToCodeBloc>(create: (context) => shipToCodeBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBloc,
          ),
          BlocProvider<OrderEligibilityBloc>(
            create: (context) => orderEligibilityBlocMock,
          ),
          BlocProvider<AddToCartBloc>(create: ((context) => addToCartBlocMock)),
          BlocProvider<PriceOverrideBloc>(
            create: (context) => priceOverrideMockBloc,
          ),
        ],
        child: Material(
          child: CartMaterialItemTile(
            cartItem: priceAggregates.first,
            showCheckBox: true,
            isOrderSummaryView: true,
          ),
        ),
      );
    }

    testWidgets(
      'cart item quantity update',
      (tester) async {
        final expectedStates = [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            isFetching: false,
            cartItemList: priceAggregates,
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));

        when(() => countlyService.addCountlyEvent(
              'changed_quantity',
              segmentation: {
                'materialNum': priceAggregates.first.getMaterialNumber
                    .getOrDefaultValue(''),
                'listPrice': priceAggregates.first.listPrice,
                'price':
                    priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
              },
            )).thenAnswer((invocation) async => Future.value());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final quantityInput = find.byType(QuantityInput);
        expect(quantityInput, findsOneWidget);
        await tester.enterText(quantityInput.first, '12');
        verify(
          () => countlyService.addCountlyEvent(
            'changed_quantity',
            segmentation: {
              'materialNum':
                  priceAggregates.first.getMaterialNumber.getOrDefaultValue(''),
              'listPrice': priceAggregates.first.listPrice,
              'price':
                  priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
            },
          ),
        ).called(1);
        verify(
          () => cartBloc.add(
            CartEvent.updateCartItem(
              item: priceAggregates.first.copyWith(quantity: 12),
              customerCodeInfo: CustomerCodeInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'cart item Increment',
      (tester) async {
        final expectedStates = [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            isFetching: false,
            cartItemList: priceAggregates,
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));

        when(() => countlyService.addCountlyEvent(
              'add_quantity',
              segmentation: {
                'materialNum': priceAggregates.first.getMaterialNumber
                    .getOrDefaultValue(''),
                'listPrice': priceAggregates.first.listPrice,
                'price':
                    priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
              },
            )).thenAnswer((invocation) async => Future.value());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final quantityInput = find.byType(QuantityInput);
        expect(quantityInput, findsOneWidget);
        final cartAdd = find.byKey(const ValueKey('cartAdd'));
        expect(cartAdd, findsOneWidget);
        await tester.tap(cartAdd, warnIfMissed: false);
        verify(
          () => countlyService.addCountlyEvent(
            'add_quantity',
            segmentation: {
              'materialNum':
                  priceAggregates.first.getMaterialNumber.getOrDefaultValue(''),
              'listPrice': priceAggregates.first.listPrice,
              'price':
                  priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
            },
          ),
        ).called(1);
        verify(
          () => cartBloc.add(
            CartEvent.addToCart(
              item: priceAggregates.first.copyWith(quantity: 1),
              customerCodeInfo: CustomerCodeInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Cart item quntity decrement',
      (tester) async {
        when(() => countlyService.addCountlyEvent(
              'deduct_quantity',
              segmentation: {
                'materialNum': priceAggregates.first.getMaterialNumber
                    .getOrDefaultValue(''),
                'listPrice': priceAggregates.first.listPrice,
                'price':
                    priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
              },
            )).thenAnswer((invocation) async => Future.value());

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartDelete = find.byKey(const ValueKey('cartDelete'));
        expect(cartDelete, findsOneWidget);
        await tester.ensureVisible(cartDelete.first);
        await tester.tap(cartDelete.first);
        verify(
          () => countlyService.addCountlyEvent(
            'deduct_quantity',
            segmentation: {
              'materialNum':
                  priceAggregates.first.getMaterialNumber.getOrDefaultValue(''),
              'listPrice': priceAggregates.first.listPrice,
              'price':
                  priceAggregates.first.price.finalPrice.getOrDefaultValue(0),
            },
          ),
        ).called(1);

        verify(
          () => cartBloc.add(
            CartEvent.addToCart(
              item: priceAggregates.first.copyWith(quantity: -1),
              customerCodeInfo: CustomerCodeInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Cart item delete',
      (tester) async {
        await tester.pumpWidget(getWidget());
        final cartItemSlidable = find.byType(CustomSlidable);
        expect(cartItemSlidable, findsOneWidget);
        await tester.dragFrom(
            const Offset(500.0, 20.0), const Offset(-200.0, 10.0));
        await tester.pump();
        final deleteIcon = find.byIcon(Icons.delete_outline);
        expect(deleteIcon, findsOneWidget);
        await tester.tap(deleteIcon);

        verify(
          () => cartBloc.add(
            CartEvent.removeFromCart(
              item: priceAggregates.first,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'cart item onCheck',
      (tester) async {
        await tester.pumpWidget(getWidget());
        final caritItemCheckbox = find.byType(Checkbox);
        expect(caritItemCheckbox, findsOneWidget);
        await tester.tap(caritItemCheckbox);

        verify(
          () => cartBloc.add(
            CartEvent.updateSelectedItem(
              item: priceAggregates.first,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Cart item Widget test',
      (tester) async {
        priceAggregates = priceAggregates
            .map(
              (e) => e.copyWith(
                price: e.price.copyWith(
                  tiers: [
                    PriceTier.empty().copyWith(
                      items: [
                        PriceTierItem.empty().copyWith(rate: 1),
                        PriceTierItem.empty().copyWith(rate: 2)
                      ],
                    )
                  ],
                  bonuses: [
                  PriceBonus.empty().copyWith(
                    items: [
                      PriceBonusItem.empty().copyWith(bonusMaterials: [
                        BonusMaterial.empty().copyWith(
                          calculation: BonusMaterialCalculation('913'),
                        )
                      ])
                    ],
                  )
                ]
                ),
              ),
            )
            .toList();
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enableListPrice: true,
              enableRemarks: true,
            ),
          ),
        );

        final expectedStates = [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            isFetching: false,
            cartItemList: priceAggregates,
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));
        priceAggregates = priceAggregates
            .map(
              (PriceAggregate e) => e.copyWith(
                salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                  enableDefaultMD: true,
                  expiryDateDisplay: true,
                ),
                materialInfo: e.materialInfo
                    .copyWith(defaultMaterialDescription: 'Test Description'),
              ),
            )
            .toList();
        await tester.pumpWidget(getWidget());
        final description = find.textContaining('Test Description');
        expect(description, findsOneWidget);
        final listPrice = find.textContaining('List Price');
        expect(listPrice, findsOneWidget);
        final priceTierLabel = find.byType(PriceTierLabel);
        expect(priceTierLabel, findsNWidgets(2));
        final expiryDate = find.textContaining('Expiry Date');
        expect(expiryDate, findsAtLeastNWidgets(1));
        final bonusDetails = find.byType(BonusDetails);
        expect(bonusDetails, findsOneWidget);
      },
    );

    testWidgets(
      'Cart item Price override test',
      (tester) async {
        priceAggregates = priceAggregates
            .map(
              (e) => e.copyWith(
                salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                  priceOverride: true,
                ),
              ),
            )
            .toList();

        await tester.pumpWidget(getWidget());
        final priceOverride = find.byKey(const ValueKey('priceOverride'));
        expect(priceOverride, findsOneWidget);
        await tester.tap(priceOverride);
        await tester.pump();
        final priceSheet = find.byKey(const ValueKey('priceSheet'));
        expect(priceSheet, findsOneWidget);
        final priceOverrideSubmitButton =
            find.byKey(const ValueKey('priceOverrideSubmitButton'));
        expect(priceOverrideSubmitButton, findsOneWidget);
        await tester.ensureVisible(priceOverrideSubmitButton.first);
        await tester.pumpAndSettle();
        await tester.tap(priceOverrideSubmitButton.first);
        verify(
          () => priceOverrideMockBloc.add(
            PriceOverrideEvent.fetch(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: priceAggregates.first.copyWith(
                salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                  priceOverride: true,
                ),
              ),
              newPrice: 0,
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'Cart item Widget remarks edit',
      (tester) async {
        priceAggregates = priceAggregates
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  remarks: 'test',
                ),
              ),
            )
            .toList();
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs:
                SalesOrganisationConfigs.empty().copyWith(enableRemarks: true),
          ),
        );

        await tester.pumpWidget(getWidget());
        final description = find.byType(RemarksMessage);
        expect(description, findsOneWidget);
        final editDeleteDialog = find.byKey(const ValueKey('editDeleteDialog'));
        expect(editDeleteDialog, findsOneWidget);
        await tester.tap(editDeleteDialog.first);
        await tester.pump();
        final childEditdButton = find.text('Edit');
        expect(childEditdButton, findsOneWidget);
        await tester.ensureVisible(childEditdButton);
        await tester.pumpAndSettle();
        await tester.tap(childEditdButton);
        await tester.pump();
        final addRemarksDialog = find.byKey(const ValueKey('addRemarksDialog'));
        expect(addRemarksDialog, findsOneWidget);
      },
    );

    testWidgets(
      'Cart item Widget remarks Delete',
      (tester) async {
        priceAggregates = priceAggregates
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  remarks: 'test',
                ),
              ),
            )
            .toList();
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs:
                SalesOrganisationConfigs.empty().copyWith(enableRemarks: true),
          ),
        );

        await tester.pumpWidget(getWidget());
        final description = find.byType(RemarksMessage);
        expect(description, findsOneWidget);
        final editDeleteDialog = find.byKey(const ValueKey('editDeleteDialog'));
        expect(editDeleteDialog, findsOneWidget);
        await tester.tap(editDeleteDialog.first);
        await tester.pumpAndSettle();
        final childDeleteButton = find.text('Delete');
        expect(childDeleteButton, findsOneWidget); //
        await tester.ensureVisible(childDeleteButton);
        await tester.pumpAndSettle();
        await tester.tap(childDeleteButton);
        verify(
          () => cartBloc.add(
            const CartEvent.remarksChanged(''),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Cart item Widget remarks add',
      (tester) async {
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs:
                SalesOrganisationConfigs.empty().copyWith(enableRemarks: true),
          ),
        );
        await tester.pumpWidget(getWidget());
        final addRemarks = find.byKey(const ValueKey('addRemarks'));
        expect(addRemarks, findsOneWidget);
        final addRemarksInkWell =
            find.byKey(ValueKey('${const ValueKey('addRemarks')}-InkWell'));
        expect(addRemarksInkWell, findsOneWidget);
        await tester.ensureVisible(addRemarksInkWell);
        await tester.pumpAndSettle();
        await tester.tap(addRemarksInkWell);
        await tester.pump();
        final addRemarksDialog = find.byKey(const ValueKey('addRemarksDialog'));
        expect(addRemarksDialog, findsOneWidget);
        final addRemark = find.byKey(const ValueKey('Add'));
        expect(addRemark, findsOneWidget);
        final cancelDddRemark = find.byKey(const ValueKey('Cancel'));
        expect(cancelDddRemark, findsOneWidget);
        await tester.tap(addRemark);

        verify(
          () => cartBloc.add(
            CartEvent.addRemarksToCartItem(
              item: priceAggregates.first,
              isDelete: false,
            ),
          ),
        ).called(1);
        await tester.pump();
        expect(cancelDddRemark, findsOneWidget);
        await tester.tap(cancelDddRemark);

      },
    );
  });
}
