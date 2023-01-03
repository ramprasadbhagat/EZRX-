import 'package:ezrxmobile/application/account/approver/approver_bloc.dart';
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
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/download_attachment/bloc/download_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/approver_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/dynamic_links.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/performance_monitor.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/auth_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/countly_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/performance_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourites_local.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_querymutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_po_document_download_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_document_type_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_template_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/valid_customer_material_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';

import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //============================================================
  //  CORE
  //
  //============================================================

  locator.registerLazySingleton(() => Config());
  locator.registerLazySingleton(() => PackageInfoService());
  locator.registerLazySingleton(() => AppRouter());

  locator.registerLazySingleton(
    () => PushNotificationService(appRouter: locator<AppRouter>()),
  );

  locator.registerLazySingleton(
    () => OktaLoginServices(config: locator<Config>()),
  );

  locator.registerLazySingleton(
    () => DynamicLinksService(
      config: locator<Config>(),
      appRouter: locator<AppRouter>(),
    ),
  );
  locator.registerLazySingleton(() => PerformanceMonitorService());
  locator.registerLazySingleton(() => FirebaseAnalyticsService(
        analytics: FirebaseAnalytics.instance,
        observer:
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ));
  locator.registerLazySingleton(() => FirebaseCrashlyticsService(
        crashlytics: FirebaseCrashlytics.instance,
      ));
  locator.registerLazySingleton(
    () => RemoteConfigService(),
  );

  locator.registerLazySingleton(
    () => RouterObserver(
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
    ),
  );
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(
    () => TokenStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(
    () => CredStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(() => CartStorage());
  locator.registerLazySingleton(
    () => AuthInterceptor(
      tokenStorage: locator<TokenStorage>(),
      packageInfoService: locator<PackageInfoService>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      config: locator<Config>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      pushNotificationService: locator<PushNotificationService>(),
      countlyService: locator<CountlyService>(),
    ),
  );
  locator.registerLazySingleton(
    () => PerformanceInterceptor(
      performanceMonitorService: locator<PerformanceMonitorService>(),
    ),
  );
  locator.registerLazySingleton(
    () => CountlyInterceptor(countlyService: locator<CountlyService>()),
  );
  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: [
        locator<AuthInterceptor>(),
        locator<PerformanceInterceptor>(),
        locator<CountlyInterceptor>(),
      ],
    ),
  );

  locator.registerLazySingleton(() => DataSourceExceptionHandler());

  locator.registerLazySingleton(() => LocalAuthentication());

  //============================================================
  //  Auth
  //
  //============================================================
  locator.registerLazySingleton(() => AuthQueryMutation());
  locator.registerLazySingleton(() => AuthLocalDataSource());
  locator.registerLazySingleton(
    () => AuthRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      tokenStorage: locator<TokenStorage>(),
      credStorage: locator<CredStorage>(),
      cartStorage: locator<CartStorage>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      pushNotificationService: locator<PushNotificationService>(),
      localAuthentication: locator<LocalAuthentication>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  locator.registerLazySingleton(
    () => ProxyLoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  //============================================================
  //  Returns Approver
  //
  //============================================================

  locator.registerLazySingleton(() => ApproverQueryMutation());

  locator.registerLazySingleton(() => ApproverLocalDataSource());

  locator.registerLazySingleton(
    () => ApproverRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      approverQueryMutation: locator<ApproverQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ApproverRepository(
      localDataSource: locator<ApproverLocalDataSource>(),
      remoteDataSource: locator<ApproverRemoteDataSource>(),
      config: locator<Config>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ApproverBloc(
      approverRepository: locator<ApproverRepository>(),
    ),
  );

  //============================================================
  // Returns - User Restriction
  //
  //============================================================

  locator.registerLazySingleton(() => UserRestrictionMutation());

  locator.registerLazySingleton(() => UserRestrictionLocalDataSource());

  locator.registerLazySingleton(
    () => UserRestrictionRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      userRestrictionMutation: locator<UserRestrictionMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRestrictionRepository(
      config: locator<Config>(),
      localDataSource: locator<UserRestrictionLocalDataSource>(),
      remoteDataSource: locator<UserRestrictionRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRestrictionListBloc(
      userRestrictionRepository: locator<UserRestrictionRepository>(),
    ),
  );

  //============================================================
  //  User
  //
  //============================================================

  locator.registerLazySingleton(() => UserQueryMutation());
  locator.registerLazySingleton(
    () => UserLocalDataSource(tokenStorage: locator<TokenStorage>()),
  );
  locator.registerLazySingleton(
    () => UserRemoteDataSource(
      httpService: locator<HttpService>(),
      userQueryMutation: locator<UserQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRepository(
      config: locator<Config>(),
      remoteDataSource: locator<UserRemoteDataSource>(),
      localDataSource: locator<UserLocalDataSource>(),
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
      firebaseCrashlyticsService: locator<FirebaseCrashlyticsService>(),
      tokenStorage: locator<TokenStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserBloc(
      userRepository: locator<UserRepository>(),
    ),
  );

  //============================================================
  //  Banner
  //
  //============================================================
  locator.registerLazySingleton(() => BannerQueryMutation());

  locator.registerLazySingleton(() => BannerLocalDataSource());

  locator.registerLazySingleton(
    () => BannerRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      bannerQueryMutation: locator<BannerQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerRepository(
      config: locator<Config>(),
      localDataSource: locator<BannerLocalDataSource>(),
      remoteDataSource: locator<BannerRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerBloc(
      bannerRepository: locator<BannerRepository>(),
    ),
  );

  //============================================================
  //  Additional bonus
  //
  //============================================================
  locator.registerLazySingleton(
    () => BonusMaterialLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => BonusMaterialRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      bonusQueryMutation: locator<BonusMaterialQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BonusMaterialQueryMutation(),
  );

  locator.registerLazySingleton(
    () => BonusMaterialRepository(
      remoteDataSource: locator<BonusMaterialRemoteDataSource>(),
      config: locator<Config>(),
      localDataSource: locator<BonusMaterialLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => BonusMaterialBloc(
      bonusMaterialRepository: locator<BonusMaterialRepository>(),
    ),
  );
  //============================================================
  //  Price Override
  //
  //============================================================
  locator.registerLazySingleton(
    () => PriceOverrideLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      priceOverrideQueryMutation: locator<PriceOverrideQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PriceOverrideQueryMutation(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRepository(
      remoteDataSource: locator<PriceOverrideRemoteDataSource>(),
      config: locator<Config>(),
      localDataSource: locator<PriceOverrideLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PriceOverrideBloc(
      priceOverrideRepository: locator<PriceOverrideRepository>(),
    ),
  );
  //============================================================
  //  Favourite
  //
  //============================================================

  locator.registerLazySingleton(
    () => FavouriteLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => FavouriteQueryMutation(),
  );
  locator.registerLazySingleton(
    () => FavouriteRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      favouriteQueryMutation: locator<FavouriteQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteRepository(
      config: locator<Config>(),
      localDataSource: locator<FavouriteLocalDataSource>(),
      remoteDataSource: locator<FavouriteRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteBloc(
      favouriteRepository: locator<FavouriteRepository>(),
    ),
  );
  //============================================================
  //  Sales Org
  //
  //============================================================

  locator.registerLazySingleton(() => SalesOrgQueryMutation());

  locator.registerLazySingleton(() => SalesOrgLocalDataSource());

  locator.registerLazySingleton(() => AccountSelectorStorage(hive: Hive));

  locator.registerLazySingleton(
    () => SalesOrgRemoteDataSource(
      httpService: locator<HttpService>(),
      salesOrgQueryMutation: locator<SalesOrgQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      localDataSource: locator<SalesOrgLocalDataSource>(),
      remoteDataSource: locator<SalesOrgRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgBloc(
      salesOrgRepository: locator<SalesOrgRepository>(),
    ),
  );

  //============================================================
  //  Customer Code
  //
  //============================================================
  locator.registerLazySingleton(() => CustomerCodeQueryMutation());

  locator.registerLazySingleton(() => CustomerCodeLocalDataSource());

  locator.registerLazySingleton(
    () => CustomerCodeRemoteDataSource(
      httpService: locator<HttpService>(),
      customerCodeQueryMutation: locator<CustomerCodeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => CustomerCodeRepository(
      config: locator<Config>(),
      remoteDataSource: locator<CustomerCodeRemoteDataSource>(),
      localCustomerCodeDataSource: locator<CustomerCodeLocalDataSource>(),
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => CustomerCodeBloc(
      customerCodeRepository: locator<CustomerCodeRepository>(),
    ),
  );

  //============================================================
  //  Ship To Code
  //
  //============================================================

  locator.registerLazySingleton(
    () => ShipToCodeRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => ShipToCodeBloc(
      shipToCodeRepository: locator<ShipToCodeRepository>(),
    ),
  );

  //============================================================
  //  Eligibility
  //
  //============================================================

  locator.registerLazySingleton(
    () => EligibilityBloc(),
  );

  //============================================================
  //  Countly
  //
  //============================================================

  locator.registerLazySingleton(
    () => CountlyService(
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Announcement
  //
  //============================================================

  locator.registerLazySingleton(() => AnnouncementQueryMutation());

  locator.registerLazySingleton(
    () => AnnouncementRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<AnnouncementQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(() => AnnouncementLocalDataSource());

  locator.registerLazySingleton(
    () => AnnouncementRepository(
      config: locator<Config>(),
      remoteDataSource: locator<AnnouncementRemoteDataSource>(),
      localDataSource: locator<AnnouncementLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementBloc(
      announcementRepository: locator<AnnouncementRepository>(),
    ),
  );

  //============================================================
  //  Order
  //
  //============================================================

  locator.registerLazySingleton(() => OrderQueryMutation());

  locator.registerLazySingleton(() => OrderLocalDataSource());

  locator.registerLazySingleton(
    () => OrderRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<OrderQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderLocalDataSource>(),
      remoteDataSource: locator<OrderRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderSummaryBloc(repository: locator<OrderRepository>()),
  );

  locator.registerLazySingleton(
    () => AdditionalDetailsBloc(),
  );

  locator.registerLazySingleton(
    () => OrderEligibilityBloc(),
  );

  //============================================================
  // Saved Orders
  //
  //============================================================
  locator.registerLazySingleton(
    () => SavedOrderListBloc(
      repository: locator<OrderRepository>(),
    ),
  );

  //============================================================
  //  Sales Rep
  //
  //============================================================

  locator.registerLazySingleton(() => SalesRepQueryMutation());

  locator.registerLazySingleton(() => SalesRepLocalDataSource());

  locator.registerLazySingleton(
    () => SalesRepRemoteDataSource(
      httpService: locator<HttpService>(),
      salesRepQueryMutation: locator<SalesRepQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesRepRepository(
      config: locator<Config>(),
      remoteDataSource: locator<SalesRepRemoteDataSource>(),
      localDataSource: locator<SalesRepLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesRepBloc(
      salesRepRepository: locator<SalesRepRepository>(),
    ),
  );

  //============================================================
  //  Material List
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialsWithMetaQuery());

  locator.registerLazySingleton(() => MaterialListLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialListQuery: locator<MaterialsWithMetaQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialListRepository(
      config: locator<Config>(),
      materialListLocalDataSource: locator<MaterialListLocalDataSource>(),
      materialListRemoteDataSource: locator<MaterialListRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialListBloc(
      materialListRepository: locator<MaterialListRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => CovidMaterialListBloc(
      materialListRepository: locator<MaterialListRepository>(),
    ),
  );

  locator.registerLazySingleton(() => MaterialBundleQuery());

  locator.registerLazySingleton(() => MaterialBundleListLocalDatasource());

  locator.registerLazySingleton(
    () => MaterialBundleListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialBundleQuery: locator<MaterialBundleQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialBundleListRepository(
      config: locator<Config>(),
      materialBundleListLocalDatasource:
          locator<MaterialBundleListLocalDatasource>(),
      materialBundleListRemoteDatasource:
          locator<MaterialBundleListRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialBundleListBloc(
      materialBundleListRepository: locator<MaterialBundleListRepository>(),
      customerMaterialPriceDetailsRepository:
          locator<MaterialPriceDetailRepository>(),
    ),
  );

  //============================================================
  //  Order Template List
  //
  //============================================================

  locator.registerLazySingleton(() => OrderTemplateQueries());

  locator.registerLazySingleton(() => OrderTemplateLocalDataSource());

  locator.registerLazySingleton(() => OrderTemplateRemoteDataSource(
        httpService: locator<HttpService>(),
        orderTemplateQueries: locator<OrderTemplateQueries>(),
        dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
        config: locator<Config>(),
      ));

  locator.registerLazySingleton(
    () => OrderTemplateRepository(
      config: locator<Config>(),
      orderTemplateLocalDataSource: locator<OrderTemplateLocalDataSource>(),
      orderTemplateRemoteDataSource: locator<OrderTemplateRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderTemplateListBloc(
      orderTemplateRepository: locator<OrderTemplateRepository>(),
    ),
  );

  //============================================================
  //  Reset Password
  //
  //============================================================
  locator.registerLazySingleton(() => ChangePasswordLocalDataSource());

  locator.registerLazySingleton(
    () => ChangePasswordRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ChangePasswordRepository(
      config: locator<Config>(),
      localDataSource: locator<ChangePasswordLocalDataSource>(),
      changePasswordRemoteDataSource: locator<ChangePasswordRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ResetPasswordBloc(
      changePasswordRepository: locator<ChangePasswordRepository>(),
    ),
  );

  //============================================================
  //  Order History
  //
  //============================================================

  locator.registerLazySingleton(() => OrderHistoryLocalDataSource());
  locator.registerLazySingleton(() => OrderHistoryQueryMutation());
  locator.registerLazySingleton(
    () => OrderHistoryRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      orderHistoryQueryMutation: locator<OrderHistoryQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderHistoryLocalDataSource>(),
      orderHistoryRemoteDataSource: locator<OrderHistoryRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );
  locator.registerLazySingleton(
    () => OrderHistoryListBloc(
      orderHistoryRepository: locator<OrderHistoryRepository>(),
    ),
  );
  //============================================================
  //  Order History Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => OrderHistoryFilterBloc(),
  );
  //============================================================
  //  Order History Filter By Status
  //
  //============================================================

  locator.registerLazySingleton(
    () => OrderHistoryFilterByStatusBloc(),
  );
  //============================================================
  //  Order History Details
  //
  //============================================================

  locator.registerLazySingleton(() => OrderHistoryDetailsLocalDataSource());

  locator.registerLazySingleton(() => OrderHistoryDetailsQueryMutation());

  locator.registerLazySingleton(
    () => OrderHistoryDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderHistoryDetailsLocalDataSource>(),
      orderHistoryDetailsRemoteDataSource:
          locator<OrderHistoryDetailsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryDetailsBloc(
      orderHistoryDetailsRepository: locator<OrderHistoryDetailsRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryDetailsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      orderHistoryDetailsQueryMutation:
          locator<OrderHistoryDetailsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  //============================================================
  //  Payment Customer Information
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentCustomerInformationLocalDataSource(),
  );

  locator
      .registerLazySingleton(() => PaymentCustomerInformationQueryMutation());

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentCustomerInformationQueryMutation:
          locator<PaymentCustomerInformationQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRepository(
      config: locator<Config>(),
      remoteDataSource: locator<PaymentCustomerInformationRemoteDataSource>(),
      localDataSource: locator<PaymentCustomerInformationLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PaymentCustomerInformationBloc(
      paymentCustomerInformationRepository:
          locator<PaymentCustomerInformationRepository>(),
    ),
  );

  //============================================================
  //  T&C
  //
  //============================================================

  locator.registerLazySingleton(
    () => AcceptanceDateLocalDataSource(),
  );


  locator.registerLazySingleton(
    () => AcceptanceDateRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => AupTcRepository(
      config: locator<Config>(),
      localDataSource: locator<AcceptanceDateLocalDataSource>(),
      remoteDataSource: locator<AcceptanceDateRemoteDataSource>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AupTcBloc(
      aupTcRepository: locator<AupTcRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Payment Terms
  //
  //============================================================

  locator.registerLazySingleton(() => PaymentTermsQueryMutation());

  locator.registerLazySingleton(() => PaymentTermLocalDataSource());

  locator.registerLazySingleton(
    () => PaymentTermsRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      payemttTermsQueryMutation: locator<PaymentTermsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermsRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentTermLocalDataSource>(),
      remoteDataSource: locator<PaymentTermsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermBloc(
      paymentTermRepository: locator<PaymentTermsRepository>(),
    ),
  );

  //============================================================
  //  Material Price
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialPriceQueryMutation());

  locator.registerLazySingleton(() => MaterialPriceLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialPriceRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceRepository(
      config: locator<Config>(),
      localDataSource: locator<MaterialPriceLocalDataSource>(),
      remoteDataSource: locator<MaterialPriceRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceBloc(
      repository: locator<MaterialPriceRepository>(),
    ),
  );

  //============================================================
  //  Material Price Detail
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialPriceDetailQueryMutation());

  locator.registerLazySingleton(() => MaterialPriceDetailLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialPriceDetailRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceDetailQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceDetailRepository(
      config: locator<Config>(),
      localDataSource: locator<MaterialPriceDetailLocalDataSource>(),
      remoteDataSource: locator<MaterialPriceDetailRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => MaterialPriceDetailBloc(
      priceRepository: locator<MaterialPriceDetailRepository>(),
      validateRepository: locator<ValidCustomerMaterialRepository>(),
    ),
  );

  //============================================================
  //  Valid Customer Material
  //
  //============================================================

  locator.registerLazySingleton(
    () => ValidCustomMaterialQuery(),
  );

  locator.registerLazySingleton(
    () => ValidCustomerMaterialLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => ValidCustomerMaterialRemoteDataSource(
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      validCustomMaterialQuery: ValidCustomMaterialQuery(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ValidCustomerMaterialRepository(
      config: locator<Config>(),
      localDataSource: locator<ValidCustomerMaterialLocalDataSource>(),
      remoteDataSource: locator<ValidCustomerMaterialRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Material Filter
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialFilterQueryMutation());
  locator.registerLazySingleton(() => MaterialFilterLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialFilterRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      materialFilterQueryMutation: locator<MaterialFilterQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterRepository(
      config: locator<Config>(),
      filterMaterialRemoteDataSource: locator<MaterialFilterRemoteDataSource>(),
      filterMaterialLocalDataSource: locator<MaterialFilterLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterBloc(
      materialFilterRepository: locator<MaterialFilterRepository>(),
    ),
  );

  //============================================================
  //  Order Document Type
  //
  //============================================================

  locator.registerLazySingleton(() => OrderDocumentTypeLocalDataSource());
  locator.registerLazySingleton(() => OrderDocumentTypeQueryMutation());

  locator.registerLazySingleton(
    () => OrderDocumentTypeRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      queryMutation: locator<OrderDocumentTypeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderDocumentTypeRepository(
      config: locator<Config>(),
      orderDocumentTypLocalDataSource:
          locator<OrderDocumentTypeLocalDataSource>(),
      orderDocumentTypRemoteDataSource:
          locator<OrderDocumentTypeRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderDocumentTypeBloc(
      orderDocumentTypeRepository: locator<OrderDocumentTypeRepository>(),
    ),
  );

  //============================================================
  //  Order History Details Po Document Type
  //
  //============================================================

  locator.registerLazySingleton(
    () => OrderHistoryDetailsPoDocumentDownloadLocal(),
  );
  locator.registerLazySingleton(
    () => OrderHistoryDetailsPoDocumentDownloadRemote(
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryDetailsPoDocumentRepository(
      config: locator<Config>(),
      remoteDataSource: locator<OrderHistoryDetailsPoDocumentDownloadRemote>(),
      localDataSource: locator<OrderHistoryDetailsPoDocumentDownloadLocal>(),
    ),
  );

  locator.registerLazySingleton(
    () => DownloadAttachmentBloc(
      downloadAttachmentRepository:
          locator<OrderHistoryDetailsPoDocumentRepository>(),
    ),
  );

  //============================================================
  //  Tender Contract
  //
  //============================================================

  locator.registerLazySingleton(() => TenderContractQuery());

  locator.registerLazySingleton(() => TenderContractLocalDataSource());

  locator.registerLazySingleton(
    () => TenderContractRemoteDataSource(
      httpService: locator<HttpService>(),
      tenderContractQuery: locator<TenderContractQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractRepository(
      config: locator<Config>(),
      tenderContractLocalDataSource: locator<TenderContractLocalDataSource>(),
      tenderContractRemoteDataSource: locator<TenderContractRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  //============================================================
  //  Discount Override
  //
  //============================================================

  locator.registerLazySingleton(() => DiscountOverrideLocalDataSource());

  locator.registerLazySingleton(
    () => DiscountOverrideRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => DiscountOverrideRepository(
      config: locator<Config>(),
      localDataSource: locator<DiscountOverrideLocalDataSource>(),
      remoteDataSource: locator<DiscountOverrideRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => DiscountOverrideBloc(
      repository: locator<DiscountOverrideRepository>(),
    ),
  );

  //============================================================
  //  Cart
  //
  //============================================================

  locator.registerLazySingleton(
    () => AddToCartBloc(),
  );

  locator.registerLazySingleton(() => StockInfoLocalDataSource());
  locator.registerLazySingleton(() => StockInfoQueryMutation());

  locator.registerLazySingleton(
    () => StockInfoRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      stockInfoQueryMutation: locator<StockInfoQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartRepository(
      cartStorage: locator<CartStorage>(),
      config: locator<Config>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      countlyService: locator<CountlyService>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartBloc(cartRepository: locator<CartRepository>()),
  );
}
