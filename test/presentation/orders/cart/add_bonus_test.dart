import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/search_bonus_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class BonusMaterialBlocMock
    extends MockBloc<BonusMaterialEvent, BonusMaterialState>
    implements BonusMaterialBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

class BonusMaterialRepositoryMock extends Mock
    implements BonusMaterialRepository {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockAppRouter extends Mock implements AppRouter {
  @override
  String currentPath = '';
}

void main() {
  late BonusMaterialBloc bonusMaterialBloc;
  late List<MaterialInfo> mockbonusItemWithDataList;
  late PriceAggregate cartItem;
  late TenderContractBloc tenderContractBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter mockAppRouter;

  setUpAll(() {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      mockAppRouter = MockAppRouter();
      bonusMaterialBloc = BonusMaterialBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      userBlocMock = UserBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

      cartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('台灣拜耳股份有限公司'),
          ),
        ),
      );

      mockbonusItemWithDataList = [
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('0000000000111111'),
          materialDescription: ' Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('台灣拜耳股份有限公司'),
          ),
        ),
      ];
      when(() => bonusMaterialBloc.state)
          .thenReturn(BonusMaterialState.initial().copyWith(
        failureOrSuccessOption: none(),
        bonus: mockbonusItemWithDataList,
        isFetching: false,
        isStarting: true,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    },
  );
  group('Test Add_Bonus', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: mockAppRouter,
        providers: [
          BlocProvider<BonusMaterialBloc>(
            create: (context) => bonusMaterialBloc,
          ),
          BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractBlocMock),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: BonusAddPage(
          cartItem: CartItem.material(cartItem),
        ),
      );
    }

    testWidgets(
      'Load add bonus Page',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartPage = find.byKey(const Key('addBonus'));
        expect(cartPage, findsOneWidget);
      },
    );

    testWidgets('Test have bonus item list didnt fetched yet.', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          isStarting: true,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      final emptyState = find.byKey(const Key('empty'));
      expect(emptyState, findsOneWidget);
    });

    testWidgets('Test have bonus item list is fecthing.', (tester) async {
      final expectedStates = <BonusMaterialState>[
        BonusMaterialState.initial().copyWith(
          isFetching: false,
          isStarting: false,
        ),
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          isStarting: false,
        )
      ];

      whenListen(bonusMaterialBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      // await tester.pump();
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      final emptyState = find.byKey(const Key('loaderImage'));
      expect(emptyState, findsOneWidget);
    });
    testWidgets('Test have bonus item list fetched.', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          isFetching: false,
          isStarting: false,
          bonus: mockbonusItemWithDataList,
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      final bonusItemList = find.byKey(const Key('bonusItemList'));
      expect(bonusItemList, findsOneWidget);
    });

    testWidgets(
        'Test have bonus item list fetched when search text is initially valid.',
        (tester) async {
      when(() => bonusMaterialBloc.state)
          .thenReturn(BonusMaterialState.initial().copyWith(
        isFetching: false,
        isStarting: false,
        searchKey: SearchKey('000'),
        bonus: mockbonusItemWithDataList,
      ));
      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      // await tester.pump();
      final addBonusTextField = find.byKey(const Key('addBonusTextField000'));
      expect(addBonusTextField, findsOneWidget);
      final bonusItemList = find.byKey(const Key('bonusItemList'));
      expect(bonusItemList, findsOneWidget);
    });

    testWidgets('Test have bonus item list fetched when search text is valid',
        (tester) async {
      final expectedStates = <BonusMaterialState>[
        BonusMaterialState.initial().copyWith(
          isFetching: false,
          isStarting: false,
          bonus: mockbonusItemWithDataList,
        ),
        BonusMaterialState.initial().copyWith(
          isFetching: false,
          isStarting: false,
          searchKey: SearchKey('000'),
          bonus: mockbonusItemWithDataList,
        )
      ];

      whenListen(bonusMaterialBloc, Stream.fromIterable(expectedStates));

      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      // await tester.pump();
      final addBonusTextField = find.byKey(const Key('addBonusTextField000'));
      expect(addBonusTextField, findsOneWidget);
      final bonusItemList = find.byKey(const Key('bonusItemList'));
      expect(bonusItemList, findsOneWidget);
    });
    testWidgets('Test have bonus add.', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          isFetching: false,
          isStarting: false,
          bonus: mockbonusItemWithDataList,
        ),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final cartPage = find.byKey(const Key('addBonus'));
      expect(cartPage, findsOneWidget);
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      final bonusItemList = find.byKey(const Key('bonusItemList'));
      expect(bonusItemList, findsOneWidget);
      final add = find.byKey(Key(
          'addItem${mockbonusItemWithDataList.first.materialNumber.getOrDefaultValue('')}'));
      expect(add, findsOneWidget);
      final addItem = tester.widget(find.byKey(Key(
          'addItem${mockbonusItemWithDataList.first.materialNumber.getOrDefaultValue('')}')));
      await tester.tap(find.byWidget(addItem));
      await tester.pump();

      final addButton = find.byKey(const Key('addButton'));
      expect(addButton, findsOneWidget);
      final button = tester.widget(find.byKey(const Key('addButton')));
      await tester.tap(find.byWidget(button), warnIfMissed: false);
    });

    testWidgets('Test add bonus search keyword assignment', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey('test'),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final addBonusSearchField =
          find.byKey(const Key('addBonusTextFieldtest'));
      final addBonusSearchFieldWidget =
          tester.widget<SearchBar>(addBonusSearchField);
      expect(addBonusSearchFieldWidget.controller.text, 'test');
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey(''),
        ),
      );
      await tester.pump();
      expect(addBonusSearchFieldWidget.controller.text, 'test');
    });

    testWidgets('Test add bonus submit search with search keyword empty',
        (tester) async {
      await tester.pumpWidget(getWidget());
      final addBonusSearchField = find.byKey(const Key('addBonusTextField'));
      await tester.enterText(addBonusSearchField, '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(
          find.text(
            'Please enter at least 2 characters.'.tr(),
          ),
          findsOneWidget);
    });

    testWidgets('Test add bonus search field clear', (tester) async {
      final expectedCustomerCodeListStates = [
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey('test'),
          isFetching: false,
        ),
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey(''),
          isFetching: false,
        ),
      ];
      whenListen(bonusMaterialBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));
      await tester.pumpWidget(getWidget());
      // final addBonusTextFieldClear =
      //     find.byKey(const Key('addBonusTextFieldClear'));
      //await tester.tap(addBonusTextFieldClear);
      final addBonusSearchField = find.byKey(const Key('addBonusTextField'));
      final addBonusSearchFieldWidget =
          tester.widget<SearchBar>(addBonusSearchField);
      await tester.pump();
      expect(addBonusSearchFieldWidget.controller.text, '');
    });

    testWidgets('Test add bonus Search change fetch data', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final addBonusSearchField = find.byKey(const Key('addBonusTextField'));
      await tester.enterText(addBonusSearchField, 'test');
      await tester.pump(const Duration(seconds: 1));
      //await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.fetch(
            user: User.empty(),
            configs: SalesOrganisationConfigs.empty(),
            pickAndPack: '',
            salesOrganisation: SalesOrganisation.empty(),
            searchKey: 'test',
            shipInfo: ShipToInfo.empty(),
            customerInfo: CustomerCodeInfo.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test add bonus Search change auto-fetch data', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial(),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(getWidget());
      });
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final addBonusSearchField = find.byKey(const Key('addBonusTextField'));
      await tester.enterText(addBonusSearchField, 'test');
      await tester.pump(const Duration(seconds: 4));
      verify(
        () => bonusMaterialBloc.add(
          BonusMaterialEvent.autoSearch(
            user: User.empty(),
            configs: SalesOrganisationConfigs.empty(),
            pickAndPack: '',
            salesOrganisation: SalesOrganisation.empty(),
            searchKey: 'test',
            shipInfo: ShipToInfo.empty(),
            customerInfo: CustomerCodeInfo.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Test add bonus search fail', (tester) async {
      final expectedCustomerCodeListStates = [
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey(''),
          isFetching: true,
        ),
        BonusMaterialState.initial().copyWith(
            searchKey: SearchKey('Test'),
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            )),
      ];
      whenListen(bonusMaterialBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final addBonusSearchField =
          find.byKey(const Key('addBonusTextFieldTest'));
      await tester.tap(addBonusSearchField);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 1));
      final addBonusSearchFieldWidget =
          tester.widget<SearchBar>(addBonusSearchField);
      await tester.pump();
      expect(addBonusSearchFieldWidget.controller.text, 'Test');
    });

    testWidgets('Test add bonus search fail With unKnownError', (tester) async {
      final expectedCustomerCodeListStates = [
        BonusMaterialState.initial().copyWith(
          searchKey: SearchKey(''),
          isFetching: true,
        ),
        BonusMaterialState.initial().copyWith(
            searchKey: SearchKey('Test'),
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Right(null),
            )),
      ];
      whenListen(bonusMaterialBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final addBonusSearchField =
          find.byKey(const Key('addBonusTextFieldTest'));
      await tester.tap(addBonusSearchField);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.enter);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(seconds: 1));
      final addBonusSearchFieldWidget =
          tester.widget<SearchBar>(addBonusSearchField);
      await tester.pump();
      expect(addBonusSearchFieldWidget.controller.text, 'Test');
    });
  });
}
