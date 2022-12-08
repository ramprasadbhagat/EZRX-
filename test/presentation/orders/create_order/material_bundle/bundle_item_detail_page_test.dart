import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bundle_item_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MaterialBundleListMockBloc
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

class AuthMockBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AddToCartMockBloc extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceDetailMockBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CartBloc cartMockBloc;
  late AuthBloc authMockBloc;
  late UserBloc userMockBloc;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgMockBloc;
  late AddToCartBloc addToCartMockBloc;
  late ShipToCodeBloc shipToCodeMockBloc;
  late EligibilityBloc eligibilityMockBloc;
  late CustomerCodeMockBloc customerCodeMockBloc;
  late MaterialBundleListBloc materialBundleListMockBloc;
  late MaterialPriceDetailBloc materialPriceDetailMockBloc;

  final mockBundle = Bundle(
    bundleName: BundleName('Mock Bundle'),
    bundleCode: 'mock_bundle_code',
    bundleInformation: [
      BundleInfo.empty(),
    ],
  );

  final mockMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('mock_material_number'),
  );

  final mockBundleAggregate = BundleAggregate(
    bundle: mockBundle,
    materialInfos: [
      mockMaterialInfo,
    ],
  );

  final mockMaterialPriceDetail = MaterialPriceDetail.empty().copyWith(
    info: mockMaterialInfo,
  );

  group('Bundle item details test', () {
    setUp(() {
      autoRouterMock = AppRouter();
      cartMockBloc = CartMockBloc();
      userMockBloc = UserMockBloc();
      authMockBloc = AuthMockBloc();
      salesOrgMockBloc = SalesOrgMockBloc();
      addToCartMockBloc = AddToCartMockBloc();
      shipToCodeMockBloc = ShipToCodeMockBloc();
      eligibilityMockBloc = EligibilityMockBloc();
      customerCodeMockBloc = CustomerCodeMockBloc();
      materialBundleListMockBloc = MaterialBundleListMockBloc();
      materialPriceDetailMockBloc = MaterialPriceDetailMockBloc();

      when(() => cartMockBloc.state).thenReturn(CartState.initial());
      when(() => salesOrgMockBloc.state).thenReturn(SalesOrgState.initial());
      when(() => addToCartMockBloc.state).thenReturn(AddToCartState.initial());
      when(() => customerCodeMockBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => authMockBloc.state).thenReturn(const AuthState.initial());
      when(() => materialBundleListMockBloc.state)
          .thenReturn(MaterialBundleListState.initial());
      when(() => userMockBloc.state).thenReturn(UserState.initial());
      when(() => shipToCodeMockBloc.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => eligibilityMockBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => materialPriceDetailMockBloc.state).thenReturn(
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: {
            mockMaterialInfo.queryInfo: mockMaterialPriceDetail,
          },
        ),
      );
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
            BlocProvider<CartBloc>(create: ((context) => cartMockBloc)),
            BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgMockBloc)),
            BlocProvider<UserBloc>(create: ((context) => userMockBloc)),
            BlocProvider<AuthBloc>(create: ((context) => authMockBloc)),
            BlocProvider<ShipToCodeBloc>(
                create: ((context) => shipToCodeMockBloc)),
            BlocProvider<CustomerCodeBloc>(
                create: ((context) => customerCodeMockBloc)),
            BlocProvider<MaterialBundleListBloc>(
                create: ((context) => materialBundleListMockBloc)),
            BlocProvider<AddToCartBloc>(
                create: ((context) => addToCartMockBloc)),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityMockBloc),
            BlocProvider<MaterialPriceDetailBloc>(
              create: (context) => materialPriceDetailMockBloc,
            ),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Page Initialized', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );
      final pageTitle = mockBundleAggregate.bundle.bundleCode;
      final pageTitleWidget = find.text('#$pageTitle');
      final bundleMaterialInfoWidget = find.byKey(
        Key('materialOption${mockMaterialInfo.materialNumber.getValue()}'),
      );
      final bundleItemDetailPage =
          find.byKey(const Key('BundleItemDetailPage'));
      final addToCartButton = find.text('Add to Cart');

      expect(pageTitleWidget, findsOneWidget);
      expect(bundleMaterialInfoWidget, findsOneWidget);
      expect(bundleItemDetailPage, findsOneWidget);
      expect(addToCartButton, findsOneWidget);
    });

    testWidgets('Clicking on + button increases bundle quantity',
        (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );

      final itemQuantityAddButton = find.byKey(const Key('bundleAdd'));
      final quantityTextWidget = find.byKey(Key(
          '${mockBundleAggregate.bundle.bundleCode}${mockMaterialInfo.materialNumber.getValue()}'));
      final quantityTextInput = tester.widget<TextField>(quantityTextWidget);

      expect(quantityTextInput.controller?.value.text, '0');

      await tester.tap(itemQuantityAddButton);

      expect(quantityTextInput.controller?.value.text, '1');
    });

    testWidgets('Clicking on - button decreases bundle quantity',
        (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );

      final itemQuantityAddButton = find.byKey(const Key('bundleAdd'));
      final itemQuantityDeleteButton = find.byKey(const Key('bundleDelete'));
      final quantityTextWidget = find.byKey(Key(
          '${mockBundleAggregate.bundle.bundleCode}${mockMaterialInfo.materialNumber.getValue()}'));
      final quantityTextInput = tester.widget<TextField>(quantityTextWidget);

      expect(quantityTextInput.controller?.value.text, '0');
      await tester.tap(itemQuantityAddButton);
      await tester.tap(itemQuantityAddButton);
      expect(quantityTextInput.controller?.value.text, '2');
      await tester.tap(itemQuantityDeleteButton);
      expect(quantityTextInput.controller?.value.text, '1');
    });

    testWidgets(
      'Directly entering integer value to quantity should update the value',
      (tester) async {
        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        final quantityTextWidget = find.byKey(Key(
            '${mockBundleAggregate.bundle.bundleCode}${mockMaterialInfo.materialNumber.getValue()}'));
        final quantityTextInput = tester.widget<TextField>(quantityTextWidget);

        quantityTextInput.controller?.clear();
        quantityTextInput.controller?.text = '12';

        expect(quantityTextInput.controller?.value.text, '12');
      },
    );

    testWidgets('Add to cart test', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );
      final addToCartButton = find.text('Add to Cart');

      await tester.tap(addToCartButton);
      await tester.pump(const Duration(seconds: 2));
    });

    // testWidgets(
    //   'Directly entering non-integer value to quantity should not update the value',
    //       (tester) async {
    //     await tester.pumpWidget(
    //       getScopedWidget(
    //         BundleItemDetailPage(
    //           bundleAggregate: mockBundleAggregate,
    //         ),
    //       ),
    //     );
    //     final quantityTextWidget = find.byKey(Key(
    //         '${mockBundleAggregate.bundle.bundleCode}${mockMaterialInfo.materialNumber.getValue()}'));
    //     final quantityTextInput = tester.widget<TextField>(quantityTextWidget);
    //
    //     quantityTextInput.controller?.clear();
    //     quantityTextInput.controller?.text = 'abcd';
    //
    //     expect(quantityTextInput.controller?.value.text, '');
    //   },
    // );
  });
}
