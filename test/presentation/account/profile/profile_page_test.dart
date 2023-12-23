//TODO: will cover the test case in EZRX-11349

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/account/profile/profile_page.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerLicenseBlocMock
    extends MockBloc<CustomerLicenseEvent, CustomerLicenseState>
    implements CustomerLicenseBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late GetIt locator;
  late CustomerLicenseBloc customerLicenseBlocMock;
  late UserBlocMock userBlockMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late List<CustomerLicense> customerLicensesListMock;
  late Stream<UserState> userStateMock;
  late User userMock;
  setUpAll(() async {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => customerLicenseBlocMock);
    autoRouterMock = locator<AppRouter>();
    customerLicenseBlocMock = CustomerLicenseBlocMock();
    userBlockMock = UserBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    userMock = User.empty().copyWith(
      username: Username('fakeUser'),
      role: Role(
        type: RoleType('client_user'),
        description: '',
        id: '',
        name: '',
      ),
      disableCreateOrder: true,
      accessRight: AccessRight.empty().copyWith(
        orders: true,
      ),
    );
    userStateMock = Stream.fromIterable([
      UserState.initial().copyWith(user: userMock),
    ]);
    customerLicensesListMock = [
      CustomerLicense(
        licenseNumbers: StringValue('fake1'),
        licenseType: StringValue('fake2'),
        licenseDescription: StringValue('fake3'),
        validFrom: DateTimeStringValue('fake4'),
        validTo: DateTimeStringValue('fake4'),
        status: StatusType('fake5'),
      ),
      CustomerLicense(
        licenseNumbers: StringValue('fake1'),
        licenseType: StringValue('fake2'),
        licenseDescription: StringValue('fake3'),
        validFrom: DateTimeStringValue('fake4'),
        validTo: DateTimeStringValue('fake4'),
        status: StatusType('fake5'),
      )
    ];
  });
  group('Test profile page', () {
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      when(() => customerLicenseBlocMock.state)
          .thenReturn(CustomerLicenseState.initial());
      when(() => userBlockMock.state).thenReturn(
        UserState.initial().copyWith(user: userMock),
      );
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    });
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<CustomerLicenseBloc>(
            create: (context) => customerLicenseBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlockMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
        ],
        child: const ProfilePage(),
      );
    }

    testWidgets('should show loading for the first time', (tester) async {
      whenListen(userBlockMock, userStateMock);
      when(() => customerLicenseBlocMock.state).thenReturn(
        CustomerLicenseState.initial().copyWith(isFetching: true),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
    });
    testWidgets('should show toast error for the case api fail',
        (tester) async {
      final customerLicenseState = [
        CustomerLicenseState.initial(),
        CustomerLicenseState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake Error'),
            ),
          ),
        )
      ];

      whenListen(
        customerLicenseBlocMock,
        Stream.fromIterable(customerLicenseState),
      );
      whenListen(userBlockMock, userStateMock);
      await tester.pumpWidget(getWidget());

      await tester.pumpAndSettle();
      expect(find.byType(CustomSnackBar), findsOneWidget);
    });
    testWidgets('should the user info', (tester) async {
      final customerLicenseState = [
        CustomerLicenseState.initial().copyWith(
          isFetching: false,
        ),
      ];

      whenListen(
        customerLicenseBlocMock,
        Stream.fromIterable(customerLicenseState),
      );
      whenListen(userBlockMock, userStateMock);
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(find.text('fakeUser'), findsOneWidget);
    });
    testWidgets('should the license information list', (tester) async {
      final customerLicenseState = [
        CustomerLicenseState.initial().copyWith(
          isFetching: false,
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(customerLicensesListMock),
          ),
          customerLicenses: customerLicensesListMock,
        ),
      ];

      whenListen(
        customerLicenseBlocMock,
        Stream.fromIterable(customerLicenseState),
      );
      whenListen(userBlockMock, userStateMock);
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.textContaining('License information'), findsOneWidget);
    });
    testWidgets('should add fetch data again when refresh', (tester) async {
      final customerLicenseBloc = locator<CustomerLicenseBloc>();
      final customerLicenseState = [
        CustomerLicenseState.initial(),
        CustomerLicenseState.initial().copyWith(
          isFetching: false,
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(customerLicensesListMock),
          ),
          customerLicenses: customerLicensesListMock,
        ),
      ];

      whenListen(
        customerLicenseBlocMock,
        Stream.fromIterable(customerLicenseState),
      );
      whenListen(userBlockMock, userStateMock);
      await tester.pumpWidget(getWidget());

      await tester.pump();
      await tester.fling(
        find.textContaining('License information'),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(
        () => customerLicenseBloc.add(
          CustomerLicenseEvent.fetch(
            salesOrganisation: SalesOrganisation.empty(),
            customerInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
      ).called(1);
    });
    testWidgets('should add load more data  when load more', (tester) async {
      final customerLicenseBloc = locator<CustomerLicenseBloc>();
      when(() => customerLicenseBlocMock.state).thenReturn(
        CustomerLicenseState.initial().copyWith(
          isFetching: false,
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(customerLicensesListMock),
          ),
          customerLicenses: [
            ...customerLicensesListMock,
            ...customerLicensesListMock,
            ...customerLicensesListMock
          ],
        ),
      );
      whenListen(userBlockMock, userStateMock);
      await tester.pumpWidget(getWidget());
      await tester.pump();
      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0.0, -10000),
      );
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      verify(
        () => customerLicenseBloc.add(
          CustomerLicenseEvent.loadMore(
            salesOrganisation: SalesOrganisation.empty(),
            customerInfo: CustomerCodeInfo.empty(),
            user: User.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Language Dropdown test', (tester) async {
      final expectedState = Stream.fromIterable([
        UserState.initial().copyWith(
          user: userMock.copyWith(
            supportedLanguages: [Language.mandarin(), Language.english()],
          ),
          activeLanguage: Language.mandarin(),
        ),
      ]);
      whenListen(userBlockMock, expectedState);
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final profilePageLanguageDropdown =
          find.byKey(WidgetKeys.profilePageLanguageDropdown);
      expect(profilePageLanguageDropdown, findsOneWidget);
      await tester.drag(
        profilePageLanguageDropdown,
        const Offset(0, -1000),
      );
      await tester.pump();
      await tester.tap(
        profilePageLanguageDropdown,
      );
      await tester.pumpAndSettle();
      final languageZH =
          find.byKey(Key('language_${Language.mandarin().languageString}'));
      expect(languageZH, findsWidgets);
      final languageEN =
          find.byKey(Key('language_${Language.english().languageString}'));
      expect(languageEN, findsWidgets);
      await tester.tap(
        languageEN.last,
        warnIfMissed: false,
      );
      verify(
        () => userBlockMock.add(
          UserEvent.selectLanguage(
            Language.english(),
          ),
        ),
      ).called(1);
    });
  });
}
