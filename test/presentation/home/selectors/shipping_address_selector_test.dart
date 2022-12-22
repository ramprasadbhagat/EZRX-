import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/selector/shipping_address_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/material_frame_wrapper.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SaveOrderListBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class MaterialFilterBlocMock
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class CovidMaterialListBlocMock
    extends MockBloc<CovidMaterialListEvent, CovidMaterialListState>
    implements CovidMaterialListBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class FavouriteBlocMock extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class MaterialBundleListBlocMock
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class OrderHistoryFilterBlocMock
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class OrderHistoryFilterByStatusBlocMock extends MockBloc<
        OrderHistoryFilterByStatusEvent, OrderHistoryFilterByStatusState>
    implements OrderHistoryFilterByStatusBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class MaterialPriceDetailBlocMock
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

final fakeShipToInfo =
    ShipToInfo.empty().copyWith(shipToCustomerCode: '00001234');

final fakeShipToInfo2 =
    ShipToInfo.empty().copyWith(shipToCustomerCode: '00001235');

final fakeCustomerInfo =
    CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '00001234');

final fakeUser = User.empty().copyWith(
  username: Username('fake-user'),
  role: Role.empty().copyWith(
    type: RoleType('client'),
  ),
  enableOrderType: true,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late AuthBlocMock mockAuthBloc;
  late SalesOrgBlocMock mockSalesOrgBloc;
  late EligibilityBlocMock mockEligibilityBloc;
  late ShipToCodeBlocMock mockShipToCodeBloc;
  late UserBlocMock mockUserBloc;
  late SaveOrderListBlocMock mockSaveOrderListBloc;
  late MaterialListBlocMock mockMaterialListBloc;
  late OrderDocumentTypeBlocMock mockOrderDocumentTypeBloc;
  late MaterialFilterBlocMock mockMaterialFilterBloc;
  late CovidMaterialListBlocMock mockCovidMaterialListBloc;
  late OrderHistoryListBlocMock mockOrderHistoryListBloc;
  late OrderTemplateListBlocMock mockOrderTemplateListBloc;
  late FavouriteBlocMock mockFavouriteBloc;
  late MaterialBundleListBlocMock mockMaterialBundleListBloc;
  late PaymentCustomerInformationBlocMock mockPaymentCustomerInformationBloc;
  late CartBlocMock mockCartBloc;
  late OrderHistoryFilterBlocMock mockOrderHistoryFilterBloc;
  late OrderHistoryFilterByStatusBlocMock mockOrderHistoryFilterByStatusBloc;
  late MaterialPriceBlocMock mockMaterialPriceBloc;
  late MaterialPriceDetailBlocMock mockMaterialPriceDetailBloc;

  final fakeSalesOrg = SalesOrganisation(
    salesOrg: SalesOrg('2601'),
    customerInfos: [],
  );

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockSalesOrgBloc = SalesOrgBlocMock();
    mockEligibilityBloc = EligibilityBlocMock();
    mockShipToCodeBloc = ShipToCodeBlocMock();
    mockUserBloc = UserBlocMock();
    mockSaveOrderListBloc = SaveOrderListBlocMock();
    mockMaterialListBloc = MaterialListBlocMock();
    mockOrderDocumentTypeBloc = OrderDocumentTypeBlocMock();
    mockMaterialFilterBloc = MaterialFilterBlocMock();
    mockCovidMaterialListBloc = CovidMaterialListBlocMock();
    mockOrderHistoryListBloc = OrderHistoryListBlocMock();
    mockOrderTemplateListBloc = OrderTemplateListBlocMock();
    mockFavouriteBloc = FavouriteBlocMock();
    mockMaterialBundleListBloc = MaterialBundleListBlocMock();
    mockPaymentCustomerInformationBloc = PaymentCustomerInformationBlocMock();
    mockCartBloc = CartBlocMock();
    mockOrderHistoryFilterBloc = OrderHistoryFilterBlocMock();
    mockOrderHistoryFilterByStatusBloc = OrderHistoryFilterByStatusBlocMock();
    mockMaterialPriceBloc = MaterialPriceBlocMock();
    mockMaterialPriceDetailBloc = MaterialPriceDetailBlocMock();
  });

  setUp(() async {
    when(() => mockCustomerCodeBloc.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
    when(() => mockSalesOrgBloc.state).thenReturn(
        SalesOrgState.initial().copyWith(salesOrganisation: fakeSalesOrg));
    when(
      () => mockEligibilityBloc.state,
    ).thenReturn(EligibilityState.initial().copyWith(
        salesOrganisation: fakeSalesOrg,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerAttr7: CustomerAttr7('ZEV'),
          customerGrp4: CustomerGrp4('VR'),
        )));
    when(() => mockShipToCodeBloc.state).thenReturn(ShipToCodeState.initial());
    when(() => mockUserBloc.state)
        .thenReturn(UserState.initial().copyWith(user: fakeUser));
    when(() => mockSaveOrderListBloc.state)
        .thenReturn(SavedOrderListState.initial());
    when(() => mockMaterialListBloc.state)
        .thenReturn(MaterialListState.initial());
    when(() => mockOrderDocumentTypeBloc.state)
        .thenReturn(OrderDocumentTypeState.initial());
    when(() => mockMaterialFilterBloc.state)
        .thenReturn(MaterialFilterState.initial());
    when(() => mockCovidMaterialListBloc.state)
        .thenReturn(CovidMaterialListState.initial());
    when(() => mockOrderHistoryListBloc.state)
        .thenReturn(OrderHistoryListState.initial());
    when(() => mockOrderTemplateListBloc.state)
        .thenReturn(OrderTemplateListState.initial());
    when(() => mockFavouriteBloc.state).thenReturn(FavouriteState.initial());
    when(() => mockMaterialBundleListBloc.state)
        .thenReturn(MaterialBundleListState.initial());
    when(() => mockPaymentCustomerInformationBloc.state)
        .thenReturn(PaymentCustomerInformationState.initial());
    when(() => mockCartBloc.state).thenReturn(CartState.initial());
    when(() => mockOrderHistoryFilterBloc.state)
        .thenReturn(OrderHistoryFilterState.initial());
    when(() => mockOrderHistoryFilterByStatusBloc.state)
        .thenReturn(OrderHistoryFilterByStatusState.initial());
    when(() => mockMaterialPriceBloc.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => mockMaterialPriceDetailBloc.state)
        .thenReturn(MaterialPriceDetailState.initial());
  });

  group('Ship Code selector Test ', () {
    Future getWidget(tester) async {
      return await tester.pumpWidget(MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CustomerCodeBloc>(
                create: (context) => mockCustomerCodeBloc),
            BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<EligibilityBloc>(
                create: (context) => mockEligibilityBloc),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => mockShipToCodeBloc),
            BlocProvider<UserBloc>(create: (context) => mockUserBloc),
            BlocProvider<SavedOrderListBloc>(
                create: (context) => mockSaveOrderListBloc),
            BlocProvider<MaterialListBloc>(
                create: (context) => mockMaterialListBloc),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => mockOrderDocumentTypeBloc),
            BlocProvider<MaterialFilterBloc>(
                create: (context) => mockMaterialFilterBloc),
            BlocProvider<CovidMaterialListBloc>(
                create: (context) => mockCovidMaterialListBloc),
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => mockOrderHistoryListBloc),
            BlocProvider<OrderTemplateListBloc>(
                create: (context) => mockOrderTemplateListBloc),
            BlocProvider<FavouriteBloc>(create: (context) => mockFavouriteBloc),
            BlocProvider<MaterialBundleListBloc>(
                create: (context) => mockMaterialBundleListBloc),
            BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => mockPaymentCustomerInformationBloc),
            BlocProvider<CartBloc>(create: (context) => mockCartBloc),
            BlocProvider<OrderHistoryFilterBloc>(
                create: (context) => mockOrderHistoryFilterBloc),
            BlocProvider<OrderHistoryFilterByStatusBloc>(
                create: (context) => mockOrderHistoryFilterByStatusBloc),
            BlocProvider<MaterialPriceBloc>(
                create: (context) => mockMaterialPriceBloc),
            BlocProvider<MaterialPriceDetailBloc>(
                create: (context) => mockMaterialPriceDetailBloc),
          ],
          child: Material(
            child: Scaffold(
              body: Row(
                children: const [
                  ShipCodeSelector(),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    testWidgets('When shipToInfo is empty', (tester) async {
      when(() => mockShipToCodeBloc.state)
          .thenReturn(ShipToCodeState.initial().copyWith(isSearching: false));

      await getWidget(tester);
      final headerText = find.text('Shipping Address');
      final selectedShipCode = find.text('NA');
      expect(headerText, findsOneWidget);
      expect(selectedShipCode, findsOneWidget);
    });

    testWidgets('When shipToInfo is loading show shimmer', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: fakeCustomerInfo,
        isFetching: true,
      ));

      await getWidget(tester);
      final shimmer = find.byType(Shimmer);
      expect(shimmer, findsOneWidget);
    });

    testWidgets('When shipToInfo is has data', (tester) async {
      when(() => mockShipToCodeBloc.state).thenReturn(ShipToCodeState.initial()
          .copyWith(isSearching: false, shipToInfo: fakeShipToInfo));

      await getWidget(tester);
      final headerText = find.text('Shipping Address');
      final selectedShipCode = find.text('00001234');
      expect(headerText, findsOneWidget);
      expect(selectedShipCode, findsOneWidget);
    });

    testWidgets('When shipToInfo has no data', (tester) async {
      whenListen(
          mockShipToCodeBloc,
          Stream.fromIterable([
            ShipToCodeState.initial().copyWith(
              isSearching: false,
              shipToInfo: fakeShipToInfo,
            ),
            ShipToCodeState.initial()
                .copyWith(isSearching: false, shipToInfo: ShipToInfo.empty()),
          ]));

      await getWidget(tester);
      final selectedShipCode = find.text('00001234');
      expect(selectedShipCode, findsNothing);
    });

    testWidgets('When shipToInfo has different data', (tester) async {
      whenListen(
          mockShipToCodeBloc,
          Stream.fromIterable([
            ShipToCodeState.initial().copyWith(
              isSearching: false,
              shipToInfo: fakeShipToInfo,
            ),
            ShipToCodeState.initial().copyWith(
              isSearching: false,
              shipToInfo: fakeShipToInfo2,
            ),
          ]));

      await getWidget(tester);
      final selectedShipCode = find.text('00001235');
      expect(selectedShipCode, findsNothing);
    });
  });
}
