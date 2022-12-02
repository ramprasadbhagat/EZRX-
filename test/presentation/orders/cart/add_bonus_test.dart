import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_bonus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/multi_bloc_provider_frame_wrapper.dart';

class BonusMaterialBlocMock
    extends MockBloc<BonusMaterialEvent, BonusMaterialState>
    implements BonusMaterialBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  late BonusMaterialBloc bonusMaterialBloc;
  late List<MaterialInfo> mockbonusItemWithDataList;
  late PriceAggregate cartItem;

  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      bonusMaterialBloc = BonusMaterialBlocMock();
      cartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: '台灣拜耳股份有限公司',
          ),
        ),
      );
      mockbonusItemWithDataList = [
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('0000000000111111'),
          materialDescription: ' Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: '台灣拜耳股份有限公司',
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
    },
  );
  group('Test Add_Bonus', () {
    Widget getWidget() {
      return MultiBlocProviderFrameWrapper(
        providers: [
          BlocProvider<BonusMaterialBloc>(
            create: (context) => bonusMaterialBloc,
          ),
        ],
        child: BonusAddPage(
          cartItem: cartItem,
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
      // await tester.pump();
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
      expect(addBonusTextField, findsOneWidget);
      final emptyState = find.byKey(const Key('empty'));
      expect(emptyState, findsOneWidget);
    });

    testWidgets('Test have bonus item list is fecthing.', (tester) async {
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          isStarting: false,
        ),
      );

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
      // await tester.pump();
      final addBonusTextField = find.byKey(const Key('addBonusTextField'));
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
      final bonusItemList = find.byKey(const Key('bonusItemList'));
      expect(bonusItemList, findsOneWidget);
      final add = find.byKey(const Key('addItem'));
      expect(add, findsOneWidget);
      final addItem = tester.widget(find.byKey(const Key('addItem')));
      await tester.tap(find.byWidget(addItem));
      await tester.pump();

      final addButton = find.byKey(const Key('addButton'));
      expect(addButton, findsOneWidget);
      final button = tester.widget(find.byKey(const Key('addButton')));
      await tester.tap(find.byWidget(button), warnIfMissed: false);
    });
  });
}
