import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
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
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<ShipToCodeBloc>(
              create: (context) => shipToCodeBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        ],
        child: const AccountTab(),
      );
    }

    testWidgets('Load account_tab widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final titleFinder = find.text('Account'.tr());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets(
      'Test Profile tile',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            userFailureOrSuccessOption: optionOf(
              _getUserFailure(variants.currentValue!),
            ),
            user: User.empty().copyWith(id: 'testId'),
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
      'Test Sales Org Selector tile',
      (tester) async {
        final expectedStates = [
          SalesOrgState.initial().copyWith(
              salesOrganisation: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('FAKE-SALE-ORG'))),
        ];
        final expectedUserStates = [
          UserState.initial().copyWith(
              user: User.empty().copyWith(userSalesOrganisations: [
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-ZPMG'))
          ])),
          UserState.initial().copyWith(
              user: User.empty().copyWith(userSalesOrganisations: [
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('FAKE-TW'))
          ]))
        ];
        whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
        whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));

        await tester.pumpWidget(getScopedWidget());
        whenListen(userBlocMock, Stream.fromIterable(expectedUserStates));
        await tester.pump();
        final salesOrgSelectTile = find.byKey(const Key('salesOrgSelect'));
        await tester.tap(salesOrgSelectTile);
        await tester.pump();

        if (salesOrgVariants.currentValue == SalesOrgVariant.onn) {
          final salesOrgOption = find.byKey(const Key('salesOrgOptionFAKE-TW'));
          expect(salesOrgOption, findsOneWidget);
          await tester.tap(salesOrgOption);
          await tester.pump();
        }
        expect(find.text('Please select a Sales Org'.tr()), findsOneWidget);
      },
      variant: salesOrgVariants,
    );

    testWidgets(
      'Test Customer Code Selector tile',
      (tester) async {
        final expectedStates = [
          CustomerCodeState.initial().copyWith(
              customeCodeInfo: CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-customer-code')),
        ];
        whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        final customerCodeSelectTile =
            find.byKey(const Key('customerCodeSelect'));
        await tester.tap(customerCodeSelectTile);
        await tester.pump();
      },
      variant: customerCodeVariants,
    );

    testWidgets(
      'Test Ship To Code Selector tile',
      (tester) async {
        final expectedStates = [
          ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(shipToCustomerCode: 'fake-ship_to-code')),
        ];
        final expectedOnShipToSelectStates = [
          ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty()
                  .copyWith(shipToCustomerCode: 'fake-123456')),
        ];
        whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
        whenListen(shipToCodeBlocMock,
            Stream.fromIterable(expectedOnShipToSelectStates));

        await tester.pumpWidget(getScopedWidget());
        whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedOnShipToSelectStates));
        await tester.pump();
        final shipToCodeSelectTile =
            find.byKey(const Key('shipToCodeSelect'));
        await tester.tap(shipToCodeSelectTile);
        await tester.pump();

        if (shipToCodeVariants.currentValue == CustomerCodeVariant.onn) {
          final shipToCodeOption = find.byKey(const Key('shipToOptionfake-123456'));
          expect(shipToCodeOption, findsOneWidget);
          await tester.tap(shipToCodeOption);
          await tester.pump();
        }
        expect(find.text('Please select a shipping address'.tr()), findsOneWidget);
      },
      variant: shipToCodeVariants,
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
