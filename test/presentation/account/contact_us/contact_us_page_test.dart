import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
// import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
// import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
// import 'package:ezrxmobile/domain/account/entities/role.dart';
// import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
// import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
// import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
// import 'package:ezrxmobile/domain/account/entities/user.dart';
// import 'package:ezrxmobile/domain/account/value/value_objects.dart';
// import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
// import 'package:ezrxmobile/domain/core/error/api_failures.dart';
// import 'package:ezrxmobile/domain/core/value/constants.dart';
// import 'package:ezrxmobile/domain/core/value/value_objects.dart';
// import 'package:ezrxmobile/domain/order/value/value_objects.dart'
//     as order_value_object;
// import 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';
// import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
// import 'package:ezrxmobile/presentation/core/widget_keys.dart';
// import 'package:ezrxmobile/presentation/routes/router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mocktail/mocktail.dart';

// import '../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockContactUsBloc extends MockBloc<ContactUsEvent, ContactUsState>
    implements ContactUsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

final locator = GetIt.instance;

void main() {
  //TODO: that you'll cover in the ticket https://zuelligpharma.atlassian.net/browse/EZRX-15157
  late SalesOrgBloc mockSalesOrgBloc;
  // late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ContactUsBloc mockContactUsBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  // final user = User.empty().copyWith(
  //   username: Username('fake-name'),
  //   role: Role(
  //     description: 'fake-desc',
  //     id: 'id',
  //     name: 'fake-name',
  //     type: RoleType('fake-type'),
  //   ),
  //   preferredLanguage: const Locale(ApiLanguageCode.english),
  // );
  // final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
  //   customerCodeSoldTo: '0030082707',
  // );
  // final salesOrg =
  //     SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001'));
  // final contactUs = ContactUs(
  //   username: Username('fake-name'),
  //   email: EmailAddress('fake-email'),
  //   contactNumber: order_value_object.PhoneNumber('12345678'),
  //   message: StringValue('fake-msg'),
  // );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    // autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockEligibilityBloc = MockEligibilityBloc();
    mockAuthBloc = MockAuthBloc();
    eligibilityBlocMock = EligibilityBlocMock();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockContactUsBloc = MockContactUsBloc();
  });

  group('Contact us Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockEligibilityBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockContactUsBloc.state).thenReturn(ContactUsState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });
    // Widget getScopedWidget() {
    //   return WidgetUtils.getScopedWidget(
    //     autoRouterMock: autoRouterMock,
    //     usingLocalization: true,
    //     providers: [
    //       BlocProvider<AuthBloc>(
    //         create: (context) => mockAuthBloc,
    //       ),
    //       BlocProvider<UserBloc>(create: (context) => mockUserBloc),
    //       BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
    //       BlocProvider<CustomerCodeBloc>(
    //         create: (context) => mockCustomerCodeBloc,
    //       ),
    //       BlocProvider<AnnouncementBloc>(
    //         create: (context) => mockAnnouncementBloc,
    //       ),
    //       BlocProvider<EligibilityBloc>(
    //         create: (context) => eligibilityBlocMock,
    //       ),
    //       BlocProvider<ContactUsBloc>(
    //         create: (context) => mockContactUsBloc,
    //       ),
    //     ],
    //     child: const Scaffold(
    //       body: ContactUsPage(),
    //     ),
    //   );
    // }

    //   testWidgets('Test Contact us', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: true,
    //         salesOrganisation: salesOrg.copyWith(salesOrg: SalesOrg('2500')),
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg.copyWith(salesOrg: SalesOrg('2500')),
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs,
    //         apiFailureOrSuccessOption: optionOf(const Right('')),
    //       ),
    //     );
    //     final expectedState = [
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     ];
    //     whenListen(mockSalesOrgBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();

    //     expect(
    //       find.byType(AnnouncementBanner),
    //       findsOneWidget,
    //     );
    //     final haveAnyQuestionsTextFinder = find.byKey(
    //       const Key('contactDetails'),
    //     );
    //     expect(haveAnyQuestionsTextFinder, findsOneWidget);
    //   });

    //   testWidgets('Test Contact Details', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs,
    //       ),
    //     );

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final haveAnyQuestionsTextFinder =
    //         find.text('Have any questions? we\'d love to hear from you.');
    //     expect(haveAnyQuestionsTextFinder, findsOneWidget);
    //     expect(
    //       find.byKey(WidgetKeys.genericKey(key: 'myezrx@zuelligpharma.com')),
    //       findsOneWidget,
    //     );
    //     expect(
    //       find.byKey(WidgetKeys.genericKey(key: '1800883711')),
    //       findsOneWidget,
    //     );
    //   });

    //   testWidgets('Test Contact Details Email Tap', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs,
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final emailKey =
    //         find.byKey(WidgetKeys.genericKey(key: 'myezrx@zuelligpharma.com'));
    //     expect(
    //       emailKey,
    //       findsOneWidget,
    //     );
    //     await tester.tap(emailKey);
    //   });

    //   testWidgets('Test Contact Details Phone no Tap', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs,
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final phoneNoKey = find.byKey(WidgetKeys.genericKey(key: '1800883711'));
    //     expect(
    //       phoneNoKey,
    //       findsOneWidget,
    //     );
    //     await tester.tap(phoneNoKey);
    //   });
    //   testWidgets('Test ContactNumberTextField when isSubmit is false',
    //       (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           contactNumber: order_value_object.PhoneNumber(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final contactNumberTextFieldKey = find.byKey(WidgetKeys.phoneNumberKey);
    //     expect(contactNumberTextFieldKey, findsOneWidget);
    //     final internationalPhoneNumberInput =
    //         find.byKey(WidgetKeys.internationalPhoneNumberInputKey);

    //     expect(internationalPhoneNumberInput, findsOneWidget);
    //     await tester.enterText(internationalPhoneNumberInput, '6');
    //     await tester.pump();
    //     verify(
    //       () => mockContactUsBloc.add(
    //         const ContactUsEvent.onContactNumberChange(
    //           newValue: '+606',
    //         ),
    //       ),
    //     );
    //     await tester.pump();
    //   });

    //   testWidgets('Test ContactNumberTextField on change', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           contactNumber: order_value_object.PhoneNumber('+606'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final internationalPhoneNumberInput =
    //         find.byKey(WidgetKeys.internationalPhoneNumberInputKey);

    //     expect(internationalPhoneNumberInput, findsOneWidget);
    //     await tester.enterText(internationalPhoneNumberInput, '6');
    //     await tester.enterText(internationalPhoneNumberInput, '');
    //     await tester.pump();
    //     verify(
    //       () => mockContactUsBloc.add(
    //         const ContactUsEvent.onContactNumberChange(
    //           newValue: '',
    //         ),
    //       ),
    //     );
    //     await tester.pump();
    //   });
    //   testWidgets('Test ContactNumberTextField when isSubmit is true',
    //       (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockContactUsBloc.state).thenReturn(
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           contactNumber: order_value_object.PhoneNumber(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final contactNumberTextFieldKey = find.byKey(WidgetKeys.phoneNumberKey);
    //     expect(contactNumberTextFieldKey, findsOneWidget);
    //     final internationalPhoneNumberInput =
    //         find.byType(InternationalPhoneNumberInput);

    //     expect(internationalPhoneNumberInput, findsOneWidget);
    //     await tester.enterText(internationalPhoneNumberInput, '601234');
    //   });

    //   testWidgets('Test Email textfield when email is not empty', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           email: EmailAddress('mdas@zuelligpharma.com'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final emailTextFieldKey = find.byKey(
    //       WidgetKeys.emailKey,
    //     );
    //     expect(emailTextFieldKey, findsOneWidget);
    //   });

    //   testWidgets('Test Email textfield when email is empty', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           email: EmailAddress(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final emailTextFieldKey = find.byKey(
    //       WidgetKeys.emailKey,
    //     );
    //     expect(emailTextFieldKey, findsOneWidget);
    //   });

    //   testWidgets('Test Email textfield on press', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           email: EmailAddress(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final emailTextFieldKey = find.byKey(
    //       WidgetKeys.emailKey,
    //     );
    //     expect(emailTextFieldKey, findsOneWidget);
    //     final emailinputTextField = find.byKey(WidgetKeys.emailKey);

    //     expect(emailinputTextField, findsOneWidget);
    //     await tester.enterText(emailinputTextField, 'm@gmail.com');
    //     await tester.pump();
    //     verify(
    //       () => mockContactUsBloc.add(
    //         const ContactUsEvent.onEmailChange(
    //           newValue: 'm@gmail.com',
    //         ),
    //       ),
    //     ).called(1);
    //   });

    //   testWidgets('Test Message textfield when Message is empty', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           message: StringValue(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final messageinputTextField = find.byKey(
    //       WidgetKeys.contactMessageKey,
    //     );
    //     expect(messageinputTextField, findsOneWidget);
    //   });

    //   testWidgets('Test Message textfield on press', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           message: StringValue('fake_message'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final messageinputTextField = find.byKey(
    //       WidgetKeys.contactMessageKey,
    //     );
    //     expect(messageinputTextField, findsOneWidget);
    //     await tester.enterText(messageinputTextField, 'message');
    //     await tester.pump();
    //     verify(
    //       () => mockContactUsBloc.add(
    //         const ContactUsEvent.onMessageChange(
    //           newValue: 'message',
    //         ),
    //       ),
    //     ).called(1);
    //   });

    //   testWidgets('Test UserName textfield when UserName is empty',
    //       (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           username: Username(''),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final userNameinputTextField = find.byKey(
    //       WidgetKeys.userNameKey,
    //     );
    //     expect(userNameinputTextField, findsOneWidget);
    //   });

    //   testWidgets('Test UserName textfield on press', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         showErrorMessage: true,
    //         contactUs: contactUs.copyWith(
    //           message: StringValue('fake_message'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));

    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     final userNameinputTextField = find.byKey(
    //       WidgetKeys.userNameKey,
    //     );
    //     expect(userNameinputTextField, findsOneWidget);
    //     await tester.enterText(userNameinputTextField, 'userName');
    //     await tester.pump();
    //     verify(
    //       () => mockContactUsBloc.add(
    //         const ContactUsEvent.onUsernameChange(
    //           newValue: 'userName',
    //         ),
    //       ),
    //     ).called(1);
    //   });

    //   testWidgets('Test Customer Snack bar for message received', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockCustomerCodeBloc.state).thenReturn(
    //       CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeInfo: fakeCustomerCode,
    //         shipToInfo: ShipToInfo.empty().copyWith(
    //           shipToName: ShipToName.empty().copyWith(name1: 'fake_name'),
    //         ),
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         responseFlag: true,
    //         contactUs: contactUs.copyWith(
    //           contactNumber: order_value_object.PhoneNumber('1234'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final messageHasBeenReceivedText = find.byKey(
    //       WidgetKeys.messageReceivedKey,
    //     );
    //     expect(messageHasBeenReceivedText, findsOneWidget);
    //   });
    //   testWidgets('Test Customer Snack bar for message not received',
    //       (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockCustomerCodeBloc.state).thenReturn(
    //       CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeInfo: fakeCustomerCode,
    //         shipToInfo: ShipToInfo.empty().copyWith(
    //           shipToName: ShipToName.empty().copyWith(name1: 'fake_name'),
    //         ),
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         responseFlag: false,
    //         contactUs: contactUs.copyWith(
    //           contactNumber: order_value_object.PhoneNumber('1234'),
    //         ),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     final messageHasBeenReceivedText = find.byKey(
    //       WidgetKeys.messageNotReceivedKey,
    //     );
    //     expect(messageHasBeenReceivedText, findsOneWidget);
    //   });

    //   testWidgets('Test Send Message Button', (tester) async {
    //     when(() => mockUserBloc.state).thenReturn(
    //       UserState.initial().copyWith(
    //         user: user,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockCustomerCodeBloc.state).thenReturn(
    //       CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeInfo: fakeCustomerCode,
    //         shipToInfo: ShipToInfo.empty().copyWith(
    //           shipToName: ShipToName.empty().copyWith(name1: 'fake_name'),
    //         ),
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         contactUs: contactUs,
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();

    //   final sendMessageButtonKey = find.byKey(WidgetKeys.sendMessageButtonKey);
    //   await tester.drag(
    //     find.byKey(WidgetKeys.internationalPhoneNumberInputKey),
    //     const Offset(0, -1000),
    //   );
    //   await tester.pump();
    //   expect(sendMessageButtonKey, findsOneWidget);
    //   await tester.tap(
    //     sendMessageButtonKey,
    //   );
    //   await tester.pump();
    //   verify(
    //     () => mockContactUsBloc.add(
    //       ContactUsEvent.submit(
    //         salesOrg: salesOrg.salesOrg,
    //       ),
    //     ),
    //   ).called(1);
    // });

    //   testWidgets('Test Failure', (tester) async {
    //     when(() => mockSalesOrgBloc.state).thenReturn(
    //       SalesOrgState.initial().copyWith(
    //         isLoading: false,
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     when(() => mockCustomerCodeBloc.state).thenReturn(
    //       CustomerCodeState.initial().copyWith(
    //         isFetching: false,
    //         customerCodeInfo: fakeCustomerCode,
    //         shipToInfo: ShipToInfo.empty().copyWith(
    //           shipToName: ShipToName.empty().copyWith(name1: 'fake_name'),
    //         ),
    //       ),
    //     );
    //     final expectedState = [
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: true,
    //         showErrorMessage: false,
    //       ),
    //       ContactUsState.initial().copyWith(
    //         isSubmitting: false,
    //         responseFlag: false,
    //         apiFailureOrSuccessOption:
    //             optionOf(const Left(ApiFailure.other('Fake-Error'))),
    //       ),
    //     ];
    //     whenListen(mockContactUsBloc, Stream.fromIterable(expectedState));
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pumpAndSettle();
    //     expect(
    //       find.byKey(WidgetKeys.customSnackBar),
    //       findsOneWidget,
    //     );
    //   });

    //   testWidgets('Test Support Hour', (tester) async {
    //     when(() => eligibilityBlocMock.state).thenReturn(
    //       EligibilityState.initial().copyWith(
    //         salesOrganisation: salesOrg,
    //       ),
    //     );
    //     await tester.pumpWidget(getScopedWidget());
    //     await tester.pump();
    //     expect(
    //       find.text('Monday to Friday: 8.30am - 5pm'.tr()),
    //       findsOneWidget,
    //     );
    //   });
  });
}
