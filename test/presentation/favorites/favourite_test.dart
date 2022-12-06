import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/favourites/favourite_tab.dart';
import 'package:ezrxmobile/presentation/favourites/favourite_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CustomerCodeMockBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialPriceDetailMockBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  var mockFavouriteBloc = MockFavouriteBloc();
  var userBlocMock = UserMockBloc();
  var shipToCodeMockBloc = ShipToCodeMockBloc();
  var customerCodeMockBloc = CustomerCodeMockBloc();
  var salesOrgMockBloc = SalesOrgMockBloc();
  var cartMockBloc = CartMockBloc();
  var mockMaterialPriceDetailBloc = MaterialPriceDetailMockBloc();
  late EligibilityBlocMock mockEligiblityBloc;

  final mockFavourite1 = Favourite(
    id: 'fake-id-1',
    isFOC: false,
    isTenderContract: false,
    materialDescription: 'desc',
    materialNumber: MaterialNumber('fake-number-1'),
  );

  final mockFavourite2 = Favourite(
    id: 'fake-id-2',
    isFOC: false,
    isTenderContract: false,
    materialDescription: 'desc',
    materialNumber: MaterialNumber('fake-number-2'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  void initialSetup() {
    mockFavouriteBloc = MockFavouriteBloc();
    userBlocMock = UserMockBloc();
    shipToCodeMockBloc = ShipToCodeMockBloc();
    customerCodeMockBloc = CustomerCodeMockBloc();
    salesOrgMockBloc = SalesOrgMockBloc();
    cartMockBloc = CartMockBloc();
    mockMaterialPriceDetailBloc = MaterialPriceDetailMockBloc();
    mockEligiblityBloc = EligibilityBlocMock();
    when(() => mockEligiblityBloc.state).thenReturn(EligibilityState.initial());
    when(() => customerCodeMockBloc.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => salesOrgMockBloc.state).thenReturn(SalesOrgState.initial());
    when(() => shipToCodeMockBloc.state).thenReturn(ShipToCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => cartMockBloc.state).thenReturn(CartState.initial());
    when(() => mockMaterialPriceDetailBloc.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
  }

  group(
    'Favourite',
    () {
      Widget getFavoritePage() {
        return MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
              BlocProvider<SalesOrgBloc>(
                  create: ((context) => salesOrgMockBloc)),
              BlocProvider<CustomerCodeBloc>(
                  create: ((context) => customerCodeMockBloc)),
              BlocProvider<ShipToCodeBloc>(
                  create: ((context) => shipToCodeMockBloc)),
              BlocProvider<FavouriteBloc>(
                  create: (context) => mockFavouriteBloc),
              BlocProvider<CartBloc>(create: (context) => cartMockBloc),
              BlocProvider<MaterialPriceDetailBloc>(
                create: (context) => mockMaterialPriceDetailBloc,
              ),
              BlocProvider<EligibilityBloc>(
                  create: (context) => mockEligiblityBloc),
            ],
            child: const FavouritesTab(),
          ),
        );
      }

      setUp(
        () => initialSetup(),
      );
      testWidgets('Favourite test  - delete favorite item failure',
          (tester) async {
        when(() => mockFavouriteBloc.state).thenAnswer((invocation) {
          return FavouriteState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption: none(),
            favouriteItems: [
              mockFavourite1,
            ],
          );
        });
        whenListen(
            mockMaterialPriceDetailBloc,
            Stream.fromIterable(
              [
                MaterialPriceDetailState.initial().copyWith(isValidating: true),
                MaterialPriceDetailState.initial().copyWith(
                  isValidating: false,
                  materialDetails: {
                    MaterialQueryInfo.fromFavorite(material: mockFavourite1):
                        MaterialPriceDetail.empty(),
                  },
                ),
              ],
            ));
        await tester.pumpWidget(getFavoritePage());
        await tester.pump();

        expect(find.byType(FavouriteListTile), findsAtLeastNWidgets(1));
        await tester.drag(
            find.byKey(const Key('slidable')), const Offset(-300, 0.0));
        await tester.pump();
        final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
        await tester.tap(find.byWidget(removeWidget));
        await tester.pump();
        verify(() => mockFavouriteBloc.add(FavouriteEvent.delete(
              item: mockFavourite1,
              user: User.empty(),
            ))).called(1);
        final favouriteButton = find.byKey(const Key('deleteFavouriteFavPage'));

        expect(favouriteButton, findsOneWidget);
        await tester.tap(favouriteButton);

        await tester.fling(
            find.byType(CustomScrollView), const Offset(0, 300), 600);
        await tester.pumpAndSettle(const Duration(seconds: 2));
        verify(() => mockFavouriteBloc.add(
              FavouriteEvent.fetch(
                user: User.empty(),
              ),
            )).called(1);
        verify(() => mockMaterialPriceDetailBloc.add(
              const MaterialPriceDetailEvent.initialized(),
            )).called(1);
      });

      testWidgets(
          'Favourite API failure, display empty list, snackbar showed and then pull to refresh',
          (tester) async {
        initialSetup();
        when(() => mockFavouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable(
            [
              FavouriteState.initial(),
              FavouriteState.initial().copyWith(
                  isLoading: false,
                  failureOrSuccessOption: optionOf(
                    const Left(ApiFailure.other('Fake Error')),
                  )),
            ],
          );
        });
        await tester.pumpWidget(getFavoritePage());
        await tester.pump();

        expect(find.byKey(const Key('snackBarMessage')), findsOneWidget);
        expect(find.byType(FavouriteListTile), findsNothing);
        expect(find.text('No favorite found'), findsOneWidget);
      });

      // Need to modify this
      //
      // testWidgets(
      //     'Fetch Favourite success, ValidCustomerMaterial failure, display an empty list',
      //     (tester) async {
      //   initialSetup();
      //   when(() => mockFavouriteBloc.stream).thenAnswer((invocation) {
      //     return Stream.fromIterable(
      //       [
      //         FavouriteState.initial(),
      //         FavouriteState.initial().copyWith(
      //           isLoading: false,
      //           favouriteItems: [mockFavourite1],
      //         ),
      //       ],
      //     );
      //   });
      //   await tester.pumpWidget(getFavoritePage());
      //   expect(find.byKey(const Key('LoaderImage')), findsOneWidget);
      //   await tester.pump();
      //   expect(find.byType(FavouriteListTile), findsNothing);
      //   expect(find.text('No favorite found'), findsOneWidget);
      // });

      testWidgets(
          'Fetch Favourite success with 2 results, ValidCustomerMaterial success, display one material valid loading price',
          (tester) async {
        initialSetup();
        when(() => mockFavouriteBloc.state).thenAnswer((invocation) {
          return FavouriteState.initial().copyWith(
            isLoading: false,
            favouriteItems: [
              mockFavourite1,
              mockFavourite2,
            ],
          );
        });
        whenListen(
            mockMaterialPriceDetailBloc,
            Stream.fromIterable(
              [
                MaterialPriceDetailState.initial().copyWith(isValidating: true),
                MaterialPriceDetailState.initial().copyWith(
                  isValidating: false,
                  isFetching: true,
                  materialDetails: {
                    MaterialQueryInfo.fromFavorite(material: mockFavourite1):
                        MaterialPriceDetail.empty()
                  },
                ),
              ],
            ));
        await tester.pumpWidget(getFavoritePage());
        await tester.pump();
        expect(find.byType(FavouriteListTile), findsOneWidget);
        expect(
            find.byKey(
              const Key('price-loading'),
            ),
            findsOneWidget);
      });

      testWidgets('Get Material Price Detail', (tester) async {
        when(() => salesOrgMockBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enableDefaultMD: true,
              enableVat: true,
            ),
          ),
        );
        whenListen(
            mockFavouriteBloc,
            Stream.fromIterable(
              [
                FavouriteState.initial().copyWith(isLoading: true),
                FavouriteState.initial().copyWith(
                  isLoading: false,
                  failureOrSuccessOption: none(),
                  favouriteItems: [
                    mockFavourite1,
                  ],
                ),
              ],
            ));
        whenListen(
            mockMaterialPriceDetailBloc,
            Stream.fromIterable(
              [
                MaterialPriceDetailState.initial().copyWith(isValidating: true),
                MaterialPriceDetailState.initial().copyWith(
                  isValidating: false,
                  materialDetails: {
                    MaterialQueryInfo.fromFavorite(material: mockFavourite1):
                        MaterialPriceDetail.empty().copyWith(
                      info: MaterialInfo.empty()
                          .copyWith(defaultMaterialDescription: 'test'),
                    ),
                  },
                ),
              ],
            ));
        await tester.pumpWidget(getFavoritePage());
        await tester.pump();

        expect(find.byType(FavouriteListTile), findsOneWidget);
        expect(find.byKey(const Key('priceBefore')), findsOneWidget);
      });
    },
  );
}
