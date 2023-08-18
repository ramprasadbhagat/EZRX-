// ignore_for_file: unused_local_variable

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class DiscountOverrideRepositoryMock extends Mock
    implements DiscountOverrideRepository {}

class DiscountOverrideBlocMock
    extends MockBloc<DiscountOverrideEvent, DiscountOverrideState>
    implements DiscountOverrideBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late List<PriceAggregate> mockCartItemWithDataList;
  late List<PriceAggregate> mockCartItemWithDataList2;
  late List<PriceAggregate> mockCartItemBundles;
  late List<PriceAggregate> mockCartItemBundles2;
  late List<PriceAggregate> mockCartItemDiscountBundles;
  late MaterialListBloc materialListBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late DiscountOverrideBloc discountOverrideBlocMock;
  late List<PriceAggregate> mockCartItemWithDataListOverride;
  late Map<MaterialNumber, Price> mockPriceList;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  final AddToCartBloc addToCartBlocMock = AddToCartBlocMock();
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late CartItem mockCartItemWithOutBatch;
  late CartItem mockCartItemWithBatch;
  late List<StockInfo> batchStockInfoMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => DiscountOverrideRepositoryMock());
    locator.registerFactory(
      () => DiscountOverrideBloc(repository: DiscountOverrideRepositoryMock()),
    );
    locator.registerFactory(() => AppRouter());
    locator.registerFactory<AddToCartBloc>(() => addToCartBlocMock);
    locator.registerFactory<TenderContractBloc>(() => tenderContractBlocMock);
    autoRouter = locator<AppRouter>();
  });
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      materialListBlocMock = MaterialListBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      cartBloc = CartBlocMock();
      materialPriceBloc = MaterialPriceBlocMock();
      salesOrgBloc = SalesOrgBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      userBloc = UserBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      discountOverrideBlocMock = DiscountOverrideBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      priceOverrideBloc = PriceOverrideBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

      mockPriceList = {};
      mockPriceList.putIfAbsent(
        MaterialNumber('000000000023168451'),
        () => Price.empty().copyWith(
          finalPrice: MaterialPrice(4.5),
        ),
      );

      mockCartItemBundles2 = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            ),
          ],
          salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
            vatValue: 8,
            enableVat: true,
            enableTaxClassification: true,
            enableTaxAtTotalLevelOnly: true,
          ),
          quantity: 5,
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[
              MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('000000000023168451'),
                materialDescription: ' Triglyceride Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
                remarks: '',
              )
            ],
            bundleInformation: [
              BundleInfo.empty().copyWith(
                quantity: 1,
                rate: 20.0,
                sequence: 1,
                type: DiscountType('%'),
              ),
              BundleInfo.empty().copyWith(
                quantity: 10,
                rate: 19.0,
                sequence: 2,
                type: DiscountType('%'),
              ),
              BundleInfo.empty().copyWith(
                quantity: 100,
                rate: 15.0,
                sequence: 3,
                type: DiscountType('%'),
              ),
            ],
            bundleCode: '',
            bundleName: BundleName('test'),
            bonusEligible: false,
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemBundles = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            ),
          ],
          quantity: 10,
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[],
            bundleInformation: [],
            bundleCode: '',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            )
          ],
          quantity: 1,
          bundle: Bundle.empty(),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168441'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemDiscountBundles = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            ),
          ],
          quantity: 1,
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(
              100.0,
            ),
          ),
          bundle: Bundle.empty().copyWith(
            materials: <MaterialInfo>[],
            bundleInformation: [],
            bundleCode: '123',
            bundleName: BundleName('test'),
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
                materialDescription: ' Mosys D',
                principalData: PrincipalData.empty().copyWith(
                  principalName:
                      PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                ),
              ),
            )
          ],
          quantity: 1,
          bundle: Bundle.empty().copyWith(
            bundleCode: '124',
            bundleInformation: [
              BundleInfo.empty().copyWith(
                rate: -10,
              ),
            ],
          ),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168441'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];

      mockCartItemWithDataList = [
        PriceAggregate.empty().copyWith(
          addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('0000000000111111'),
              ),
              materialDescription: ' Mosys D',
            ),
          ],
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
            remarks: '',
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
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
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];
      mockCartItemWithDataListOverride = [
        PriceAggregate.empty().copyWith(
          price: Price.empty().copyWith(
            isPriceOverride: true,
          ),
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023168451'),
            materialDescription: ' Triglyceride Mosys D',
            principalData: PrincipalData.empty().copyWith(
              principalName: PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
            ),
          ),
          stockInfo: StockInfo.empty().copyWith(
            inStock: MaterialInStock('Yes'),
          ),
        ),
      ];
      mockCartItemWithOutBatch = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023168451'),
            ),
          ),
        ],
        itemType: CartItemType.material,
      );

      batchStockInfoMock = [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          inStock: MaterialInStock('Yes'),
          expiryDate: DateTimeStringValue('NA'),
          salesDistrict: '',
          batch: BatchNumber('fake-batch'),
        ),
      ];
      mockCartItemWithBatch = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            quantity: 1,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023168451'),
            ),
            stockInfo: batchStockInfoMock.first,
            stockInfoList: batchStockInfoMock,
          ),
        ],
        itemType: CartItemType.material,
      );
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartItems: [CartItem.material(mockCartItemWithDataList.first)],
          isFetching: false,
        ),
      );
      when(() => materialPriceBloc.state).thenReturn(
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: mockPriceList,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => userBloc.state).thenReturn(UserState.initial());
      when(() => discountOverrideBlocMock.state)
          .thenReturn(DiscountOverrideState.initial());
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial().copyWith());
      when(() => orderSummaryBlocMock.state).thenReturn(
        OrderSummaryState.initial().copyWith(),
      );
      when(() => salesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableReferenceNote: true,
            enableVat: true,
            enableFutureDeliveryDay: true,
            enableMobileNumber: true,
            enableSpecialInstructions: true,
            disableOrderType: false,
            enableCollectiveNumber: true,
            enablePaymentTerms: true,
            enableRemarks: true,
            priceOverride: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ),
      );
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
        ),
      );
      when(() => userBloc.state).thenReturn(
        UserState.initial()
            .copyWith(user: User.empty().copyWith(hasBonusOverride: false)),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => orderDocumentTypeBlocMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          selectedOrderType: OrderDocumentType.empty().copyWith(
            documentType: DocumentType('Test (ZPOR)'),
          ),
        ),
      );
      when(() => priceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    },
  );
  group(
    'Test Cart_Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouter,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBloc),
            BlocProvider<CartBloc>(create: (context) => cartBloc),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBloc,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AddToCartBloc>(
              create: ((context) => addToCartBlocMock),
            ),
            BlocProvider<MaterialListBloc>(
              create: ((context) => materialListBlocMock),
            ),
            BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
            BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<OrderEligibilityBloc>(
              create: (context) => orderEligibilityBlocMock,
            ),
            BlocProvider<PriceOverrideBloc>(
              create: (context) => priceOverrideBloc,
            ),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
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

      testWidgets('Delete item from cart by swapping', (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList2,
            isFetching: true,
            isClearing: false,
            isUpserting: false,
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final listWidget = find.byType(CartProductTile);
        expect(listWidget, findsOneWidget);
        await tester.drag(listWidget, const Offset(-500, 0));
        await tester.pump();
        final deleteIcon = find.byIcon(Icons.delete_outline);
        expect(deleteIcon, findsOneWidget);

        await tester.tap(
          deleteIcon,
          warnIfMissed: true,
        );
        await tester.pump(const Duration(seconds: 1));

        verify(
          () => cartBloc.add(
            CartEvent.upsertCart(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('2601')),
              customerCodeInfo:
                  CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1234'),
              shipToInfo: ShipToInfo.empty(),
              priceAggregate: mockCartItemWithDataList2.first,
              quantity: 0,
              salesOrganisationConfigs:
                  SalesOrganisationConfigs.empty().copyWith(
                enableReferenceNote: true,
                enableVat: true,
                enableFutureDeliveryDay: true,
                enableMobileNumber: true,
                enableSpecialInstructions: true,
                disableOrderType: false,
                enableCollectiveNumber: true,
                enablePaymentTerms: true,
                enableRemarks: true,
                priceOverride: true,
              ),
              counterOfferDetails: RequestCounterOfferDetails.empty(),
            ),
          ),
        ).called(1);
      });
      testWidgets(
          'Test SnackBarMessage when delete the item from cart by swapping',
          (tester) async {
        when(() => cartBloc.state).thenReturn(
          CartState.initial().copyWith(
            cartProducts: mockCartItemWithDataList2,
            isClearing: true,
            isUpserting: true,
          ),
        );
        final expectedStates = [
          CartState.initial().copyWith(
            cartProducts: [
              ...mockCartItemWithDataList2,
              ...mockCartItemWithDataList2
            ],
            isClearing: false,
            isUpserting: false,
          ),
        ];
        whenListen(cartBloc, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        final msg = find.textContaining(
          'Item has been removed from cart.'.tr(),
        );
        expect(msg, findsOneWidget);
      });
      // testWidgets('Test have cart item list and Refresh', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       // selectedItemsMaterialNumber: mockMaterialItemList,
      //       cartItems: [
      //         CartItem.bundle(mockCartItemBundles),
      //         mockCartItemWithOutBatch,
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final noBundleList = find.text('No bundle found');
      //   expect(noBundleList, findsNothing);
      //   final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
      //   expect(scrollWidget, findsOneWidget);

      //   final cartBundleItemTile =
      //       find.byWidgetPredicate((w) => w is CartBundleItemTile);

      //   expect(cartBundleItemTile, findsOneWidget);
      //   final cartTile =
      //       find.byWidgetPredicate((w) => w is CartMaterialItemTile);

      //   expect(cartTile, findsOneWidget);
      //   final selectAllButton = find.byKey(const Key('selectAllButton'));

      //   expect(selectAllButton, findsOneWidget);

      //   final totalSection = find.byKey(const Key('totalSection'));

      //   expect(totalSection, findsOneWidget);

      //   await tester.fling(scrollWidget, const Offset(0.0, 300.0), 1000.0);
      //   await tester.pump();
      //   await tester.pump(const Duration(seconds: 1));
      //   await tester.pump(const Duration(seconds: 1));
      //   await tester.pump(const Duration(seconds: 1));
      //   verify(
      //     () => cartBloc.add(
      //       CartEvent.fetch(
      //         salesOrganisationConfigs:
      //     SalesOrganisationConfigs.empty().copyWith(
      //   enableReferenceNote: true,
      //   enableVat: true,
      //   enableFutureDeliveryDay: true,
      //   enableMobileNumber: true,
      //   enableSpecialInstructions: true,
      //   disableOrderType: false,
      //   enableCollectiveNumber: true,
      //   enablePaymentTerms: true,
      //   enableRemarks: true,
      //   priceOverride: true,
      // ),
      //         salesOrganisation: SalesOrganisation.empty()
      //             .copyWith(salesOrg: SalesOrg('2601')),
      //         customerCodeInfo:
      //             CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '1234'),
      //         shipToInfo: ShipToInfo.empty(),
      //         doNotAllowOutOfStockMaterials: true,
      //         comboDealEligible: false,
      //         isSpecialOrderType: false,
      //       ),
      //     ),
      //   ).called(1);
      // });

      // testWidgets('Test have cart item list add and slide and remove item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final addWidget = find.byKey(Key(
      //       'cartAdd${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   await tester.tap(addWidget);
      //   await tester.pump();

      //   await tester.drag(
      //       find.byKey(const Key('slidable')), const Offset(-300, 0.0));
      //   await tester.pump();

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list add and decrease item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final addWidget = tester.widget(find.byKey(Key(
      //       'cartAdd${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(addWidget));
      //   await tester.pump();

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list decrease item', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));

      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));
      //   await tester.pump();
      // });

      // testWidgets('Test have cart item list with one remark message',
      //     (tester) async {
      //   final mockCartItemWithRemarkDataList = [
      //     mockCartItemWithDataList2.first.copyWith(
      //       materialInfo: mockCartItemWithDataList2.first.materialInfo.copyWith(
      //         remarks: 'good product',
      //       ),
      //     ),
      //   ];

      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithRemarkDataList.first)
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //         configs: SalesOrganisationConfigs.empty().copyWith(
      //       enableRemarks: true,
      //     )),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithRemarkDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));

      //   final remarkWidget = find.byKey(Key(
      //       'remarks${mockCartItemWithRemarkDataList[0].materialInfo.remarks}'));
      //   expect(remarkWidget, findsOneWidget);
      // });

      // testWidgets('Test have cart item list and Material price loading NA',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => materialPriceBloc.state).thenReturn(
      //     MaterialPriceState.initial().copyWith(
      //       materialPrice: {},
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final finder = find.byKey(const Key('price-loading'));
      //   expect(finder, findsNothing);
      // });
      // testWidgets('Test have cart item list and Material price loading Builder',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList2.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => materialPriceBloc.state).thenReturn(
      //     MaterialPriceState.initial().copyWith(
      //       materialPrice: {},
      //       isFetching: true,
      //     ),
      //   );

      //   final expectedStates = [
      //     MaterialPriceState.initial().copyWith(
      //       isFetching: false,
      //     ),
      //   ];
      //   whenListen(materialPriceBloc, Stream.fromIterable(expectedStates));

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final finder = find.byKey(const Key('price-loading'));
      //   expect(finder, findsNothing);
      // });

      // testWidgets('Test have zmg Discount cart item', (tester) async {
      //   when(() => materialPriceBloc.state)
      //       .thenReturn(MaterialPriceState.initial().copyWith(
      //     isFetching: false,
      //     materialPrice: {
      //       MaterialNumber('000000000023168451'): Price.empty().copyWith(
      //         zmgDiscount: true,
      //         tiers: [
      //           PriceTier(
      //             tier: 'c',
      //             items: [PriceTierItem.empty()],
      //           )
      //         ],
      //       )
      //     },
      //   ));
      //   when(() => addToCartBlocMock.state).thenReturn(
      //     AddToCartState.initial().copyWith(
      //       isFetching: false,
      //       cartItem: PriceAggregate.empty().copyWith(
      //         materialInfo: MaterialInfo.empty().copyWith(
      //           materialNumber: MaterialNumber('000000000023168451'),
      //           hasValidTenderContract: true,
      //         ),
      //         price: Price.empty().copyWith(
      //           zmgDiscount: true,
      //           tiers: [
      //             PriceTier(
      //               tier: 'c',
      //               items: [PriceTierItem.empty()],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   );
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithDataList2.first.copyWith(
      //           price: Price.empty().copyWith(
      //             zmgDiscount: true,
      //             tiers: [
      //               PriceTier(
      //                 tier: 'c',
      //                 items: [PriceTierItem.empty()],
      //               )
      //             ],
      //           ),
      //         ))
      //       ],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();
      //   final tierLabel = find.byKey(const Key('tieredPricingLogo'));
      //   expect(tierLabel, findsOneWidget);
      //   await tester.pump();
      //   await tester.tap(
      //     tierLabel,
      //   );
      //   await tester.pump();
      //   expect(autoRouter.currentPath, 'orders/update_cart');
      // });

      // testWidgets('Check if price is not overrided ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));

      //   await tester.pump();
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   final unitPrice = find.byKey(const Key('unitPrice'));

      //   expect(
      //     (tester.firstWidget(unitPrice) as Text).style!.color,
      //     ZPColors.black,
      //   );
      // });

      // testWidgets('should Price OverRide not Visible ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //         hasPriceOverride: false,
      //       ),
      //     ),
      //   );
      //   when(() => orderEligibilityBlocMock.state).thenReturn(
      //     OrderEligibilityState.initial().copyWith(
      //       configs: SalesOrganisationConfigs.empty().copyWith(
      //         disableOrderType: false,
      //       ),
      //       orderType: 'ZPFC',
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //         hasPriceOverride: false,
      //       ),
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   await tester.pump();
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   await tester.tap(priceWidget);
      //   await tester.pump();
      //   final priceSheet = find.byKey(const Key('priceSheet'));

      //   expect(priceSheet, findsNothing);
      // });

      // testWidgets('open bottom sheet to override price', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final removeWidget = tester.widget(find.byKey(Key(
      //       'cartDelete${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}')));
      //   await tester.tap(find.byWidget(removeWidget));

      //   await tester.pump();
      //   final priceWidget = find.byKey(
      //     Key('priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'),
      //   );
      //   // tester.widget(find.byKey(const Key('priceOverride')));
      //   expect(priceWidget, findsOneWidget);
      //   await tester.tap(
      //     priceWidget,
      //   );
      //   // final bottomSheet = find.byKey(
      //   //   const Key('priceSheetKey'),
      //   // );
      //   // expect(bottomSheet, findsOneWidget);
      // });
      // testWidgets('Check if price is overrided ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(mockCartItemWithDataListOverride.first)
      //       ],
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //   expect(item, findsOneWidget);
      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final priceWidget = find.byKey(Key(
      //       'priceOverride${mockCartItemWithDataList.first.getMaterialNumber.getOrDefaultValue('')}'));
      //   expect(priceWidget, findsOneWidget);
      //   final unitPrice = find.byKey(const Key('unitPrice'));

      //   expect(
      //     (tester.firstWidget(unitPrice) as Text).style!.color,
      //     ZPColors.red,
      //   );
      // });
      // testWidgets('Test discount override', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: true,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       user: User.empty().copyWith(
      //         role: Role.empty().copyWith(
      //           type: RoleType('external_sales_rep'),
      //         ),
      //       ),
      //       salesOrgConfigs: SalesOrganisationConfigs.empty()
      //           .copyWith(enableZDP8Override: true),
      //     ),
      //   );
      //   await tester.pumpWidget(getWidget());
      //   await tester.pump();

      //   final discountOverrideFinder =
      //       find.byKey(const Key('discountOverride'));
      //   expect(discountOverrideFinder, findsOneWidget);
      // });
      // testWidgets('Test have cart item list add update a bonus item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: true,
      //     ),
      //   );

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);

      //   if (salesOrgBloc.state.configs.enableRemarks) {
      //     final addRemarkButton =
      //         tester.widget(find.byKey(const Key('addRemarksBonus')));
      //     await tester.tap(find.byWidget(addRemarkButton));
      //     await tester.pump();

      //     final addRemarkDialog = find.byKey(const Key('addRemarksDialog'));
      //     expect(addRemarkDialog, findsOneWidget);

      //     const remarkText = '1234';
      //     final textField = find.byKey(const Key('remarkTextField'));
      //     await tester.enterText(textField, remarkText);

      //     final addButton = find.byKey(const Key('add'));
      //     await tester.tap(addButton);
      //     await tester.pump();

      //     verify(
      //       () => cartBloc.add(
      //         CartEvent.addRemarkToBonusItem(
      //           message: remarkText,
      //           bonusItem: mockCartItemWithDataList[0].addedBonusList[0],
      //           item: CartItem.material(mockCartItemWithDataList.first),
      //         ),
      //       ),
      //     ).called(1);
      //   }
      // });

      // testWidgets('Test have Tire Discount cart item', (tester) async {
      //   when(() => materialPriceBloc.state)
      //       .thenReturn(MaterialPriceState.initial().copyWith(
      //     isFetching: false,
      //     materialPrice: {
      //       MaterialNumber('000000000023168451'): Price.empty().copyWith(
      //         zmgDiscount: true,
      //         tiers: [
      //           PriceTier(
      //             tier: 'c',
      //             items: [PriceTierItem.empty()],
      //           )
      //         ],
      //       )
      //     },
      //   ));
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [
      //         CartItem.material(
      //           mockCartItemWithDataList2.first.copyWith(
      //             price: Price.empty().copyWith(
      //               zmgDiscount: true,
      //               tiers: [
      //                 PriceTier(
      //                   tier: 'c',
      //                   items: [PriceTierItem.empty()],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //       isFetching: false,
      //     ),
      //   );
      //   when(() => addToCartBlocMock.state).thenReturn(
      //     AddToCartState.initial().copyWith(
      //       isFetching: false,
      //       cartItem: PriceAggregate.empty().copyWith(
      //         price: Price.empty().copyWith(
      //           tiers: [
      //             PriceTier(
      //               tier: 'c',
      //               items: [PriceTierItem.empty()],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   );
      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();
      //   final tierDiscountLable = find.byKey(const Key('tieredPricingLogo'));
      //   expect(tierDiscountLable, findsOneWidget);
      //   await tester.tap(
      //     tierDiscountLable,
      //   );
      //   await tester.pump();
      //   expect(autoRouter.currentPath, 'orders/update_cart');
      // });

      // testWidgets('Test have Bundle Discount cart item', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemDiscountBundles
      //           .map((e) => CartItem.bundle([e]))
      //           .toList(),
      //       isFetching: false,
      //     ),
      //   );

      //   await tester.pumpWidget(Material(child: getWidget()));
      //   await tester.pump();

      //   final cartBundleItemTile = find.byType(CartBundleItemTile);
      //   expect(cartBundleItemTile, findsNWidgets(2));

      //   expect(find.byKey(const Key('cartBundleItemTotal')), findsNWidgets(2));

      //   expect(find.textContaining('Total Discount: '), findsOneWidget);
      //   expect(find.textContaining('Total Amount: '), findsOneWidget);
      // });

      // testWidgets('Test have cart item list add delete a bonus item',
      //     (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map(
      //             (e) => CartItem.material(e.copyWith(
      //               materialInfo: e.materialInfo.copyWith(
      //                 materialGroup4: MaterialGroup.four('none'),
      //                 hidePrice: false,
      //               ),
      //               price: e.price.copyWith(additionalBonusEligible: true),
      //             )),
      //           )
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //         user: User.empty().copyWith(
      //       role: Role.empty().copyWith(
      //         type: RoleType('external_sales_rep'),
      //       ),
      //       hasBonusOverride: true,
      //     )),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();

      //   final listWidget = find.byWidgetPredicate((w) => w is ListTile);
      //   expect(listWidget, findsAtLeastNWidgets(1));
      //   final item = find.byKey(const Key('bonusTile'));
      //   expect(item, findsOneWidget);
      //   final addWidget = tester.widget(
      //     find.byKey(
      //       const Key('addBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(addWidget),
      //   );

      //   final removeWidget = tester.widget(
      //     find.byKey(
      //       const Key('removeBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(removeWidget),
      //   );
      //   final deleteWidget = tester.widget(
      //     find.byKey(
      //       const Key('deleteBonusFromCart'),
      //     ),
      //   );
      //   await tester.tap(
      //     find.byWidget(deleteWidget),
      //   );

      //   final addBonusButton = find.byKey(
      //     const Key('addBonusButton'),
      //   );
      //   expect(addBonusButton, findsOneWidget);
      //   await tester.tap(addBonusButton);
      //   await tester.pump();
      //   expect(autoRouter.current.name, BonusAddPageRoute.name);
      // });

      // testWidgets('Test have cart item remarks update', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );

      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //       configs: SalesOrganisationConfigs.empty().copyWith(
      //         enableRemarks: true,
      //       ),
      //     ),
      //   );
      //   final expectedStates = [
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //     ),
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //     ),
      //   ];

      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final item = find.byKey(Key(
      //       'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrCrash()}'));
      //   expect(item, findsOneWidget);
      //   //final addRemarkDialog = find.byKey(const Key('addRemarksDialog'));
      //   final addRemarkButton =
      //       tester.widget(find.byKey(const Key('addRemarksBonus')));
      //   await tester.tap(find.byWidget(addRemarkButton));
      //   whenListen(
      //     cartBloc,
      //     Stream.fromIterable(expectedStates),
      //     initialState: CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: true,
      //     ),
      //   );
      //   await tester.pump();
      // });

      // testWidgets('cart order summary ', (tester) async {
      //   when(() => cartBloc.state).thenReturn(
      //     CartState.initial().copyWith(
      //       cartItems: [CartItem.material(mockCartItemWithDataList.first)],
      //       isFetching: false,
      //       // selectedItemsMaterialNumber: mockCartItemWithDataList
      //       //     .map<MaterialNumber>((e) => e.getMaterialNumber)
      //       //     .toList()
      //     ),
      //   );
      //   when(() => customerCodeBloc.state).thenReturn(
      //     CustomerCodeState.initial().copyWith(
      //       customerCodeInfo: CustomerCodeInfo.empty().copyWith(
      //         customerCodeSoldTo: '1234',
      //         billToInfos: [
      //           BillToInfo.empty().copyWith(
      //             billToCustomerCode: 'test',
      //           )
      //         ],
      //       ),
      //     ),
      //   );
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //       configs:
      //           SalesOrganisationConfigs.empty().copyWith(enableBillTo: true),
      //     ),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final orderSummaryButton = find.byKey(const Key('orderSummaryButton'));
      //   expect(orderSummaryButton, findsOneWidget);
      //   await tester.tap(orderSummaryButton);
      // });

      // testWidgets('cart item radio button', (tester) async {
      //   final expectedStates = [
      //     CartState.initial().copyWith(
      //       cartItems: [],
      //       isFetching: true,
      //       apiFailureOrSuccessOption:
      //           optionOf(const Left(ApiFailure.other('Fake-Error'))),
      //     ),
      //     CartState.initial().copyWith(
      //       cartItems: mockCartItemWithDataList
      //           .map((e) => CartItem.material(e))
      //           .toList(),
      //       isFetching: false,
      //       apiFailureOrSuccessOption: none(),
      //     )
      //   ];
      //   whenListen(cartBloc, Stream.fromIterable(expectedStates));
      //   when(() => eligibilityBloc.state).thenReturn(
      //     EligibilityState.initial().copyWith(
      //       salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //         enableTaxAtTotalLevelOnly: true,
      //       ),
      //     ),
      //   );
      //   const taxCode = 'VAT';
      //   when(() => salesOrgBloc.state).thenReturn(
      //     SalesOrgState.initial().copyWith(
      //         salesOrganisation: SalesOrganisation.empty().copyWith(
      //       salesOrg: SalesOrg(taxCode),
      //     )),
      //   );
      //   await tester.runAsync(() async {
      //     await tester.pumpWidget(getWidget());
      //   });

      //   await tester.pump();
      //   final selectAllRadioButton =
      //       find.byKey(const Key('selectAllRadioButton'));
      //   expect(selectAllRadioButton, findsOneWidget);
      //   await tester.tap(selectAllRadioButton);
      //   verify(() => cartBloc.add(
      //         const CartEvent.selectAllButtonTapped(),
      //       )).called(1);
      // });

      testWidgets('cart page Customer Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byType(AccountSuspendedBanner);
        expect(accountSuspendedBanner, findsOneWidget);
        final accountSuspendedBannerTest = find.textContaining(
          'Customer is suspended, please contact ZP Admin for support',
        );
        expect(accountSuspendedBannerTest, findsOneWidget);
      });

      testWidgets('cart page Ships To Code AccountSuspendedBanner ',
          (tester) async {
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('01'),
            ),
          ),
        );
        await tester.pumpWidget(getWidget());

        await tester.pump();
        final accountSuspendedBanner = find.byType(AccountSuspendedBanner);
        expect(accountSuspendedBanner, findsOneWidget);
        final accountSuspendedBannerTest = find.textContaining(
          'Customer is suspended, please contact ZP Admin for support',
        );
        expect(accountSuspendedBannerTest, findsOneWidget);
      });

      //     testWidgets('Test have cart item update cart', (tester) async {
      //       final newList = [
      //         mockCartItemWithDataList.first.copyWith(
      //           materialInfo: mockCartItemWithDataList.first.materialInfo.copyWith(
      //             hasValidTenderContract: true,
      //           ),
      //           tenderContract: TenderContract.empty().copyWith(
      //             contractNumber:
      //                 TenderContractNumber.tenderContractItemNumber('0000123'),
      //             tenderOrderReason: TenderContractReason('750'),
      //           ),
      //         )
      //       ];
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.material(newList.first)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => tenderContractBlocMock.state)
      //           .thenReturn(TenderContractState.initial().copyWith(
      //               selectedTenderContract: TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000123'),
      //                 tenderOrderReason: TenderContractReason('750'),
      //               ),
      //               apiFailureOrSuccessOption: optionOf(const Right('success')),
      //               isFetching: false,
      //               tenderContractList: [
      //             TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //             ),
      //             TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000125'),
      //                 tenderOrderReason: TenderContractReason('750'))
      //           ]));
      //       when(() => addToCartBlocMock.state).thenReturn(
      //         AddToCartState.initial().copyWith(
      //           isFetching: false,
      //           cartItem: mockCartItemBundles.first.copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //                 hasValidTenderContract: true,
      //                 materialNumber: MaterialNumber('0000123')),
      //             tenderContract: TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //               tenderOrderReason: TenderContractReason('750'),
      //             ),
      //           ),
      //         ),
      //       );
      //       whenListen(tenderContractBlocMock,
      //           Stream.fromIterable([tenderContractBlocMock.state]));
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final item = find.byKey(Key(
      //           'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //       expect(item, findsOneWidget);
      //       await tester.tap(item);
      //       await tester.pump();
      //       expect(autoRouter.currentPath, 'orders/update_cart');
      //     });

      //     testWidgets('Test have cart item update cart button pressed',
      //         (tester) async {
      //       final newList = [
      //         mockCartItemWithDataList.first.copyWith(
      //           materialInfo: mockCartItemWithDataList.first.materialInfo.copyWith(
      //             hasValidTenderContract: true,
      //           ),
      //           tenderContract: TenderContract.empty().copyWith(
      //             contractNumber:
      //                 TenderContractNumber.tenderContractItemNumber('0000123'),
      //             tenderOrderReason: TenderContractReason('750'),
      //           ),
      //         )
      //       ];
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.material(newList.first)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => tenderContractBlocMock.state)
      //           .thenReturn(TenderContractState.initial().copyWith(
      //               selectedTenderContract: TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000123'),
      //                 tenderOrderReason: TenderContractReason('750'),
      //               ),
      //               apiFailureOrSuccessOption: optionOf(const Right('success')),
      //               isFetching: false,
      //               tenderContractList: [
      //             TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //             ),
      //             TenderContract.empty().copyWith(
      //                 contractNumber:
      //                     TenderContractNumber.tenderContractItemNumber('0000125'),
      //                 tenderOrderReason: TenderContractReason('750'))
      //           ]));
      //       when(() => addToCartBlocMock.state).thenReturn(
      //         AddToCartState.initial().copyWith(
      //           isFetching: false,
      //           cartItem: mockCartItemBundles.first.copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //                 hasValidTenderContract: true,
      //                 materialNumber: MaterialNumber('0000123')),
      //             tenderContract: TenderContract.empty().copyWith(
      //               contractNumber:
      //                   TenderContractNumber.tenderContractItemNumber('0000123'),
      //               tenderOrderReason: TenderContractReason('750'),
      //             ),
      //           ),
      //         ),
      //       );
      //       whenListen(tenderContractBlocMock,
      //           Stream.fromIterable([tenderContractBlocMock.state]));
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final item = find.byKey(Key(
      //           'cartItem${mockCartItemWithDataList[0].materialInfo.materialNumber.getOrDefaultValue('')}'));
      //       expect(item, findsOneWidget);
      //       await tester.tap(item);
      //       await tester.pump();
      //       expect(autoRouter.currentPath, 'orders/update_cart');
      //     });

      //     testWidgets('Test to have correct GST and totalPrice', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.bundle(mockCartItemBundles2)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       final taxCodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxCodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'), findsOneWidget);
      //       expect(
      //           cartBloc.state.grandTotal(
      //             isMYMarketSalesRep: false,
      //           ),
      //           108.0);
      //     });

      //     testWidgets(
      //         'Test to have correct price for special ordertype with market TH',
      //         (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [
      //             CartItem.material(
      //               mockCartItemWithDataList.first.copyWith(
      //                 price: Price.empty().copyWith(
      //                   finalPrice: MaterialPrice(108),
      //                 ),
      //               ),
      //             ),
      //           ],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => orderDocumentTypeBlocMock.state).thenReturn(
      //         OrderDocumentTypeState.initial().copyWith(
      //             isOrderTypeSelected: true,
      //             selectedOrderType: OrderDocumentType.empty().copyWith(
      //               documentType: DocumentType('ZPFB'),
      //             )),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //           salesOrganisation: SalesOrganisation.empty().copyWith(
      //             salesOrg: SalesOrg('2902'),
      //           ),
      //           selectedOrderType: OrderDocumentType.empty().copyWith(
      //             documentType: DocumentType('ZPFB'),
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //           ),
      //           salesOrganisation: SalesOrganisation.empty().copyWith(
      //             salesOrg: SalesOrg('2902'),
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });

      //       await tester.pump();
      //       tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      //       tester.binding.window.devicePixelRatioTestValue = 1.0;
      //       final taxcodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxcodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'.tr()), findsOneWidget);
      //       final txt = find.text(': NA 108');
      //       expect(txt, findsAtLeastNWidgets(1));
      //     });

      //     testWidgets('Test to have correct GST and totalPrice with Bundle',
      //         (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [CartItem.bundle(mockCartItemBundles2)],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => orderDocumentTypeBlocMock.state).thenReturn(
      //         OrderDocumentTypeState.initial().copyWith(
      //             isOrderTypeSelected: true,
      //             selectedOrderType: OrderDocumentType.empty().copyWith(
      //               documentType: DocumentType('ZPFB'),
      //             )),
      //       );
      //       when(() => eligibilityBloc.state).thenReturn(
      //         EligibilityState.initial().copyWith(
      //           salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //             currency: Currency('SGD'),
      //           ),
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             vatValue: 8,
      //             enableVat: true,
      //             enableTaxClassification: true,
      //             enableTaxAtTotalLevelOnly: true,
      //             currency: Currency('SGD'),
      //           ),
      //         ),
      //       );
      //       await tester.runAsync(() async {
      //         await tester.pumpWidget(getWidget());
      //       });
      //       tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      //       tester.binding.window.devicePixelRatioTestValue = 1.0;

      //       await tester.pumpAndSettle(const Duration(seconds: 5));
      //       final taxCodeInPercentageKey =
      //           find.byKey(const Key('taxCodeInPercentageKey'));
      //       expect(taxCodeInPercentageKey, findsOneWidget);
      //       expect(find.text('VAT in %'), findsOneWidget);

      //       final totalTaxKey = find.byKey(const Key('totalTaxKey'));
      //       expect(totalTaxKey, findsOneWidget);
      //       expect(find.text('VAT'), findsOneWidget);
      //       final grandTotalKey = find.byKey(const Key('grandTotalKey'));
      //       expect(grandTotalKey, findsOneWidget);
      //       expect(find.text('Grand Total'), findsOneWidget);
      //       final txt = find.text(': SGD 108');
      //       expect(txt, findsAtLeastNWidgets(1));
      //       expect(
      //           cartBloc.state.grandTotal(
      //             isMYMarketSalesRep: false,
      //           ),
      //           108.0);
      //     });

      //     testWidgets('cart Item with no valid batch valid ', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [mockCartItemWithOutBatch],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             enableBatchNumber: true,
      //           ),
      //         ),
      //       );

      //       await tester.pumpWidget(getWidget());
      //       await tester.pump();

      //       final batchNumber = find.byKey(ValueKey(
      //           'batchNumber_${mockCartItemWithOutBatch.materials.first.materialNumberString}'));
      //       expect(batchNumber, findsOneWidget);
      //     });

      //     testWidgets('cart Item with valid batch valid ', (tester) async {
      //       when(() => cartBloc.state).thenReturn(
      //         CartState.initial().copyWith(
      //           cartItems: [mockCartItemWithBatch],
      //           isFetching: false,
      //         ),
      //       );
      //       when(() => salesOrgBloc.state).thenReturn(
      //         SalesOrgState.initial().copyWith(
      //           configs: SalesOrganisationConfigs.empty().copyWith(
      //             enableBatchNumber: true,
      //           ),
      //         ),
      //       );

      //       await tester.pumpWidget(getWidget());
      //       await tester.pump();

      //       final batchNumber = find.byKey(ValueKey(
      //           'batchNumber_${mockCartItemWithBatch.materials.first.materialNumberString}'));
      //       expect(batchNumber, findsOneWidget);
      //     });
    },
  );
}
