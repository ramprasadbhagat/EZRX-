import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/edit_beneficiary_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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

class ManageBankBeneficiaryBlocMock
    extends MockBloc<ManageBankBeneficiaryEvent, ManageBankBeneficiaryState>
    implements ManageBankBeneficiaryBloc {}

void main() {
  late ManageBankBeneficiaryBloc manageBankBeneficiaryBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    manageBankBeneficiaryBlocMock = ManageBankBeneficiaryBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    authBlocMock = AuthBlocMock();
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();

    when(() => announcementBlocMock.state).thenReturn(
      AnnouncementState.initial(),
    );
    when(() => authBlocMock.state).thenReturn(
      const AuthState.initial(),
    );

    when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
      ManageBankBeneficiaryState.initial(),
    );
  });

  Widget getEditBeneficiaryPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
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
      child: const EditBeneficiaryPage(),
    );
  }

  void verifyAppBarTitleAndScaffoldKey() {
    final appBarTitle = find.text('Edit Bank Beneficiary');
    final scaffold = find.byKey(const Key('editBeneficiary'));
    expect(appBarTitle, findsOneWidget);
    expect(scaffold, findsOneWidget);
  }

  group('Test Edit Beneficiary', () {
    testWidgets(
      'Load Edit Beneficiary page',
      (tester) async {
        await tester.pumpWidget(getEditBeneficiaryPage());
        await tester.pump();
        verifyAppBarTitleAndScaffoldKey();
      },
    );

    testWidgets(
      'Load Edit Beneficiary page tap on Edit button without any change',
      (tester) async {
        final expectedStates = [
          ManageBankBeneficiaryState.initial(),
          ManageBankBeneficiaryState.initial().copyWith(
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
            ),
          ),
        ];

        whenListen(
          manageBankBeneficiaryBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getEditBeneficiaryPage());
        await tester.pump();
        verifyAppBarTitleAndScaffoldKey();
        final card = find.byKey(const Key('editBeneficiaryNameField'));
        expect(card, findsOneWidget);
        await tester.drag(
          card,
          const Offset(0.0, -1000.0),
        );
        await tester.pump(const Duration(seconds: 1));
        final addBeneficiaryButton =
            find.byKey(const Key('editBeneficiaryButton'), skipOffstage: false);
        expect(addBeneficiaryButton, findsOneWidget);
        await tester.tap(addBeneficiaryButton);
        await tester.pump();
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
              isEdit: true,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets(
      'Load Edit Beneficiary tap on Edit Button orElse validation',
      (tester) async {
        when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
          ManageBankBeneficiaryState.initial().copyWith(
            salesDistrict: [
              SalesDistrict.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrictInfo: [
                  SalesDistrictInfo.empty().copyWith(
                    salesDistrictHeader: StringValue('Singapore'),
                    salesDistrictLabel: StringValue('SG'),
                  )
                ],
              )
            ],
            beneficiaryData: BankBeneficiary.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: 'Singapore',
              beneficiaryName: StringValue('Name'),
              bankName: StringValue('Bank'),
              branch: 'Branch',
              bankCode: 'Code',
              bankAccount: StringValue('987654321'),
              hdbcSwiftCode: 'SwiftCode',
              bankAddress: 'BankAddress',
              payNowUen: 'PayNow',
              emailId: EmailAddress.optional('SG@hotmail.com'),
            ),
          ),
        );
        await tester.pumpWidget(getEditBeneficiaryPage());
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        verifyAppBarTitleAndScaffoldKey();
        //sales Org
        final salesOrgDropDownField =
            find.byKey(const Key('salesOrgDropdownKey'));
        expect(salesOrgDropDownField.first, findsOneWidget);
        //sales Org

        //saleDistrict
        final salesDistrictDropDownField =
            find.byKey(const Key('salesDistrictDropdownKey'));
        expect(salesDistrictDropDownField.first, findsOneWidget);
        //saleDistrict

        //beneficiaryNameField
        final beneficiaryNameField =
            find.byKey(const Key('editBeneficiaryNameField'));
        expect(beneficiaryNameField, findsOneWidget);
        await tester.enterText(beneficiaryNameField, 'TestName');
        await tester.pump();
        //beneficiaryNameField

        //bankNameField
        final bankNameField = find.byKey(const Key('editBankNameField'));
        expect(bankNameField, findsOneWidget);
        await tester.enterText(bankNameField, 'TestBank');
        await tester.pump();
        //bankNameField

        //branchField
        final branchField = find.byKey(const Key('editBranchField'));
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
        final bankCodeField = find.byKey(const Key('editBankCodeField'));
        expect(bankCodeField, findsOneWidget);
        await tester.enterText(bankCodeField, 'TestCode');
        await tester.pump();
        //bankCodeField

        //bankAccountField
        final bankAccountField = find.byKey(const Key('editBankAccountField'));
        expect(bankAccountField, findsOneWidget);
        await tester.enterText(bankAccountField, '123456789');
        await tester.pump();
        //bankAccountField

        //hdbcSwiftCodeField
        final hdbcSwiftCodeField =
            find.byKey(const Key('editHdbcSwiftCodeField'));
        expect(hdbcSwiftCodeField, findsOneWidget);
        await tester.enterText(hdbcSwiftCodeField, 'TestSwiftCode');
        await tester.pump();
        //hdbcSwiftCodeField

        //bankAddressField
        final bankAddressField = find.byKey(const Key('editBankAddressField'));
        expect(bankAddressField, findsOneWidget);
        await tester.enterText(bankAddressField, 'TestBankAddress');
        await tester.pump();
        //bankAddressField

        //payNowUenField
        final payNowUenField = find.byKey(const Key('editPayNowUenField'));
        expect(payNowUenField, findsOneWidget);
        await tester.enterText(payNowUenField, 'PayNowTest');
        await tester.pump();
        //payNowUenField

        //emailIdField
        final emailIdField = find.byKey(const Key('editEmailIdField'));
        expect(emailIdField, findsOneWidget);
        await tester.enterText(emailIdField, 'abc@hotmail.com');
        await tester.pump();
        //emailIdField
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

        final editBeneficiaryButton = find.byKey(
          const Key('editBeneficiaryButton'),
        );
        expect(editBeneficiaryButton, findsOneWidget);
        await tester.tap(editBeneficiaryButton);
        await tester.pump();
        verify(
          () => manageBankBeneficiaryBlocMock.add(
            const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
              isEdit: true,
            ),
          ),
        ).called(1);
      },
    );
  });

  testWidgets(
    'Load Edit beneficiary Code and Submit with success',
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
            ),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: false,
            response: BankBeneficiaryResponse.empty().copyWith(
              info: '1 data edited.',
            ),
          ),
        ],
      );
      whenListen(manageBankBeneficiaryBlocMock, expectedState);
      await tester.pumpWidget(getEditBeneficiaryPage());
      await tester.pump();
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      verifyAppBarTitleAndScaffoldKey();
      final card = find.byKey(const Key('editBeneficiaryNameField'));
      expect(card, findsOneWidget);
      await tester.drag(
        card,
        const Offset(0.0, -1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      final editBeneficiaryButton = find.byKey(
        const Key('editBeneficiaryButton'),
      );
      expect(editBeneficiaryButton, findsOneWidget);
      await tester.tap(editBeneficiaryButton);
      await tester.pump();
      verify(
        () => manageBankBeneficiaryBlocMock.add(
          const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
            isEdit: true,
          ),
        ),
      ).called(1);
    },
  );

  testWidgets(
    'Load Edit beneficiary and Submit with failure',
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
            ),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Some Error'))),
          ),
        ],
      );
      whenListen(manageBankBeneficiaryBlocMock, expectedState);
      await tester.pumpWidget(getEditBeneficiaryPage());
      await tester.pump();
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      verifyAppBarTitleAndScaffoldKey();
      final card = find.byKey(const Key('editBeneficiaryNameField'));
      expect(card, findsOneWidget);
      await tester.drag(
        card,
        const Offset(0.0, -1000.0),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));
      final editBeneficiaryButton = find.byKey(
        const Key('editBeneficiaryButton'),
      );
      expect(editBeneficiaryButton, findsOneWidget);
      await tester.tap(editBeneficiaryButton);
      await tester.pump();
      verify(
        () => manageBankBeneficiaryBlocMock.add(
          const ManageBankBeneficiaryEvent.addOrUpdateBeneficiary(
            isEdit: true,
          ),
        ),
      ).called(1);
      final errorMessage = find.byKey(WidgetKeys.customSnackBar);
      expect(errorMessage, findsOneWidget);
    },
  );
}
