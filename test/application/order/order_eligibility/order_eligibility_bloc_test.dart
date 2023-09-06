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
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
              type: RoleType('external_sales_rep'),
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
            subTotal: 80.0,
          );
        },
      );
      // blocTest<OrderEligibilityBloc, OrderEligibilityState>(
      //   '=> event Initialize and Update',
      //   build: () => OrderEligibilityBloc(),
      //   act: (bloc) => bloc
      //     ..add(
      //       initializedOrderEligibilityEvent,
      //     )
      //     ..add(
      //       OrderEligibilityEvent.update(
      //         cartItems: [fakeCartItem],
      //         grandTotal: 200.0,
      //         orderType: '',
      //         subTotal: 180.0,
      //       ),
      //     ),
      //   expect: () => [
      //     initializedOrderEligibilityState,
      //     initializedOrderEligibilityState.copyWith(
      //       cartItems: <PriceAggregate>[
      //         fakeCartItem.copyWith(
      //           quantity: 1,
      //         ),
      //       ],
      //       orderType: '',
      //       grandTotal: 200.0,
      //       subTotal: 180.0,
      //     ),
      //   ],
      // );

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

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is less than minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedOrderEligibilityState
              .copyWith(
                salesOrg: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2902')),
                subTotal: 40.0,
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, false);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is equal to minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedOrderEligibilityState
              .copyWith(
                salesOrg: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2902')),
                subTotal: 50.0,
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when salesOrg county TH and subTotal is greater than minOrderValue',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedOrderEligibilityState
              .copyWith(
                salesOrg: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2902')),
                subTotal: 60.0,
              )
              .isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed And Customer Code Account Suspended',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final orderEligibilityState =
              initializedOrderEligibilityState.copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              status: Status('Z1'),
            ),
          );

          expect(orderEligibilityState.isAccountSuspended, true);
          expect(orderEligibilityState.isMinOrderValuePassed, false);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed And Ship to Account Suspended',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final orderEligibilityState =
              initializedOrderEligibilityState.copyWith(
            shipInfo: ShipToInfo.empty().copyWith(
              status: Status('Z1'),
            ),
          );

          expect(orderEligibilityState.isAccountSuspended, true);
          expect(orderEligibilityState.isMinOrderValuePassed, false);
        },
      );

      test(
        'Mini order value bypass for Sales rep for material with principalCode == 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: fakeUser,
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('101252'),
                  ),
                ),
              )
            ],
            subTotal: 99,
            configs: SalesOrganisationConfigs.empty()
                .copyWith(minOrderAmount: '100'),
          );

          expect(eligibilityState.isMinOrderValuePassed, true);
        },
      );
      test(
        'Mini order value not bypass for Sales rep for material with principalCode != 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: fakeUser,
            cartItems: [PriceAggregate.empty()],
            grandTotal: 99,
            configs: SalesOrganisationConfigs.empty()
                .copyWith(minOrderAmount: '100'),
          );

          expect(eligibilityState.isMinOrderValuePassed, false);
        },
      );

      test(
        'Mini order value bypass for Client User for material with principalCode == 100822',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: fakeUser.copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
            ),
            cartItems: [
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('101252'),
                  ),
                ),
              )
            ],
            grandTotal: 99,
            configs: SalesOrganisationConfigs.empty()
                .copyWith(minOrderAmount: '100'),
          );

          expect(eligibilityState.isMinOrderValuePassed, true);
        },
      );
      test(
        'Mini order value not bypass for Client User for material with principalCode != 100822',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: fakeUser,
            cartItems: [PriceAggregate.empty()],
            grandTotal: 99,
            configs: SalesOrganisationConfigs.empty()
                .copyWith(minOrderAmount: '100'),
          );

          expect(eligibilityState.isMinOrderValuePassed, false);
        },
      );
    },
  );
}
