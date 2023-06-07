import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/bank_beneficiary_page.dart';
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
  late AnnouncementBloc announcementBlocMock;
  late ManageBankBeneficiaryBloc manageBankBeneficiaryBlocMock;
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late List<BankBeneficiary> bankBeneficiaryList;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      manageBankBeneficiaryBlocMock = ManageBankBeneficiaryBlocMock();
      bankBeneficiaryList =
          await BankBeneficiaryLocalDataSource().getBankBeneficiaries();
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
    },
  );

  Widget getBankBeneficiaryPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
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
      child: const BankBeneficiaryPage(),
    );
  }

  group(
    'Test Bank Beneficiary Test =>',
    () {
      testWidgets(
        'Load Bank Beneficiary with no data', 
        (tester) async {
        await tester.pumpWidget(getBankBeneficiaryPage());
        await tester.pump();
        final appBarTitle = find.text('Bank Beneficiary Management');
        final noDataError = find.text('No Beneficiary found');
        expect(appBarTitle, findsOneWidget);
        expect(noDataError, findsOneWidget);
      });

      testWidgets(
        'Load Bank Beneficiary with data loading',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              isFetching: true,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final loaderImage = find.byKey(const Key('loaderImage'));
          expect(appBarTitle, findsOneWidget);
          expect(loaderImage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Bank Beneficiary with data',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Bank Beneficiary with initially loading and then data shown',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageBankBeneficiaryState.initial().copyWith(isFetching: true),
              ManageBankBeneficiaryState.initial().copyWith(
                isFetching: false,
                beneficiaryList: bankBeneficiaryList,
              ),
            ],
          );
          whenListen(manageBankBeneficiaryBlocMock, expectedState);
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Bank Beneficiary with data loaded then onRefresh',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          final handle = tester.ensureSemantics();
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final card = find.byKey(const Key('bankBeneficiary0'));
          expect(card, findsOneWidget);

          await tester.drag(
            card,
            const Offset(0.0, 1000.0),
          );
          await tester.pump(const Duration(seconds: 1));

          expect(
            tester.getSemantics(find.byType(RefreshProgressIndicator)),
            matchesSemantics(
              label: 'Refresh',
            ),
          );

          await tester
              .pump(const Duration(seconds: 1)); // finish the scroll animation
          await tester.pump(const Duration(
              seconds: 1)); // finish the indicator settle animation
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => manageBankBeneficiaryBlocMock.add(
              const ManageBankBeneficiaryEvent.fetch(),
            ),
          ).called(1);
          handle.dispose();
        },
      );

      testWidgets(
        'Load Bank Beneficiary and scroll the list',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final card = find.byKey(const Key('bankBeneficiary0'));
          expect(card, findsOneWidget);
          await tester.drag(
            card,
            const Offset(0.0, -2000.0),
          );
          await tester.pump(const Duration(seconds: 1));
          final lastDeductionCode = find.byKey(const Key('bankBeneficiary17'));
          expect(lastDeductionCode, findsOneWidget);
        },
      );

      testWidgets(
        'Load Bank Beneficiary and delete by icon',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('bankBeneficiary0'));
          expect(item, findsOneWidget);
          final deleteIcon = find.byKey(const Key('deleteKey0'));
          expect(deleteIcon, findsOneWidget);
          await tester.tap(deleteIcon);
          await tester.pump();
          final deleteDialog = find.byKey(
            const ValueKey('confirmDialog'),
          );
          expect(deleteDialog, findsOneWidget);
          final deleteButton = find.byKey(const Key('Delete'));
          expect(deleteButton, findsOneWidget);
          await tester.tap(deleteButton);
          await tester.pump();
          verify(
            () => manageBankBeneficiaryBlocMock.add(
              ManageBankBeneficiaryEvent.deleteBeneficiary(
                beneficiary: bankBeneficiaryList.first
              ),
            ),
          ).called(1);
        },
      );
      
      testWidgets(
        'Load Bank Beneficiary add button clicked',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final addBeneficiaryKey =
              find.byKey(const Key('addBeneficiaryKey'));
          expect(addBeneficiaryKey, findsOneWidget);
          await tester.tap(addBeneficiaryKey);
          await tester.pump();
          expect(
            autoRouterMock.current.name == 'AddBeneficiaryPageRoute',
            true,
          );
        },
      );

       testWidgets(
        'Load Bank Beneficiary add tap tile',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final paymentMethodTileKey = find.byKey(const Key('bankBeneficiary0'));
          expect(paymentMethodTileKey, findsOneWidget);
          await tester.tap(paymentMethodTileKey);
          await tester.pump();

          expect(
            autoRouterMock.current.name == 'EditBeneficiaryPageRoute',
            true,
          );
        },
      );

      testWidgets(
        'Load Bank Beneficiary and delete by sliding',
        (tester) async {
          when(() => manageBankBeneficiaryBlocMock.state).thenReturn(
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryList: bankBeneficiaryList,
            ),
          );
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('bankBeneficiary0'));
          expect(item, findsOneWidget);

          await tester.drag(
              find.byKey(const Key('bankBeneficiary0')), const Offset(-300, 0.0));
          await tester.pump();
          final deleteIcon = find.byIcon(Icons.delete_outline);
          expect(deleteIcon, findsOneWidget);
          await tester.tap(deleteIcon);
          await tester.pump();
          verify(
            () => manageBankBeneficiaryBlocMock.add(
              ManageBankBeneficiaryEvent.deleteBeneficiary(
                beneficiary: bankBeneficiaryList.first
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Bank Beneficiary list change',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [],
              ),
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [bankBeneficiaryList.first],
              ),
            ],
          );
          whenListen(manageBankBeneficiaryBlocMock, expectedState);
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Bank Beneficiary listen the listener with error',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [],
                isSubmitting: true,
              ),
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [],
                isSubmitting: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('Some Error.'),
                  ),
                ),
              ),
            ],
          );
          whenListen(manageBankBeneficiaryBlocMock, expectedState);
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsOneWidget);
          final errorMessage = find.byKey(const Key('snackBarMessage'));
          expect(errorMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Deduction code listen the listener with success',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [],
                isSubmitting: true,
              ),
              ManageBankBeneficiaryState.initial().copyWith(
                beneficiaryList: [bankBeneficiaryList.first],
                isSubmitting: false,
                response: BankBeneficiaryResponse.empty().copyWith(
                  info: '1 Data Added.',
                ),
              ),
            ],
          );
          whenListen(manageBankBeneficiaryBlocMock, expectedState);
          await tester.pumpWidget(getBankBeneficiaryPage());
          await tester.pump();
          final appBarTitle = find.text('Bank Beneficiary Management');
          final noDataError = find.text('No Beneficiary found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final errorMessage = find.byKey(const Key('snackBarMessage'));
          expect(errorMessage, findsOneWidget);
        },
      );
    },
  );
}

