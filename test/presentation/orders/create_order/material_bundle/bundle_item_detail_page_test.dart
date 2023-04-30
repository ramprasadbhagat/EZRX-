import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bundle_item_detail_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';
import '../../../order_history/order_history_details_widget_test.dart';

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

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AddToCartMockBloc extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class EligibilityMockBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MaterialPriceDetailMockBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CartBloc cartMockBloc;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late UserBloc userMockBloc;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgMockBloc;
  late AddToCartBloc addToCartMockBloc;
  late ShipToCodeBloc shipToCodeMockBloc;
  late EligibilityBloc eligibilityMockBloc;
  late CustomerCodeMockBloc customerCodeMockBloc;
  late MaterialBundleListBloc materialBundleListMockBloc;
  late MaterialPriceDetailBloc materialPriceDetailMockBloc;
  late TenderContractBloc tenderContractBlocMock;

  final mockBundle = Bundle(
    materials: <MaterialInfo>[],
    bundleName: BundleName('Mock Bundle'),
    bundleCode: 'mock_bundle_code',
    bundleInformation: [
      BundleInfo.empty(),
    ],
  );

  final mockMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('mock_material_number'),
    defaultMaterialDescription: 'testing',
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

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  group('Bundle item details test', () {
    setUp(() {
      autoRouterMock = AppRouter();
      cartMockBloc = CartMockBloc();
      userMockBloc = UserMockBloc();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      salesOrgMockBloc = SalesOrgMockBloc();
      addToCartMockBloc = AddToCartMockBloc();
      shipToCodeMockBloc = ShipToCodeMockBloc();
      eligibilityMockBloc = EligibilityMockBloc();
      customerCodeMockBloc = CustomerCodeMockBloc();
      materialBundleListMockBloc = MaterialBundleListMockBloc();
      materialPriceDetailMockBloc = MaterialPriceDetailMockBloc();
      tenderContractBlocMock = TenderContractBlocMock();

      when(() => cartMockBloc.state).thenReturn(CartState.initial());
      when(() => salesOrgMockBloc.state).thenReturn(SalesOrgState.initial());
      when(() => addToCartMockBloc.state).thenReturn(AddToCartState.initial());
      when(() => customerCodeMockBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => materialBundleListMockBloc.state)
          .thenReturn(MaterialBundleListState.initial());
      when(() => userMockBloc.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
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
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
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
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
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
            BlocProvider<TenderContractBloc>(
                create: (context) => tenderContractBlocMock),
          ],
          child: child,
        ),
      );
    }

    testWidgets('Page Loading', (tester) async {
      when((() => materialPriceDetailMockBloc.state))
          .thenReturn(MaterialPriceDetailState.initial().copyWith(
        isFetching: true,
      ));
      when((() => userMockBloc.state)).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
              accessRight: AccessRight.empty().copyWith(
        orders: true,
      ))));
      whenListen(
          materialPriceDetailMockBloc,
          Stream.fromIterable([
            MaterialPriceDetailState.initial().copyWith(
              isFetching: true,
            ),
            MaterialPriceDetailState.initial().copyWith(
              isFetching: false,
            )
          ]));
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );
      final pageTitle = mockBundleAggregate.bundle.bundleCode;
      final pageTitleWidget = find.text('#$pageTitle');

      final bundleItemDetailPage =
          find.byKey(const Key('bundleItemDetailPage'));

      expect(pageTitleWidget, findsOneWidget);
      expect(bundleItemDetailPage, findsOneWidget);
      final itemLoading = find.byKey(const Key('itemLoading'));
      expect(itemLoading, findsOneWidget);
      final buttonLoading = find.byKey(const Key('buttonLoading'));
      expect(buttonLoading, findsOneWidget);
      await tester.tap(buttonLoading);
    });

    testWidgets('Page Initialized', (tester) async {
      when((() => userMockBloc.state)).thenReturn(UserState.initial().copyWith(
        user: User.empty().copyWith(
            accessRight: AccessRight.empty().copyWith(
          orders: true,
        )),
      ));
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
          find.byKey(const Key('bundleItemDetailPage'));
      final addToCartButton = find.text('Add to Cart');

      expect(pageTitleWidget, findsOneWidget);
      expect(bundleMaterialInfoWidget, findsOneWidget);
      expect(bundleItemDetailPage, findsOneWidget);
      expect(addToCartButton, findsOneWidget);
    });

    testWidgets('Clicking on + button increases bundle quantity',
        (tester) async {
      when(() => salesOrgMockBloc.state)
          .thenReturn(SalesOrgState.initial().copyWith(
              configs: SalesOrganisationConfigs.empty().copyWith(
        enableDefaultMD: true,
      )));
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );
      await tester.pump();

      final itemQuantityAddButton = find.byKey(Key(
          'bundleAdd${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
      final quantityTextWidget = find.byKey(Key(
          'bundleText${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
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

      final itemQuantityAddButton = find.byKey(Key(
          'bundleAdd${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
      final itemQuantityDeleteButton = find.byKey(Key(
          'bundleDelete${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
      final quantityTextWidget = find.byKey(Key(
          'bundleText${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
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
            'bundleText${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));
        final quantityTextInput = tester.widget<TextField>(quantityTextWidget);

        quantityTextInput.controller?.clear();
        quantityTextInput.controller?.text = '12';

        expect(quantityTextInput.controller?.value.text, '12');
      },
    );

    testWidgets('Add to cart test', (tester) async {
      when((() => userMockBloc.state)).thenReturn(UserState.initial().copyWith(
        user: User.empty().copyWith(
            accessRight: AccessRight.empty().copyWith(
          orders: true,
        )),
      ));
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

    testWidgets('Test text field changed', (tester) async {
      await tester.pumpWidget(
        getScopedWidget(
          BundleItemDetailPage(
            bundleAggregate: mockBundleAggregate,
          ),
        ),
      );

      final quantityTextWidget = find.byKey(Key(
          'bundleText${mockMaterialInfo.materialNumber.getOrDefaultValue('')}'));

      await tester.enterText(quantityTextWidget, '5');
      await tester.pump();
      expect(find.text('5'), findsAtLeastNWidgets(1));
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

    testWidgets(
      'Test Bundle Detail Page Disable create order Add To Cart Button Hidden - Return Admin',
      (tester) async {
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
          () => userMockBloc.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Bundle Detail Page Disable create order Add To Cart Button Hidden - Return Requestor',
      (tester) async {
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
          () => userMockBloc.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Bundle Detail Page Disable create order Add To Cart Button Hidden - Return Approver',
      (tester) async {
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
          () => userMockBloc.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Bundle Detail Page Disable create order Add To Cart Button Hidden - disableCreateOrder true',
      (tester) async {
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
          () => userMockBloc.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsNothing);
      },
    );

    testWidgets(
      'Test Bundle Detail Page Disable create order Add To Cart Button Hidden - disableCreateOrder false',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fakeUser'),
          disableCreateOrder: false,
          accessRight: AccessRight.empty().copyWith(
            orders: true,
          ),
          role: Role(
            type: RoleType('fakeRole'),
            description: '',
            id: '',
            name: '',
          ),
        );

        when(
          () => userMockBloc.state,
        ).thenReturn(
          UserState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(
          getScopedWidget(
            BundleItemDetailPage(
              bundleAggregate: mockBundleAggregate,
            ),
          ),
        );
        await tester.pump();

        final addToCartButton = find.text('Add to Cart');
        expect(addToCartButton, findsOneWidget);
      },
    );
  });
}
