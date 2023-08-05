import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/deduction_code/edit_deduction_code_page.dart';
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

class ManageDeductionCodeBlocMock
    extends MockBloc<ManageDeductionCodeEvent, ManageDeductionCodeState>
    implements ManageDeductionCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesDistrictBlocMock
    extends MockBloc<SalesDistrictEvent, SalesDistrictState>
    implements SalesDistrictBloc {}

void main() {
  late ManageDeductionCodeBloc deductionCodeMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late UserBloc userBlocMock;
  late SalesDistrictBloc salesDistrictBlocMock;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      deductionCodeMock = ManageDeductionCodeBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      salesDistrictBlocMock = SalesDistrictBlocMock();
      locator.registerLazySingleton(() => AppRouter());
      autoRouterMock = locator<AppRouter>();
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial(),
      );
      when(() => authBlocMock.state).thenReturn(
        const AuthState.initial(),
      );
      when(() => deductionCodeMock.state).thenReturn(
        ManageDeductionCodeState.initial(),
      );
      when(() => salesDistrictBlocMock.state).thenReturn(
        SalesDistrictState.initial().copyWith(
          salesDistrictList: [
            SalesDistrict.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrictInfo: <SalesDistrictInfo>[
                SalesDistrictInfo.empty().copyWith(
                  id: 1,
                  salesDistrictHeader: StringValue('SG'),
                  salesDistrictLabel: StringValue('SG'),
                ),
              ],
            ),
          ],
        ),
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
    },
  );

  Widget getEditDeductionCodePage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<SalesDistrictBloc>(
          create: (context) => salesDistrictBlocMock,
        ),
        BlocProvider<ManageDeductionCodeBloc>(
          create: (context) => deductionCodeMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
      ],
      child: const EditDeductionCodePage(),
    );
  }

  void verifyAppBarTitleAndScaffoldKey() {
    final appBarTitle = find.text('Edit Deduction Code');
    final scaffold = find.byKey(const Key('editDeductionCode'));
    expect(appBarTitle, findsAtLeastNWidgets(2));
    expect(scaffold, findsOneWidget);
  }

  group(
    'Test Edit Deduction Code  Page => ',
    () {
      testWidgets(
        'Load Deduction Code page',
        (tester) async {
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
        },
      );

      testWidgets(
        'Load Edit Deduction Code page tap on edit button without data',
        (tester) async {
          final expectedStates = [
            ManageDeductionCodeState.initial(),
            ManageDeductionCodeState.initial().copyWith(
              showErrorMessages: true,
            ),
          ];

          whenListen(deductionCodeMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
          final editDeductionCodeButton = find.byKey(
            const Key('editDeductionCodeButton'),
          );
          expect(editDeductionCodeButton, findsOneWidget);
          await tester.tap(editDeductionCodeButton);
          await tester.pump();
          final deductionCodeErrorMsg =
              find.textContaining('Deduction code cannot be empty.');
          expect(deductionCodeErrorMsg, findsOneWidget);
          final amountTypeErrorMsg =
              find.textContaining('Please Select amount type.');
          expect(amountTypeErrorMsg, findsOneWidget);
          final deductionDescriptionErrorMsg =
              find.textContaining('Deduction Description cannot be empty.');
          expect(deductionDescriptionErrorMsg, findsOneWidget);
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.addOrEditDeductionCode(
                isEdit: true,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Edit Deduction Code page tap on edit button orElse validation',
        (tester) async {
          when(() => deductionCodeMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              showErrorMessages: true,
              deductionCodeData: DeductionCode.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrict: StringValue('SG'),
                deductionCode: StringValue('R4'),
                amountType: StringValue('Return'),
                deductionDescription: StringValue('Test'),
              ),
            ),
          );
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
          //saleDistrict
          final salesDistrictDropDownField =
              find.byKey(const Key('salesDistrictDropdownKey'));
          expect(salesDistrictDropDownField.first, findsOneWidget);
          await tester.tap(
            salesDistrictDropDownField.first,
            warnIfMissed: false,
          );
          await tester.pump(const Duration(seconds: 1));
          await tester.tap(find.text('SG').last, warnIfMissed: false);
          await tester.pump(const Duration(seconds: 1));
          //saleDistrict
          //deductionCode
          final textField = find.byKey(const Key('deductionCodeTextKey'));
          expect(textField, findsOneWidget);
          await tester.enterText(textField, 'R');
          await tester.pump();
          //deductionCode
          //amountType
          final amountTypeDropDownField =
              find.byKey(const Key('amountTypeKey'));
          expect(amountTypeDropDownField.first, findsOneWidget);
          await tester.tap(amountTypeDropDownField.first, warnIfMissed: false);
          await tester.pump(const Duration(seconds: 1));
          await tester.tap(find.text('Return').last, warnIfMissed: false);
          await tester.pump(const Duration(seconds: 1));
          //amountType
          //deductionDescription
          final deductionDescriptionTextField =
              find.byKey(const Key('deductionDescriptionKey'));
          expect(deductionDescriptionTextField, findsOneWidget);
          await tester.enterText(deductionDescriptionTextField, 'T');
          await tester.pump();
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.onValueChange(
                label: DeductionCodeLabel.salesDistrict,
                newValue: 'SG',
              ),
            ),
          ).called(1);
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.onValueChange(
                label: DeductionCodeLabel.deductionCode,
                newValue: 'R',
              ),
            ),
          ).called(1);
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.onValueChange(
                label: DeductionCodeLabel.amountType,
                newValue: 'Return',
              ),
            ),
          ).called(1);
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.onValueChange(
                label: DeductionCodeLabel.deductionDescription,
                newValue: 'T',
              ),
            ),
          ).called(1);
          final addDeductionCodeButton = find.byKey(
            const Key('editDeductionCodeButton'),
          );
          expect(addDeductionCodeButton, findsOneWidget);
          await tester.tap(addDeductionCodeButton);
          await tester.pump();
          final deductionCodeErrorMsg =
              find.textContaining('Deduction code cannot be empty.');
          expect(deductionCodeErrorMsg, findsNothing);
          final amountTypeErrorMsg =
              find.textContaining('Please Select amount type.');
          expect(amountTypeErrorMsg, findsNothing);
          final deductionDescriptionErrorMsg =
              find.textContaining('Deduction Description cannot be empty.');
          expect(deductionDescriptionErrorMsg, findsNothing);
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.addOrEditDeductionCode(
                isEdit: true,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Edit Deduction Code and Submit with success',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: true,
                deductionCodeData: DeductionCode.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: StringValue('SG'),
                  amountType: StringValue('Return'),
                  deductionCode: StringValue('R4'),
                  deductionDescription: StringValue('Test'),
                ),
              ),
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: false,
                response: AddDeductionCode.empty().copyWith(
                  success: true,
                  info: '1 data edited.',
                ),
              ),
            ],
          );
          whenListen(deductionCodeMock, expectedState);
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
          final editDeductionCodeButton = find.byKey(
            const Key('editDeductionCodeButton'),
          );
          expect(editDeductionCodeButton, findsOneWidget);
          await tester.tap(editDeductionCodeButton);
          await tester.pump();
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.addOrEditDeductionCode(
                isEdit: true,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Edit Deduction Code and Submit with failure from BE',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: true,
                deductionCodeData: DeductionCode.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: StringValue('SG'),
                  amountType: StringValue('Return'),
                  deductionCode: StringValue('R4'),
                  deductionDescription: StringValue('Test'),
                ),
              ),
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: false,
                response: AddDeductionCode.empty().copyWith(
                  success: false,
                  info: 'Some Error.',
                ),
              ),
            ],
          );
          whenListen(deductionCodeMock, expectedState);
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
          final editDeductionCodeButton = find.byKey(
            const Key('editDeductionCodeButton'),
          );
          expect(editDeductionCodeButton, findsOneWidget);
          await tester.tap(editDeductionCodeButton);
          await tester.pump();
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.addOrEditDeductionCode(
                isEdit: true,
              ),
            ),
          ).called(1);
          final errorMessage = find.byKey(WidgetKeys.customSnackBar);
          expect(errorMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Edit Deduction Code and Submit with failure',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: true,
                deductionCodeData: DeductionCode.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: StringValue('SG'),
                  amountType: StringValue('Return'),
                  deductionCode: StringValue('R4'),
                  deductionDescription: StringValue('Test'),
                ),
              ),
              ManageDeductionCodeState.initial().copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('Some Error'),
                  ),
                ),
              ),
            ],
          );
          whenListen(deductionCodeMock, expectedState);
          await tester.pumpWidget(getEditDeductionCodePage());
          await tester.pump();
          verifyAppBarTitleAndScaffoldKey();
          final editDeductionCodeButton = find.byKey(
            const Key('editDeductionCodeButton'),
          );
          expect(editDeductionCodeButton, findsOneWidget);
          await tester.tap(editDeductionCodeButton);
          await tester.pump();
          verify(
            () => deductionCodeMock.add(
              const ManageDeductionCodeEvent.addOrEditDeductionCode(
                isEdit: true,
              ),
            ),
          ).called(1);
          final errorMessage = find.byKey(WidgetKeys.customSnackBar);
          expect(errorMessage, findsOneWidget);
        },
      );
    },
  );
}
