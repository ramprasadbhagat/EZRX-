import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_history/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';
import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SalesRepBlocMock extends MockBloc<SalesRepEvent, SalesRepState>
    implements SalesRepBloc {}

class AupTcBlocMock extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class PaymentTermBlocMock extends MockBloc<PaymentTermEvent, PaymentTermState>
    implements PaymentTermBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserRestrictionListBlocMock
    extends MockBloc<UserRestrictionListEvent, UserRestrictionListState>
    implements UserRestrictionListBloc {}

class MaterialBundleListBlocMock
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

class CovidMaterialListBlocMock
    extends MockBloc<CovidMaterialListEvent, CovidMaterialListState>
    implements CovidMaterialListBloc {}

class MaterialFilterBlocMock
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

class ReturnRequestTypeCodeBlocMock
    extends MockBloc<ReturnRequestTypeCodeEvent, ReturnRequestTypeCodeState>
    implements ReturnRequestTypeCodeBloc {}

class PolicyConfigurationListBlocMock
    extends MockBloc<PolicyConfigurationEvent, PolicyConfigurationState>
    implements PolicyConfigurationBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class ReturnApproverBlocMock
    extends MockBloc<ReturnApproverEvent, ReturnApproverState>
    implements ReturnApproverBloc {}

class ReturnApproverFilterBlocMock
    extends MockBloc<ReturnApproverFilterEvent, ReturnApproverFilterState>
    implements ReturnApproverFilterBloc {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

class DeepLinkingMockBloc extends MockBloc<DeepLinkingEvent, DeepLinkingState>
    implements DeepLinkingBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class OrderHistoryDetailsMockBloc
    extends MockBloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState>
    implements OrderHistoryDetailsBloc {}

class ScanMaterialInfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class SettingMockBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

class OrderHistoryFilterMockBloc
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class ViewByOrderHistoryMockBloc
    extends MockBloc<ViewByOrderHistoryEvent, ViewByOrderHistoryState>
    implements ViewByOrderHistoryBloc {}
class PushNotificationServiceMock extends Mock implements PushNotificationService {}

class ChatBotMockBloc
    extends MockBloc<ChatBotEvent, ChatBotState>
    implements ChatBotBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late SalesRepBloc salesRepBlocMock;
  late AupTcBloc aupTcBlocMock;
  late AccountSummaryBloc accountSummaryMock;
  late CartBloc cartBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late UserRestrictionListBloc userRestrictionListBlocMock;
  late UsageCodeBloc usageCodeBlocMock;
  late ReturnRequestTypeCodeBloc returnRequestTypeCodeBlocMock;
  late PolicyConfigurationBloc policyConfigurationListBlocMock;
  late MaterialListBloc materialListBlocMock;
  late ScanMaterialInfoBloc scanMaterialInfoMockBloc;
  late SettingBloc settingBlocMock;

  late MaterialFilterBloc materialFilterBlocMock;

  late MaterialBundleListBloc materialBundleListBlocMock;
  late CovidMaterialListBloc covidMaterialListBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeMock;
  late ReturnApproverBloc returnApproverBlocMock;
  late ReturnApproverFilterBlocMock returnApproverFilterBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late RemoteConfigService remoteConfigServiceMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  late OrderHistoryListBloc mockOrderHistoryListBloc;
  final mockOrderHistoryDetailsBloc = OrderHistoryDetailsMockBloc();
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockViewByOrderHistoryBloc = ViewByOrderHistoryMockBloc();
  late PushNotificationService pushNotificationServiceMock;
  final chatBotBloc = ChatBotMockBloc();

  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final fakeUser = User.empty().copyWith(
      id: 'fake-id',
      username: Username('fake-username'),
      fullName: const FullName(firstName: 'first name', lastName: 'last name'),
      userSalesOrganisations: [fakeSalesOrganisation],
      customerCode: CustomerCode('130046'),
      email: EmailAddress('a@abc.com'),
      role: Role.empty().copyWith(
        type: RoleType('internal_sales_rep'),
        id: 'fake-id',
        name: 'fake-name',
        description: 'fake-description',
      ));

  // late AppRouter router;
  setUpAll(() async {
    remoteConfigServiceMock = RemoteConfigServiceMock();
    pushNotificationServiceMock = PushNotificationServiceMock();
    when(() => remoteConfigServiceMock.getReturnsConfig()).thenReturn(true);
    when(() => remoteConfigServiceMock.getScanToOrderConfig()).thenReturn(true);
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    locator.registerLazySingleton(() => ChatBotService(
          config: locator<Config>(),
          pushNotificationService: pushNotificationServiceMock,
        ));
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerLazySingleton<RemoteConfigService>(
        () => remoteConfigServiceMock);

    locator.registerLazySingleton(() => mockOrderHistoryListBloc);
  });

  group('Splash Screen', () {
    setUp(() {
      locator = GetIt.instance;
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      accountSummaryMock = AccountSummaryBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      shipToCodeBLocMock = ShipToCodeBlocMock();
      covidMaterialListBlocMock = CovidMaterialListBlocMock();
      orderDocumentTypeMock = OrderDocumentTypeBlocMock();
      salesRepBlocMock = SalesRepBlocMock();
      aupTcBlocMock = AupTcBlocMock();
      cartBlocMock = CartBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      userRestrictionListBlocMock = UserRestrictionListBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = locator<AppRouter>();
      materialBundleListBlocMock = MaterialBundleListBlocMock();
      usageCodeBlocMock = UsageCodeBlocMock();
      returnRequestTypeCodeBlocMock = ReturnRequestTypeCodeBlocMock();
      policyConfigurationListBlocMock = PolicyConfigurationListBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      materialFilterBlocMock = MaterialFilterBlocMock();
      returnApproverBlocMock = ReturnApproverBlocMock();
      returnApproverFilterBlocMock = ReturnApproverFilterBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      deepLinkingBlocMock = DeepLinkingMockBloc();
      mockOrderHistoryListBloc = OrderHistoryListBlocMock();
      scanMaterialInfoMockBloc = ScanMaterialInfoBlocMock();
      settingBlocMock = SettingMockBloc();

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => settingBlocMock.state).thenReturn(SettingState.initial());
      when(() => orderDocumentTypeMock.state).thenReturn(
        OrderDocumentTypeState.initial().copyWith(
          selectedOrderType: OrderDocumentType.empty()
              .copyWith(documentType: DocumentType('ZPOR Test (ZPOR)')),
        ),
      );
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => accountSummaryMock.state)
          .thenReturn(AccountSummaryState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBLocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => salesRepBlocMock.state).thenReturn(SalesRepState.initial());
      when(() => aupTcBlocMock.state).thenReturn(AupTcState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => paymentCustomerInformationBlocMock.state)
          .thenReturn(PaymentCustomerInformationState.initial());
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => userRestrictionListBlocMock.state)
          .thenReturn(UserRestrictionListState.initial());
      when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
      when(() => returnRequestTypeCodeBlocMock.state)
          .thenReturn(ReturnRequestTypeCodeState.initial());
      when(() => policyConfigurationListBlocMock.state)
          .thenReturn(PolicyConfigurationState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
      when(() => materialFilterBlocMock.state)
          .thenReturn(MaterialFilterState.initial());
      when(() => returnApproverBlocMock.state)
          .thenReturn(ReturnApproverState.initial());
      when(() => scanMaterialInfoMockBloc.state)
          .thenReturn(ScanMaterialInfoState.initial());

      when(() => returnApproverFilterBlocMock.state)
          .thenReturn(ReturnApproverFilterState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => deepLinkingBlocMock.state)
          .thenReturn(const DeepLinkingState.initial());
      when(() => mockOrderHistoryListBloc.state)
          .thenReturn(OrderHistoryListState.initial());
      when(() => mockOrderHistoryDetailsBloc.state)
          .thenReturn(OrderHistoryDetailsState.initial());
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(OrderHistoryFilterState.initial());
      when(() => mockViewByOrderHistoryBloc.state)
          .thenReturn(ViewByOrderHistoryState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<UserRestrictionListBloc>(
              create: (context) => userRestrictionListBlocMock,
            ),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBLocMock),
            BlocProvider<SalesRepBloc>(create: (context) => salesRepBlocMock),
            BlocProvider<AupTcBloc>(create: (context) => aupTcBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBlocMock),
            BlocProvider<PaymentTermBloc>(
                create: (context) => paymentTermBlocMock),
            BlocProvider<MaterialBundleListBloc>(
                create: (context) => materialBundleListBlocMock),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
            BlocProvider<CovidMaterialListBloc>(
                create: (context) => covidMaterialListBlocMock),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeMock),
            BlocProvider<UsageCodeBloc>(create: (context) => usageCodeBlocMock),
            BlocProvider<ReturnRequestTypeCodeBloc>(
                create: (context) => returnRequestTypeCodeBlocMock),
            BlocProvider<PolicyConfigurationBloc>(
                create: (context) => policyConfigurationListBlocMock),
            BlocProvider<MaterialListBloc>(
                create: (context) => materialListBlocMock),
            BlocProvider<MaterialFilterBloc>(
                create: (context) => materialFilterBlocMock),
            BlocProvider<ReturnApproverBloc>(
                create: (context) => returnApproverBlocMock),
            BlocProvider<ReturnApproverFilterBloc>(
                create: (context) => returnApproverFilterBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            ),
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => mockOrderHistoryListBloc),
            BlocProvider<OrderHistoryDetailsBloc>(
                create: (context) => mockOrderHistoryDetailsBloc),
            BlocProvider<ScanMaterialInfoBloc>(
                create: (context) => scanMaterialInfoMockBloc),
            BlocProvider<SettingBloc>(
              create: (context) => settingBlocMock,
            ),
            BlocProvider<AccountSummaryBloc>(
              create: (context) => accountSummaryMock,
            ),
            BlocProvider<OrderHistoryFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc,
            ),
            BlocProvider<ViewByOrderHistoryBloc>(
              create: (context) => mockViewByOrderHistoryBloc,
            ),
            BlocProvider<ChatBotBloc>(
              create: (context) => chatBotBloc,
            ),
          ],
          child: const SplashPage(),
        ),
      );
    }

    testWidgets('When Auth State is initialized', (tester) async {
      final expectedAuthListStates = [
        const AuthState.loading(),
        const AuthState.initial(),
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));

      await getWidget(tester);
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsNWidgets(2));
    });
    testWidgets('When Auth State is un-authenticated', (tester) async {
      final expectedAuthListStates = [
        const AuthState.loading(),
        const AuthState.unauthenticated()
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsNWidgets(1));
      verify(() => userBlocMock.add(const UserEvent.initialized())).called(1);
      expect(autoRouterMock.current.name, LoginPageRoute.name);
    });

    testWidgets('When Auth State is authenticated', (tester) async {
      final expectedAuthListStates = [
        const AuthState.authenticated(),
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      verify(() => userBlocMock.add(const UserEvent.fetch())).called(1);
      expect(autoRouterMock.current.name, IntroPageRoute.name);
    });

    testWidgets('When PaymentCustomerInformation bloc is listening',
        (tester) async {
      final expectedPaymentStates = [
        PaymentCustomerInformationState.initial(),
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: const PaymentCustomerInformation(
            paymentTerm: 'paymentTerm',
            shipToInfoList: <ShipToInfo>[],
          ),
        )
      ];

      await getWidget(tester);
      await tester.pump();

      whenListen(
        paymentCustomerInformationBlocMock,
        Stream.fromIterable(expectedPaymentStates),
      );

      verify(() => paymentTermBlocMock.add(PaymentTermEvent.fetch(
            customeCodeInfo: customerCodeBlocMock.state.customerCodeInfo,
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
            salesOrganisationConfigs: salesOrgBlocMock.state.configs,
            salesRepresentativeInfo: salesRepBlocMock.state.salesRepInfo,
            paymentCustomerInformation:
                PaymentCustomerInformation.empty().copyWith(
              paymentTerm: 'paymentTerm',
              shipToInfoList: <ShipToInfo>[],
            ),
          ))).called(1);
    });

    testWidgets('When cart bloc has error', (tester) async {
      final expectedStates = [
        CartState.initial().copyWith(apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
          isFetching: true,
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pump();
      expect(find.text('Fake-Error'), findsOneWidget);
    });

    // testWidgets('When user dont have state organization', (tester) async {
    //   final expectedEligibilityStates = [
    //     EligibilityState.initial().copyWith(
    //         salesOrganisation: SalesOrganisation.empty(),
    //         customerCodeInfo: CustomerCodeInfo.empty(),
    //         salesOrgConfigs: SalesOrganisationConfigs.empty(),
    //         user: fakeUser),
    //     EligibilityState.initial().copyWith(
    //       salesOrganisation:
    //           SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
    //       customerCodeInfo: CustomerCodeInfo.empty()
    //           .copyWith(customerGrp4: CustomerGrp4('VR')),
    //       salesOrgConfigs: SalesOrganisationConfigs.empty()
    //           .copyWith(disableBundles: false, salesOrg: SalesOrg('2601')),
    //       user: fakeUser.copyWith(
    //         role: Role.empty().copyWith(
    //           type: RoleType('internal_sales_rep'),
    //         ),
    //       ),
    //     ),
    //   ];

    //   whenListen(
    //       eligibilityBlocMock, Stream.fromIterable(expectedEligibilityStates));
    //   final expectedStates = [
    //     CartState.initial().copyWith(apiFailureOrSuccessOption: none()),
    //     CartState.initial().copyWith(
    //       apiFailureOrSuccessOption: optionOf(
    //         Right([PriceAggregate.empty()]),
    //       ),
    //       isFetching: true,
    //     ),
    //   ];
    //   whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
    //   final expectedUserListStates = [
    //     UserState.initial(),
    //     UserState.initial().copyWith(
    //       user: fakeUser.copyWith(userSalesOrganisations: []),
    //     ),
    //   ];
    //   whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

    //   await getWidget(tester);
    //   await tester.pump();

    //   verify(() => aupTcBlocMock
    //           .add(AupTcEvent.show(fakeUser, salesOrgBlocMock.state.salesOrg)))
    //       .called(2);

    //   verify(() => cartBlocMock.add(const CartEvent.initialized())).called(1);
    //   // expect(find.byType(UpgradeAlert), findsOneWidget);
    // });

    testWidgets('When user role has return admin access ', (tester) async {
      final expectedEligibilityStates = [
        EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrgConfigs: SalesOrganisationConfigs.empty(),
            user: fakeUser),
        EligibilityState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerGrp4: CustomerGrp4('VR')),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableBundles: false, salesOrg: SalesOrg('2601')),
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
        ),
      ];

      whenListen(
          eligibilityBlocMock, Stream.fromIterable(expectedEligibilityStates));

      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(
          user: fakeUser.copyWith(disableReturns: false),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pump();
      final salesOrganisation = eligibilityBlocMock.state.salesOrganisation;
      verify(
          () => userRestrictionListBlocMock.add(UserRestrictionListEvent.fetch(
                salesOrg: salesOrganisation.salesOrg,
              ))).called(1);

      verify(() =>
          policyConfigurationListBlocMock.add(PolicyConfigurationEvent.fetch(
            salesOrganisation: salesOrganisation,
            searchKey: '',
          ))).called(1);
      // expect(find.byType(UpgradeAlert), findsOneWidget);
    });

    test('testing UpgraderLocalizationMessage valid', () async {
      expect(UpgraderLocalizationMessage(), isNotNull);
      expect(() => UpgraderLocalizationMessage().message(UpgraderMessage.body),
          isNotNull);
      expect(
          () => UpgraderLocalizationMessage()
              .message(UpgraderMessage.buttonTitleIgnore),
          isNotNull);
      expect(
          () => UpgraderLocalizationMessage()
              .message(UpgraderMessage.buttonTitleLater),
          isNotNull);
      expect(
          () => UpgraderLocalizationMessage().message(UpgraderMessage.prompt),
          isNotNull);
      expect(
          () => UpgraderLocalizationMessage()
              .message(UpgraderMessage.releaseNotes),
          isNotNull);
      expect(() => UpgraderLocalizationMessage().message(UpgraderMessage.title),
          isNotNull);
    });

    testWidgets('OrderDocumentType change triggers MaterialList Fetch',
        (tester) async {
      final salesOrg = salesOrgBlocMock.state.salesOrg;

      final expectedStates = [
        OrderDocumentTypeState.initial().copyWith(
          selectedOrderType: OrderDocumentType.empty().copyWith(
            salesOrg: salesOrg,
          ),
        ),
      ];
      whenListen(orderDocumentTypeMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();

      orderDocumentTypeMock.add(
        OrderDocumentTypeEvent.selectedOrderType(
          isReasonSelected: true,
          selectedOrderType: OrderDocumentType.empty().copyWith(
            salesOrg: salesOrg,
          ),
        ),
      );

      verify(
        () => materialListBlocMock.add(
          MaterialListEvent.fetch(
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
            configs: salesOrgBlocMock.state.configs,
            customerCodeInfo: customerCodeBlocMock.state.customerCodeInfo,
            shipToInfo: eligibilityBlocMock.state.shipToInfo,
            selectedMaterialFilter:
                materialFilterBlocMock.state.selectedMaterialFilter,
          ),
        ),
      ).called(2);
    });

    testWidgets('Return Request Type fetch on Eligibility Change - Success',
        (tester) async {
      final expectedStates = [
        EligibilityState.initial().copyWith(
          salesOrganisation: salesOrgBlocMock.state.salesOrganisation.copyWith(
            salesOrg: SalesOrg('123'),
          ),
        ),
      ];
      whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();

      verify(
        () => returnRequestTypeCodeBlocMock.add(
          ReturnRequestTypeCodeEvent.fetch(
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
          ),
        ),
      ).called(2);
    });

    testWidgets('Return Request Type fetch on Eligibility Change - Failure',
        (tester) async {
      final expectedStates = [EligibilityState.initial()];
      whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pump();
    });

    testWidgets('DeepLinkingBloc initializes correctly',
        (WidgetTester tester) async {
      when(() => remoteConfigServiceMock.getReturnsConfig()).thenReturn(false);
      whenListen(
          eligibilityBlocMock,
          Stream.fromIterable([
            EligibilityState.initial(),
            EligibilityState.initial().copyWith(
                shipToInfo: ShipToInfo.empty()
                    .copyWith(shipToCustomerCode: 'fake-code')),
          ]));
      await getWidget(tester);
      await tester.pump();

      verify(() => deepLinkingBlocMock.add(const DeepLinkingEvent.initialize()))
          .called(1);
    });

    testWidgets('When Redirecting History page - success', (tester) async {
      final expectedDeeplinkStates = [
        const DeepLinkingState.initial(),
        DeepLinkingState.linkPending(
          Uri(path: '/history_details'),
        ),
        const DeepLinkingState.redirectHistoryDetail('fake-order-history'),
      ];
      whenListen(
          deepLinkingBlocMock, Stream.fromIterable(expectedDeeplinkStates));
      await getWidget(tester);
      await tester.pump();
      verify(() => deepLinkingBlocMock.add(DeepLinkingEvent.consumePendingLink(
            selectedCustomerCode: CustomerCodeInfo.empty(),
            selectedSalesOrganisation: SalesOrganisation.empty(),
            selectedShipTo: ShipToInfo.empty(),
          ))).called(1);
    });
    testWidgets('When Redirecting History page -failure ', (tester) async {
      final expectedDeeplinkStates = [
        const DeepLinkingState.error(
          ApiFailure.historyDetailRoute(),
        )
      ];
      whenListen(
          deepLinkingBlocMock, Stream.fromIterable(expectedDeeplinkStates));
      await getWidget(tester);
      await tester.pump();
      expect(find.text('This order history is not available on your account'),
          findsOneWidget);
    });
  });
}
