import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_advice_footer/add_payment_advice_footer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../utils/widget_utils.dart';

class ManagePaymentAdviceFooterBlocMock extends MockBloc<
    ManagePaymentAdviceFooterEvent,
    ManagePaymentAdviceFooterState> implements ManagePaymentAdviceFooterBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesDistrictBlocMock
    extends MockBloc<SalesDistrictEvent, SalesDistrictState>
    implements SalesDistrictBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ManagePaymentAdviceFooterBloc managePaymentAdviceFooterBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesDistrictBloc salesDistrictBlocMock;

  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => managePaymentAdviceFooterBlocMock);
    locator.registerLazySingleton(() => announcementBlocMock);
    locator.registerLazySingleton(() => authBlocMock);
    locator.registerLazySingleton(() => userBlocMock);
    locator.registerLazySingleton(() => salesDistrictBlocMock);
    managePaymentAdviceFooterBlocMock = ManagePaymentAdviceFooterBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    authBlocMock = AuthBlocMock();
    userBlocMock = UserBlocMock();
    salesDistrictBlocMock = SalesDistrictBlocMock();
    autoRouterMock = locator<AppRouter>();
    when(() => managePaymentAdviceFooterBlocMock.state)
        .thenReturn(ManagePaymentAdviceFooterState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesDistrictBlocMock.state)
        .thenReturn(SalesDistrictState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ManagePaymentAdviceFooterBloc>(
          create: (context) => managePaymentAdviceFooterBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
        BlocProvider<SalesDistrictBloc>(
          create: (context) => salesDistrictBlocMock,
        ),
      ],
      child: const Scaffold(
        body: AddPaymentAdviceFooterPage(),
      ),
    );
  }

  group('Add Payment Advice Footer Test', () {
    testWidgets('Show Toast When Submit Failure', (tester) async {
      final expectStates = [
        ManagePaymentAdviceFooterState.initial().copyWith(isSubmitting: true),
        ManagePaymentAdviceFooterState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];
      whenListen(
        managePaymentAdviceFooterBlocMock,
        Stream.fromIterable(expectStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });

    testWidgets('Listen When paymentAdviceFooterData.salesOrg Change',
        (tester) async {
      final fakeSaleDistrict = SalesDistrict.empty().copyWith(
        salesOrg: fakeSGSalesOrg,
        salesDistrictInfo: [SalesDistrictInfo.empty()],
      );
      when(() => salesDistrictBlocMock.state).thenReturn(
        SalesDistrictState.initial().copyWith(
          salesDistrictList: [fakeSaleDistrict],
        ),
      );
      final expectStates = [
        ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
            salesOrg: fakeIDSalesOrg,
          ),
        ),
        ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
            salesOrg: fakeSGSalesOrg,
          ),
        ),
      ];
      whenListen(
        managePaymentAdviceFooterBlocMock,
        Stream.fromIterable(expectStates),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      verify(
        () => managePaymentAdviceFooterBlocMock.add(
          ManagePaymentAdviceFooterEvent.salesDistrictOnChange(
            salesDistrictInfo: fakeSaleDistrict.salesDistrictInfo.first,
          ),
        ),
      ).called(1);
    });

    testWidgets(
      'Sale Org Selection',
      (tester) async {
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith.user(
            userSalesOrganisations: [
              fakeIDSalesOrganisation,
              fakeSGSalesOrganisation,
            ],
          ),
        );
        when(() => managePaymentAdviceFooterBlocMock.state).thenReturn(
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              salesOrg: fakeIDSalesOrg,
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final selectionFinder = find.byKey(
          ValueKey(
            'salesOrg${fakeIDSalesOrg.getOrDefaultValue('')}',
          ),
        );
        expect(selectionFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Header Section Test',
      (tester) async {
        when(() => managePaymentAdviceFooterBlocMock.state).thenReturn(
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              headerTextActive: true,
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final platformSwitchFinder = find.byType(
          PlatformSwitch,
        );
        expect(platformSwitchFinder, findsOneWidget);
        await tester.tap(platformSwitchFinder);
        verify(
          () => managePaymentAdviceFooterBlocMock.add(
            const ManagePaymentAdviceFooterEvent.headerTextToggle(false),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Upload File Section When File Empty Test',
      (tester) async {
        when(() => managePaymentAdviceFooterBlocMock.state).thenReturn(
          ManagePaymentAdviceFooterState.initial().copyWith(
            showErrorMessages: true,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(find.text('File Cannot be empty'.tr()), findsOneWidget);
        await tester.tap(find.text('Click to Upload'.tr()));
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.addPaymentAdviceUploadDialog),
          findsOneWidget,
        );
        await tester
            .tap(find.byKey(WidgetKeys.addPaymentAdvicePhotoUploadButton));
        verify(
          () => managePaymentAdviceFooterBlocMock.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.gallery,
            ),
          ),
        );
        await tester
            .tap(find.byKey(WidgetKeys.addPaymentAdviceFileUploadButton));
        verify(
          () => managePaymentAdviceFooterBlocMock.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
        );
      },
    );

    testWidgets(
      'Upload File Section When File Not Empty Test',
      (tester) async {
        when(() => managePaymentAdviceFooterBlocMock.state).thenReturn(
          ManagePaymentAdviceFooterState.initial().copyWith(
            showErrorMessages: true,
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                logoLocalFile: [
                  PlatformFile(
                    name: 'fake-name',
                    size: 10,
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final deleteButton = find.byIcon(Icons.delete_outline_outlined);
        expect(deleteButton, findsOneWidget);
        await tester.tap(deleteButton);
        verify(
          () => managePaymentAdviceFooterBlocMock.add(
            const ManagePaymentAdviceFooterEvent.removePickedFile(),
          ),
        ).called(1);
      },
    );
  });
}
