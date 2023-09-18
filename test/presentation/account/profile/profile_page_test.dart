//TODO: will cover the test case in EZRX-11349

// import 'package:auto_route/auto_route.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
// import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
// import 'package:ezrxmobile/application/account/language/language_bloc.dart';
// import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
// import 'package:ezrxmobile/application/account/user/user_bloc.dart';
// import 'package:ezrxmobile/domain/account/entities/access_right.dart';
// import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
// import 'package:ezrxmobile/domain/account/entities/role.dart';
// import 'package:ezrxmobile/domain/account/entities/user.dart';
// import 'package:ezrxmobile/domain/account/value/value_objects.dart';
// import 'package:ezrxmobile/domain/auth/entities/language.dart';
// import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
// import 'package:ezrxmobile/domain/core/error/api_failures.dart';
// import 'package:ezrxmobile/domain/core/value/value_objects.dart';
// import 'package:ezrxmobile/presentation/account/profile/profile_page.dart';
// import 'package:ezrxmobile/presentation/core/language_picker.dart';
// import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
// import 'package:ezrxmobile/presentation/core/widget_keys.dart';
// import 'package:ezrxmobile/presentation/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../utils/widget_utils.dart';

// class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

// class CustomerLicenseBlocMock
//     extends MockBloc<CustomerLicenseEvent, CustomerLicenseState>
//     implements CustomerLicenseBloc {}

// class LanguageBlocMock extends MockBloc<LanguageEvent, LanguageState>
//     implements LanguageBloc {}

// class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
//     implements EligibilityBloc {}

// class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
//     implements SalesOrgBloc {}

void main() {
//   late GetIt locator;
//   late CustomerLicenseBloc customerLicenseBlocMock;
//   late UserBlocMock userBlockMock;
//   late AppRouter autoRouterMock;
//   late LanguageBloc languageBlocMock;
//   late EligibilityBloc eligibilityBlocMock;
//   late SalesOrgBloc salesOrgBlocMock;
//   late List<CustomerLicense> customerLicensesListMock;
//   late Stream<UserState> userStateMock;
//   late User userMock;
//   setUpAll(() async {
//     locator = GetIt.instance;
//     locator.registerLazySingleton(() => AppRouter());
//     locator.registerLazySingleton(() => customerLicenseBlocMock);
//     autoRouterMock = locator<AppRouter>();
//     customerLicenseBlocMock = CustomerLicenseBlocMock();
//     userBlockMock = UserBlocMock();
//     languageBlocMock = LanguageBlocMock();
//     eligibilityBlocMock = EligibilityBlocMock();
//     salesOrgBlocMock = SalesOrgBlocMock();
//     userMock = User.empty().copyWith(
//       username: Username('fakeUser'),
//       role: Role(
//         type: RoleType('client_user'),
//         description: '',
//         id: '',
//         name: '',
//       ),
//       disableCreateOrder: true,
//       accessRight: AccessRight.empty().copyWith(
//         orders: true,
//       ),
//     );
//     userStateMock = Stream.fromIterable([
//       UserState.initial().copyWith(user: userMock),
//     ]);
//     customerLicensesListMock = [
//       CustomerLicense(
//         licenseNumbers: StringValue('fake1'),
//         licenseType: StringValue('fake2'),
//         licenseDescription: StringValue('fake3'),
//         validFrom: DateTimeStringValue('fake4'),
//         validTo: DateTimeStringValue('fake4'),
//         status: StatusType('fake5'),
//       ),
//       CustomerLicense(
//         licenseNumbers: StringValue('fake1'),
//         licenseType: StringValue('fake2'),
//         licenseDescription: StringValue('fake3'),
//         validFrom: DateTimeStringValue('fake4'),
//         validTo: DateTimeStringValue('fake4'),
//         status: StatusType('fake5'),
//       )
//     ];
//   });
//   group('Test profile page', () {
//     setUp(() {
//       when(() => customerLicenseBlocMock.state)
//           .thenReturn(CustomerLicenseState.initial());
//       when(() => userBlockMock.state).thenReturn(
//         UserState.initial().copyWith(user: userMock),
//       );
//       when(() => languageBlocMock.state).thenReturn(LanguageState.initial());
//       when(() => eligibilityBlocMock.state)
//           .thenReturn(EligibilityState.initial());
//       when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
//     });
//     RouteDataScope getWidget() {
//       return WidgetUtils.getScopedWidget(
//         autoRouterMock: autoRouterMock,
//         providers: [
//           BlocProvider<CustomerLicenseBloc>(
//             create: (context) => customerLicenseBlocMock,
//           ),
//           BlocProvider<UserBloc>(
//             create: (context) => userBlockMock,
//           ),
//           BlocProvider<LanguageBloc>(
//             create: (context) => languageBlocMock,
//           ),
//           BlocProvider<EligibilityBloc>(
//             create: (context) => eligibilityBlocMock,
//           ),
//           BlocProvider<SalesOrgBloc>(
//             create: (context) => salesOrgBlocMock,
//           ),
//         ],
//         child: const ProfilePage(),
//       );
//     }

//     testWidgets('should show loading for the first time', (tester) async {
//       final customerLicenseState = [
//         CustomerLicenseState.initial().copyWith(isFetching: true)
//       ];

//       whenListen(
//         customerLicenseBlocMock,
//         Stream.fromIterable(customerLicenseState),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       await tester.pump(const Duration(seconds: 2));
//       expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
//     });
//     testWidgets('should show toast error for the case api fail',
//         (tester) async {
//       final customerLicenseState = [
//         CustomerLicenseState.initial(),
//         CustomerLicenseState.initial().copyWith(
//           failureOrSuccessOption: optionOf(
//             const Left(
//               ApiFailure.other('Fake Error'),
//             ),
//           ),
//         )
//       ];

//       whenListen(
//         customerLicenseBlocMock,
//         Stream.fromIterable(customerLicenseState),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       await tester.pumpAndSettle();
//       expect(find.byType(CustomSnackBar), findsOneWidget);
//     });
//     testWidgets('should the user info', (tester) async {
//       final customerLicenseState = [
//         CustomerLicenseState.initial().copyWith(
//           isFetching: false,
//         ),
//       ];

//       whenListen(
//         customerLicenseBlocMock,
//         Stream.fromIterable(customerLicenseState),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       await tester.pumpAndSettle();
//       expect(find.text('fakeUser'), findsOneWidget);
//     });
//     testWidgets('should the license information list', (tester) async {
//       final customerLicenseState = [
//         CustomerLicenseState.initial().copyWith(
//           isFetching: false,
//           canLoadMore: true,
//           failureOrSuccessOption: optionOf(
//             Right(customerLicensesListMock),
//           ),
//           customerLicenses: customerLicensesListMock,
//         ),
//       ];

//       whenListen(
//         customerLicenseBlocMock,
//         Stream.fromIterable(customerLicenseState),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       expect(find.textContaining('License information'), findsOneWidget);
//     });
//     testWidgets('should add fetch data again when refresh', (tester) async {
//       final customerLicenseBloc = locator<CustomerLicenseBloc>();
//       final customerLicenseState = [
//         CustomerLicenseState.initial(),
//         CustomerLicenseState.initial().copyWith(
//           isFetching: false,
//           canLoadMore: true,
//           failureOrSuccessOption: optionOf(
//             Right(customerLicensesListMock),
//           ),
//           customerLicenses: customerLicensesListMock,
//         ),
//       ];

//       whenListen(
//         customerLicenseBlocMock,
//         Stream.fromIterable(customerLicenseState),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       await tester.fling(
//         find.textContaining('License information'),
//         const Offset(0.0, 300.0),
//         1000.0,
//       );
//       await tester.pumpAndSettle();
//       verify(
//         () => customerLicenseBloc.add(
//           CustomerLicenseEvent.fetch(
//             salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
//             customerInfo: eligibilityBlocMock.state.customerCodeInfo,
//             user: eligibilityBlocMock.state.user,
//           ),
//         ),
//       ).called(1);
//     });
//     testWidgets('should add load more data  when load more', (tester) async {
//       final customerLicenseBloc = locator<CustomerLicenseBloc>();
//       when(() => customerLicenseBlocMock.state).thenReturn(
//         CustomerLicenseState.initial().copyWith(
//           isFetching: false,
//           canLoadMore: true,
//           failureOrSuccessOption: optionOf(
//             Right(customerLicensesListMock),
//           ),
//           customerLicenses: [
//             ...customerLicensesListMock,
//             ...customerLicensesListMock,
//             ...customerLicensesListMock
//           ],
//         ),
//       );
//       whenListen(userBlockMock, userStateMock);
//       await tester.pumpWidget(getWidget());
//       await tester.drag(
//         find.byType(CustomScrollView),
//         const Offset(0.0, -10000),
//       );
//       await tester.pumpAndSettle(const Duration(microseconds: 500));
//       verify(
//         () => customerLicenseBloc.add(
//           CustomerLicenseEvent.loadMore(
//             salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
//             customerInfo: eligibilityBlocMock.state.customerCodeInfo,
//             user: eligibilityBlocMock.state.user,
//           ),
//         ),
//       ).called(1);
//     });

//     testWidgets('Language Dropdown test', (tester) async {
//       whenListen(userBlockMock, userStateMock);
//       when(() => languageBlocMock.state).thenReturn(
//         LanguageState.initial().copyWith(
//           languages: [
//             Language(subTag: const Locale('zh')),
//             Language(subTag: const Locale('en'))
//           ],
//           activeLanguage: Language(subTag: const Locale('zh')),
//         ),
//       );
//       await tester.pumpWidget(getWidget());
//       final profilePageLanguageDropdown =
//           find.byKey(WidgetKeys.profilePageLanguageDropdown);
//       expect(profilePageLanguageDropdown, findsOneWidget);
//       await tester.tap(profilePageLanguageDropdown);
//       await tester.pumpAndSettle();
//       final languageZH =
//           find.byKey(Key('language_${const Locale('zh').languageString()}'));
//       expect(languageZH, findsWidgets);
//       final languageEN =
//           find.byKey(Key('language_${const Locale('en').languageString()}'));
//       expect(languageEN, findsWidgets);
//       await tester.tap(languageEN.last, warnIfMissed: false);
//       await tester.pumpAndSettle();
//       verify(
//         () => languageBlocMock.add(
//           LanguageEvent.changeLanguage(
//             Language(
//               subTag: const Locale('en'),
//             ),
//           ),
//         ),
//       ).called(1);
//     });
//   });
}
