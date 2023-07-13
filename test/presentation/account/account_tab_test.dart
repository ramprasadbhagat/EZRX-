import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/presentation/account/account_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class FavoriteRemoteDataSourceMock extends Mock
    implements FavouriteRemoteDataSource {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ProxyLoginFormBlocMock
    extends MockBloc<ProxyLoginFormEvent, ProxyLoginFormState>
    implements ProxyLoginFormBloc {}

class MaterialListBlocMock
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

final locator = GetIt.instance;

enum ProfileErrorVariant {
  other,
  serverError,
  poorConnection,
  serverTimeout,
  userNotFound,
  authError,
  noApiFailure,
  noError
}

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

enum ShipToCodeVariant { onn, off }

final variants = ValueVariant({...ProfileErrorVariant.values});

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

final shipToCodeVariants = ValueVariant({...ShipToCodeVariant.values});

Either<ApiFailure, dynamic> _getUserFailure(ProfileErrorVariant? value) {
  switch (value!.name) {
    case 'other':
      return const Left(ApiFailure.other('Fake Error'));
    case 'serverError':
      return const Left(ApiFailure.serverError('Fake Server Error'));
    case 'poorConnection':
      return const Left(ApiFailure.poorConnection());
    case 'serverTimeout':
      return const Left(ApiFailure.serverTimeout());
    case 'userNotFound':
      return const Left(ApiFailure.userNotFound());
    case 'authError':
      return const Left(ApiFailure.other('authentication failed'));
    case 'noApiFailure':
      return const Right('No API Error');
    default:
      return const Left(ApiFailure.other('Fake Error'));
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late ProxyLoginFormBloc proxyLoginFormBlocMock;
  late MaterialListBloc materialListBlocMock;
  late RemoteConfigService remoteConfigServiceMock;

  setUpAll(() {
    remoteConfigServiceMock = RemoteConfigServiceMock();

    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => remoteConfigServiceMock);

    locator.registerLazySingleton(() => AppRouter());
  });
  group('Account Tab Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = locator<AppRouter>();
      cartBlocMock = CartBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      proxyLoginFormBlocMock = ProxyLoginFormBlocMock();
      materialListBlocMock = MaterialListBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => proxyLoginFormBlocMock.state)
          .thenReturn(ProxyLoginFormState.initial());
      when(() => materialListBlocMock.state)
          .thenReturn(MaterialListState.initial());
    });

    Widget getScopedWidget() {
      return EasyLocalization(
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
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<ProxyLoginFormBloc>(
                create: (context) => proxyLoginFormBlocMock),
            BlocProvider<MaterialListBloc>(
                create: (context) => materialListBlocMock),
          ],
          child: const AccountTab(),
        ),
      );
    }

    testWidgets('Load account_tab widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final titleFinder = find.text('Account'.tr());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets(
      'Test Profile tile length more than or equal to 1',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              id: 'testId',
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        find.byKey(const Key('profileTile'));
        expect(find.byKey(const Key('profileTile')), findsOneWidget);
      },
      variant: variants,
    );
    testWidgets(
      'Test Profile tile returns empty name',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              id: 'testId',
            ),
          ),
          UserState.initial().copyWith(
            userFailureOrSuccessOption: optionOf(
              _getUserFailure(variants.currentValue!),
            ),
            user: User.empty().copyWith(
              id: 'testId',
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        find.byKey(const Key('profileTile'));
        expect(find.byKey(const Key('profileTile')), findsOneWidget);
      },
      variant: variants,
    );

    testWidgets(
      'Test Profile name length in 1',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              id: 'testId',
              fullName: const FullName(firstName: 'test', lastName: 't'),
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        find.byKey(const Key('profileTile'));
        expect(find.byKey(const Key('profileTile')), findsOneWidget);
      },
      variant: variants,
    );

    testWidgets('Tap login_on_behalf with cancel button click', (tester) async {
      final expectedStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('root_admin')),
          ),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedStates));
      when(() => remoteConfigServiceMock.getPaymentsConfig()).thenReturn(false);

      final expectedStates1 = [
        ProxyLoginFormState.initial().copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
        ProxyLoginFormState.initial().copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: none(),
        ),
      ];
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
      expect(loginOnBehalfTile, findsOneWidget);
      await tester.tap(loginOnBehalfTile);
      whenListen(proxyLoginFormBlocMock, Stream.fromIterable(expectedStates1));
      await tester.pumpAndSettle();
      final cancelKey = find.byKey(const Key('cancel'));
      expect(cancelKey, findsOneWidget);
      await tester.tap(cancelKey);
      await tester.pumpAndSettle();
      await tester.pump();
    });

    testWidgets('Tap login_on_behalf with submit button click', (tester) async {
      final expectedStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('root_admin')),
            accessRight: AccessRight.empty().copyWith(
              adminPOAttachment: true,
            ),
          ),
        ),
      ];
      when(() => remoteConfigServiceMock.getPaymentsConfig()).thenReturn(false);

      whenListen(userBlocMock, Stream.fromIterable(expectedStates));
      final expectedStates1 = [
        ProxyLoginFormState.initial().copyWith(
          isSubmitting: true,
        ),
        ProxyLoginFormState.initial().copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(const Right('success')),
        ),
      ];
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
      expect(loginOnBehalfTile, findsOneWidget);
      await tester.tap(loginOnBehalfTile);
      whenListen(proxyLoginFormBlocMock, Stream.fromIterable(expectedStates1));
      await tester.pumpAndSettle();
      final proxyLoginUsernameFieldKey =
          find.byKey(const Key('proxyLoginUsernameField'));
      expect(proxyLoginUsernameFieldKey, findsOneWidget);
      await tester.enterText(proxyLoginUsernameFieldKey, 'test');
      final proxyLoginSubmitButtonKey =
          find.byKey(const Key('proxyLoginSubmitButton'));
      expect(proxyLoginSubmitButtonKey, findsOneWidget);
      await tester.tap(proxyLoginSubmitButtonKey);
      await tester.pump();
    });

    testWidgets('Tap settingsTile', (tester) async {
      final expectedStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('zp_admin')),
          ),
        ),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final settingsTile = find.byKey(const Key('settingsTile'));
      expect(settingsTile, findsOneWidget);
      await tester.tap(settingsTile);
      await tester.pump();
    });

    testWidgets(
        'SupportTile should not be visible when user salesOrg is not SG',
        (tester) async {
      final expectedUserStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('zp_admin')),
          ),
        ),
      ];
      final expectedSalesOrgState = [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('1300'),
          ),
        ),
      ];

      whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));
      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedSalesOrgState));

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final supportTile = find.byKey(const Key('supportTile'));

      expect(supportTile, findsNothing);
    });

    testWidgets('Tap supportTile when user salesOrg is from SG',
        (tester) async {
      final expectedUserStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('zp_admin')),
          ),
        ),
      ];
      final expectedSalesOrgState = [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ),
      ];

      whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));
      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedSalesOrgState));

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final supportTile = find.byKey(const Key('supportTile'));

      expect(supportTile, findsOneWidget);

      await tester.tap(supportTile);
      await tester.pump();
    });

    testWidgets(
        'Payment Configuration should be visible when user role is root_admin',
        (tester) async {
      final expectedUserStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('root_admin')),
          ),
        ),
      ];
      when(() => remoteConfigServiceMock.getPaymentsConfig()).thenReturn(true);

      whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final supportTile = find.byKey(const Key('paymentConfigurationTile'));

      expect(supportTile, findsOneWidget);
    });

    testWidgets(
        'Payment Configuration should not be visible when user role is other than root_admin',
        (tester) async {
      final expectedUserStates = [
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            id: 'testId',
            role: Role.empty().copyWith(type: RoleType('fake_admin')),
          ),
        ),
      ];

      whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final supportTile = find.byKey(const Key('paymentConfigurationTile'));

      expect(supportTile, findsNothing);
    });
  });
}
