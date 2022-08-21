import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxyLogin/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
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
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:get_it/get_it.dart';

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

  locator.registerLazySingleton(
    () => OktaLoginServices(config: locator<Config>()),
  );

  locator.registerLazySingleton(
    () => DataSourceExceptionHandler(),
  );

  //============================================================
  //  Auth
  //
  //============================================================
  locator.registerLazySingleton(
    () => AuthQueryMutation(),
  );
  locator.registerLazySingleton(() => AuthLocalDataSource());
  locator.registerLazySingleton(
    () => AuthRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
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
    () => AuthBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ProxyLoginFormBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  //============================================================
  //  User
  //
  //============================================================

  locator.registerLazySingleton(
    () => UserQueryMutation(),
  );
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
  locator.registerLazySingleton(
    () => BannerQueryMutation(),
  );

  locator.registerLazySingleton(
    () => BannerRemoteDataSource(
      httpService: locator<HttpService>(),
      bannerQueryMutation: locator<BannerQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerRepository(remoteDataSource: locator<BannerRemoteDataSource>()),
  );

  locator.registerLazySingleton(
    () => BannerBloc(
        bannerRepository: locator<BannerRepository>(),
        salesOrgBloc: locator<SalesOrgBloc>()),
  );

  //============================================================
  //  Sales Org
  //
  //============================================================

  locator.registerLazySingleton(
    () => SalesOrgBloc(userBloc: locator<UserBloc>()),
  );

  //============================================================
  //  Countly
  //
  //============================================================

  locator.registerLazySingleton(
    () => CountlyService(),
  );
}
