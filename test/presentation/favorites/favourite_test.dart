import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

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

void main() {
  late GetIt locator;
  final mockFavouriteBloc = MockFavouriteBloc();
  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;
  //TODO: Fix later in test case PR
  // final mockValidCustomerMaterialBloc = MockValidCustomerMaterialBloc();
  // final UserBloc userBlocMock = UserMockBloc();
  // final shipToCodeMockBloc = ShipToCodeMockBloc();
  // final customerCodeMockBloc = CustomerCodeMockBloc();
  // final salesOrgMockBloc = SalesOrgMockBloc();
  // final cartMockBloc = CartMockBloc();
  // final mockMaterialPriceDetailBloc = MaterialPriceDetailMockBloc();
  //
  // final mockFavourite1 = Favourite.empty().copyWith(
  //   id: '1',
  //   isFOC: false,
  //   isTenderContract: false,
  //   materialDescription: 'desc',
  //   materialNumber: MaterialNumber('131312312'),
  // );
  //
  // //TODO: Need write more test case when implement MaterialPriceDetailBloc in this page
  // setUpAll(() async {
  //   TestWidgetsFlutterBinding.ensureInitialized();
  //
  //   locator = GetIt.instance;
  //   locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  //   locator.registerLazySingleton(() => AppRouter());
  //   locator.registerLazySingleton(() => CountlyService());
  //   locator.registerLazySingleton(() => mockFavouriteBloc);
  //   locator.registerLazySingleton(() => mockValidCustomerMaterialBloc);
  //   autoRouterMock = locator<AppRouter>();
  //   mockHTTPService = MockHTTPService();
  //   locator.registerLazySingleton<HttpService>(
  //     () => mockHTTPService,
  //   );
  //   when(() => mockValidCustomerMaterialBloc.state).thenReturn(
  //     ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
  //       validateFavoriteMaterialId: ValidCustomerMaterialViewModel(
  //         status: ValidatingStatus.success,
  //         validMaterialNumbers: [mockFavourite1.materialNumber],
  //       )
  //     }),
  //   );
  //   when(() => customerCodeMockBloc.state)
  //       .thenReturn(CustomerCodeState.initial());
  //   when(() => salesOrgMockBloc.state).thenReturn(SalesOrgState.initial());
  //   when(() => shipToCodeMockBloc.state).thenReturn(ShipToCodeState.initial());
  //   when(() => userBlocMock.state).thenReturn(UserState.initial());
  //   when(() => cartMockBloc.state).thenReturn(CartState.initial());
  //   when(() => mockMaterialPriceDetailBloc.state)
  //       .thenReturn(MaterialPriceDetailState.initial());
  // });
  //
  // group(
  //   'Favourite',
  //   () {
  //     setUp(() {
  //       when(() => mockFavouriteBloc.state)
  //           .thenReturn(FavouriteState.initial());
  //     });
  //
  //     StackRouterScope getWUT() {
  //       return WidgetUtils.getScopedWidget(
  //         autoRouterMock: autoRouterMock,
  //         providers: [
  //           BlocProvider<UserBloc>(create: (context) => userBlocMock),
  //           BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgMockBloc)),
  //           BlocProvider<CustomerCodeBloc>(
  //               create: ((context) => customerCodeMockBloc)),
  //           BlocProvider<ShipToCodeBloc>(
  //               create: ((context) => shipToCodeMockBloc)),
  //           BlocProvider<FavouriteBloc>(create: (context) => mockFavouriteBloc),
  //           BlocProvider<ValidCustomerMaterialBloc>(
  //               create: (context) => mockValidCustomerMaterialBloc),
  //           BlocProvider<CartBloc>(create: (context) => cartMockBloc),
  //           BlocProvider<MaterialPriceDetailBloc>(
  //             create: (context) => mockMaterialPriceDetailBloc,
  //           ),
  //         ],
  //         child: const Scaffold(body: FavouritesTab()),
  //       );
  //     }
  //
  //     testWidgets('Favourite test  - delete favorite item',
  //         (tester) async {
  //       final favouriteBloc = locator<MockFavouriteBloc>();
  //       when(() => favouriteBloc.stream).thenAnswer((invocation) {
  //         return Stream.fromIterable([
  //           FavouriteState.initial().copyWith(
  //             isLoading: false,
  //             failureOrSuccessOption: none(),
  //             favouriteItems: [mockFavourite1],
  //           ),
  //         ]);
  //       });
  //       await tester.pumpWidget(getWUT());
  //       await tester.pump();
  //
  //       expect(
  //         find.byKey(const Key('scrollList')),
  //         findsOneWidget,
  //       );
  //       final favouriteListTile = find.byType(FavouriteListTile);
  //       expect(favouriteListTile, findsAtLeastNWidgets(1));
  //       await tester.drag(find.byKey(const Key('slidable')), const Offset(-300, 0.0));
  //       await tester.pump();
  //
  //       final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
  //       await tester.tap(find.byWidget(removeWidget));
  //       await tester.pump();
  //
  //     });
  //
  //     testWidgets('Favourite test  - valid Many items for favourite',
  //         (tester) async {
  //       final favouriteBloc = locator<MockFavouriteBloc>();
  //       when(() => favouriteBloc.stream).thenAnswer((invocation) {
  //         return Stream.fromIterable([
  //           FavouriteState.initial().copyWith(
  //             isLoading: false,
  //             failureOrSuccessOption: none(),
  //             favouriteItems: [mockFavourite1],
  //           ),
  //         ]);
  //       });
  //       await tester.pumpWidget(getWUT());
  //       await tester.pump();
  //
  //       expect(
  //         find.byKey(const Key('scrollList')),
  //         findsOneWidget,
  //       );
  //       final favouriteListTile = find.byType(FavouriteListTile);
  //       expect(favouriteListTile, findsAtLeastNWidgets(1));
  //
  //       await tester.pump();
  //       final deleteIcon = find.byKey(
  //         const Key('deleteFavouriteFavPage'),
  //       );
  //       expect(
  //         deleteIcon,
  //         findsOneWidget,
  //       );
  //
  //       final gestureDetector = find.byKey(
  //         const Key('itemClicked'),
  //       );
  //       expect(
  //         gestureDetector,
  //         findsOneWidget,
  //       );
  //     });
  //
  //     testWidgets('Favourite test - is Snackbar shown?', (tester) async {
  //       final favouriteBloc = locator<MockFavouriteBloc>();
  //       when(() => favouriteBloc.stream).thenAnswer((invocation) {
  //         return Stream.fromIterable(
  //           [
  //             FavouriteState.initial(),
  //             FavouriteState.initial().copyWith(
  //                 isLoading: false,
  //                 favouriteItems: [
  //                   Favourite.empty(),
  //                   Favourite.empty(),
  //                 ],
  //                 failureOrSuccessOption: optionOf(
  //                   const Left(ApiFailure.other('Fake Error')),
  //                 )),
  //           ],
  //         );
  //       });
  //       await tester.pumpWidget(getWUT());
  //       await tester.pump();
  //
  //       expect(
  //         find.byKey(const Key('snackBarMessage')),
  //         findsOneWidget,
  //       );
  //     });
  //
  //     testWidgets(
  //       'Favourite test - No Favourite item found',
  //       (tester) async {
  //         final favouriteBloc = locator<MockFavouriteBloc>();
  //         when(() => favouriteBloc.stream).thenAnswer(
  //           (invocation) {
  //             return Stream.fromIterable(
  //               [
  //                 FavouriteState.initial(),
  //                 FavouriteState.initial().copyWith(
  //                   isLoading: false,
  //                   favouriteItems: [],
  //                   failureOrSuccessOption: none(),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //
  //         await tester.pumpWidget(getWUT());
  //         await tester.pump();
  //
  //         expect(
  //           find.text('No favorite found'),
  //           findsWidgets,
  //         );
  //       },
  //     );
  //     testWidgets(
  //       'Favourite test - No API error',
  //       (tester) async {
  //         final favouriteBloc = locator<MockFavouriteBloc>();
  //         when(() => favouriteBloc.stream).thenAnswer(
  //           (invocation) {
  //             return Stream.fromIterable(
  //               [
  //                 FavouriteState.initial(),
  //                 FavouriteState.initial().copyWith(
  //                   isLoading: false,
  //                   favouriteItems: [
  //                     Favourite.empty(),
  //                     Favourite.empty(),
  //                   ],
  //                   failureOrSuccessOption:
  //                       optionOf(const Right('No API error')),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //         await tester.pumpWidget(getWUT());
  //         await tester.pump();
  //
  //         expect(
  //           find.byKey(const Key('scrollList')),
  //           findsWidgets,
  //         );
  //       },
  //     );
  //     testWidgets(
  //       'Favourite test - No validate Favourite item found',
  //       (tester) async {
  //         when(() => mockValidCustomerMaterialBloc.state).thenReturn(
  //           ValidCustomerMaterialState.initial().copyWith(validMaterialState: {
  //             validateFavoriteMaterialId: const ValidCustomerMaterialViewModel(
  //               status: ValidatingStatus.failure,
  //               validMaterialNumbers: [],
  //             )
  //           }),
  //         );
  //         final favouriteBloc = locator<MockFavouriteBloc>();
  //         when(() => favouriteBloc.stream).thenAnswer(
  //           (invocation) {
  //             return Stream.fromIterable(
  //               [
  //                 FavouriteState.initial(),
  //                 FavouriteState.initial().copyWith(
  //                   isLoading: false,
  //                   favouriteItems: [mockFavourite1],
  //                   failureOrSuccessOption: none(),
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //
  //         await tester.pumpWidget(getWUT());
  //         await tester.pump();
  //
  //         expect(
  //           find.text('No favorite found'),
  //           findsWidgets,
  //         );
  //       },
  //     );
  //   },
  // );
}
