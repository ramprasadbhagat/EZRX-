import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/profile_tile_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
  });
  group('Profile tile section Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
          ],
          child: const Material(child: ProfileTile()),
        ),
      );
    }

    testWidgets(
      'Test Profile tile length more than or equal to 1',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              id: 'testId',
              fullName: const FullName(firstName: 'test', lastName: 'test'),
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final findProfileTileKey = find.byKey(WidgetKeys.profileTileSection);
        expect(findProfileTileKey, findsOneWidget);
      },
    );
    testWidgets(
      'Test Profile tile returns empty name',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              id: 'testId',
            ),
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        final findProfileTileKey = find.byKey(WidgetKeys.profileTileSection);
        expect(findProfileTileKey, findsOneWidget);
      },
    );
    testWidgets(
      'Test Profile Name',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            user: fakeUserWithName,
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final findProfileName = find.text(
          '${'Hello'.tr()}, ${const FullName(firstName: 'test', lastName: 'test').toTitleCase}',
        );
        expect(findProfileName, findsOneWidget);
      },
    );
    testWidgets(
      'Test Profile Name subtitle section',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );
        final expectedStates = [
          UserState.initial().copyWith(
            user: fakeUserWithName,
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final findProfileName = find.text(
          '${'Hello'.tr()}, ${const FullName(firstName: 'test', lastName: 'test').toTitleCase}',
        );
        expect(findProfileName, findsOneWidget);
        final profileTileSectionCustomerInformation =
            find.byKey(WidgetKeys.profileTileSectionCustomerInformation);
        expect(profileTileSectionCustomerInformation, findsOneWidget);
      },
    );
    testWidgets(
      'Test Error section',
      (tester) async {
        final expectedStates = [
          UserState.initial().copyWith(
            userFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake_error'))),
            user: fakeUserWithName,
          ),
        ];
        whenListen(userBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final findProfileName = find.text(
          '${'Hello'.tr()}, ${const FullName(firstName: 'test', lastName: 'test').toTitleCase}',
        );
        expect(findProfileName, findsOneWidget);
      },
    );
  });
}
