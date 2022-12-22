import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DiscountOverrideRepositoryMock extends Mock
    implements DiscountOverrideRepository {}

void main() {
  late DiscountOverrideRepository discountOverrideRepositoryMock;

  group('Testing discount override bloc', () {
    setUp(
      () {
        discountOverrideRepositoryMock = DiscountOverrideRepositoryMock();
      },
    );
    blocTest<DiscountOverrideBloc, DiscountOverrideState>(
      'fetch the override discount',
      build: () => DiscountOverrideBloc(
        repository: discountOverrideRepositoryMock,
      ),
      setUp: () {
        when(() => discountOverrideRepositoryMock.getMaterialPriceWithOverride(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            price: Price.empty())).thenAnswer(
          (invocation) async => Right(
            Price.empty(),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DiscountOverrideEvent.fetch(
          customerCode: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          material: MaterialInfo.empty(),
          materialNumber: MaterialNumber(''),
          price: Price.empty(),
        ),
      ),
      expect: () => [
        DiscountOverrideState.initial().copyWith(
          materialPrice: Price.empty().copyWith(
            isPriceOverride: false,
          ),
          apiFailureOrSuccessOption: none(),
          showErrorMessages: false,
        ),
      ],
    );
blocTest<DiscountOverrideBloc, DiscountOverrideState>(
      'update the override discount',
      build: () => DiscountOverrideBloc(
        repository: discountOverrideRepositoryMock,
      ),
      setUp: () {
        when(() => discountOverrideRepositoryMock.getMaterialPriceWithOverride(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            price: Price.empty())).thenAnswer(
          (invocation) async => Right(
            Price.empty(),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DiscountOverrideEvent.update(
          price: Price.empty(),
          showErrorMessages: true,
        ),
      ),
      expect: () => [
        DiscountOverrideState.initial().copyWith(
            materialPrice:
                Price.empty().copyWith(),
            showErrorMessages: true,
            apiFailureOrSuccessOption: none()),
      ],
    );
    blocTest<DiscountOverrideBloc, DiscountOverrideState>(
      'failed to fetch the override discount',
      build: () => DiscountOverrideBloc(
        repository: discountOverrideRepositoryMock,
      ),
      setUp: () {
        when(() => discountOverrideRepositoryMock.getMaterialPriceWithOverride(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            price: Price.empty())).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.priceOverrideNotFound(),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DiscountOverrideEvent.fetch(
          customerCode: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          material: MaterialInfo.empty(),
          materialNumber: MaterialNumber(''),
          price: Price.empty(),
        ),
      ),
      expect: () => [
        DiscountOverrideState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.priceOverrideNotFound()),
          ),
        ),
      ],
    );
  });

  
}
