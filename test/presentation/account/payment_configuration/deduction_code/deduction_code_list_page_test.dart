import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/deduction_code/deduction_code_list_page.dart';
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

void main() {
  late ManageDeductionCodeBloc deductionCodeBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late List<DeductionCode> deductionCodeList;
  late AppRouter autoRouterMock;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      deductionCodeBlocMock = ManageDeductionCodeBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      deductionCodeList =
          await DeductionCodeLocalDataSource().getDeductionCodes();
      locator.registerLazySingleton(() => AppRouter());
      autoRouterMock = locator<AppRouter>();
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial(),
      );
      when(() => authBlocMock.state).thenReturn(
        const AuthState.initial(),
      );
      when(() => deductionCodeBlocMock.state).thenReturn(
        ManageDeductionCodeState.initial(),
      );
    },
  );

  Widget getDeductionCodeListPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ManageDeductionCodeBloc>(
          create: (context) => deductionCodeBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
      ],
      child: const DeductionCodeListPage(),
    );
  }

  void verifyAppBarTitleAndScaffoldKey() {
    final appBarTitle = find.text('Configure Deduction Code');
    final noDataError = find.text('No deduction code found');
    expect(appBarTitle, findsOneWidget);
    expect(noDataError, findsOneWidget);
  }

  group(
    'Test Deduction Code List Page => ',
    () {
      testWidgets(
        'Load Deduction code with no data',
        (tester) async {
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          verifyAppBarTitleAndScaffoldKey();
        },
      );

      testWidgets(
        'Load Deduction code with data loading',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              isFetching: true,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pump();
          final appBarTitle = find.text('Configure Deduction Code');
          final loaderImage = find.byKey(const Key('loaderImage'));
          expect(appBarTitle, findsOneWidget);
          expect(loaderImage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Deduction code with data',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Deduction code with initially loading and then data shown',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(isFetching: true),
              ManageDeductionCodeState.initial().copyWith(
                isFetching: false,
                deductionCodeList: deductionCodeList,
              ),
            ],
          );
          whenListen(deductionCodeBlocMock, expectedState);
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Deduction code with data loaded then onRefresh',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          final handle = tester.ensureSemantics();
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final card = find.byKey(const Key('deductionCode0'));
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
          await tester.pump(
            const Duration(
              seconds: 1,
            ),
          ); // finish the indicator settle animation
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => deductionCodeBlocMock.add(
              const ManageDeductionCodeEvent.fetch(),
            ),
          ).called(1);
          handle.dispose();
        },
      );

      testWidgets(
        'Load Deduction code and scroll the list',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final card = find.byKey(const Key('deductionCode0'));
          expect(card, findsOneWidget);
          await tester.drag(
            card,
            const Offset(0.0, -1000.0),
          );
          await tester.pump(const Duration(seconds: 1));
          final lastDeductionCode = find.byKey(const Key('deductionCode9'));
          expect(lastDeductionCode, findsOneWidget);
        },
      );

      testWidgets(
        'Load Deduction code and delete by icon',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('deductionCode0'));
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
            () => deductionCodeBlocMock.add(
              ManageDeductionCodeEvent.deleteDeductionCode(
                data: DeductionCodeDto.fromDomain(
                  DeductionCode.empty().copyWith(
                    amountType: StringValue('Manual Input'),
                    deductionCode: StringValue('R1'),
                    deductionDescription: StringValue('Returns Upon Delivery'),
                    salesDistrict: StringValue(''),
                    salesOrg: SalesOrg('2500'),
                  ),
                ).toDomain(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Deduction code add button clicked',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final addDeductionCodeKey =
              find.byKey(const Key('addDeductionCodeKey'));
          expect(addDeductionCodeKey, findsOneWidget);
          await tester.tap(addDeductionCodeKey);
          await tester.pump();

          expect(
            autoRouterMock.current.name == 'AddDeductionCodePageRoute',
            true,
          );
        },
      );

      testWidgets(
        'Load Deduction code add tap tile',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final paymentMethodTileKey = find.byKey(const Key('deductionCode0'));
          expect(paymentMethodTileKey, findsOneWidget);
          await tester.tap(paymentMethodTileKey);
          await tester.pump();

          expect(
            autoRouterMock.current.name == 'EditDeductionCodePageRoute',
            true,
          );
        },
      );

      testWidgets(
        'Load Deduction code and delete by sliding',
        (tester) async {
          when(() => deductionCodeBlocMock.state).thenReturn(
            ManageDeductionCodeState.initial().copyWith(
              deductionCodeList: deductionCodeList,
            ),
          );
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('deductionCode0'));
          expect(item, findsOneWidget);

          await tester.drag(
            find.byKey(const Key('deductionCode0')),
            const Offset(-300, 0.0),
          );
          await tester.pump();
          final deleteIcon = find.byIcon(Icons.delete_outline);
          expect(deleteIcon, findsOneWidget);
          await tester.tap(deleteIcon);
          await tester.pump();
          verify(
            () => deductionCodeBlocMock.add(
              ManageDeductionCodeEvent.deleteDeductionCode(
                data: DeductionCodeDto.fromDomain(
                  DeductionCode.empty().copyWith(
                    amountType: StringValue('Manual Input'),
                    deductionCode: StringValue('R1'),
                    deductionDescription: StringValue('Returns Upon Delivery'),
                    salesDistrict: StringValue(''),
                    salesOrg: SalesOrg('2500'),
                  ),
                ).toDomain(),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Deduction code list change',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [],
              ),
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [deductionCodeList.first],
              ),
            ],
          );
          whenListen(deductionCodeBlocMock, expectedState);
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Deduction code listen the listener with error',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [],
                isSubmitting: true,
              ),
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [],
                isSubmitting: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('Some Error.'),
                  ),
                ),
              ),
            ],
          );
          whenListen(deductionCodeBlocMock, expectedState);
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsOneWidget);
          final errorMessage = find.byKey(WidgetKeys.customSnackBar);
          expect(errorMessage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Deduction code listen the listener with success',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [],
                isSubmitting: true,
              ),
              ManageDeductionCodeState.initial().copyWith(
                deductionCodeList: [deductionCodeList.first],
                isSubmitting: false,
                response: AddDeductionCode.empty().copyWith(
                  success: true,
                  info: '1 Data Added.',
                ),
              ),
            ],
          );
          whenListen(deductionCodeBlocMock, expectedState);
          await tester.pumpWidget(getDeductionCodeListPage());
          await tester.pumpAndSettle();
          final appBarTitle = find.text('Configure Deduction Code');
          final noDataError = find.text('No deduction code found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final errorMessage = find.byKey(WidgetKeys.customSnackBar);
          expect(errorMessage, findsOneWidget);
        },
      );
    },
  );
}
