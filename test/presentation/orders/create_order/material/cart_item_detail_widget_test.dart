import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_bonus_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';

import '../../../../utils/material_frame_wrapper.dart';

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockFunctionHolder extends Mock implements FunctionHolder {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class FunctionHolder {
  void onFieldChange(int value) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  setUp(() {
    salesOrgBlocMock = SalesOrgMockBloc();
    tenderContractBlocMock = TenderContractBlocMock();
    eligibilityBlocMock = MockEligibilityBloc();
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget testWidget({
    required PriceAggregate cartItem,
    Function(int)? onFieldChanged,
  }) {
    return MaterialFrameWrapper(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SalesOrgBloc>(create: ((context) => salesOrgBlocMock)),
          BlocProvider<TenderContractBloc>(
            create: (context) => tenderContractBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Material(
          child: CartItemDetailWidget(
            cartItem: cartItem,
            onQuantityChanged: onFieldChanged ?? (value) {},
          ),
        ),
      ),
    );
  }

  group('Cart Item Detail Widget', () {
    testWidgets('- layout children widgets', (tester) async {
      await tester.pumpWidget(
        testWidget(
          cartItem: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialDescription: 'fake-material-description',
              principalData: PrincipalData.empty().copyWith(
                principalName: PrincipalName('fake-principle-name'),
              ),
              materialNumber: MaterialNumber('fake-material-number'),
            ),
          ),
        ),
      );

      expect(find.text('fake-material-description'), findsOneWidget);
      expect(find.text('fake-principle-name'), findsOneWidget);
      expect(find.text('fake-material-number'), findsOneWidget);
      expect(find.byType(QuantityInput), findsOneWidget);
      expect(find.byType(BonusDetails), findsOneWidget);
      // expect(find.byKey(const Key('Unit Price NA 0')), findsOneWidget);
      // expect(find.byKey(const Key('Total Price NA 0')), findsOneWidget);
    });

    testWidgets('- show tier discount label', (tester) async {
      await tester.pumpWidget(
        testWidget(
          cartItem: PriceAggregate.empty().copyWith(
            price: Price.empty().copyWith(
              tiers: [
                PriceTier.empty().copyWith(
                  items: [
                    PriceTierItem.empty(),
                    PriceTierItem.empty(),
                  ],
                ),
                PriceTier.empty().copyWith(
                  items: [
                    PriceTierItem.empty(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('tieredPricing')), findsOneWidget);
      expect(find.byType(PriceTierLabel), findsNWidgets(2));
    });

    testWidgets('- show price before tax code', (tester) async {
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableVat: true,
          ),
        ),
      );
      await tester.pumpWidget(
        testWidget(
          cartItem: PriceAggregate.empty(),
        ),
      );

      // expect(
      //     find.byKey(const Key('Unit price before VATNA 0')), findsOneWidget);
      // expect(
      //     find.byKey(const Key('Total price before VATNA 0')), findsOneWidget);
    });

    testWidgets(
        '- show label when qty is bigger than remaining tender contract qty',
        (tester) async {
      when(() => tenderContractBlocMock.state).thenReturn(
        TenderContractState.initial().copyWith(
          selectedTenderContract:
              TenderContract.empty().copyWith(remainingTenderQuantity: 3),
        ),
      );

      await tester.pumpWidget(
        testWidget(
          cartItem: PriceAggregate.empty().copyWith(quantity: 4),
        ),
      );

      expect(
        find.text(
          'Please ensure the order quantity is less than \nor equal to Remaining Quantity of the contract',
        ),
        findsOneWidget,
      );
    });
    // testWidgets('- call onQuantityChanged when qty is changed ',
    //     (tester) async {
    //   final functionHolder = MockFunctionHolder();
    //   await tester.pumpWidget(testWidget(
    //     cartItem: PriceAggregate.empty(),
    //     onFieldChanged: functionHolder.onFieldChange,
    //   ));
    //   final plusButton = find.byKey(const Key('cartItemAdd'));
    //   final minusButton = find.byKey(const Key('cartItemDelete'));
    //   final inputField = find.byKey(const Key('item'));

    //   expect(plusButton, findsOneWidget);
    //   await tester.tap(plusButton);
    //   await tester.pump();
    //   verify(() => functionHolder.onFieldChange(2)).called(1);
    //   expect(minusButton, findsOneWidget);
    //   await tester.tap(minusButton);
    //   await tester.pump();
    //   verify(() => functionHolder.onFieldChange(1)).called(1);
    //   expect(inputField, findsOneWidget);
    //   await tester.enterText(inputField, '3');
    //   await tester.pump();
    //   verify(() => functionHolder.onFieldChange(3)).called(1);
    // });
  });
}
