import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/user/bloc/user_bloc.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/auth/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/core/http/base_options.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:ezrxmobile/infrastructure/user/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/user/repository/user_repository.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //============================================================
  //  CORE
  //
  //============================================================

  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(
    () => TokenStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(
    () => AuthInterceptor(tokenStorage: locator<TokenStorage>()),
  );
  locator.registerLazySingleton(
    () => HttpService(
      baseOptions: StageBaseOptions(),
      interceptors: [locator<AuthInterceptor>()],
    ),
  );

  //============================================================
  //  Auth
  //
  //============================================================
  locator.registerLazySingleton(
    () => AuthRemoteDataSource(httpService: locator<HttpService>()),
  );

  locator.registerLazySingleton(() => CredStorage());

  locator.registerLazySingleton(() => OktaLoginServices());

  locator.registerLazySingleton(
    () => AuthRepository(
      remoteDataSource: locator<AuthRemoteDataSource>(),
      tokenStorage: locator<TokenStorage>(),
      oktaLoginServices: locator<OktaLoginServices>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthBloc(
      authRepository: locator<AuthRepository>(),
      userRepository: locator<UserRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  //============================================================
  //  User
  //
  //============================================================
  locator.registerLazySingleton(
    () => UserRemoteDataSource(httpService: locator<HttpService>()),
  );

  locator.registerLazySingleton(
    () => UserRepository(
      remoteDataSource: locator<UserRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserBloc(
      authBloc: locator<AuthBloc>(),
      userRepository: locator<UserRepository>(),
    ),
  );
}
