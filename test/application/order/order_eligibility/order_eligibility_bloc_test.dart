import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityEvent initializedOrderEligibilityEvent;
  late OrderEligibilityState initializedOrderEligibilityState;
  late User fakeUser;
  late PriceAggregate fakeCartItem;
  group(
    'Test Order Eligibility Bloc',
    () {
      setUp(
        () {
          fakeUser = User.empty().copyWith(
            email: EmailAddress('test@yopmail.com'),
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          );
          fakeCartItem = PriceAggregate.empty().copyWith(
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(10.34),
            ),
            materialInfo: MaterialInfo.empty().copyWith(
              materialDescription: 'Fake Description',
            ),
            quantity: 1,
          );
          initializedOrderEligibilityEvent = OrderEligibilityEvent.initialized(
            user: fakeUser,
            cartItems: [fakeCartItem],
            salesOrg:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            configs: SalesOrganisationConfigs.empty().copyWith(
              minOrderAmount: '50.0',
            ),
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            shipInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            orderType: '',
            grandTotal: 100.0,
          );
          initializedOrderEligibilityState =
              OrderEligibilityState.initial().copyWith(
            user: fakeUser,
            cartItems: [
              fakeCartItem.copyWith(
                quantity: 1,
              )
            ],
            salesOrg:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            configs: SalesOrganisationConfigs.empty().copyWith(
              minOrderAmount: '50.0',
            ),
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            shipInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            orderType: '',
            grandTotal: 100.0,
          );
        },
      );
      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> event Initialize and Update',
        build: () => OrderEligibilityBloc(),
        act: (bloc) => bloc
          ..add(
            initializedOrderEligibilityEvent,
          )
          ..add(
            OrderEligibilityEvent.update(
              cartItems: [fakeCartItem],
              grandTotal: 200.0,
              orderType: '',
            ),
          ),
        expect: () => [
          initializedOrderEligibilityState,
          initializedOrderEligibilityState.copyWith(
            cartItems: <PriceAggregate>[
              fakeCartItem.copyWith(
                quantity: 1,
              ),
            ],
            orderType: '',
            grandTotal: 200.0,
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed =
              initializedOrderEligibilityState.isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when orderType ZPFC',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedOrderEligibilityState
              .copyWith(
                orderType: 'ZPFC',
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );
    },
  );
}
