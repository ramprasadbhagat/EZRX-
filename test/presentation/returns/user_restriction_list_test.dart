import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/user_restriction_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserRestrictionListBlocMock
    extends MockBloc<UserRestrictionListEvent, UserRestrictionListState>
    implements UserRestrictionListBloc {}

class UserRestrictionDetailsBlocMock
    extends MockBloc<UserRestrictionDetailsEvent, UserRestrictionDetailsState>
    implements UserRestrictionDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late String mockSearchKey;
  late SalesOrg mockSalesOrg;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  late UserRestrictionDetailsBloc userRestrictiondetailsBlocMock;
  late List<String> mockUserNamesList;
  late UserRestrictionListBloc userRestrictionListBlocMock;
  late AuthBloc authBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    setupLocator();

    mockSearchKey = 'Person';
    mockSalesOrg = SalesOrg('2601');
    salesOrgBlocMock = SalesOrgBlocMock();
    userRestrictiondetailsBlocMock = UserRestrictionDetailsBlocMock();
    autoRouterMock = locator<AppRouter>();
    eligibilityBlocMock = EligibilityBlockMock();
    userRestrictionListBlocMock = UserRestrictionListBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    mockUserNamesList = [
      'mockUser',
      'mockPerson',
      'mockAgedPerson',
      'mockYoungPerson',
    ];
    when(() => userRestrictiondetailsBlocMock.state)
        .thenReturn(UserRestrictionDetailsState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getScopedWidget(Widget child) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<UserRestrictionListBloc>(
          create: (context) => userRestrictionListBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
        BlocProvider<UserRestrictionDetailsBloc>(
          create: (context) => userRestrictiondetailsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
      ],
      child: child,
    );
  }

  group('User Restriction List Page Test', () {
    testWidgets('Loading', (tester) async {
      final expectedState = [
        UserRestrictionListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
      ];

      whenListen(
        userRestrictionListBlocMock,
        Stream.fromIterable(expectedState),
        initialState: UserRestrictionListState.initial(),
      );

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));
      await tester.pump();

      final loader = find.byKey(const Key('LoaderImage'));
      expect(loader, findsOneWidget);
    });

    testWidgets('Failed to load', (tester) async {
      final expectedState = [
        UserRestrictionListState.initial().copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-error'))),
        )
      ];

      when(() => userRestrictionListBlocMock.state)
          .thenReturn(UserRestrictionListState.initial());
      whenListen(
        userRestrictionListBlocMock,
        Stream.fromIterable(expectedState),
      );

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));
      await tester.pump();

      final snackBar = find.byKey(WidgetKeys.customSnackBar);
      expect(snackBar, findsOneWidget);
    });

    testWidgets('Load successfully', (tester) async {
      final expectedState = [
        UserRestrictionListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        UserRestrictionListState.initial().copyWith(
          usernames: mockUserNamesList,
        ),
      ];

      whenListen(
        userRestrictionListBlocMock,
        Stream.fromIterable(expectedState),
        initialState: UserRestrictionListState.initial(),
      );

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));
      await tester.pump();

      final userRestrictionListPage =
          find.byKey(const Key('UserRestrictionListPage'));
      final userRestrictionListItem =
          find.byKey(Key('userRestrictionTile-${mockUserNamesList[0]}'));

      expect(userRestrictionListPage, findsOneWidget);
      expect(userRestrictionListItem, findsOneWidget);
    });

    testWidgets('Successfully refreshed items', (tester) async {
      when(() => userRestrictionListBlocMock.state).thenReturn(
        UserRestrictionListState.initial().copyWith(
          usernames: mockUserNamesList,
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: mockSalesOrg,
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: mockSalesOrg,
          ),
        ),
      );
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));

      await tester.drag(
        find.byKey(Key('userRestrictionTile-${mockUserNamesList[0]}')),
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
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation

      handle.dispose();

      verify(
        () => userRestrictionListBlocMock.add(
          UserRestrictionListEvent.fetch(salesOrg: mockSalesOrg),
        ),
      ).called(1);
    });

    testWidgets(
      'Load successfully and searched items',
      (tester) async {
        final expectedState = [
          UserRestrictionListState.initial().copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
          UserRestrictionListState.initial().copyWith(
            usernames: mockUserNamesList,
          ),
          UserRestrictionListState.initial().copyWith(
            searchKey: mockSearchKey,
            usernames: mockUserNamesList,
          ),
        ];

        whenListen(
          userRestrictionListBlocMock,
          Stream.fromIterable(expectedState),
          initialState: UserRestrictionListState.initial(),
        );

        await tester
            .pumpWidget(getScopedWidget(const UserRestrictionListPage()));
        await tester.pump();

        final removedWhileSearchingUserRestrictionItem =
            find.byKey(Key('userRestrictionTile-${mockUserNamesList[0]}'));
        final stillPresentWhileSearchingUserRestrictionItem =
            find.byKey(Key('userRestrictionTile-${mockUserNamesList[1]}'));

        expect(removedWhileSearchingUserRestrictionItem, findsNothing);
        expect(stillPresentWhileSearchingUserRestrictionItem, findsOneWidget);
      },
    );

    testWidgets('Clear already searched list', (tester) async {
      final initialState = UserRestrictionListState.initial().copyWith(
        searchKey: mockSearchKey,
        usernames: mockUserNamesList,
      );

      when(() => userRestrictionListBlocMock.state).thenReturn(initialState);

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));
      await tester.pump();

      final removedWhileSearchingUserRestrictionItem =
          find.byKey(Key('userRestrictionTile-${mockUserNamesList[0]}'));

      expect(removedWhileSearchingUserRestrictionItem, findsNothing);

      // final clearSearchButton =
      //     find.byKey(const Key('clearUserRestrictionListSearch'));

      // await tester.tap(clearSearchButton);

      // verify(() => userRestrictionListBlocMock.add(
      //       const UserRestrictionListEvent.updateSearchKey(''),
      //     )).called(1);
    });

    testWidgets('onChanged fired for changing search text', (tester) async {
      when(() => userRestrictionListBlocMock.state).thenReturn(
        UserRestrictionListState.initial().copyWith(
          usernames: mockUserNamesList,
        ),
      );

      await tester.pumpWidget(getScopedWidget(const UserRestrictionListPage()));
      await tester.pump();

      final textField = find.byKey(const Key('userRestrictionListSearchField'));
      await tester.enterText(textField, mockSearchKey);
      await tester.pump(const Duration(milliseconds: 3000));

      verify(
        () => userRestrictionListBlocMock.add(
          UserRestrictionListEvent.updateSearchKey(mockSearchKey),
        ),
      ).called(1);
    });
  });
}
