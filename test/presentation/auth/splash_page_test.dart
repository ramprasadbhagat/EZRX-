import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';
import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesRepBloc salesRepBlocMock;
  late AupTcBloc aupTcBlocMock;
  late ZPAccountSummaryBloc accountSummaryMock;
  late CartBloc cartBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late AboutUsBloc aboutUsBlocMock;
  late UserRestrictionListBloc userRestrictionListBlocMock;
  late UsageCodeBloc usageCodeBlocMock;
  late ReturnRequestTypeCodeBloc returnRequestTypeCodeBlocMock;
  late PolicyConfigurationBloc policyConfigurationListBlocMock;
  late MaterialListBloc materialListBlocMock;
  late ScanMaterialInfoBloc scanMaterialInfoMockBloc;
  late SettingBloc settingBlocMock;
  late IntroBloc introBlocMock;
  late ReturnListByItemBloc returnListByItemBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late MaterialFilterBloc materialFilterBlocMock;
  late ProductDetailBloc productDetailBloc;
  late LoginFormBloc loginFormBloc;
  late ProductImageBloc productImageBloc;
  late OrderDocumentTypeBloc orderDocumentTypeMock;
  late ReturnApproverBloc returnApproverBlocMock;
  late ReturnApproverFilterBlocMock returnApproverFilterBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late RemoteConfigService remoteConfigServiceMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  late ViewByItemsBloc mockViewByItemsBloc;
  late NotificationBloc mockNotificationBloc;
  late PriceOverrideBloc mockPriceOverrideBloc;
  late ResetPasswordBloc resetPasswordBlocMock;
  final mockOrderHistoryDetailsBloc = ViewByOrderDetailsBlocMock();
  final mockOrderHistoryFilterBloc = ViewByItemFilterBlocMock();
  final mockViewByOrderBloc = ViewByOrderBlocMock();
  late PushNotificationService pushNotificationServiceMock;
  final chatBotBloc = ChatBotMockBloc();
  late MaterialPriceBloc mockMaterialPriceBloc;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBloc;
  late ZPAllInvoicesBloc allInvoicesBlocMock;
  late ZPAllCreditsBloc allCreditsBlocMock;
  late ViewByOrderFilterBloc viewByOrderFilterBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;
  late ProductSearchBloc productSearchBlocMock;
  late ReturnListByRequestBloc returnListByRequestBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBlocMock;
  late ZPPaymentSummaryBloc paymentSummaryBlocMock;
  late ZPSoaBloc soaBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late ZPPaymentInProgressBloc paymentInProgressBlocMock;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late PaymentSummaryFilterBloc paymentSummaryFilterBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late ArticlesInfoBloc articlesInfoBlocMock;
  late ZPFullSummaryBloc fullSummaryBlocMock;
  late ArticlesInfoFilterBloc articlesInfoFilterBlocMock;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late AnnouncementFilterBloc announcementFilterBlocMock;
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
    ),
    settings: Settings.empty().copyWith(
      languagePreference: Language.mandarin(),
    ),
  );

  // late AppRouter router;
  setUpAll(() async {
    remoteConfigServiceMock = RemoteConfigServiceMock();
    pushNotificationServiceMock = PushNotificationServiceMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(
        config: locator<Config>(),
      ),
    );
    // await locator<MixpanelService>().init();
    locator.registerLazySingleton(
      () => ChatBotService(
        config: locator<Config>(),
        pushNotificationService: pushNotificationServiceMock,
      ),
    );

    locator.registerLazySingleton<RemoteConfigService>(
      () => remoteConfigServiceMock,
    );

    locator.registerLazySingleton(() => mockViewByItemsBloc);
    locator.registerLazySingleton(() => mockMaterialPriceBloc);
    locator.registerLazySingleton(() => mockNotificationBloc);
    locator.registerLazySingleton(() => mockPriceOverrideBloc);
  });

  group('Splash Screen', () {
    setUp(() {
      locator = GetIt.instance;
      customerCodeBlocMock = CustomerCodeBlocMock();
      fullSummaryBlocMock = ZPFullSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      accountSummaryMock = ZPAccountSummaryBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      orderDocumentTypeMock = OrderDocumentTypeBlocMock();
      salesRepBlocMock = SalesRepBlocMock();
      aupTcBlocMock = AupTcBlocMock();
      cartBlocMock = CartBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      userRestrictionListBlocMock = UserRestrictionListBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = locator<AppRouter>();
      usageCodeBlocMock = UsageCodeBlocMock();
      returnRequestTypeCodeBlocMock = ReturnRequestTypeCodeBlocMock();
      policyConfigurationListBlocMock = PolicyConfigurationListBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      materialFilterBlocMock = MaterialFilterBlocMock();
      returnApproverBlocMock = ReturnApproverBlocMock();
      returnApproverFilterBlocMock = ReturnApproverFilterBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      announcementInfoBlocMock = AnnouncementInfoBlocMock();
      deepLinkingBlocMock = DeepLinkingBlocMock();
      mockViewByItemsBloc = ViewByItemsBlocMock();
      scanMaterialInfoMockBloc = ScanMaterialInfoBlocMock();
      settingBlocMock = SettingMockBloc();
      mockMaterialPriceBloc = MaterialPriceBlocMock();
      introBlocMock = IntroBlocMock();
      returnListByItemBlocMock = ReturnListByItemBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
      productDetailBloc = ProductDetailBlocMock();
      creditAndInvoiceDetailsBloc = CreditAndInvoiceDetailsBlocMock();
      loginFormBloc = LoginFormBlocMock();
      mockNotificationBloc = NotificationBlocMock();
      aboutUsBlocMock = AboutUsBlocMock();
      mockPriceOverrideBloc = PriceOverrideBlocMock();
      allInvoicesBlocMock = ZPAllInvoicesBlocMock();
      allCreditsBlocMock = ZPAllCreditsBlocMock();
      viewByOrderFilterBlocMock = ViewByOrderFilterBlocMock();
      paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
      productSearchBlocMock = ProductSearchBlocMock();
      returnListByRequestBlocMock = ReturnListByRequestBlocMock();
      downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();
      paymentSummaryBlocMock = ZPPaymentSummaryBlocMock();
      soaBlocMock = ZPSoaBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      paymentInProgressBlocMock = ZPPaymentInProgressBlocMock();
      comboDealMaterialDetailBlocMock = ComboDealMaterialDetailBlocMock();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      availableCreditsBlocMock = AvailableCreditsBlocMock();
      outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
      returnItemsBlocMock = ReturnItemsBlocMock();
      paymentSummaryFilterBlocMock = PaymentSummaryFilterBlocMock();
      reOrderPermissionBlocMock = ReOrderPermissionBlocMock();
      articlesInfoBlocMock = ArticlesInfoBlocMock();
      productImageBloc = ProductImageBlocMock();
      articlesInfoFilterBlocMock = ArticlesInfoFilterBlocMock();
      customerLicenseBlocMock = CustomerLicenseBlocMock();
      announcementFilterBlocMock = AnnouncementFilterBlocMock();
      resetPasswordBlocMock = ResetPasswordBlocMock();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => fullSummaryBlocMock.state)
          .thenReturn(FullSummaryState.initial());
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
      when(() => salesRepBlocMock.state).thenReturn(SalesRepState.initial());
      when(() => aupTcBlocMock.state).thenReturn(AupTcState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => aboutUsBlocMock.state).thenReturn(AboutUsState.initial());
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
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());
      when(() => mockOrderHistoryDetailsBloc.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => mockOrderHistoryFilterBloc.state)
          .thenReturn(ViewByItemFilterState.initial());
      when(() => mockViewByOrderBloc.state)
          .thenReturn(ViewByOrderState.initial());
      when(() => mockMaterialPriceBloc.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => introBlocMock.state).thenReturn(IntroState.initial());
      when(() => returnListByItemBlocMock.state)
          .thenReturn(ReturnListByItemState.initial());
      when(() => viewByItemDetailsBlocMock.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => productDetailBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => creditAndInvoiceDetailsBloc.state)
          .thenReturn(CreditAndInvoiceDetailsState.initial());
      when(() => loginFormBloc.state).thenReturn(LoginFormState.initial());
      when(() => mockNotificationBloc.state)
          .thenReturn(NotificationState.initial());
      when(() => mockPriceOverrideBloc.state)
          .thenReturn(PriceOverrideState.initial());
      when(() => chatBotBloc.state).thenReturn(ChatBotState.initial());
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
      when(() => allCreditsBlocMock.state)
          .thenReturn(AllCreditsState.initial());
      when(() => viewByOrderFilterBlocMock.state)
          .thenReturn(ViewByOrderFilterState.initial());
      when(() => paymentSummaryDetailsBlocMock.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => productSearchBlocMock.state)
          .thenReturn(ProductSearchState.initial());
      when(() => returnListByRequestBlocMock.state)
          .thenReturn(ReturnListByRequestState.initial());
      when(() => downloadPaymentAttachmentsBlocMock.state)
          .thenReturn(DownloadPaymentAttachmentsState.initial());
      when(() => paymentSummaryBlocMock.state)
          .thenReturn(PaymentSummaryState.initial());
      when(() => soaBlocMock.state).thenReturn(SoaState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => paymentInProgressBlocMock.state)
          .thenReturn(PaymentInProgressState.initial());
      when(() => comboDealMaterialDetailBlocMock.state)
          .thenReturn(ComboDealMaterialDetailState.initial());
      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial());
      when(() => availableCreditsBlocMock.state)
          .thenReturn(AvailableCreditsState.initial());
      when(() => outstandingInvoicesBlocMock.state)
          .thenReturn(OutstandingInvoicesState.initial());
      when(() => returnItemsBlocMock.state)
          .thenReturn(ReturnItemsState.initial());
      when(() => paymentSummaryFilterBlocMock.state)
          .thenReturn(PaymentSummaryFilterState.initial());
      when(() => reOrderPermissionBlocMock.state)
          .thenReturn(ReOrderPermissionState.initial());
      when(() => articlesInfoBlocMock.state)
          .thenReturn(ArticlesInfoState.initial());
      when(() => productImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => resetPasswordBlocMock.state)
          .thenReturn(ResetPasswordState.initial());
      when(() => articlesInfoFilterBlocMock.state)
          .thenReturn(ArticlesInfoFilterState.initial());
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => announcementFilterBlocMock.state)
          .thenReturn(AnnouncementFilterState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<AboutUsBloc>(
              create: (context) => aboutUsBlocMock,
            ),
            BlocProvider<UserRestrictionListBloc>(
              create: (context) => userRestrictionListBlocMock,
            ),
            BlocProvider<ZPFullSummaryBloc>(
              create: (context) => fullSummaryBlocMock,
            ),
            BlocProvider<SalesRepBloc>(create: (context) => salesRepBlocMock),
            BlocProvider<AupTcBloc>(create: (context) => aupTcBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: (context) => paymentCustomerInformationBlocMock,
            ),
            BlocProvider<PaymentTermBloc>(
              create: (context) => paymentTermBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeMock,
            ),
            BlocProvider<UsageCodeBloc>(
              create: (context) => usageCodeBlocMock,
            ),
            BlocProvider<ReturnRequestTypeCodeBloc>(
              create: (context) => returnRequestTypeCodeBlocMock,
            ),
            BlocProvider<PolicyConfigurationBloc>(
              create: (context) => policyConfigurationListBlocMock,
            ),
            BlocProvider<MaterialListBloc>(
              create: (context) => materialListBlocMock,
            ),
            BlocProvider<MaterialFilterBloc>(
              create: (context) => materialFilterBlocMock,
            ),
            BlocProvider<ReturnApproverBloc>(
              create: (context) => returnApproverBlocMock,
            ),
            BlocProvider<ReturnApproverFilterBloc>(
              create: (context) => returnApproverFilterBlocMock,
            ),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            ),
            BlocProvider<ViewByItemsBloc>(
              create: (context) => mockViewByItemsBloc,
            ),
            BlocProvider<ViewByOrderDetailsBloc>(
              create: (context) => mockOrderHistoryDetailsBloc,
            ),
            BlocProvider<ScanMaterialInfoBloc>(
              create: (context) => scanMaterialInfoMockBloc,
            ),
            BlocProvider<SettingBloc>(
              create: (context) => settingBlocMock,
            ),
            BlocProvider<ZPAccountSummaryBloc>(
              create: (context) => accountSummaryMock,
            ),
            BlocProvider<ViewByItemFilterBloc>(
              create: (context) => mockOrderHistoryFilterBloc,
            ),
            BlocProvider<ViewByOrderBloc>(
              create: (context) => mockViewByOrderBloc,
            ),
            BlocProvider<ChatBotBloc>(
              create: (context) => chatBotBloc,
            ),
            BlocProvider<AnnouncementInfoBloc>(
              create: (context) => announcementInfoBlocMock,
            ),
            BlocProvider<MaterialPriceBloc>(
              create: (context) => mockMaterialPriceBloc,
            ),
            BlocProvider<IntroBloc>(create: (context) => introBlocMock),
            BlocProvider<ReturnListByItemBloc>(
              create: (context) => returnListByItemBlocMock,
            ),
            BlocProvider<ViewByItemDetailsBloc>(
              create: (context) => viewByItemDetailsBlocMock,
            ),
            BlocProvider<ProductDetailBloc>(
              create: (context) => productDetailBloc,
            ),
            BlocProvider<CreditAndInvoiceDetailsBloc>(
              create: (context) => creditAndInvoiceDetailsBloc,
            ),
            BlocProvider<LoginFormBloc>(create: (context) => loginFormBloc),
            BlocProvider<NotificationBloc>(
              create: (context) => mockNotificationBloc,
            ),
            BlocProvider<PriceOverrideBloc>(
              create: (context) => mockPriceOverrideBloc,
            ),
            BlocProvider<ZPAllInvoicesBloc>(
              create: (context) => allInvoicesBlocMock,
            ),
            BlocProvider<ZPAllCreditsBloc>(
              create: (context) => allCreditsBlocMock,
            ),
            BlocProvider<ViewByOrderFilterBloc>(
              create: (context) => viewByOrderFilterBlocMock,
            ),
            BlocProvider<PaymentSummaryDetailsBloc>(
              create: (context) => paymentSummaryDetailsBlocMock,
            ),
            BlocProvider<ProductSearchBloc>(
              create: (context) => productSearchBlocMock,
            ),
            BlocProvider<ReturnListByRequestBloc>(
              create: (context) => returnListByRequestBlocMock,
            ),
            BlocProvider<DownloadPaymentAttachmentsBloc>(
              create: (context) => downloadPaymentAttachmentsBlocMock,
            ),
            BlocProvider<ZPPaymentSummaryBloc>(
              create: (context) => paymentSummaryBlocMock,
            ),
            BlocProvider<ZPSoaBloc>(
              create: (context) => soaBlocMock,
            ),
            BlocProvider<AdditionalDetailsBloc>(
              create: (context) => additionalDetailsBlocMock,
            ),
            BlocProvider<ZPPaymentInProgressBloc>(
              create: (context) => paymentInProgressBlocMock,
            ),
            BlocProvider<ComboDealMaterialDetailBloc>(
              create: (context) => comboDealMaterialDetailBlocMock,
            ),
            BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock,
            ),
            BlocProvider<AvailableCreditsBloc>(
              create: (context) => availableCreditsBlocMock,
            ),
            BlocProvider<OutstandingInvoicesBloc>(
              create: (context) => outstandingInvoicesBlocMock,
            ),
            BlocProvider<ReturnItemsBloc>(
              create: (context) => returnItemsBlocMock,
            ),
            BlocProvider<PaymentSummaryFilterBloc>(
              create: (context) => paymentSummaryFilterBlocMock,
            ),
            BlocProvider<ReOrderPermissionBloc>(
              create: (context) => reOrderPermissionBlocMock,
            ),
            BlocProvider<ArticlesInfoBloc>(
              create: (context) => articlesInfoBlocMock,
            ),
            BlocProvider<ProductImageBloc>(
              create: (context) => productImageBloc,
            ),
            BlocProvider<ResetPasswordBloc>(
              create: (context) => resetPasswordBlocMock,
            ),
            BlocProvider<ArticlesInfoFilterBloc>(
              create: (context) => articlesInfoFilterBlocMock,
            ),
            BlocProvider<CustomerLicenseBloc>(
              create: (context) => customerLicenseBlocMock,
            ),
            BlocProvider<AnnouncementFilterBloc>(
              create: (context) => announcementFilterBlocMock,
            ),
          ],
          child: const SplashPage(),
        ),
      );
    }

    //commented test case reason:
    //since MixpanelService has changed we need to mock
    //the actual Mixpanel library class otherwise we will face this
    //issue:
    //The following LateError was thrown building:
    // LateInitializationError: Field 'mixpanel' has not been initialized.

    // testWidgets('When Auth State is un-authenticated', (tester) async {
    //   final expectedAuthListStates = [
    //     const AuthState.loading(),
    //     const AuthState.unauthenticated()
    //   ];
    //   whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
    //   await getWidget(tester);
    //   await tester.pump();
    //   final splashLoadingIndicator =
    //       find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
    //   expect(splashLoadingIndicator, findsNWidgets(1));
    //   verify(() => userBlocMock.add(const UserEvent.initialized())).called(1);
    //   expect(autoRouterMock.current.name, LoginPageRoute.name);
    // });

    testWidgets(
        'When Auth State is authenticated and user having multiple customerCodes',
        (tester) async {
      final expectedAuthListStates = [
        const AuthState.authenticated(),
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      verify(() => userBlocMock.add(const UserEvent.fetch())).called(1);
    });

    testWidgets('When Intro Bloc is listener and isAppFirstLaunch == true',
        (tester) async {
      final expectedStates = [
        IntroState.initial().copyWith(isLoading: true),
        IntroState.initial().copyWith(isAppFirstLaunch: true, isLoading: false),
      ];
      whenListen(introBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pump();
      expect(autoRouterMock.current.name, IntroPageRoute.name);
    });

    testWidgets('When Intro Bloc is listener and showTermsAndCondition == true',
        (tester) async {
      final expectedStates = [
        IntroState.initial().copyWith(isLoading: true),
        IntroState.initial()
            .copyWith(isAppFirstLaunch: false, isLoading: false),
      ];
      whenListen(introBlocMock, Stream.fromIterable(expectedStates));
      when(() => userBlocMock.state).thenAnswer(
        (invocation) => UserState.initial().copyWith(
          user: fakeUser.copyWith(
            acceptPrivacyPolicy: true,
          ),
          isLoginOnBehalf: false,
        ),
      );
      await getWidget(tester);
      await tester.pump();
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
            billToInfo: [],
          ),
        ),
      ];

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          salesOrganisation: fakeTWSalesOrganisation,
          configs: fakeSalesOrganisationConfigs,
        ),
      );

      whenListen(
        paymentCustomerInformationBlocMock,
        Stream.fromIterable(expectedPaymentStates),
      );

      await getWidget(tester);
      await tester.pump();

      verify(
        () => paymentTermBlocMock.add(
          PaymentTermEvent.fetch(
            customeCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            salesRepresentativeInfo: salesRepBlocMock.state.salesRepInfo,
            paymentCustomerInformation:
                PaymentCustomerInformation.empty().copyWith(
              paymentTerm: 'paymentTerm',
              shipToInfoList: <ShipToInfo>[],
            ),
            user: fakeUser,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'When PaymentCustomerInformation bloc event call when customer code changes',
        (tester) async {
      final expectedStates = [
        EligibilityState.initial(),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedStates),
      );

      await getWidget(tester);
      await tester.pump();

      verify(
        () => paymentCustomerInformationBlocMock
            .add(const PaymentCustomerInformationEvent.initialized()),
      ).called(1);

      verify(
        () => paymentCustomerInformationBlocMock.add(
          PaymentCustomerInformationEvent.fetch(
            customeCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            selectedShipToCode: fakeShipToInfo.shipToCustomerCode,
          ),
        ),
      ).called(1);
    });

    testWidgets('When cart bloc has error', (tester) async {
      final expectedStates = [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.text('Fake-Error'.tr()), findsOneWidget);
    });

    testWidgets('When user dont have state organization', (tester) async {
      final expectedEligibilityStates = [
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrgConfigs: SalesOrganisationConfigs.empty(),
          user: fakeUser,
        ),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeTWSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      ];

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          configs: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );

      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedEligibilityStates),
      );
      final expectedStates = [
        CartState.initial().copyWith(apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            Right([PriceAggregate.empty()]),
          ),
          isFetching: true,
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(
          user: fakeUser.copyWith(
            userSalesOrganisations: [],
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      verify(() => introBlocMock.add(const IntroEvent.checkAppFirstLaunch()))
          .called(1);

      verify(
        () => cartBlocMock.add(
          CartEvent.initialized(
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeSalesOrganisationConfigs,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('internal_sales_rep'),
              ),
            ),
          ),
        ),
      ).called(1);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('When user role has return admin access ', (tester) async {
      final expectedEligibilityStates = [
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrgConfigs: SalesOrganisationConfigs.empty(),
          user: fakeUser,
        ),
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeTWSalesOrganisation,
          salesOrgConfigs: fakeSalesOrganisationConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeUser.copyWith(
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
        ),
      ];

      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedEligibilityStates),
      );

      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(
          user: fakeUser.copyWith(
            disableReturns: false,
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      when(() => salesOrgBlocMock.state).thenAnswer(
        (invocation) => SalesOrgState.initial().copyWith(
          configs: fakeSalesOrganisationConfigs,
          salesOrganisation: fakeTWSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      verify(
        () => userRestrictionListBlocMock.add(
          UserRestrictionListEvent.fetch(
            salesOrg: fakeTWSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      expect(find.byType(Scaffold), findsOneWidget);
    });

    test('testing UpgraderLocalizationMessage valid', () async {
      expect(UpgraderLocalizationMessage(), isNotNull);
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.body),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage()
            .message(UpgraderMessage.buttonTitleIgnore),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage()
            .message(UpgraderMessage.buttonTitleLater),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.prompt),
        isNotNull,
      );
      expect(
        () =>
            UpgraderLocalizationMessage().message(UpgraderMessage.releaseNotes),
        isNotNull,
      );
      expect(
        () => UpgraderLocalizationMessage().message(UpgraderMessage.title),
        isNotNull,
      );
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
          MaterialListEvent.initialized(
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
            configs: salesOrgBlocMock.state.configs,
            customerCodeInfo: eligibilityBlocMock.state.customerCodeInfo,
            shipToInfo: eligibilityBlocMock.state.shipToInfo,
            selectedMaterialFilter: materialFilterBlocMock.state.materialFilter,
            user: fakeClientUser,
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

    testWidgets('When Redirecting History page - success', (tester) async {
      final expectedDeeplinkStates = [
        const DeepLinkingState.initial(),
        DeepLinkingState.linkPending(
          EzrxLink(Uri(path: '/history_details').toString()),
        ),
        DeepLinkingState.redirectOrderDetail(OrderNumber('fake-order-history')),
      ];
      whenListen(
        deepLinkingBlocMock,
        Stream.fromIterable(expectedDeeplinkStates),
      );
      await getWidget(tester);
      await tester.pump();
      verify(
        () => deepLinkingBlocMock.add(
          DeepLinkingEvent.consumePendingLink(
            selectedCustomerCode: CustomerCodeInfo.empty(),
            selectedShipTo: ShipToInfo.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets('When Redirecting History page -failure ', (tester) async {
      final expectedDeeplinkStates = [
        const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
      ];
      whenListen(
        deepLinkingBlocMock,
        Stream.fromIterable(expectedDeeplinkStates),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(
        find.text('This order is not available on your account'),
        findsOneWidget,
      );
    });
    testWidgets('When user Language Change', (tester) async {
      final expectedUserListStates = [
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(
        EasyLocalization.of(tester.element(find.byType(Scaffold)))?.locale,
        const Locale('en'),
      );
    });

    testWidgets('When Login on Behalf terms and condition page not displayed',
        (tester) async {
      final expectedUserListStates = [
        UserState.initial().copyWith(
          user: fakeUser,
          isLoginOnBehalf: true,
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));

      await getWidget(tester);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      verifyNever(
        () => aupTcBlocMock.add(AupTcEvent.show(fakeUser)),
      );
    });

    testWidgets('When Upsert Cart But Exceed Maximum Quantity', (tester) async {
      final cartListStates = [
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.maximumCartQuantityExceed('99999'),
            ),
          ),
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(cartListStates));

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(
            'In cart quantity should not be more than {maximumNumber}.'.tr(
              namedArgs: {
                'maximumNumber': '99999',
              },
            ),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Chat bot error message', (tester) async {
      final expectedStates = [
        ChatBotState.initial().copyWith(
          chatbotFailureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];
      whenListen(chatBotBloc, Stream.fromIterable(expectedStates));

      await getWidget(tester);
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.textContaining('Fake-error'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('fetch product details image', (tester) async {
      final material = MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-material'),
      );
      final expectedUserListStates = [
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: material,
          ),
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ];

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      whenListen(
        productDetailBloc,
        Stream.fromIterable(expectedUserListStates),
      );

      await getWidget(tester);
    });

    testWidgets('fetch bundle details image ', (tester) async {
      final materials = [
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-1'),
        ),
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-2'),
        ),
      ];
      final expectedUserListStates = [
        ProductDetailState.initial().copyWith(
          productDetailAggregate: ProductDetailAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.bundle(),
              bundle: Bundle.empty().copyWith(
                materials: materials,
              ),
            ),
          ),
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ];

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );

      whenListen(
        productDetailBloc,
        Stream.fromIterable(expectedUserListStates),
      );

      await getWidget(tester);
    });

    testWidgets(
        'When user preferred language gets updated cart initial event called',
        (tester) async {
      final eligibilityState = EligibilityState.initial().copyWith(
        user: fakeRootAdminUser.copyWith(
          preferredLanguage: Language('EN'),
        ),
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeTWSalesOrganisation,
        salesOrgConfigs: fakeTWSalesOrgConfigs,
        shipToInfo: fakeShipToInfo,
      );

      final expectedListStates = [
        eligibilityState.copyWith(
          user: fakeRootAdminUser.copyWith(
            preferredLanguage: Language('ZH'),
          ),
        ),
      ];
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable(expectedListStates),
        initialState: eligibilityState,
      );

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 500));
      verify(
        () => cartBlocMock.add(
          CartEvent.initialized(
            user: fakeRootAdminUser.copyWith(
              preferredLanguage: Language('ZH'),
            ),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeTWSalesOrganisation,
            salesOrganisationConfigs: fakeTWSalesOrgConfigs,
            shipToInfo: fakeShipToInfo,
          ),
        ),
      ).called(1);
    });
  });
}
