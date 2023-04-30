import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';
import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';

import 'package:ezrxmobile/presentation/returns/add_edit_user_restrictions.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class UserRestrictionDetailsBlocMock
    extends MockBloc<UserRestrictionDetailsEvent, UserRestrictionDetailsState>
    implements UserRestrictionDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserRestrictionListBlocMock
    extends MockBloc<UserRestrictionListEvent, UserRestrictionListState>
    implements UserRestrictionListBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late UserRestrictionDetailsBloc userRestrictionDetailsMockBloc;
  late EligibilityBloc eligibilityBlocMock;
  late UserRestrictionListBloc userRestrictionListBlocMock;
  late CartBloc cartBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(
    () {
      locator.registerLazySingleton(() => MixpanelService());
      locator<MixpanelService>().init(mixpanel: MixpanelMock());
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
      locator.registerLazySingleton(() => AppRouter());
    },
  );

  Widget getScopedWidget(Widget child) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<UserRestrictionDetailsBloc>(
          create: (context) => userRestrictionDetailsMockBloc,
        ),
        BlocProvider<UserRestrictionListBloc>(
          create: (context) => userRestrictionListBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock),
      ],
      child: child,
    );
  }

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      userRestrictionDetailsMockBloc = UserRestrictionDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      userRestrictionListBlocMock = UserRestrictionListBlocMock();
      cartBlocMock = CartBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userRestrictionDetailsMockBloc.state)
          .thenReturn(UserRestrictionDetailsState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => userRestrictionListBlocMock.state)
          .thenReturn(UserRestrictionListState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    },
  );
  group('Test Add Edit User Restriction Page', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserRestrictionDetailsBloc>(
              create: (context) => userRestrictionDetailsMockBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: AddEditUserRestrictionPage(isEditing: false),
      );
    }

    testWidgets(
      'Load Add Edit User Restriction Page',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final addEditUserRestrictionPage =
            find.byKey(const Key('AddEditUserRestrictionPage'));
        expect(addEditUserRestrictionPage, findsOneWidget);
      },
    );

    testWidgets('Loading Page', (tester) async {
      final expectedState = [
        UserRestrictionDetailsState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
      ];

      whenListen(
        userRestrictionDetailsMockBloc,
        Stream.fromIterable(expectedState),
        initialState: UserRestrictionDetailsState.initial(),
      );

      await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
        isEditing: true,
      )));
      await tester.pump();

      final loader = find.byKey(const Key('LoaderImage'));
      expect(loader, findsOneWidget);
    });

    testWidgets(
      'Add ApproverRights',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final addApproverRightsButton =
            find.byKey(const Key('addApproverRightsButton'));
        expect(addApproverRightsButton, findsOneWidget);
        await tester.tap(addApproverRightsButton);
        await tester.pump();
      },
    );

    testWidgets('listener condition check', (tester) async {
      final expectedState = [
        UserRestrictionDetailsState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Right(
              'No Error',
            ),
          ),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          userRestrictionStatus: UserRestrictionStatus.empty().copyWith(
            approvalLimitStatus: true,
            approverRightsStatus: 'status',
          ),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          userRestrictionStatus: UserRestrictionStatus.empty().copyWith(
            approvalLimitStatus: true,
            approverRightsStatus: '0 rows inserted',
          ),
        ),
      ];

      whenListen(
        userRestrictionDetailsMockBloc,
        Stream.fromIterable(expectedState),
        initialState: UserRestrictionDetailsState.initial(),
      );

      await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
        isEditing: true,
      )));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byKey(const Key('snackBarMessage')), findsOneWidget);
    });

    testWidgets(
      '_ApproverRights test cases ',
      (tester) async {
        when(() => userRestrictionDetailsMockBloc.state)
            .thenReturn(UserRestrictionDetailsState.initial().copyWith(
          approverRights: ApproverRights.empty().copyWith(
            approverRightsList: [
              ApproverRightsDetails.empty().copyWith(
                salesOrg: SalesOrg('2602'),
              ),
            ],
          ),
          addedApproverRightsList: <ApproverRightsDetails>[
            ApproverRightsDetails.empty().copyWith(
              salesOrg: SalesOrg('2602'),
            ),
            ApproverRightsDetails.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ],
        ));

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final addApproveWidget = find.byType(SliverList);
        expect(addApproveWidget, findsOneWidget);

        final findSalesOrg = find.text('2602');
        await tester.tap(findSalesOrg);
        await tester.pump();

        final findDeleteIcon = find.byIcon(Icons.delete);
        expect(findDeleteIcon, findsOneWidget);
        await tester.tap(findDeleteIcon);

        final findIndustryCode1Key = find.byKey(const Key('industryCode1'));
        expect(findIndustryCode1Key, findsOneWidget);
        await tester.enterText(findIndustryCode1Key, 'mock-industry-code');
        await tester.pump();
      },
    );

    testWidgets(
      '_AddDeleteButton cancel tap',
      (tester) async {
        await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
          isEditing: true,
        )));
        await tester.pump();

        final findOnDeletePress = find.byKey(const Key('onDeletePressed'));
        expect(findOnDeletePress, findsOneWidget);
        await tester.tap(findOnDeletePress);
        await tester.pump();

        expect(find.text('Confirm Delete'.tr()), findsOneWidget);
        expect(
            find.text('User Restriction Will be deleted'.tr()), findsOneWidget);

        final findCancelButton = find.text('Cancel');
        expect(findCancelButton, findsOneWidget);
        await tester.tap(findCancelButton);
        await tester.pump();
      },
    );

    testWidgets(
      '_AddDeleteButton confirm condition',
      (tester) async {
        final expectedState = [
          CartState.initial(),
        ];

        whenListen(
          cartBlocMock,
          Stream.fromIterable(expectedState),
          initialState: CartState.initial().copyWith(isClearing: true),
        );

        await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
          isEditing: true,
        )));
        await tester.pump();

        final findOnDeletePress = find.byKey(const Key('onDeletePressed'));
        expect(findOnDeletePress, findsOneWidget);
        await tester.tap(findOnDeletePress);
        await tester.pump();
        await tester.pumpAndSettle(const Duration(seconds: 1));
      },
    );

    testWidgets(
      '_AddDeleteButton Submit tap when User Restriction Not Added',
      (tester) async {
        await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
          isEditing: true,
        )));
        await tester.pump();

        final findOnAddPressed = find.byKey(const Key('onAddPressed'));
        expect(findOnAddPressed, findsOneWidget);
        await tester.tap(findOnAddPressed);
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('User Restriction Not Added'.tr()), findsOneWidget);
      },
    );

    testWidgets(
      '_AddDeleteButton Submit tap when Form is valid',
      (tester) async {
        final expectedState = [
          UserRestrictionDetailsState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            approverRights: ApproverRights.empty().copyWith(
              approverRightsList: [
                ApproverRightsDetails.empty().copyWith(
                  salesOrg: SalesOrg('2602'),
                ),
              ],
            ),
            addedApproverRightsList: [
              ApproverRightsDetails.empty().copyWith(
                salesOrg: SalesOrg('2602'),
              ),
              ApproverRightsDetails.empty().copyWith(
                salesOrg: SalesOrg('2602'),
              ),
            ],
            approvalLimits: ApprovalLimits.empty().copyWith(
                valueLowerLimit: ApprovalLimit(5),
                valueUpperLimit: ApprovalLimit(1000)),
          ),
        ];

        whenListen(
          userRestrictionDetailsMockBloc,
          Stream.fromIterable(expectedState),
          initialState: UserRestrictionDetailsState.initial(),
        );

        await tester.pumpWidget(getScopedWidget(AddEditUserRestrictionPage(
          isEditing: true,
        )));
        await tester.pump();

        final findUserNameKey = find.byKey(const Key('userNameKey'));
        final findReturnLowerLimit = find.byKey(const Key('returnLowerLimit'));
        final findReturnUpperLimit = find.byKey(const Key('returnUpperLimit'));

        await tester.enterText(findUserNameKey, 'user');
        await tester.enterText(findReturnLowerLimit, '5');
        await tester.enterText(findReturnUpperLimit, '100');

        await tester.pump();

        final findOnAddPressed = find.byKey(const Key('onAddPressed'));
        expect(findOnAddPressed, findsOneWidget);
        await tester.tap(findOnAddPressed);
        await tester.pump();
      },
    );
  });
}
