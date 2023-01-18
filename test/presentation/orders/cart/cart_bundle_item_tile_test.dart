import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

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

void main() {
  // late CartItem bundleItem;
  // late TenderContractBloc tenderContractBlocMock;
  // late UserBloc userBloc;
  // late SalesOrgBloc salesOrgBloc;
  // late EligibilityBloc eligibilityBloc;
  // late CustomerCodeBloc customerCodeBloc;
  // late ShipToCodeBloc shipToCodeBloc;
  // late CountlyService countlyService;
  // late CartBloc cartBloc;
  // late MaterialPriceBloc materialPriceBloc;
  // late Map<MaterialNumber, Price> mockPriceList;
  // late List<PriceAggregate> priceAggregates;

  // setUpAll(() {
  //   countlyService = CountlyServiceMock();
  //   locator.registerLazySingleton(() => countlyService);
  // });
  // setUp(
  //   () {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     tenderContractBlocMock = TenderContractBlocMock();
  //     userBloc = UserBlocMock();
  //     salesOrgBloc = SalesOrgBlocMock();
  //     eligibilityBloc = EligibilityBlocMock();
  //     customerCodeBloc = CustomerCodeBlocMock();
  //     shipToCodeBloc = ShipToBlocMock();
  //     cartBloc = CartBlocMock();
  //     materialPriceBloc = MaterialPriceBlocMock();
  //     mockPriceList = {
  //       MaterialNumber('000000000023168451'): Price.empty().copyWith(
  //         finalPrice: MaterialPrice(4.5),
  //       ),
  //       MaterialNumber('000000000023168452'): Price.empty().copyWith(
  //         finalPrice: MaterialPrice(5.5),
  //       )
  //     };
  //     priceAggregates = <PriceAggregate>[
  //       PriceAggregate.empty().copyWith(
  //         quantity: 2,
  //         materialInfo: MaterialInfo.empty().copyWith(
  //           materialNumber: MaterialNumber('000000000023168451'),
  //           materialDescription: ' Triglyceride Mosys D',
  //           principalData: PrincipalData.empty().copyWith(
  //             principalName: '台灣拜耳股份有限公司',
  //           ),
  //         ),
  //       ),
  //       PriceAggregate.empty().copyWith(
  //         quantity: 2,
  //         materialInfo: MaterialInfo.empty().copyWith(
  //           materialNumber: MaterialNumber('000000000023168452'),
  //           materialDescription: ' Triglyceride Mosys D',
  //           principalData: PrincipalData.empty().copyWith(
  //             principalName: '台灣拜耳股份有限公司',
  //           ),
  //         ),
  //       ),
  //     ];
  //     bundleItem = CartItem(
  //       materials: priceAggregates,
  //       itemType: CartItemType.bundle,
  //     );
  //     when(() => userBloc.state).thenReturn(UserState.initial());
  //     when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
  //     when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
  //     when(() => customerCodeBloc.state).thenReturn(
  //       CustomerCodeState.initial(),
  //     );
  //     when(() => shipToCodeBloc.state).thenReturn(ShipToCodeState.initial());
  //     when(() => tenderContractBlocMock.state)
  //         .thenReturn(TenderContractState.initial());
  //     when(() => cartBloc.state).thenReturn(CartState.initial().copyWith(
  //       isFetching: false,
  //       cartItemList: priceAggregates,
  //     ));
  //     when(() => materialPriceBloc.state)
  //         .thenReturn(MaterialPriceState.initial().copyWith(
  //       isFetching: false,
  //       materialPrice: mockPriceList,
  //     ));
  //   },
  // );
  // group('bundle Item Tile quantiy change', () {
  //   Widget getWidget() {
  //     return WidgetUtils.getScopedWidget(
  //       autoRouterMock: AutoRouterMock(),
  //       providers: [
  //         BlocProvider<TenderContractBloc>(
  //             create: (context) => tenderContractBlocMock),
  //         BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
  //         BlocProvider<ShipToCodeBloc>(create: (context) => shipToCodeBloc),
  //         BlocProvider<UserBloc>(create: (context) => userBloc),
  //         BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
  //         BlocProvider<CartBloc>(create: (context) => cartBloc),
  //         BlocProvider<CustomerCodeBloc>(
  //           create: (context) => customerCodeBloc,
  //         ),
  //         BlocProvider<MaterialPriceBloc>(
  //           create: (context) => materialPriceBloc,
  //         ),
  //       ],
  //       child: MaterialApp(
  //         title: 'Tests',
  //         home: Scaffold(
  //           body: CartBundleItemTile(
  //             cartItem: bundleItem,
  //             showCheckBox: true,
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   testWidgets(
  //     'bundle item quntity update',
  //     (tester) async {
  //       when(() => countlyService.addCountlyEvent(
  //             'changed_quantity',
  //             segmentation: {
  //               'materialNum': bundleItem.materials.first.getMaterialNumber
  //                   .getOrDefaultValue(''),
  //               'listPrice': bundleItem.materials.first.listPrice,
  //               'price': bundleItem.materials.first.price.finalPrice
  //                   .getOrDefaultValue(0),
  //             },
  //           )).thenAnswer((invocation) async => Future.value());

  //       await tester.pumpWidget(getWidget());
  //       await tester.pump();
  //       final quantityInput = find.byType(QuantityInput);
  //       expect(quantityInput, findsNWidgets(2));
  //       await tester.ensureVisible(quantityInput.first);
  //       await tester.pump();
  //       await tester.tap(quantityInput.first, warnIfMissed: false);
  //       await tester.enterText(quantityInput.first, '12');
  //       await tester.pump();

  //       verify(
  //         () => countlyService.addCountlyEvent(
  //           'changed_quantity',
  //           segmentation: {
  //             'materialNum': bundleItem.materials.first.getMaterialNumber
  //                 .getOrDefaultValue(''),
  //             'listPrice': bundleItem.materials.first.listPrice,
  //             'price': bundleItem.materials.first.price.finalPrice
  //                 .getOrDefaultValue(0),
  //           },
  //         ),
  //       ).called(1);
  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.updateCartItem(
  //             item: bundleItem.materials.first.copyWith(quantity: 12),
  //             customerCodeInfo: CustomerCodeInfo.empty(),
  //             doNotallowOutOfStockMaterial: true,
  //             salesOrganisation: SalesOrganisation.empty(),
  //             salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
  //             shipToInfo: ShipToInfo.empty(),
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'bundle item quntity decrement',
  //     (tester) async {
  //       bundleItem = bundleItem.copyWith(
  //         materials: bundleItem.materials
  //             .map(
  //               (e) => e.copyWith(quantity: 4),
  //             )
  //             .toList(),
  //       );

  //       when(() => countlyService.addCountlyEvent(
  //             'deduct_quantity',
  //             segmentation: {
  //               'materialNum': bundleItem.materials.first.getMaterialNumber
  //                   .getOrDefaultValue(''),
  //               'listPrice': bundleItem.materials.first.listPrice,
  //               'price': bundleItem.materials.first.price.finalPrice
  //                   .getOrDefaultValue(0),
  //             },
  //           )).thenAnswer((invocation) async => Future.value());

  //       await tester.pumpWidget(getWidget());
  //       await tester.pump();
  //       final quantityInput = find.byType(QuantityInput);
  //       expect(quantityInput, findsNWidgets(2));
  //       await tester.ensureVisible(quantityInput.first);
  //       await tester.pump();

  //       await tester.tap(quantityInput.first, warnIfMissed: false);
  //       final cartDelete = find.byKey(const ValueKey('cartDelete'));
  //       expect(cartDelete, findsNWidgets(2));
  //       await tester.tap(cartDelete.first);
  //       verify(
  //         () => countlyService.addCountlyEvent(
  //           'deduct_quantity',
  //           segmentation: {
  //             'materialNum': bundleItem.materials.first.getMaterialNumber
  //                 .getOrDefaultValue(''),
  //             'listPrice': bundleItem.materials.first.listPrice,
  //             'price': bundleItem.materials.first.price.finalPrice
  //                 .getOrDefaultValue(0),
  //           },
  //         ),
  //       ).called(1);

  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.addToCart(
  //             item: bundleItem.materials.first.copyWith(quantity: -1),
  //             customerCodeInfo: CustomerCodeInfo.empty(),
  //             doNotallowOutOfStockMaterial: true,
  //             salesOrganisation: SalesOrganisation.empty(),
  //             salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
  //             shipToInfo: ShipToInfo.empty(),
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'bundle item quntity increment',
  //     (tester) async {
  //       when(() => countlyService.addCountlyEvent(
  //             'add_quantity',
  //             segmentation: {
  //               'materialNum': bundleItem.materials.first.getMaterialNumber
  //                   .getOrDefaultValue(''),
  //               'listPrice': bundleItem.materials.first.listPrice,
  //               'price': bundleItem.materials.first.price.finalPrice
  //                   .getOrDefaultValue(0),
  //             },
  //           )).thenAnswer((invocation) async => Future.value());

  //       await tester.pumpWidget(getWidget());
  //       final quantityInput = find.byType(QuantityInput);
  //       expect(quantityInput, findsNWidgets(2));
  //       await tester.ensureVisible(quantityInput.first);
  //       await tester.pump();
  //       await tester.tap(quantityInput.first, warnIfMissed: false);
  //       final cartAdd = find.byKey(const ValueKey('cartAdd'));
  //       expect(cartAdd, findsNWidgets(2));
  //       await tester.tap(cartAdd.first);
  //       verify(
  //         () => countlyService.addCountlyEvent(
  //           'add_quantity',
  //           segmentation: {
  //             'materialNum': bundleItem.materials.first.getMaterialNumber
  //                 .getOrDefaultValue(''),
  //             'listPrice': bundleItem.materials.first.listPrice,
  //             'price': bundleItem.materials.first.price.finalPrice
  //                 .getOrDefaultValue(0),
  //           },
  //         ),
  //       ).called(1);

  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.addToCart(
  //             item: bundleItem.materials.first.copyWith(quantity: 1),
  //             customerCodeInfo: CustomerCodeInfo.empty(),
  //             doNotallowOutOfStockMaterial: true,
  //             salesOrganisation: SalesOrganisation.empty(),
  //             salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
  //             shipToInfo: ShipToInfo.empty(),
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'bundle item delete',
  //     (tester) async {
  //       await tester.pumpWidget(getWidget());
  //       final bundleCart = find.byType(CustomSlidable);
  //       expect(bundleCart, findsOneWidget);
  //       await tester.dragFrom(
  //           const Offset(500.0, 20.0), const Offset(-200.0, 10.0));
  //       await tester.pump();
  //       final deleteIcon = find.byIcon(Icons.delete_outline);
  //       expect(deleteIcon, findsOneWidget);
  //       await tester.tap(deleteIcon);

  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.removeFromCart(
  //             item: bundleItem.materials.first,
  //           ),
  //         ),
  //       ).called(1);
  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.removeFromCart(
  //             item: bundleItem.materials.last,
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'bundle item onCheck',
  //     (tester) async {
  //       await tester.pumpWidget(getWidget());
  //       final bundleCartCheckbox = find.byType(Checkbox);
  //       expect(bundleCartCheckbox, findsOneWidget);
  //       await tester.tap(bundleCartCheckbox);

  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.updateSelectedItem(
  //             item: bundleItem.materials.first,
  //           ),
  //         ),
  //       ).called(1);
  //       verify(
  //         () => cartBloc.add(
  //           CartEvent.updateSelectedItem(
  //             item: bundleItem.materials.last,
  //           ),
  //         ),
  //       ).called(1);
  //     },
  //   );

  //   testWidgets(
  //     'bundle item Widget test',
  //     (tester) async {
  //       when(() => salesOrgBloc.state).thenReturn(
  //         SalesOrgState.initial().copyWith(
  //           configs: SalesOrganisationConfigs.empty()
  //               .copyWith(enableListPrice: true),
  //         ),
  //       );

  //       final expectedStates = [
  //         CartState.initial().copyWith(
  //           isFetching: true,
  //         ),
  //         CartState.initial().copyWith(
  //           isFetching: false,
  //           cartItemList: priceAggregates,
  //         ),
  //       ];
  //       whenListen(cartBloc, Stream.fromIterable(expectedStates));
  //       bundleItem = bundleItem.copyWith(
  //         materials: bundleItem.materials
  //             .map(
  //               (e) => e.copyWith(
  //                 bundle: Bundle.empty().copyWith(
  //                   bundleInformation: [
  //                     BundleInfo(
  //                       quantity: 1,
  //                       rate: 1,
  //                       sequence: 1,
  //                       type: MaterialBundleType('test bundleInfoMessage'),
  //                     ),
  //                     BundleInfo(
  //                       quantity: 1,
  //                       rate: 1,
  //                       sequence: 1,
  //                       type: MaterialBundleType('test bundleInfoMessage'),
  //                     ),
  //                   ],
  //                 ),
  //                 salesOrgConfig: SalesOrganisationConfigs.empty()
  //                     .copyWith(enableDefaultMD: true),
  //                 materialInfo: e.materialInfo
  //                     .copyWith(defaultMaterialDescription: 'Test Description'),
  //               ),
  //             )
  //             .toList(),
  //       );
  //       await tester.pumpWidget(getWidget());
  //       final description = find.textContaining('Test Description');
  //       expect(description, findsAtLeastNWidgets(2));
  //       final listPrice = find.textContaining('List Price');
  //       expect(listPrice, findsOneWidget);
  //       final bundleInfoMessage = find.textContaining('test bundleInfoMessage');
  //       expect(bundleInfoMessage, findsAtLeastNWidgets(2));
  //     },
  //   );
  // });
}
