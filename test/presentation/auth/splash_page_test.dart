import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
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
import '../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';
import '../account/payment_configuration/bank_beneficiary/add_beneficiary_page_test.dart';
import '../account/payment_configuration/deduction_code/add_deduction_code_page_test.dart';
import '../account/payment_configuration/payment_method/add_payment_method_page_test.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

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

class ManagePaymentAdviceFooterBlocMock extends MockBloc<
    ManagePaymentAdviceFooterEvent,
    ManagePaymentAdviceFooterState> implements ManagePaymentAdviceFooterBloc {}

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

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class OrderHistoryDetailsMockBloc
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class ScanMaterialInfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class SettingMockBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

class OrderHistoryFilterMockBloc
    extends MockBloc<ViewByItemFilterEvent, ViewByItemFilterState>
    implements ViewByItemFilterBloc {}

class ViewByOrderMockBloc extends MockBloc<ViewByOrderEvent, ViewByOrderState>
    implements ViewByOrderBloc {}

class PushNotificationServiceMock extends Mock
    implements PushNotificationService {}

class ChatBotMockBloc extends MockBloc<ChatBotEvent, ChatBotState>
    implements ChatBotBloc {}

class IntroBlocMock extends MockBloc<IntroEvent, IntroState>
    implements IntroBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ReturnListByItemMockBloc
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class ViewByItemDetailsMockBloc
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class ProductDetailMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class CreditAndInvoiceDetailsMockBloc
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class LoginFormMockBloc extends MockBloc<LoginFormEvent, LoginFormState>
    implements LoginFormBloc {}

class NotificationMockBloc
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class AllCreditsBlocMock extends MockBloc<AllCreditsEvent, AllCreditsState>
    implements AllCreditsBloc {}

class ViewByOrderFilterBlocMock
    extends MockBloc<ViewByOrderFilterEvent, ViewByOrderFilterState>
    implements ViewByOrderFilterBloc {}

class PaymentSummaryDetailsBlocMock
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class ProductSearchBlocMock
    extends MockBloc<ProductSearchEvent, ProductSearchState>
    implements ProductSearchBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class SoaBlocMock extends MockBloc<SoaEvent, SoaState> implements SoaBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class PaymentInProgressBlocMock
    extends MockBloc<PaymentInProgressEvent, PaymentInProgressState>
    implements PaymentInProgressBloc {}

class ComboDealMaterialDetailBlocMock
    extends MockBloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState>
    implements ComboDealMaterialDetailBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class AvailableCreditsBlocMock
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class OutstandingInvoicesBlocMock
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class ReturnItemsBlocMock extends MockBloc<ReturnItemsEvent, ReturnItemsState>
    implements ReturnItemsBloc {}

class PaymentSummaryFilterBlocMock
    extends MockBloc<PaymentSummaryFilterEvent, PaymentSummaryFilterState>
    implements PaymentSummaryFilterBloc {}

class ReOrderPermissionBlocMock
    extends MockBloc<ReOrderPermissionEvent, ReOrderPermissionState>
    implements ReOrderPermissionBloc {}

class ArticlesInfoBlocMock
    extends MockBloc<ArticlesInfoEvent, ArticlesInfoState>
    implements ArticlesInfoBloc {}

class FullSummaryBlocMock extends MockBloc<FullSummaryEvent, FullSummaryState>
    implements FullSummaryBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class ArticlesInfoFilterBlocMock
    extends MockBloc<ArticlesInfoFilterEvent, ArticlesInfoFilterState>
    implements ArticlesInfoFilterBloc {}

class AnnouncementFilterBlocMock
    extends MockBloc<AnnouncementFilterEvent, AnnouncementFilterState>
    implements AnnouncementFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
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
  late PaymentMethodsBloc paymentMethodsBlocMock;
  late ManageBankBeneficiaryBloc manageBankBeneficiaryBlocMock;
  late SalesDistrictBloc salesDistrictBlocMock;
  late ManageDeductionCodeBloc manageDeductionCodeBlocMock;
  late ManagePaymentAdviceFooterBloc managePaymentAdviceFooterBlocMock;
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
  final mockOrderHistoryDetailsBloc = OrderHistoryDetailsMockBloc();
  final mockOrderHistoryFilterBloc = OrderHistoryFilterMockBloc();
  final mockViewByOrderBloc = ViewByOrderMockBloc();
  late PushNotificationService pushNotificationServiceMock;
  final chatBotBloc = ChatBotMockBloc();
  late MaterialPriceBloc mockMaterialPriceBloc;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBloc;
  late AllInvoicesBloc allInvoicesBlocMock;
  late AllCreditsBloc allCreditsBlocMock;
  late ViewByOrderFilterBloc viewByOrderFilterBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;
  late ProductSearchBloc productSearchBlocMock;
  late ReturnListByRequestBloc returnListByRequestBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBlocMock;
  late PaymentSummaryBloc paymentSummaryBlocMock;
  late SoaBloc soaBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late PaymentInProgressBloc paymentInProgressBlocMock;
  late ComboDealMaterialDetailBloc comboDealMaterialDetailBlocMock;
  late OrderSummaryBloc orderSummaryBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late PaymentSummaryFilterBloc paymentSummaryFilterBlocMock;
  late ReOrderPermissionBloc reOrderPermissionBlocMock;
  late ArticlesInfoBloc articlesInfoBlocMock;
  late FullSummaryBloc fullSummaryBlocMock;
  late ArticlesInfoFilterBloc articlesInfoFilterBlocMock;
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
      fullSummaryBlocMock = FullSummaryBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      accountSummaryMock = AccountSummaryBlocMock();
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
      paymentMethodsBlocMock = PaymentMethodBlocMock();
      manageBankBeneficiaryBlocMock = ManageBankBeneficiaryBlocMock();
      salesDistrictBlocMock = SalesDistrictBlocMock();
      manageDeductionCodeBlocMock = ManageDeductionCodeBlocMock();
      managePaymentAdviceFooterBlocMock = ManagePaymentAdviceFooterBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      materialFilterBlocMock = MaterialFilterBlocMock();
      returnApproverBlocMock = ReturnApproverBlocMock();
      returnApproverFilterBlocMock = ReturnApproverFilterBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      announcementInfoBlocMock = AnnouncementInfoBlocMock();
      deepLinkingBlocMock = DeepLinkingMockBloc();
      mockViewByItemsBloc = ViewByItemsBlocMock();
      scanMaterialInfoMockBloc = ScanMaterialInfoBlocMock();
      settingBlocMock = SettingMockBloc();
      mockMaterialPriceBloc = MaterialPriceMockBloc();
      introBlocMock = IntroBlocMock();
      returnListByItemBlocMock = ReturnListByItemMockBloc();
      viewByItemDetailsBlocMock = ViewByItemDetailsMockBloc();
      productDetailBloc = ProductDetailMockBloc();
      creditAndInvoiceDetailsBloc = CreditAndInvoiceDetailsMockBloc();
      loginFormBloc = LoginFormMockBloc();
      mockNotificationBloc = NotificationMockBloc();
      mockPriceOverrideBloc = PriceOverrideBlocMock();
      allInvoicesBlocMock = AllInvoicesBlocMock();
      allCreditsBlocMock = AllCreditsBlocMock();
      viewByOrderFilterBlocMock = ViewByOrderFilterBlocMock();
      paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
      productSearchBlocMock = ProductSearchBlocMock();
      returnListByRequestBlocMock = ReturnListByRequestBlocMock();
      downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();
      paymentSummaryBlocMock = PaymentSummaryBlocMock();
      soaBlocMock = SoaBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      paymentInProgressBlocMock = PaymentInProgressBlocMock();
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
      announcementFilterBlocMock = AnnouncementFilterBlocMock();
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
      when(() => paymentMethodsBlocMock.state).thenReturn(
        PaymentMethodsState.initial(),
      );
      when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
        ManageBankBeneficiaryState.initial(),
      );
      when(() => salesDistrictBlocMock.state).thenReturn(
        SalesDistrictState.initial(),
      );
      when(() => manageDeductionCodeBlocMock.state).thenReturn(
        ManageDeductionCodeState.initial(),
      );
      when(() => managePaymentAdviceFooterBlocMock.state).thenReturn(
        ManagePaymentAdviceFooterState.initial(),
      );
      when(() => accountSummaryMock.state)
          .thenReturn(AccountSummaryState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
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
      when(() => articlesInfoFilterBlocMock.state)
          .thenReturn(ArticlesInfoFilterState.initial());
      when(() => announcementFilterBlocMock.state)
          .thenReturn(AnnouncementFilterState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [
            Locale('en'),
          ],
          path: 'assets/langs/langs.csv',
          startLocale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          useOnlyLangCode: true,
          assetLoader: CsvAssetLoader(),
          child: WidgetUtils.getScopedWidget(
            autoRouterMock: autoRouterMock,
            providers: [
              BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock,
              ),
              BlocProvider<ManageBankBeneficiaryBloc>(
                create: (context) => manageBankBeneficiaryBlocMock,
              ),
              BlocProvider<SalesDistrictBloc>(
                create: (context) => salesDistrictBlocMock,
              ),
              BlocProvider<ManageDeductionCodeBloc>(
                create: (context) => manageDeductionCodeBlocMock,
              ),
              BlocProvider<ManagePaymentAdviceFooterBloc>(
                create: (context) => managePaymentAdviceFooterBlocMock,
              ),
              BlocProvider<PaymentMethodsBloc>(
                create: (context) => paymentMethodsBlocMock,
              ),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
              BlocProvider<UserRestrictionListBloc>(
                create: (context) => userRestrictionListBlocMock,
              ),
              BlocProvider<FullSummaryBloc>(
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
              BlocProvider<AccountSummaryBloc>(
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
              BlocProvider<AllInvoicesBloc>(
                create: (context) => allInvoicesBlocMock,
              ),
              BlocProvider<AllCreditsBloc>(
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
              BlocProvider<PaymentSummaryBloc>(
                create: (context) => paymentSummaryBlocMock,
              ),
              BlocProvider<SoaBloc>(
                create: (context) => soaBlocMock,
              ),
              BlocProvider<AdditionalDetailsBloc>(
                create: (context) => additionalDetailsBlocMock,
              ),
              BlocProvider<PaymentInProgressBloc>(
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
              BlocProvider<ArticlesInfoFilterBloc>(
                create: (context) => articlesInfoFilterBlocMock,
              ),
              BlocProvider<AnnouncementFilterBloc>(
                create: (context) => announcementFilterBlocMock,
              ),
            ],
            child: const SplashPage(),
          ),
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
        )
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
      await tester.pump(const Duration(milliseconds: 500));

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
      await tester.pump(const Duration(milliseconds: 500));
      verify(
        () => userRestrictionListBlocMock.add(
          UserRestrictionListEvent.fetch(
            salesOrg: fakeTWSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      verify(
        () => paymentMethodsBlocMock.add(
          const PaymentMethodsEvent.fetch(),
        ),
      ).called(1);

      verify(
        () => manageBankBeneficiaryBlocMock.add(
          const ManageBankBeneficiaryEvent.fetch(),
        ),
      ).called(1);

      verify(
        () => salesDistrictBlocMock.add(
          const SalesDistrictEvent.fetch(),
        ),
      ).called(1);
      verify(
        () => manageDeductionCodeBlocMock.add(
          const ManageDeductionCodeEvent.fetch(),
        ),
      ).called(1);
      verify(
        () => managePaymentAdviceFooterBlocMock.add(
          const ManagePaymentAdviceFooterEvent.fetch(),
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
          MaterialListEvent.fetch(
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
          Uri(path: '/history_details'),
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
      await tester.pump();
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
      await tester.pump(const Duration(milliseconds: 500));
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
            'In cart quantity should not be more than 99999.'.tr(),
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
        )
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
