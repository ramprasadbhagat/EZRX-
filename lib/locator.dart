import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/bloc/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_list/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/dynamic_links.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/performance_monitor.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/auth_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/performance_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:get_it/get_it.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';

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
  locator.registerLazySingleton(() => FirebaseAnalyticsService());
  locator.registerLazySingleton(() => FirebaseCrashlyticsService());
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
  locator.registerLazySingleton(
    () => AuthInterceptor(
      tokenStorage: locator<TokenStorage>(),
      packageInfoService: locator<PackageInfoService>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      config: locator<Config>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );
  locator.registerLazySingleton(
    () => PerformanceInterceptor(
      performanceMonitorService: locator<PerformanceMonitorService>(),
    ),
  );
  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: [
        locator<AuthInterceptor>(),
        locator<PerformanceInterceptor>(),
      ],
    ),
  );

  locator.registerLazySingleton(() => DataSourceExceptionHandler());

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
      config: locator<Config>(),
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      tokenStorage: locator<TokenStorage>(),
      credStorage: locator<CredStorage>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthBloc(authRepository: locator<AuthRepository>()),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  locator.registerLazySingleton(
    () => ProxyLoginFormBloc(authRepository: locator<AuthRepository>()),
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
    ),
  );

  locator.registerLazySingleton(
    () => UserBloc(
      authBloc: locator<AuthBloc>(),
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
      salesOrgBloc: locator<SalesOrgBloc>(),
    ),
  );

  //============================================================
  //  Sales Org
  //
  //============================================================

  locator.registerLazySingleton(() => SalesOrgQueryMutation());

  locator.registerLazySingleton(() => SalesOrgLocalDataSource());

  locator.registerLazySingleton(
    () => SalesOrgRemoteDataSource(
      httpService: locator<HttpService>(),
      salesOrgQueryMutation: locator<SalesOrgQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgRepository(
      config: locator<Config>(),
      localDataSource: locator<SalesOrgLocalDataSource>(),
      remoteDataSource: locator<SalesOrgRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgBloc(
      userBloc: locator<UserBloc>(),
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
    ),
  );

  locator.registerLazySingleton(
    () => CustomerCodeBloc(
      userBloc: locator<UserBloc>(),
      customerCodeRepository: locator<CustomerCodeRepository>(),
      salesOrgBloc: locator<SalesOrgBloc>(),
      searchBloc: locator<SearchBloc>(),
    ),
  );

  //============================================================
  //  Ship To Code
  //
  //============================================================

  locator.registerLazySingleton(
    () => ShipToCodeBloc(
      customerCodeBloc: locator<CustomerCodeBloc>(),
    ),
  );

  locator.registerLazySingleton(
    () => SearchBloc(),
  );

  //============================================================
  //  Countly
  //
  //============================================================

  locator.registerLazySingleton(
    () => CountlyService(),
  );

  //============================================================
  //  Announcement
  //
  //============================================================

  locator.registerLazySingleton(() => AnnouncementQueryMutation());

  locator.registerLazySingleton(() => AnnouncementRemoteDataSource(
        httpService: locator<HttpService>(),
        queryMutation: locator<AnnouncementQueryMutation>(),
        exceptionHandler: locator<DataSourceExceptionHandler>(),
      ));

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
    ),
  );

  //============================================================
  // Saved Orders
  //
  //============================================================
  locator.registerLazySingleton(
    () => SavedOrderListBloc(
      userBloc: locator<UserBloc>(),
      salesOrgBloc: locator<SalesOrgBloc>(),
      customerCodeBloc: locator<CustomerCodeBloc>(),
      shipToCodeBloc: locator<ShipToCodeBloc>(),
      repository: locator<OrderRepository>(),
    ),
  );

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
      userBloc: locator<UserBloc>(),
      salesRepRepository: locator<SalesRepRepository>(),
    ),
  );
}
