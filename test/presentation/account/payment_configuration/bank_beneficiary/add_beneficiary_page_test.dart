import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/add_beneficiary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class ManageBankBeneficiaryBlocMock
    extends MockBloc<ManageBankBeneficiaryEvent, ManageBankBeneficiaryState>
    implements ManageBankBeneficiaryBloc {}

void main() {
  late ManageBankBeneficiaryBloc manageBankBeneficiaryBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    manageBankBeneficiaryBlocMock = ManageBankBeneficiaryBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    authBlocMock = AuthBlocMock();
    userBlocMock = UserBlocMock();
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();

    when(() => announcementBlocMock.state).thenReturn(
      AnnouncementState.initial(),
    );
    when(() => authBlocMock.state).thenReturn(
      const AuthState.initial(),
    );
    when(() => userBlocMock.state).thenReturn(
      UserState.initial().copyWith(
        user: User.empty().copyWith(
          userSalesOrganisations: [
            SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2900'),
            ),
            SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ],
        ),
      ),
    );
    when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
      ManageBankBeneficiaryState.initial(),
    );
  });

  Widget getAddBeneficiaryPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<ManageBankBeneficiaryBloc>(
          create: (context) => manageBankBeneficiaryBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
      ],
      child: const AddBeneficiaryPage(),
    );
  }

  void verifyAppBarTitleAndScaffoldKey() {
    final appBarTitle = find.text('Add Beneficiary');
    final scaffold = find.byKey(const Key('addBeneficiary'));
    expect(appBarTitle, findsOneWidget);
    expect(scaffold, findsOneWidget);
  }

  group('Test Add Beneficiary', () {
    testWidgets(
      'Load Add Beneficiary Code page',
      (tester) async {
        await tester.pumpWidget(getAddBeneficiaryPage());
        await tester.pump();
        verifyAppBarTitleAndScaffoldKey();
      },
    );

    testWidgets(
      'Load Add Beneficiary page tap on Add button without any input',
      (tester) async {
        final expectedStates = [
          ManageBankBeneficiaryState.initial(),
          ManageBankBeneficiaryState.initial().copyWith(
            showErrorMessages: true,
          ),
        ];

        whenListen(
            manageBankBeneficiaryBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getAddBeneficiaryPage());
        await tester.pump();
        verifyAppBarTitleAndScaffoldKey();
        final addBeneficiaryButton =
            find.byKey(const Key('addBeneficiaryButton'), skipOffstage: false);
        expect(addBeneficiaryButton, findsOneWidget);
        await tester.tap(addBeneficiaryButton);
        await tester.pump();
        final salesOrgErrorMsg =
            find.textContaining('Please Select Sales Org.');
        expect(salesOrgErrorMsg, findsOneWidget);
      },
    );

    //******************* Need To ReVisit This Case ************************/
    testWidgets(
      'Load Add Beneficiary tap on Submit orElse validation',
      (tester) async {
        when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
          ManageBankBeneficiaryState.initial().copyWith(
              salesDistrict: [
                SalesDistrict.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrictInfo: [
                    SalesDistrictInfo.empty().copyWith(
                      salesDistrictHeader: StringValue('Singapore'),
                      salesDistrictLabel: StringValue('SG')
                    )
                  ]
                )
              ],
              beneficiaryData: BankBeneficiary.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: 'Singapore',
                  beneficiaryName: StringValue('TestName'),
                  bankName: StringValue('TestBank'),
                  branch: 'TestBranch',
                  bankCode: 'TestCode',
                  bankAccount: StringValue('123456789'),
                  hdbcSwiftCode: 'TestSwiftCode',
                  bankAddress: 'TestBankAddress',
                  payNowUen: 'PayNowTest',
                  emailId: EmailAddress.optional('abc@hotmail.com'),
              )
          ),
        );
        await tester.pumpWidget(getAddBeneficiaryPage());
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        verifyAppBarTitleAndScaffoldKey();
        //sales Org
        final salesOrgDropDownField =
            find.byKey(const Key('salesOrgDropdownKey'));
        expect(salesOrgDropDownField.first, findsOneWidget);
        await tester.tap(salesOrgDropDownField.first, warnIfMissed: false);
        await tester.pump(const Duration(seconds: 2));
        await tester.tap(find.text('2601 - ZPSG').last, warnIfMissed: false);
        await tester.pump(const Duration(seconds: 1));
        //sales Org

        //saleDistrict
        final salesDistrictDropDownField =
            find.byKey(const Key('salesDistrictDropdownKey'));
        expect(salesDistrictDropDownField.first, findsOneWidget);
        await tester.tap(salesDistrictDropDownField.first, warnIfMissed: false);
        await tester.pump(const Duration(seconds: 1));
        await tester.tap(find.text('SG').last, warnIfMissed: false);
        await tester.pump(const Duration(seconds: 1));
        //saleDistrict

        //beneficiaryNameField
          final beneficiaryNameField = find.byKey(const Key('beneficiaryNameField'));
          expect(beneficiaryNameField, findsOneWidget);
          await tester.enterText(beneficiaryNameField, 'TestName');
          await tester.pump();
        //beneficiaryNameField

        //bankNameField
          final bankNameField = find.byKey(const Key('bankNameField'));
          expect(bankNameField, findsOneWidget);
          await tester.enterText(bankNameField, 'TestBank');
          await tester.pump();
        //bankNameField

        //branchField
          final branchField = find.byKey(const Key('branchField'));
          expect(branchField, findsOneWidget);
          await tester.enterText(branchField, 'TestBranch');
          await tester.pump();
        //branchField
        await tester.drag(
          branchField,
          const Offset(0.0, -1000.0),
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));
        //bankCodeField
          final bankCodeField = find.byKey(const Key('bankCodeField'));
          expect(bankCodeField, findsOneWidget);
          await tester.enterText(bankCodeField, 'TestCode');
          await tester.pump();
        //bankCodeField

        //bankAccountField
          final bankAccountField = find.byKey(const Key('bankAccountField'));
          expect(bankAccountField, findsOneWidget);
          await tester.enterText(bankAccountField, '123456789');
          await tester.pump();
        //bankAccountField

        //hdbcSwiftCodeField
          final hdbcSwiftCodeField = find.byKey(const Key('hdbcSwiftCodeField'));
          expect(hdbcSwiftCodeField, findsOneWidget);
          await tester.enterText(hdbcSwiftCodeField, 'TestSwiftCode');
          await tester.pump();
        //hdbcSwiftCodeField

        //bankAddressField
          final bankAddressField = find.byKey(const Key('bankAddressField'));
          expect(bankAddressField, findsOneWidget);
          await tester.enterText(bankAddressField, 'TestBankAddress');
          await tester.pump();
        //bankAddressField

        //payNowUenField
          final payNowUenField = find.byKey(const Key('payNowUenField'));
          expect(payNowUenField, findsOneWidget);
          await tester.enterText(payNowUenField, 'PayNowTest');
          await tester.pump();
        //payNowUenField

        //emailIdField
          final emailIdField = find.byKey(const Key('emailIdField'));
          expect(emailIdField, findsOneWidget);
          await tester.enterText(emailIdField, 'abc@hotmail.com');
          await tester.pump();
        //emailIdField


        verify(() =>
          manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.selectSalesOrg,
              newValue: '2601',
            ),
          )
        ).called(1);
        verify(() =>
          manageBankBeneficiaryBlocMock.add(
            ManageBankBeneficiaryEvent.fetchSalesDistrict(
              salesOrg: SalesOrg('2601'),
              fromAdd: true,
            ),
          )
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.selectSalesDistrict,
              newValue: 'Singapore',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.beneficiaryName,
              newValue: 'TestName',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.bankName,
              newValue: 'TestBank',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.branch,
              newValue: 'TestBranch',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.bankCode,
              newValue: 'TestCode',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.bankAccount,
              newValue: '123456789',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.hdbcSwiftCode,
              newValue: 'TestSwiftCode',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.bankAddress,
              newValue: 'TestBankAddress',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.payNowUen,
              newValue: 'PayNowTest',
            ),
          ),
        ).called(1);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.onValueChange(
              label: BeneficiaryLabel.emailId,
              newValue: 'abc@hotmail.com',
            ),
          ),
        ).called(1);

         final addBeneficiaryButton = find.byKey(
          const Key('addBeneficiaryButton'),
        );
        expect(addBeneficiaryButton, findsOneWidget);
        await tester.tap(addBeneficiaryButton);
        await tester.pump();
        final salesOrgErrorMsg =
            find.textContaining('Please Select Sales Org.');
        expect(salesOrgErrorMsg, findsNothing);
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
              isEdit: false,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Load Add beneficiary Code and Submit with success',
      (tester) async {
        final expectedState = Stream.fromIterable(
          [
            ManageBankBeneficiaryState.initial().copyWith(
                isSubmitting: true,
                beneficiaryData: BankBeneficiary.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: 'SG',
                  beneficiaryName: StringValue('TestName'),
                  bankAccount: StringValue('123456789'),
                  bankName: StringValue('TestBank'),
                  branch: 'TestBranch',
                  bankCode: 'TestCode',
                  hdbcSwiftCode: 'TestSwiftCode',
                  bankAddress: 'TestBankAddress',
                  payNowUen: 'PayNowTest',
                  emailId: EmailAddress.optional(''),
                )),
            ManageBankBeneficiaryState.initial().copyWith(
              isSubmitting: false,
              response: BankBeneficiaryResponse.empty().copyWith(
                info: '1 data added.',
              ),
            ),
          ],
        );
        whenListen(manageBankBeneficiaryBlocMock, expectedState);
        await tester.pumpWidget(getAddBeneficiaryPage());
        await tester.pump();
        verifyAppBarTitleAndScaffoldKey();
        final card = find.byKey(const Key('beneficiaryNameField'));
        expect(card, findsOneWidget);
        await tester.drag(
          card,
          const Offset(0.0, -1000.0),
        );
        await tester.pump(const Duration(seconds: 1));
        final addBeneficiaryButton = find.byKey(
          const Key('addBeneficiaryButton'),
        );
        expect(addBeneficiaryButton, findsOneWidget);
        await tester.tap(addBeneficiaryButton);
        await tester.pump();
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
              isEdit: false,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Load Add beneficiary and Submit with failure',
      (tester) async {
        final expectedState = Stream.fromIterable(
          [
            ManageBankBeneficiaryState.initial().copyWith(
                isSubmitting: true,
                beneficiaryData: BankBeneficiary.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: 'SG',
                  beneficiaryName: StringValue('TestName'),
                  bankAccount: StringValue('123456789'),
                  bankName: StringValue('TestBank'),
                  branch: 'TestBranch',
                  bankCode: 'TestCode',
                  hdbcSwiftCode: 'TestSwiftCode',
                  bankAddress: 'TestBankAddress',
                  payNowUen: 'PayNowTest',
                  emailId: EmailAddress.optional(''),
                )),
            ManageBankBeneficiaryState.initial().copyWith(
                isSubmitting: false,
                failureOrSuccessOption:
                    optionOf(const Left(ApiFailure.other('Some Error')))),
          ],
        );
        whenListen(manageBankBeneficiaryBlocMock, expectedState);
        await tester.pumpWidget(getAddBeneficiaryPage());
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        verifyAppBarTitleAndScaffoldKey();
        final card = find.byKey(const Key('branchField'));
        expect(card, findsOneWidget);
        await tester.drag(
          card,
          const Offset(0.0, -1000.0),
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));
        final addBeneficiaryButton = find.byKey(
          const Key('addBeneficiaryButton'),
        );
        expect(addBeneficiaryButton, findsOneWidget);
        await tester.tap(addBeneficiaryButton);
        await tester.pump();
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
              isEdit: false,
            ),
          ),
        ).called(1);
        final errorMessage = find.byKey(const Key('snackBarMessage'));
        expect(errorMessage, findsOneWidget);
      },
    );
  });
}
