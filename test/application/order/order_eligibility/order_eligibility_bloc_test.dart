import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityState initializedState;
  late OrderEligibilityState changedState;
  late PriceAggregate fakeCartItem;
  group(
    'Test Order Eligibility Bloc',
    () {
      setUp(
        () async {
          fakeCartItem = (await CartLocalDataSource().upsertCartItems())[0];
          initializedState = OrderEligibilityState.initial().copyWith(
            user: fakeExternalSalesRepUser,
            salesOrg: fakeSalesOrganisation.copyWith(salesOrg: fakeSalesOrg),
            configs: fakeEmptySalesConfigs.copyWith(
              minOrderAmount: '50.0',
            ),
            customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
            shipInfo: fakeShipToInfo.copyWith(city1: 'Kol'),
          );
          changedState = initializedState.copyWith(
            cartItems: [fakeCartItem],
            grandTotal: 100.0,
            subTotal: 80.0,
          );
        },
      );

      blocTest(
        ' => Initialized event test',
        build: () => OrderEligibilityBloc(),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            OrderEligibilityEvent.initialized(
              user: initializedState.user,
              salesOrg: initializedState.salesOrg,
              customerCodeInfo: initializedState.customerCodeInfo,
              configs: initializedState.configs,
              shipInfo: initializedState.shipInfo,
              orderType: initializedState.orderType,
            ),
          );
        },
        expect: () => [initializedState],
      );

      blocTest(
        ' => showErrorMessage when state.isMinOrderValuePassed is false',
        build: () => OrderEligibilityBloc(),
        seed: () => initializedState,
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          initializedState.copyWith(
            showErrorMessage: true,
          )
        ],
      );

      blocTest(
        ' => showErrorMessage when state.isMWPNotAllowedAndPresentInCart is true',
        build: () => OrderEligibilityBloc(),
        seed: () => changedState.copyWith(
          cartItems: [
            fakeCartItem.copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('100225'),
                ),
                type: MaterialInfoType('material'),
              ),
              price: Price.empty(),
            )
          ],
        ),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          changedState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('100225'),
                  ),
                  type: MaterialInfoType('material'),
                ),
                price: Price.empty(),
              )
            ],
            showErrorMessage: true,
          )
        ],
      );

      blocTest(
        ' => showErrorMessage when state.isOOSOrderAllowedToSubmit is false',
        build: () => OrderEligibilityBloc(),
        seed: () => changedState.copyWith(
          configs: fakeEmptySalesConfigs.copyWith(
            materialWithoutPrice: true,
          ),
          cartItems: [
            fakeCartItem.copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                principalData: PrincipalData.empty().copyWith(
                  principalCode: PrincipalCode('100225'),
                ),
              ),
            )
          ],
        ),
        act: (OrderEligibilityBloc bloc) {
          bloc.add(
            const OrderEligibilityEvent.validateOrderEligibility(),
          );
        },
        expect: () => [
          changedState.copyWith(
            configs: fakeEmptySalesConfigs.copyWith(
              materialWithoutPrice: true,
            ),
            cartItems: [
              fakeCartItem.copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  principalData: PrincipalData.empty().copyWith(
                    principalCode: PrincipalCode('100225'),
                  ),
                ),
              )
            ],
            showErrorMessage: true,
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Update event test',
        build: () => OrderEligibilityBloc(),
        seed: () => initializedState,
        act: (bloc) => bloc.add(
          OrderEligibilityEvent.update(
            cartItems: [fakeCartItem],
            grandTotal: 200.0,
            orderType: '',
            subTotal: 180.0,
          ),
        ),
        expect: () => [
          initializedState.copyWith(
            cartItems: <PriceAggregate>[fakeCartItem],
            orderType: '',
            grandTotal: 200.0,
            subTotal: 180.0,
          ),
        ],
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = changedState.isMinOrderValuePassed;
          expect(isMinOrderValuePassed, true);
        },
      );

      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> Test if isMinOrderValuePassed when orderType ZPFC',
        build: () => OrderEligibilityBloc(),
        act: (bloc) {
          final isMinOrderValuePassed = initializedState
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
          final isMinOrderValuePassed = initializedState
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
          final isMinOrderValuePassed = initializedState
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
          final isMinOrderValuePassed = initializedState
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
          final orderEligibilityState = initializedState.copyWith(
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
          final orderEligibilityState = initializedState.copyWith(
            shipInfo: ShipToInfo.empty().copyWith(
              status: Status('Z1'),
            ),
          );

          expect(orderEligibilityState.isAccountSuspended, true);
          expect(orderEligibilityState.isMinOrderValuePassed, false);
        },
      );

      test(
        ' => Mini order value bypass for Sales rep for material with principalCode == 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
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
        ' => Mini order value not bypass for Sales rep for material with principalCode != 100225',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
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
            user: initializedState.user,
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
        ' => Mini order value not bypass for Client User for material with principalCode != 100822',
        () {
          final eligibilityState = OrderEligibilityState.initial().copyWith(
            user: initializedState.user,
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
