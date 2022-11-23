import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/multi_bloc_provider_frame_wrapper.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late List<PriceAggregate> mockCartItemWithDataList;
  late List<PriceAggregate> mockCartItemWithDataList2;

  late List<PriceAggregate> mockCartItemWithDataListOverride;
  late Map<MaterialNumber, Price> mockPriceList;

  final AuthBloc authBlocMock = AuthBlocMock();
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      salesOrgBloc = SalesOrgBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      mockPriceList = {};
      mockPriceList.putIfAbsent(
          MaterialNumber('000000000023168451'),
          () => Price.empty().copyWith(
                finalPrice: MaterialPrice(4.5),
              ));
      mockCartItemWithDataList = [
        PriceAggregate.empty().copyWith(
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: '台灣拜耳股份有限公司',
            ),
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
              principalName: '台灣拜耳股份有限公司',
            ),
          ),
        ),
      ];
      mockCartItemWithDataListOverride = [
        PriceAggregate.empty().copyWith(
          isOverride: true,
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
      when(() => cartBloc.state).thenReturn(CartState.initial().copyWith(
        apiFailureOrSuccessOption: none(),
        cartItemList: mockCartItemWithDataList,
        isFetching: false,
      ));
      when(() => materialPriceBloc.state)
          .thenReturn(MaterialPriceState.initial().copyWith(
        isFetching: false,
        materialPrice: mockPriceList,
      ));
      when(() => salesOrgBloc.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
      ));
      when(() => customerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
        customerCodeSoldTo: '1234',
      )));
    },
  );
  group(
    'Test Cart_Page',
    () {
      Widget getWidget() {
        return MultiBlocProviderFrameWrapper(
          providers: [
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
                create: (context) => materialPriceBloc),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBloc),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
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
      testWidgets(
        'Load Cart Page with Error',
        (tester) async {
          when(() => cartBloc.state).thenReturn(CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ));
          final expectedStates = [
            CartState.initial().copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
          ];
          whenListen(cartBloc, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final cartPage = find.byKey(const Key('cartpage'));
          expect(cartPage, findsOneWidget);
          final errorMessage = find.byKey(const Key('snackBarMessage'));
          expect(errorMessage, findsOneWidget);
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

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });
        // verify(() => authBlocMock.add(const AuthEvent.authCheck()));
      });
      testWidgets('Test have cart item list and Refresh', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final noBundleList = find.text('No bundle found');
        expect(noBundleList, findsNothing);
        final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
        expect(scrollWidget, findsOneWidget);
        await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
      });

      testWidgets('Test have cart item list add and slide and remove item',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final addWidget = tester.widget(find.byIcon(Icons.add));
        await tester.tap(find.byWidget(addWidget));
        await tester.pump();

        await tester.drag(
            find.byKey(const Key('slidable')), const Offset(-300, 0.0));
        await tester.pump();

        final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
        await tester.tap(find.byWidget(removeWidget));
        await tester.pump();
      });

      testWidgets('Test have cart item list add and decrease item',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final addWidget = tester.widget(find.byIcon(Icons.add));
        await tester.tap(find.byWidget(addWidget));
        await tester.pump();

        final removeWidget = tester.widget(find.byIcon(Icons.remove));
        await tester.tap(find.byWidget(removeWidget));
        await tester.pump();
      });

      testWidgets('Test have cart item list decrease item', (tester) async {
        //todo
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList2,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);

        final removeWidget = tester.widget(find.byIcon(Icons.remove));
        await tester.tap(find.byWidget(removeWidget));
        await tester.pump();
      });
      // TODO: Biswaranjan
      // delete button now change to slide to show
      // Cart item now directly get value from Price Aggegrate instead of cal
      // testWidgets('Test have cart item list and remove from cart',
      //     (tester) async {
      //   //todo
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItemList: mockCartItemWithDataList2,
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsOneWidget);

      //   final deleteWidget = tester.widget(find.byIcon(Icons.delete));
      //   await tester.tap(find.byWidget(deleteWidget));
      //   await tester.pump();
      // });
      // testWidgets('Test have cart item list and Material price loading',
      //     (tester) async {
      //   //todo
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItemList: mockCartItemWithDataList2,
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => materialPriceBloc.state).thenReturn(
      //     MaterialPriceState.initial().copyWith(
      //       materialPrice: {},
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsOneWidget);
      //   final finder = find.byKey(const Key('price-loading'));
      //   expect(finder, findsOneWidget);
      // });
      testWidgets('Test have cart item list and Material price loading NA',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList2,
            isFetching: false,
          ),
        );
        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {},
            isFetching: false,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final finder = find.byKey(const Key('price-loading'));
        expect(finder, findsNothing);
      });
      testWidgets('Test have cart item list and Material price loading Builder',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList2,
            isFetching: false,
          ),
        );
        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            materialPrice: {},
            isFetching: true,
          ),
        );

        final expectedStates = [
          MaterialPriceState.initial().copyWith(
            isFetching: false,
          ),
        ];
        whenListen(materialPriceBloc, Stream.fromIterable(expectedStates));

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final finder = find.byKey(const Key('price-loading'));
        expect(finder, findsNothing);
      });

      // TODO: need fix
      // testWidgets('Test have zmg Discount cart item', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItemList: [
      //         mockCartItemWithDataList2.first.copyWith(
      //           price: Price.empty().copyWith(
      //             zmgDiscount: true,
      //           ),
      //         )
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   await tester.pumpWidget(getWidget());
      //   await tester.pump();
      //   final zmgDiscountLable = find.byKey(const Key('zmgDiscountLable'));
      //   expect(zmgDiscountLable, findsOneWidget);
      // });

      testWidgets('open bottom sheet to override price', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final removeWidget = tester.widget(find.byIcon(Icons.remove));
        await tester.tap(find.byWidget(removeWidget));

        await tester.pump();
        final priceWidget = find.byKey(
          const Key('priceOverride'),
        );
        // tester.widget(find.byKey(const Key('priceOverride')));
        expect(priceWidget, findsOneWidget);
        await tester.tap(
          priceWidget,
        );
        // final bottomSheet = find.byKey(
        //   const Key('priceSheetKey'),
        // );
        // expect(bottomSheet, findsOneWidget);
      });
      testWidgets('Check if price is overrided ', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataListOverride,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final removeWidget = tester.widget(find.byIcon(Icons.remove));
        await tester.tap(find.byWidget(removeWidget));

        await tester.pump();
        final priceWidget = find.byKey(
          const Key('priceOverride'),
        );
        expect(priceWidget, findsOneWidget);

        expect(
            (tester.firstWidget(find.byKey(
              const Key('listPrice'),
            )) as Text)
                .style!
                .color,
            ZPColors.red);
      });
      testWidgets('Check if price is not overrided ', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartItemList: mockCartItemWithDataList,
            isFetching: true,
          ),
        );

        await tester.runAsync(() async {
          await tester.pumpWidget(getWidget());
        });

        await tester.pump();
        final item = find.byKey(Key(
            'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber}'));
        expect(item, findsOneWidget);
        final listWidget = find.byWidgetPredicate((w) => w is ListTile);
        expect(listWidget, findsOneWidget);
        final removeWidget = tester.widget(find.byIcon(Icons.remove));
        await tester.tap(find.byWidget(removeWidget));

        await tester.pump();
        final priceWidget = find.byKey(
          const Key('priceOverride'),
        );
        expect(priceWidget, findsOneWidget);

        expect(
            (tester.firstWidget(find.byKey(
              const Key('listPrice'),
            )) as Text)
                .style!
                .color,
            ZPColors.lightGray);
      });
    },
  );
}
