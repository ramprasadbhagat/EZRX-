import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderRepositoryMock extends Mock implements OrderRepository {}

void main() {
  late OrderRepository orderRepositoryMock;

  group(
    'Test Order Eligibility Bloc',
    () {
      setUp(
        () {
          orderRepositoryMock = OrderRepositoryMock();
        },
      );
      blocTest<OrderEligibilityBloc, OrderEligibilityState>(
        '=> event checkMinimumOrderValue',
        setUp: () {
          when(() => orderRepositoryMock.checkMinOrderValue(
                shipInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
                user: User.empty()
                    .copyWith(email: EmailAddress('awsib@gmail.com')),
                cartItems: <PriceAggregate>[
                  PriceAggregate.empty().copyWith(
                    quantity: 2,
                  )
                ],
                grandTotal: 100.0,
                customerCodeInfo:
                    CustomerCodeInfo.empty().copyWith(division: 'div'),
                salesOrg: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601')),
                orderType: '',
                configs: SalesOrganisationConfigs.empty()
                    .copyWith(currency: Currency('PHP')),
              )).thenAnswer((value) => true);
        },
        build: () => OrderEligibilityBloc(repository: orderRepositoryMock),
        act: (bloc) => bloc.add(
          OrderEligibilityEvent.checkMinimumOrderValue(
            shipInfo: ShipToInfo.empty().copyWith(city1: 'Kol'),
            user: User.empty().copyWith(email: EmailAddress('awsib@gmail.com')),
            cartItems: <PriceAggregate>[
              PriceAggregate.empty().copyWith(
                quantity: 2,
              )
            ],
            grandTotal: 100.0,
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(division: 'div'),
            salesOrg:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
            orderType: '',
            configs: SalesOrganisationConfigs.empty()
                .copyWith(currency: Currency('PHP')),
          ),
        ),
        expect: () => [
          OrderEligibilityState.initial().copyWith(
            eligibleForOrderSubmit: false,
          ),
          OrderEligibilityState.initial().copyWith(
            eligibleForOrderSubmit: true,
          ),
        ],
      );
    },
  );
}
