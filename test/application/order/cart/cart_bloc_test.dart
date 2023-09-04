import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  late ShipToInfo shipToInfo;
  late CustomerCodeInfo customerCodeInfo;
  late CartRepository cartRepositoryMock;
  late SalesOrganisation salesOrganisation;
  late SalesOrganisationConfigs salesOrganisationConfigs;

  setUpAll(() {
    salesOrganisation = SalesOrganisation.empty()
        .copyWith(salesOrg: SalesOrg('fake-sales-org'));
    salesOrganisationConfigs = SalesOrganisationConfigs.empty().copyWith(
      salesOrg: SalesOrg('fake-sales-org'),
    );
    shipToInfo =
        ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-customer-code');
    customerCodeInfo =
        CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'fake-sold-to');
  });
  setUp(() {
    cartRepositoryMock = CartRepositoryMock();
  });

  group(
    'Testing CartBloc',
    () {
      blocTest<CartBloc, CartState>(
        'Fetch failure',
        build: () => CartBloc(cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.clearCart(),
          ).thenAnswer(
            (invocation) async => const Right(
              unit,
            ),
          );
        },
        seed: () => CartState.initial().copyWith(
          cartProducts: [PriceAggregate.empty()],
          salesOrganisation: salesOrganisation,
          config: salesOrganisationConfigs,
          shipToInfo: shipToInfo,
          customerCodeInfo: customerCodeInfo,
        ),
        act: (bloc) => bloc.add(
          const CartEvent.clearCart(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isClearing: true,
            cartProducts: [PriceAggregate.empty()],
            salesOrganisation: salesOrganisation,
            config: salesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          ),
          CartState.initial().copyWith(
            salesOrganisation: salesOrganisation,
            config: salesOrganisationConfigs,
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          ),
        ],
      );
    },
  );
}
