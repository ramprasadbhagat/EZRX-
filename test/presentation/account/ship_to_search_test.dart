import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/account/ship_to_search.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

enum CustomerCodeVariant { onn, off }

enum ShipToCodeVariant { onn, off }

final shipToCodeVariants = ValueVariant({...ShipToCodeVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock customerCodeBlocMock;
  late ShipToCodeBlocMock shipToCodeBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  final fakeMaterialNumber = MaterialNumber('000000000023168451');

  final fakematerialInfo = MaterialInfo(
    quantity: 0,
    materialNumber: fakeMaterialNumber,
    materialDescription: "Reag Cup 15ml 1'S",
    governmentMaterialCode: '',
    therapeuticClass: 'All other non-therapeutic products',
    itemBrand: 'Item not listed in I',
    principalData: PrincipalData(
      principalName: PrincipalName('台灣羅氏醫療診斷設備(股)公司'),
      principalCode: PrincipalCode('0000102004'),
    ),
    taxClassification: MaterialTaxClassification('Product : Full Tax'),
    itemRegistrationNumber: 'NA',
    unitOfMeasurement: 'EA',
    materialGroup2: MaterialGroup.two(''),
    materialGroup4: MaterialGroup.four('OTH'),
    isSampleMaterial: false,
    hidePrice: false,
    hasValidTenderContract: false,
    hasMandatoryTenderContract: false,
    taxes: ['5'],
    bundles: [],
    defaultMaterialDescription: '',
    isFOCMaterial: false,
    remarks: '',
  );
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Ship To Search Screen', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      autoRouterMock = locator<AppRouter>();
      cartBlocMock = CartBlocMock();
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<ShipToCodeBloc>(create: (context) => shipToCodeBlocMock),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
        ],
        child: const ShiptToSearchPage(),
      );
    }

    testWidgets('Load ship to Search Widget', (tester) async {
      when(() => shipToCodeBlocMock.state).thenReturn(
        ShipToCodeState.initial().copyWith(
          searchKey: SearchKey('GSK'),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      final customerSearchPage = find.byKey(const Key('shipToSearchPage'));
      expect(customerSearchPage, findsOneWidget);
    });

    testWidgets('Clear ship to Search', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final clearShipToSearch = find.byKey(const Key('clearShipToSearch'));
      expect(clearShipToSearch, findsOneWidget);
      await tester.tap(clearShipToSearch);
    });

    testWidgets('Field Submitted ship to Search', (tester) async {
      whenListen(
          shipToCodeBlocMock,
          Stream.fromIterable(
            [
              ShipToCodeState.initial().copyWith(searchKey: SearchKey('')),
              ShipToCodeState.initial().copyWith(
                searchKey: SearchKey('GSK'),
              ),
            ],
          ));

      await tester.pumpWidget(getScopedWidget());

      await tester.enterText(
          find.byKey(const Key('shipToCodeSearchField')), 'a@b.c');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      // expect(find.byType(TextEditingValue), findsOneWidget);
      expect(find.text('123'), findsNothing);
      expect(find.text('a@b.c'), findsOneWidget);
    });
    testWidgets('snackBarMessage test', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.enterText(
          find.byKey(const Key('shipToCodeSearchField')), 'a@b.c');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('a@b.c'), findsOneWidget);
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });

    testWidgets(
      'Test Ship To Code Selector tile and search',
      (tester) async {
        final expectedShipToCodeListStates = [
          ShipToCodeState.initial().copyWith(isSearching: true),
          ShipToCodeState.initial().copyWith(
            isSearching: false,
            shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-123456', defaultShipToAddress: false),
            shipToInfoList: [
              ShipToInfo.empty().copyWith(defaultShipToAddress: true),
            ],
          ),
        ];
        // when(() => cartBlocMock.state)
        //     .thenReturn(CartState.initial().copyWith(cartItemList: [
        //   PriceAggregate.empty().copyWith(
        //     materialInfo: fakematerialInfo,
        //   ),
        // ]));

        whenListen(shipToCodeBlocMock,
            Stream.fromIterable(expectedShipToCodeListStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('shipToCodeSelect')), findsOneWidget);
        expect(find.byType(CustomLabel), findsOneWidget);
        if (customerCodeVariants.currentValue == CustomerCodeVariant.onn) {
          final shipToCodeOption =
              find.byKey(const Key('shipToOptionfake-123456'));
          expect(shipToCodeOption, findsOneWidget);
        }
      },
      variant: shipToCodeVariants,
    );
    testWidgets(
      'Test when cart item is not empty',
      (tester) async {
        when(() => cartBlocMock.state)
            .thenReturn(CartState.initial().copyWith(cartItems: [
          CartItem.material(
            PriceAggregate.empty().copyWith(
              materialInfo: fakematerialInfo,
            ),
          ),
        ]));

        when(() => shipToCodeBlocMock.state)
            .thenReturn(ShipToCodeState.initial().copyWith(shipToInfoList: [
          ShipToInfo.empty().copyWith(
              defaultShipToAddress: true, shipToCustomerCode: 'fake-123456'),
        ]));

        await tester.pumpWidget(getScopedWidget());

        await tester.pump(const Duration(seconds: 1));

        final shipToCodeSelect = find.byKey(const Key('shipToCodeSelect'));

        expect(shipToCodeSelect, findsOneWidget);

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(ListTile), findsWidgets);

        await tester.tap(
          find.byType(ListTile).first,
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.text('Change Shipping Address'), findsOneWidget);
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle(const Duration(seconds: 3));
        await tester.tap(find.text('Change'));
        await tester.pumpAndSettle(const Duration(seconds: 3));
      },
    );
    testWidgets(
      'Test when cart item is  empty',
      (tester) async {
        when(() => cartBlocMock.state).thenReturn(CartState.initial());

        when(() => shipToCodeBlocMock.state)
            .thenReturn(ShipToCodeState.initial().copyWith(shipToInfoList: [
          ShipToInfo.empty().copyWith(
              defaultShipToAddress: true, shipToCustomerCode: 'fake-123456'),
        ]));

        await tester.pumpWidget(getScopedWidget());

        await tester.pump(const Duration(seconds: 1));

        final shipToCodeSelect = find.byKey(const Key('shipToCodeSelect'));

        expect(shipToCodeSelect, findsOneWidget);

        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(ListTile), findsWidgets);

        await tester.tap(
          find.byType(ListTile).first,
        );

        await tester.pump(const Duration(seconds: 1));

        expect(find.text('Change Shipping Address'), findsNothing);
      },
    );
  });
}
