import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/choose_bonus_sheet.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class BonusMaterialBlocMock
    extends MockBloc<BonusMaterialEvent, BonusMaterialState>
    implements BonusMaterialBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

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

void main() {
  late BonusMaterialBloc bonusMaterialBloc;
  late PriceAggregate cartItem;
  late TenderContractBloc tenderContractBlocMock;
  //late BonusMaterialRepositoryMock bonusMaterialRepository;
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  late EligibilityBloc eligibilityBloc;
  late CustomerCodeBloc customerCodeBloc;

  late CartBloc cartBloc;
  late AppRouter autoRouter;

  setUpAll(() {
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
  });
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      bonusMaterialBloc = BonusMaterialBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      // bonusMaterialRepository = BonusMaterialRepositoryMock();
      userBloc = UserBlocMock();
      salesOrgBloc = SalesOrgBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();
      cartBloc = CartBlocMock();

      cartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('台灣拜耳股份有限公司'),
          ),
          quantity: MaterialQty(2),
        ),
      );
      // mockbonusItemWithDataList = [
      //   MaterialInfo.empty().copyWith(
      //     materialNumber: MaterialNumber('0000000000111111'),
      //     materialDescription: ' Mosys D',
      //     principalData: PrincipalData.empty().copyWith(
      //       principalName: PrincipalName('台灣拜耳股份有限公司'),
      //     ),
      //   ),
      // ];
      when(() => bonusMaterialBloc.state).thenReturn(
        BonusMaterialState.initial().copyWith(
          failureOrSuccessOption: none(),
          bonusItemList: [],
          isFetching: false,
        ),
      );
      when(() => userBloc.state).thenReturn(UserState.initial());
      when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(isFetching: false),
      );
    },
  );
  group('Test Add_Bonus', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        providers: [
          BlocProvider<BonusMaterialBloc>(
            create: (context) => bonusMaterialBloc,
          ),
          BlocProvider<TenderContractBloc>(
            create: (context) => tenderContractBlocMock,
          ),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<UserBloc>(create: (context) => userBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
        ],
        child: UpdateBonus(
          materialInfo: cartItem.materialInfo,
          cartItem: CartItem.material(cartItem),
          isUpdateFromCart: true,
        ),
      );
    }

    testWidgets(
      'Update bonus Widget',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final updateBonus = find.byKey(const Key('updateBonus'));
        expect(updateBonus, findsOneWidget);
      },
    );

    testWidgets(
      'Update bonus Quantity Change',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final updateBonus = find.byKey(const Key('updateBonus'));
        expect(updateBonus, findsOneWidget);
        final quantityInput = find.byType(QuantityInput);
        expect(quantityInput, findsOneWidget);
        await tester.enterText(quantityInput.first, '12');
      },
    );

    // testWidgets(
    //   'Update bonus Quantity Increment',
    //   (tester) async {
    //     await tester.pumpWidget(getWidget());
    //     await tester.pump();
    //     final updateBonus = find.byKey(const Key('updateBonus'));
    //     expect(updateBonus, findsOneWidget);
    //     final bounsAdd = find.byKey(const Key('bounsAdd'));
    //     expect(bounsAdd, findsOneWidget);
    //     await tester.tap(bounsAdd.first);
    //   },
    // );

    // testWidgets(
    //   'Update bonus Quantity Decrement',
    //   (tester) async {
    //     await tester.pumpWidget(getWidget());
    //     await tester.pump();
    //     final updateBonus = find.byKey(const Key('updateBonus'));
    //     expect(updateBonus, findsOneWidget);
    //     final bonusDelete = find.byKey(const Key('bonusDelete'));
    //     expect(bonusDelete, findsOneWidget);
    //     await tester.tap(bonusDelete.first);
    //   },
    // );

    testWidgets(
      'Add updated bonus',
      (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final updateBonus = find.byKey(const Key('updateBonus'));
        expect(updateBonus, findsOneWidget);
        final addButton = find.byKey(const Key('addButton'));
        expect(addButton, findsOneWidget);
        await tester.tap(addButton.first);
        await tester.pump();
        final addBonusSnackBar =
            find.textContaining('Bonus item added to the cart'.tr());
        expect(addBonusSnackBar, findsOneWidget);
        final errorEmptyMessage = find.byKey(WidgetKeys.customSnackBar);
        expect(errorEmptyMessage, findsOneWidget);
      },
    );
  });
}
