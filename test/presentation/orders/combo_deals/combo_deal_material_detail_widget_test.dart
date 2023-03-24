import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/combo_deal_material_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_item.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockComboDealListBloc
    extends MockBloc<ComboDealListEvent, ComboDealListState>
    implements ComboDealListBloc {}

class MockComboDealDetailBloc
    extends MockBloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState>
    implements ComboDealMaterialDetailBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockTenderContractBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

void main() {
  late MaterialPriceDetailBloc materialPriceDetailBloc;
  late CartBloc cartBloc;
  late EligibilityBloc eligibilityBloc;
  late ComboDealMaterialDetailBloc comboDealDetailBloc;
  late ComboDealListBloc comboDealListBloc;
  late UserBloc userBloc;
  late TenderContractBloc tenderContractBloc;
  late AppRouter router;
  final locator = GetIt.instance;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(const CartEvent.initialized());
    registerFallbackValue(const ComboDealMaterialDetailEvent.initialize());
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    router = locator<AppRouter>();
  });

  setUp(() async {
    materialPriceDetailBloc = MockMaterialPriceDetailBloc();
    cartBloc = MockCartBloc();
    eligibilityBloc = MockEligibilityBloc();
    comboDealDetailBloc = MockComboDealDetailBloc();
    comboDealListBloc = MockComboDealListBloc();
    userBloc = MockUserBloc();
    tenderContractBloc = MockTenderContractBloc();

    when(() => materialPriceDetailBloc.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => cartBloc.state).thenReturn(CartState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    when(() => comboDealDetailBloc.state)
        .thenReturn(ComboDealMaterialDetailState.initial());
    when(() => comboDealListBloc.state)
        .thenReturn(ComboDealListState.initial());
    when(() => userBloc.state).thenReturn(UserState.initial());
    when(() => tenderContractBloc.state)
        .thenReturn(TenderContractState.initial());
  });

  Widget wrapper(Widget child) => WidgetUtils.getScopedWidget(
        autoRouterMock: router,
        providers: [
          BlocProvider<MaterialPriceDetailBloc>(
            create: (context) => materialPriceDetailBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBloc,
          ),
          BlocProvider<TenderContractBloc>(
            create: (context) => tenderContractBloc,
          ),
          BlocProvider<ComboDealMaterialDetailBloc>(
            create: (context) => comboDealDetailBloc,
          ),
          BlocProvider<ComboDealListBloc>(
            create: (context) => comboDealListBloc,
          ),
        ],
        child: child,
      );
  group('Combo Deal Detail Page', () {
    testWidgets('Initialize', (tester) async {
      await tester.pumpWidget(
        wrapper(
          ComboDealMaterialDetailPage(
            comboItems: [PriceAggregate.empty()],
          ),
        ),
      );

      expect(find.text('Combo Bundle Details'), findsOneWidget);
      expect(find.byType(ComboDealItem), findsNothing);
      expect(find.byKey(const Key('addToCartButton')), findsOneWidget);
      expect(find.text('Add To Cart'), findsOneWidget);
      verify(() => comboDealDetailBloc.add(
            ComboDealMaterialDetailEvent.initComboDealItems(
              items: [PriceAggregate.empty()],
              salesConfigs: SalesOrganisationConfigs.empty(),
            ),
          )).called(1);

      verify(() => materialPriceDetailBloc.add(
            MaterialPriceDetailEvent.comboDealFetch(
              user: User.empty(),
              customerCode: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToCode: ShipToInfo.empty(),
              materialInfoList: [],
            ),
          )).called(1);

      verify(
        () => comboDealListBloc.add(
          ComboDealListEvent.fetchMaterialDeal(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            comboDeals: PriceComboDeal.empty(),
          ),
        ),
      );
    });

    testWidgets('Loading', (tester) async {
      when(() => comboDealDetailBloc.state).thenReturn(
        ComboDealMaterialDetailState.initial().copyWith(
          isFetchingComboInfo: true,
        ),
      );
      await tester.pumpWidget(
        wrapper(
          ComboDealMaterialDetailPage(
            comboItems: [PriceAggregate.empty()],
          ),
        ),
      );

      expect(find.byKey(const Key('loaderImage')), findsOneWidget);
      final addToCartButton = find.byKey(const Key('addToCartButton'));
      expect(addToCartButton, findsOneWidget);

      await tester.tap(addToCartButton);
      await tester.pump();

      verifyNever(() => cartBloc.add(any()));
    });
  });

  group('Combo deal K1', () {
    final fakeFirstMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-1'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [
              ComboDealMaterial.empty().copyWith(
                minQty: 4,
                materialNumber: MaterialNumber('fake-number-1'),
                rate: -10,
              )
            ],
            setNo: 'fake-set',
          ),
        ],
      ),
    );
    final fakeSecondMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-2'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet(
            materials: [
              ComboDealMaterial.empty().copyWith(
                minQty: 3,
                materialNumber: MaterialNumber('fake-number-2'),
                rate: -10,
                mandatory: true,
              )
            ],
            setNo: 'fake-set',
          ),
        ],
      ),
    );

    testWidgets(
      'Display 2 combo item, one isn\'t eligible and both are selected',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 4),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 2),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): true,
              MaterialNumber('fake-number-2'): true,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            ComboDealMaterialDetailPage(
              comboItems: [fakeFirstMaterial, fakeSecondMaterial],
            ),
          ),
        );

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(find.byType(MandatoryLabel), findsNWidgets(1));
        expect(find.widgetWithText(DiscountLabel, ' -10.0'), findsNWidgets(2));
        expect(
          find.byKey(const Key('Total label 540.0')),
          findsOneWidget,
        );
        expect(find.text('Minimum Quantity should be 3'), findsOneWidget);
        final addToCartButton = find.byKey(const Key('addToCartButton'));
        expect(addToCartButton, findsOneWidget);

        await tester.tap(addToCartButton);
        await tester.pump();

        verifyNever(() => cartBloc.add(any()));
      },
    );

    testWidgets(
      'Display 2 combo item, both are eligible and selected',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 4),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 4),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): true,
              MaterialNumber('fake-number-2'): true,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            ComboDealMaterialDetailPage(
              comboItems: [fakeFirstMaterial, fakeSecondMaterial],
            ),
          ),
        );

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(
          find.byKey(const Key('Total label 720.0')),
          findsOneWidget,
        );
        expect(
          find.text(
              'You must purchase all of the product items with min. of below mentioned quantity.'),
          findsOneWidget,
        );
        final addToCartButton = find.byKey(const Key('addToCartButton'));
        expect(addToCartButton, findsOneWidget);

        await tester.tap(addToCartButton);
        await tester.pump();

        verify(
          () => cartBloc.add(
            CartEvent.addComboDealToCart(
              comboDealItems: [
                fakeFirstMaterial.copyWith(quantity: 4),
                fakeSecondMaterial.copyWith(quantity: 4)
              ],
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              overrideQty: false,
            ),
          ),
        ).called(1);

        expect(router.current.name == 'CartPageRoute', true);
      },
    );

    testWidgets(
      'Display 2 combo item in edit mode, both are eligible, selected, and verify set price and combo deal info function',
      (tester) async {
        whenListen(
          materialPriceDetailBloc,
          Stream.fromIterable(
            [
              MaterialPriceDetailState.initial().copyWith(isFetching: true),
              MaterialPriceDetailState.initial(),
            ],
          ),
        );

        whenListen(
          comboDealListBloc,
          Stream.fromIterable(
            [
              ComboDealListState.initial().copyWith(isFetching: true),
              ComboDealListState.initial(),
            ],
          ),
        );

        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 4),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 4),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): true,
              MaterialNumber('fake-number-2'): true,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            ComboDealMaterialDetailPage(
              comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              isEdit: true,
            ),
          ),
        );
        await tester.pump();

        verify(
          () => comboDealDetailBloc.add(
            ComboDealMaterialDetailEvent.setPriceInfo(
              priceMap: {},
              comboDeal: PriceComboDeal.empty(),
            ),
          ),
        ).called(1);

        /*verify(
          () => comboDealDetailBloc.add(
            ComboDealDetailEvent.setComboDealInfo(
              comboDealInfo: ComboDeal.empty(),
              alreadySelectedMaterials: [
                fakeFirstMaterial.copyWith(quantity: 4),
                fakeSecondMaterial.copyWith(quantity: 4),
              ],
              isEdit: true,
            ),
          ),
        ).called(1);*/

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(
          find.byKey(const Key('Total label 720.0')),
          findsOneWidget,
        );
        final addToCartButton = find.byKey(const Key('addToCartButton'));
        expect(addToCartButton, findsOneWidget);
        expect(find.text('Update cart'), findsOneWidget);
        await tester.tap(addToCartButton);
        await tester.pump();

        verify(
          () => cartBloc.add(
            CartEvent.addComboDealToCart(
              comboDealItems: [
                fakeFirstMaterial.copyWith(quantity: 4),
                fakeSecondMaterial.copyWith(quantity: 4)
              ],
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              overrideQty: true,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'Eligible item verify add quantity',
      (tester) async {
        await tester.pumpWidget(
          wrapper(
            Material(
              child: ComboDealItem(
                material: fakeFirstMaterial.copyWith(quantity: 5),
                isSelected: true,
                onCheckBoxPressed: () {},
                onQuantityUpdated: (int qty) {},
              ),
            ),
          ),
        );
      },
    );
    testWidgets(
      'Eligible item verify reduce quantity',
      (tester) async {
        await tester.pumpWidget(
          wrapper(
            Material(
              child: ComboDealItem(
                material: fakeFirstMaterial.copyWith(quantity: 5),
                isSelected: true,
                onCheckBoxPressed: () {},
                onQuantityUpdated: (int qty) {},
              ),
            ),
          ),
        );
      },
    );
    testWidgets(
      'Non-eligible item verify reduce quantity',
      (tester) async {
        await tester.pumpWidget(
          wrapper(
            Material(
              child: ComboDealItem(
                material: fakeFirstMaterial.copyWith(quantity: 3),
                isSelected: true,
                onCheckBoxPressed: () {},
                onQuantityUpdated: (int qty) {},
              ),
            ),
          ),
        );

        expect(find.byKey(const Key('QuantityInput')), findsOneWidget);
        await tester.tap(find.byKey(const Key('DeleteKey')));
        await tester.pump();
        verifyNever(() => comboDealDetailBloc.add(any()));
      },
    );

    testWidgets(
      'Item verify update selection',
      (tester) async {
        await tester.pumpWidget(
          wrapper(
            Material(
              child: ComboDealItem(
                material: fakeFirstMaterial.copyWith(quantity: 5),
                isSelected: true,
                onCheckBoxPressed: () {
                  comboDealDetailBloc.add(
                    ComboDealMaterialDetailEvent.updateItemSelection(
                      item: MaterialNumber('fake-number-1'),
                    ),
                  );
                },
                onQuantityUpdated: (int qty) {},
              ),
            ),
          ),
        );
        final checkBox = find.byType(Checkbox);
        expect(checkBox, findsOneWidget);
        await tester.tap(checkBox);
        await tester.pump();
        verify(
          () => comboDealDetailBloc.add(
            ComboDealMaterialDetailEvent.updateItemSelection(
              item: MaterialNumber('fake-number-1'),
            ),
          ),
        ).called(1);
      },
    );
  });

  group('Combo Deal k2.1', () {
    final comboDeal = ComboDeal.empty().copyWith(
      groupDeal: ComboDealGroupDeal.empty().copyWith(
        rate: -10,
      ),
      materialComboDeals: [
        ComboDealMaterialSet(
          materials: [
            ComboDealMaterial.empty().copyWith(
              materialNumber: MaterialNumber('fake-number-1'),
              minQty: 2,
              mandatory: true,
            )
          ],
          setNo: 'fake-set-1',
        ),
        ComboDealMaterialSet(
          materials: [
            ComboDealMaterial.empty().copyWith(
              materialNumber: MaterialNumber('fake-number-2'),
            )
          ],
          setNo: 'fake-set-2',
        ),
      ],
    );

    final fakeFirstMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-1'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: comboDeal,
    );
    final fakeSecondMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-2'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: comboDeal,
    );

    testWidgets(
      'Display all item in combo deal with each set one item selected',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 4),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 2),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): true,
              MaterialNumber('fake-number-2'): true,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            const ComboDealMaterialDetailPage(
              comboItems: [],
            ),
          ),
        );

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(find.byType(MandatoryLabel), findsNWidgets(1));
        expect(find.byType(DiscountLabel), findsNWidgets(3));
        expect(
          find.byKey(const Key('Total label 540.0')),
          findsOneWidget,
        );
        expect(
          find.text(
              'You must purchase a mandatory product with a minimum QTY [2] + any other product set A'),
          findsOneWidget,
        );
        expect(
          find.text(
              'You must purchase a mandatory product with a minimum QTY [1] + any other product set B'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Display all item in combo deal with each set one item selected, one material isn\'t eligible',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 1),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 2),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): true,
              MaterialNumber('fake-number-2'): true,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            const ComboDealMaterialDetailPage(
              comboItems: [],
            ),
          ),
        );

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(find.text('Minimum Quantity should be 2'), findsOneWidget);
      },
    );

    testWidgets(
      'Display empty',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(),
        );
        await tester.pumpWidget(
          wrapper(
            const ComboDealMaterialDetailPage(
              comboItems: [],
            ),
          ),
        );

        expect(find.text('Combo bundle is empty'), findsOneWidget);
      },
    );
  });

  group('Combo Deal k2.2', () {
    final comboDeal = ComboDeal.empty().copyWith(
      flexiQtyTier: [
        ComboDealQtyTier.empty().copyWith(
          minQty: 2,
          rate: -10,
        ),
      ],
      materialComboDeals: [
        ComboDealMaterialSet(
          materials: [
            ComboDealMaterial.empty().copyWith(
              materialNumber: MaterialNumber('fake-number-1'),
            ),
            ComboDealMaterial.empty().copyWith(
              materialNumber: MaterialNumber('fake-number-2'),
            ),
          ],
          setNo: 'fake-set-1',
        ),
      ],
    );

    final fakeFirstMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-1'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: comboDeal,
    );
    final fakeSecondMaterial = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-number-2'),
      ),
      price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
      comboDeal: comboDeal,
    );

    testWidgets(
      'Display combo item with no item selected',
      (tester) async {
        when(() => comboDealDetailBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: {
              MaterialNumber('fake-number-1'):
                  fakeFirstMaterial.copyWith(quantity: 4),
              MaterialNumber('fake-number-2'):
                  fakeSecondMaterial.copyWith(quantity: 2),
            },
            selectedItems: {
              MaterialNumber('fake-number-1'): false,
              MaterialNumber('fake-number-2'): false,
            },
          ),
        );
        await tester.pumpWidget(
          wrapper(
            const ComboDealMaterialDetailPage(
              comboItems: [],
            ),
          ),
        );

        expect(find.byType(ComboDealItem), findsNWidgets(2));
        expect(
          find.text(
              'You must purchase a total QTY of [2] from any product or products.'),
          findsOneWidget,
        );
      },
    );
  });

  group(
    'Combo deal K4 case',
    () {
      const headerTitle =
          'You must purchase a product or products with a total QTY of 3 OR 8 OR 20. (Discounts will increase as the total quantity exceeds the minimum eligibilities)';
      final fakeFirstMaterial = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-number-1'),
        ),
        price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
        comboDeal: ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-1'),
                  rate: -10,
                ),
              ],
              setNo: 'fake-set',
            ),
          ],
          flexiQtyTier: <ComboDealQtyTier>[
            ComboDealQtyTier(
              rate: 5.0,
              conditionNumber: '',
              minQty: 3,
              type: DiscountType('%'),
              suffix: '',
            ),
            ComboDealQtyTier(
              rate: 5.5,
              conditionNumber: '',
              minQty: 8,
              type: DiscountType('%'),
              suffix: '',
            ),
            ComboDealQtyTier(
              rate: 6.0,
              conditionNumber: '',
              minQty: 20,
              type: DiscountType('%'),
              suffix: '',
            ),
          ],
        ),
      );

      final fakeSecondMaterial = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-number-2'),
        ),
        price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
        comboDeal: ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-2'),
                  rate: -10,
                )
              ],
              setNo: 'fake-set',
            ),
          ],
          flexiQtyTier: <ComboDealQtyTier>[
            ComboDealQtyTier(
              rate: 5.0,
              conditionNumber: '',
              minQty: 3,
              type: DiscountType('%'),
              suffix: '',
            ),
            ComboDealQtyTier(
              rate: 5.5,
              conditionNumber: '',
              minQty: 8,
              type: DiscountType('%'),
              suffix: '',
            ),
            ComboDealQtyTier(
              rate: 6.0,
              conditionNumber: '',
              minQty: 20,
              type: DiscountType('%'),
              suffix: '',
            ),
          ],
        ),
      );

      testWidgets(
        'Display 2 combo item, none is selected, nothing happen while add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'): fakeFirstMaterial,
                MaterialNumber('fake-number-2'): fakeSecondMaterial,
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verifyNever(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Display 2 combo item, select one, increase quantity to 2, nothing happen while add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 2),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 0),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(0);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verifyNever(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Display 2 combo item, select one, increase quantity to 3, add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 3),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 0),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(0);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verify(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Edit Combo Deals, include another material and add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 3),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 1),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
                isEdit: true,
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(1);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verify(() => cartBloc.add(any()));
        },
      );
    },
  );

  group(
    'Combo deal K4_2 case',
    () {
      const headerTitle =
          'You must purchase a product or products with a total QTY of 6 OR 60. (Discounts will increase as the total quantity exceeds the minimum eligibilities)';
      final fakeFirstMaterial = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-number-1'),
        ),
        price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
        comboDeal: ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-1'),
                  rate: -6,
                  suffix: '1',
                  type: DiscountType('%'),
                ),
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-1'),
                  rate: -6.5,
                  suffix: '2',
                  type: DiscountType('%'),
                ),
              ],
              setNo: 'fake-set',
            ),
          ],
          flexiQtyTier: <ComboDealQtyTier>[
            ComboDealQtyTier(
              rate: 0.0,
              conditionNumber: '',
              minQty: 6,
              type: DiscountType('%'),
              suffix: '1',
            ),
            ComboDealQtyTier(
              rate: 0.0,
              conditionNumber: '',
              minQty: 60,
              type: DiscountType('%'),
              suffix: '2',
            ),
          ],
        ),
      );

      final fakeSecondMaterial = PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-number-2'),
        ),
        price: Price.empty().copyWith(lastPrice: MaterialPrice(100)),
        comboDeal: ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-2'),
                  rate: -7,
                  suffix: '1',
                  type: DiscountType('%'),
                ),
                ComboDealMaterial.empty().copyWith(
                  minQty: 0,
                  materialNumber: MaterialNumber('fake-number-2'),
                  rate: -7.5,
                  suffix: '2',
                  type: DiscountType('%'),
                )
              ],
              setNo: 'fake-set',
            ),
          ],
          flexiQtyTier: <ComboDealQtyTier>[
            ComboDealQtyTier(
              rate: 0.0,
              conditionNumber: '',
              minQty: 6,
              type: DiscountType('%'),
              suffix: '1',
            ),
            ComboDealQtyTier(
              rate: 0.0,
              conditionNumber: '',
              minQty: 60,
              type: DiscountType('%'),
              suffix: '2',
            ),
          ],
        ),
      );

      testWidgets(
        'Display 2 combo item, none is selected, nothing happen while add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'): fakeFirstMaterial,
                MaterialNumber('fake-number-2'): fakeSecondMaterial,
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verifyNever(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Display 2 combo item, select one, increase quantity to 2, nothing happen while add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 2),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 0),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(0);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verifyNever(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Display 2 combo item, select one, increase total quantity to 6, add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 5),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 1),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(0);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verify(() => cartBloc.add(any()));
        },
      );

      testWidgets(
        'Edit Combo Deals, include another material and add to cart',
        (tester) async {
          when(() => comboDealDetailBloc.state).thenReturn(
            ComboDealMaterialDetailState.initial().copyWith(
              items: {
                MaterialNumber('fake-number-1'):
                    fakeFirstMaterial.copyWith(quantity: 5),
                MaterialNumber('fake-number-2'):
                    fakeSecondMaterial.copyWith(quantity: 1),
              },
              selectedItems: {},
            ),
          );
          await tester.pumpWidget(
            wrapper(
              ComboDealMaterialDetailPage(
                comboItems: [fakeFirstMaterial, fakeSecondMaterial],
                isEdit: true,
              ),
            ),
          );

          expect(find.byType(ComboDealItem), findsNWidgets(2));
          expect(find.byType(MandatoryLabel), findsNothing);
          expect(
            find.text(headerTitle),
            findsOneWidget,
          );
          final checkbox = find.byType(Checkbox);
          expect(checkbox, findsAtLeastNWidgets(2));
          final getFirstCheckbox = checkbox.at(1);
          await tester.tap(getFirstCheckbox);
          await tester.pump();
          final addToCartButton = find.byKey(const Key('addToCartButton'));
          expect(addToCartButton, findsOneWidget);

          await tester.tap(addToCartButton);
          await tester.pump();

          verify(() => cartBloc.add(any()));
        },
      );
    },
  );
}
