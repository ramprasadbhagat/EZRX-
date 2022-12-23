import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/account/account_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

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
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });
  group('Account Tab Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
      cartBlocMock = CartBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });

    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en', 'SG'),
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
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

    testWidgets('Tap login_on_behalf', (tester) async {
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
      final loginOnBehalfTile = find.byKey(const Key('loginOnBehalfTile'));
      expect(loginOnBehalfTile, findsOneWidget);
      await tester.tap(loginOnBehalfTile);
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
  });
}
