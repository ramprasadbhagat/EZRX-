import 'dart:async';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/order_storage.dart';
import 'package:ezrxmobile/application/returns/returns_overview/returns_overview_bloc.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';

import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';

import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';

import 'package:wakelock/wakelock.dart';

import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';

import 'package:ezrxmobile/application/account/payment_notification/payment_notification_bloc.dart';

import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  final config = locator<Config>();
  await Firebase.initializeApp(options: kIsWeb ? config.firebaseOptions : null);
  debugPrint(
    'AppPushs background: ${message.notification?.title} ${message.notification?.body} ${message.data}',
  );
}

Future<void> initialSetup({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupLocator();

  final config = locator<Config>();
  config.appFlavor = flavor;

  await Firebase.initializeApp(options: kIsWeb ? config.firebaseOptions : null);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  } else {
    debugPrint = (String? message, {int? wrapWidth}) {};
    FlutterError.onError = _crashlytics.recordFlutterError;
  }

  await locator<RemoteConfigService>().init();
  await locator<TokenStorage>().init();
  await locator<CredStorage>().init();
  await locator<OktaLoginServices>().init();
  await locator<AccountSelectorStorage>().init();
  await locator<CartStorage>().init();
  await locator<SettingStorage>().init();
  await locator<OrderStorage>().init();
  locator<MixpanelService>().init(
    mixpanel: await Mixpanel.init(
      config.mixpanelKey,
      trackAutomaticEvents: true,
    ),
  );

  if (!kIsWeb) {
    await Wakelock.enable();
    await locator<ClevertapService>().init();
    if (locator<RemoteConfigService>().getScanToOrderConfig()) {
      await ScanditFlutterDataCaptureBarcode.initialize();
      await locator<MaterialInfoScanner>().init();
    }
  }
}

void runAppWithCrashlyticsAndLocalization() {
  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('th'),
          Locale('zh'),
          Locale('my'),
          Locale('vi'),
          Locale('km'),
        ],
        path: 'assets/langs/langs.csv',
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return const App();
          },
        ),
      ),
    ),
    (error, stack) {
      if (!kIsWeb) {
        _crashlytics.recordError(error, stack);
      }
    },
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(const AuthEvent.init()),
        ),
        BlocProvider<LoginFormBloc>(
          create: (context) => locator<LoginFormBloc>(),
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => locator<ProxyLoginFormBloc>(),
        ),
        BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),
        BlocProvider<BannerBloc>(create: (context) => locator<BannerBloc>()),
        BlocProvider<SalesOrgBloc>(
          create: (context) =>
              locator<SalesOrgBloc>()..add(const SalesOrgEvent.initialized()),
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => locator<CustomerCodeBloc>(),
        ),
        BlocProvider<UserRestrictionListBloc>(
          create: (context) => locator<UserRestrictionListBloc>(),
        ),
        BlocProvider<ShipToCodeBloc>(
          create: (context) => locator<ShipToCodeBloc>(),
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => locator<EligibilityBloc>(),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => locator<AnnouncementBloc>(),
        ),
        BlocProvider<SavedOrderListBloc>(
          create: (context) => locator<SavedOrderListBloc>(),
        ),
        BlocProvider<MaterialFilterBloc>(
          create: (context) => locator<MaterialFilterBloc>(),
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => locator<MaterialListBloc>(),
        ),
        BlocProvider<MaterialBundleListBloc>(
          create: (context) => locator<MaterialBundleListBloc>(),
        ),
        BlocProvider<CovidMaterialListBloc>(
          create: (context) => locator<CovidMaterialListBloc>(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => locator<FavouriteBloc>(),
        ),
        BlocProvider<OrderHistoryListBloc>(
          create: (context) => locator<OrderHistoryListBloc>(),
        ),
        BlocProvider<OrderHistoryFilterBloc>(
          create: (context) => locator<OrderHistoryFilterBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => locator<ResetPasswordBloc>(),
        ),
        BlocProvider<ForgotPasswordBloc>(
          create: (context) => locator<ForgotPasswordBloc>(),
        ),
        BlocProvider<AupTcBloc>(
          create: (context) => locator<AupTcBloc>(),
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => locator<MaterialPriceBloc>(),
        ),
        BlocProvider<BonusMaterialBloc>(
          create: (context) => locator<BonusMaterialBloc>(),
        ),
        BlocProvider<OrderTemplateListBloc>(
          create: (context) => locator<OrderTemplateListBloc>(),
        ),
        BlocProvider<MaterialPriceDetailBloc>(
          create: (context) => locator<MaterialPriceDetailBloc>(),
        ),
        BlocProvider<PaymentCustomerInformationBloc>(
          create: (context) => locator<PaymentCustomerInformationBloc>(),
        ),
        BlocProvider<SalesRepBloc>(
          create: (context) => locator<SalesRepBloc>(),
        ),
        BlocProvider<PaymentTermBloc>(
          create: (context) => locator<PaymentTermBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
        BlocProvider<PriceOverrideBloc>(
          create: (context) => locator<PriceOverrideBloc>(),
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => locator<OrderSummaryBloc>(),
        ),
        BlocProvider<AdditionalDetailsBloc>(
          create: (context) => locator<AdditionalDetailsBloc>(),
        ),
        BlocProvider<OrderDocumentTypeBloc>(
          create: (context) => locator<OrderDocumentTypeBloc>(),
        ),
        BlocProvider<OrderHistoryDetailsBloc>(
          create: (context) => locator<OrderHistoryDetailsBloc>(),
        ),
        BlocProvider<PoAttachmentBloc>(
          create: (context) => locator<PoAttachmentBloc>(),
        ),
        BlocProvider<OrderHistoryFilterByStatusBloc>(
          create: (context) => locator<OrderHistoryFilterByStatusBloc>(),
        ),
        BlocProvider<OrderEligibilityBloc>(
          create: (context) => locator<OrderEligibilityBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
        BlocProvider<UsageCodeBloc>(
          create: (context) => locator<UsageCodeBloc>(),
        ),
        BlocProvider<PolicyConfigurationBloc>(
          create: (context) => locator<PolicyConfigurationBloc>(),
        ),
        BlocProvider<ReturnRequestTypeCodeBloc>(
          create: (context) => locator<ReturnRequestTypeCodeBloc>(),
        ),
        BlocProvider<UserRestrictionDetailsBloc>(
          create: (context) => locator<UserRestrictionDetailsBloc>(),
        ),
        BlocProvider<ReturnsOverviewBloc>(
          create: (context) => locator<ReturnsOverviewBloc>(),
        ),
        BlocProvider<RequestReturnBloc>(
          create: (context) => locator<RequestReturnBloc>(),
        ),
        BlocProvider<ReturnApproverBloc>(
          create: (context) => locator<ReturnApproverBloc>(),
        ),
        BlocProvider<ReturnSummaryBloc>(
          create: (context) => locator<ReturnSummaryBloc>(),
        ),
        BlocProvider<RequestReturnFilterBloc>(
          create: (context) => locator<RequestReturnFilterBloc>(),
        ),
        BlocProvider<ReturnApproverFilterBloc>(
          create: (context) => locator<ReturnApproverFilterBloc>(),
        ),
        BlocProvider<ComboDealListBloc>(
          create: (context) => locator<ComboDealListBloc>(),
        ),
        BlocProvider<ComboDealMaterialDetailBloc>(
          create: (context) => locator<ComboDealMaterialDetailBloc>(),
        ),
        BlocProvider<PaymentNotificationBloc>(
          create: (context) => locator<PaymentNotificationBloc>(),
        ),
        BlocProvider<ScanMaterialInfoBloc>(
          create: (context) {
            final bloc = locator<ScanMaterialInfoBloc>();
            if (locator<RemoteConfigService>().getScanToOrderConfig()) {
              bloc.add(const ScanMaterialInfoEvent.initialized());
            }

            return bloc;
          },
        ),
        BlocProvider<TenderContractListBloc>(
          create: (context) => locator<TenderContractListBloc>(),
        ),
        BlocProvider<PaymentSummaryBloc>(
          create: (context) => locator<PaymentSummaryBloc>(),
        ),
        BlocProvider<ReturnSummaryFilterBloc>(
          create: (context) => locator<ReturnSummaryFilterBloc>(),
        ),
        BlocProvider<ReturnSummaryDetailsBloc>(
          create: (context) => locator<ReturnSummaryDetailsBloc>(),
        ),
        BlocProvider<ReturnPriceBloc>(
          create: (context) => locator<ReturnPriceBloc>(),
        ),
        BlocProvider<SubmitReturnBloc>(
          create: (context) => locator<SubmitReturnBloc>(),
        ),
        BlocProvider<DeepLinkingBloc>(
          create: (context) => locator<DeepLinkingBloc>(),
        ),
        BlocProvider<AdminPoAttachmentBloc>(
          create: (context) => locator<AdminPoAttachmentBloc>(),
        ),
        BlocProvider<AdminPoAttachmentFilterBloc>(
          create: (context) => locator<AdminPoAttachmentFilterBloc>(),
        ),
        BlocProvider<PaymentMethodsBloc>(
          create: (context) => locator<PaymentMethodsBloc>(),
        ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => locator<AllInvoicesFilterBloc>(),
        ),
        BlocProvider<AllInvoicesBloc>(
          create: (context) => locator<AllInvoicesBloc>(),
        ),
        BlocProvider<CreditAndInvoiceDetailsBloc>(
          create: (context) => locator<CreditAndInvoiceDetailsBloc>(),
        ),
        BlocProvider<AllCreditsBloc>(
          create: (context) => locator<AllCreditsBloc>(),
        ),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => locator<DownloadPaymentAttachmentsBloc>(),
        ),
        BlocProvider<ManagePaymentMethodsBloc>(
          create: (context) => locator<ManagePaymentMethodsBloc>(),
        ),
        BlocProvider<AddPaymentMethodBloc>(
          create: (context) => locator<AddPaymentMethodBloc>(),
        ),
        BlocProvider<SettingBloc>(
          create: (context) => locator<SettingBloc>(),
        ),
        BlocProvider<ManageBankBeneficiaryBloc>(
          create: (context) => locator<ManageBankBeneficiaryBloc>(),
        ),
        BlocProvider<SalesDistrictBloc>(
          create: (context) => locator<SalesDistrictBloc>(),
        ),
        BlocProvider<ManageDeductionCodeBloc>(
          create: (context) => locator<ManageDeductionCodeBloc>(),
        ),
        BlocProvider<ManageDeductionCodeBloc>(
          create: (context) => locator<ManageDeductionCodeBloc>(),
        ),
        BlocProvider<ManageBankBeneficiaryBloc>(
          create: (context) => locator<ManageBankBeneficiaryBloc>(),
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => locator<AllCreditsFilterBloc>(),
        ),
        BlocProvider<ManageDeductionCodeBloc>(
          create: (context) => locator<ManageDeductionCodeBloc>(),
        ),
        BlocProvider<ManagePaymentAdviceFooterBloc>(
          create: (context) => locator<ManagePaymentAdviceFooterBloc>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        title: locator<Config>().appName,
        theme: appThemeData[AppTheme.light],
        // darkTheme: appThemeData[AppTheme.dark],
        // themeMode: ThemeMode.system,
        routerDelegate: AutoRouterDelegate(
          router,
          navigatorObservers: () => [
            locator<FirebaseAnalyticsService>().observer,
            locator<RouterObserver>(),
          ],
        ),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
