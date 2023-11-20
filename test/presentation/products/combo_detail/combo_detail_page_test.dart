import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:collection/collection.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_qty_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_sku_tier.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MaterialListMockBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class ProductDetailsMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ProductImageMockBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ComboDealMaterialDetailMockBloc
    extends MockBloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState>
    implements ComboDealMaterialDetailBloc {}

class MockAppRouter extends Mock implements AppRouter {}

class MaterialPageXMock extends Mock implements MaterialPageX {}

class MixpanelMock extends Mock implements Mixpanel {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  final materialListMockBloc = MaterialListMockBloc();
  final productDetailMockBloc = ProductDetailsMockBloc();
  final mockProductImageBloc = ProductImageMockBloc();
  final materialPriceMockBloc = MaterialPriceMockBloc();
  final comboDetailMockBloc = ComboDealMaterialDetailMockBloc();
  late EligibilityBlocMock eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  var comboMaterialsMock = <MaterialNumber, PriceAggregate>{};
  var comboMaterialsSeletedMock = <MaterialNumber, bool>{};
  const fakeCustomerName = 'fake-customer-name';

  final requiredMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 4,
    materialNumber: MaterialNumber('fake-material'),
    rate: -10,
    mandatory: true,
  );
  final requiredMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 2,
    materialNumber: MaterialNumber('fake-material2'),
    rate: -5,
    mandatory: true,
  );
  final optionalMaterial = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-optional-material'),
    rate: -5,
    mandatory: false,
  );
  final optionalMaterial2 = ComboDealMaterial.empty().copyWith(
    minQty: 0,
    materialNumber: MaterialNumber('fake-optional-material2'),
    rate: -8,
    mandatory: false,
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    customerCodeBlocMock = CustomerCodeBlocMock();
    cartMockBloc = CartMockBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    autoRouterMock = MockAppRouter();

    when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => userBlocMock.state).thenReturn(
      UserState.initial().copyWith(),
    );
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerName: CustomerName.empty().copyWith(name1: fakeCustomerName),
        ),
      ),
    );
    when(() => materialListMockBloc.state)
        .thenReturn(MaterialListState.initial());
    when(() => productDetailMockBloc.state)
        .thenReturn(ProductDetailState.initial());
    when(() => materialPriceMockBloc.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => cartMockBloc.state).thenReturn(CartState.initial());
    when(() => comboDetailMockBloc.state)
        .thenReturn(ComboDealMaterialDetailState.initial());
    when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: false,
      providers: [
        BlocProvider<UserBloc>(create: (context) => userBlocMock),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
        BlocProvider<EligibilityBloc>(
          create: ((context) => eligibilityBlocMock),
        ),
        BlocProvider<MaterialListBloc>(
          create: ((context) => materialListMockBloc),
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => mockProductImageBloc,
        ),
        BlocProvider<MaterialPriceBloc>(
          create: ((context) => materialPriceMockBloc),
        ),
        BlocProvider<CartBloc>(
          create: ((context) => cartMockBloc),
        ),
        BlocProvider<ComboDealMaterialDetailBloc>(
          create: ((context) => comboDetailMockBloc),
        ),
      ],
      child: const ComboDetailPage(),
    );
  }

  group(
    'Combo Details Page',
    () {
      testWidgets(
        'Load Combo Detail Page Initialize',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final comboDetailPage = find.byKey(const Key('comboDealDetailPage'));
          expect(comboDetailPage, findsOneWidget);
        },
      );

      testWidgets(
        'Fetching combo detail info',
        (tester) async {
          when(() => comboDetailMockBloc.state).thenReturn(
            comboDetailMockBloc.state.copyWith(isFetchingComboInfo: true),
          );
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K1');
          expect(appbarTitle, findsNothing);

          final appbarLoading = find.byKey(WidgetKeys.comboTitleLoading);
          expect(appbarLoading, findsOneWidget);

          final comboRequirementLoading =
              find.byKey(WidgetKeys.comboRequirementTitleLoading);
          expect(comboRequirementLoading, findsOneWidget);

          final comboRequirementSubTitleLoading =
              find.byKey(WidgetKeys.comboRequirementSubTitleLoading);
          expect(comboRequirementSubTitleLoading, findsOneWidget);
        },
      );

      //TODO: Edit case
    },
  );

  group(
    'Combo Details K1',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [requiredMaterial, requiredMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );
        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-material2'): PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material2'),
            ),
            comboDeal: comboDeal,
          ),
        };
        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): true,
          MaterialNumber('fake-material2'): true,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K1');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage =
              find.text('Purchase all items with min. of its quantity.');
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Per item');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsNothing);

          final totalUnitMessage =
              find.text('${comboMaterialsSeletedMock.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K2.1',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          groupDeal: ComboDealGroupDeal.empty().copyWith(
            rate: -15,
          ),
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [requiredMaterial],
              setNo: 'fake-set',
            ),
            ComboDealMaterialSet(
              materials: [optionalMaterial],
              setNo: 'fake-set-optional',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): true,
          MaterialNumber('fake-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K2.1');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase FIXED product with min. of its quantity and any product in the list.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Per item');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsOneWidget);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsOneWidget);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K2.2',
    () {
      setUp(() {
        final comboDeal = ComboDeal.empty().copyWith(
          flexiQtyTier: [
            ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12),
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): false,
          MaterialNumber('fake-optional-material'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K2.2');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase any products with min. ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} of total quantity.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Quantity');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('Total qty: ${materialsSelected.length}');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K3',
    () {
      setUp(() {
        final firstSKUTier =
            ComboDealSKUTier.empty().copyWith(minQty: 3, rate: -12);
        final secondSKUTier =
            ComboDealSKUTier.empty().copyWith(minQty: 7, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiSKUTier: [
            firstSKUTier,
            secondSKUTier,
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-material'): PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material2'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material2'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-material'): false,
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-optional-material2'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K3');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase different products with min. of its quantity. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total SKUs');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K4',
    () {
      setUp(() {
        final firstQtyTier =
            ComboDealQtyTier.empty().copyWith(minQty: 3, rate: -12);
        final secondQtyTier =
            ComboDealQtyTier.empty().copyWith(minQty: 7, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiQtyTier: [
            firstQtyTier,
            secondQtyTier,
          ],
          materialComboDeals: [
            ComboDealMaterialSet(
              materials: [optionalMaterial, optionalMaterial2],
              setNo: 'fake-set',
            ),
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material2'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material2'),
            ),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-optional-material2'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K4');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase min. ${comboMaterialsMock.values.first.comboDeal.minPurchaseQty} items from any of these products. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Quantity');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('Total qty: ${materialsSelected.length}');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );

  group(
    'Combo Details K5',
    () {
      setUp(() {
        final firstAmountTier =
            ComboDealTierRule.empty().copyWith(minTotalAmount: 50, rate: -12);
        final secondAmountTier =
            ComboDealTierRule.empty().copyWith(minTotalAmount: 160, rate: -20);
        final comboDeal = ComboDeal.empty().copyWith(
          flexiTierRule: [
            firstAmountTier,
            secondAmountTier,
          ],
        );

        comboMaterialsMock = {
          MaterialNumber('fake-optional-material'):
              PriceAggregate.empty().copyWith(
            quantity: 4,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material'),
            ),
            price: Price.empty().copyWith(lastPrice: MaterialPrice(18)),
            comboDeal: comboDeal,
          ),
          MaterialNumber('fake-optional-material2'):
              PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-optional-material2'),
            ),
            price: Price.empty().copyWith(lastPrice: MaterialPrice(10)),
            comboDeal: comboDeal,
          ),
        };

        comboMaterialsSeletedMock = {
          MaterialNumber('fake-optional-material'): false,
          MaterialNumber('fake-optional-material2'): false,
        };
        when(() => comboDetailMockBloc.state).thenReturn(
          ComboDealMaterialDetailState.initial().copyWith(
            items: comboMaterialsMock,
            materialCount: comboMaterialsMock.length,
            selectedItems: comboMaterialsSeletedMock,
          ),
        );
      });

      testWidgets(
        'Appbar title',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();
          final appbarTitle = find.text('Combo K5');
          expect(appbarTitle, findsOneWidget);
        },
      );

      testWidgets(
        'Requirement section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final requirementMessage = find.text(
            'Purchase min. \$${comboMaterialsMock.values.first.comboDeal.sortedMinTotalAmountTiers.firstOrNull?.minTotalAmount ?? 0} from these products. Buy more save more.',
          );
          expect(requirementMessage, findsOneWidget);

          final discountOnMessage = find.text('Total Order Amount');
          expect(discountOnMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Body section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final comboFixedList = find.byKey(WidgetKeys.comboFixedList);
          expect(comboFixedList, findsNothing);

          final selectAtLeastMessage = find.text(
            'Select at least one product from the below section to receive offered price',
          );
          expect(selectAtLeastMessage, findsNothing);

          final searchBar = find.byType(CustomSearchBar);
          expect(searchBar, findsOneWidget);

          final totalMaterials = find.byKey(WidgetKeys.totalMaterialItemCount);
          expect(totalMaterials, findsOneWidget);

          final comboMaterialList = find.byKey(WidgetKeys.comboMaterialList);
          expect(comboMaterialList, findsOneWidget);
        },
      );

      testWidgets(
        'Add to cart section',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());

          await tester.pump();

          final notEligibleMessage =
              find.byKey(WidgetKeys.comboNotEligibleMessage);
          expect(notEligibleMessage, findsOneWidget);

          final materialsSelected = comboMaterialsSeletedMock.entries
              .where((element) => element.value)
              .toList();

          final totalUnitMessage =
              find.text('${materialsSelected.length} items');
          expect(totalUnitMessage, findsOneWidget);

          final comboRateDiscounted =
              find.byKey(WidgetKeys.comboRateDiscounted);
          expect(comboRateDiscounted, findsNothing);

          final nextDealInfo = find.byKey(WidgetKeys.comboNextDealInfo);
          expect(nextDealInfo, findsNothing);

          final checkoutButton = find.byKey(WidgetKeys.checkoutButton);
          expect(checkoutButton, findsOneWidget);
        },
      );
    },
  );
}
