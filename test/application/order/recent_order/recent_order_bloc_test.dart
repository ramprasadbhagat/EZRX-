import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/recent_order/recent_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/recent_order_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class RecentOrderRepositoryMock extends Mock implements RecentOrderRepository {}

class FavoriteRepositoryMock extends Mock implements FavouriteRepository {}

void main() {
  final recentOrderRepository = RecentOrderRepositoryMock();
  final favoriteRepository = FavoriteRepositoryMock();

  final salesOrgConfigMock = SalesOrganisationConfigs.empty();
  final customerCodeInfoMock = CustomerCodeInfo.empty();
  final shipToInfoMock = ShipToInfo.empty();
  final mockMaterialNumber = MaterialNumber('mockMaterialNumber');

  final recentOrderItemsMock = [
    RecentOrderItem.empty().copyWith(qty: 4),
  ];

  final updatedRecentOrderItemsMock = [
    RecentOrderItem.empty().copyWith(
      qty: 4,
      isFavourite: false,
    ),
    RecentOrderItem.empty().copyWith(
      qty: 5,
      isFavourite: true,
    ),
  ];

  final updatedRecentOrderItemsWithImagesMock = [
    RecentOrderItem.empty().copyWith(
      qty: 4,
      isFavourite: false,
      materialNumber: mockMaterialNumber,
      productImages: ProductImages.empty().copyWith(name: 'mock1'),
    ),
    RecentOrderItem.empty().copyWith(
      qty: 5,
      isFavourite: true,
      materialNumber: mockMaterialNumber,
      productImages: ProductImages.empty().copyWith(name: 'mock2'),
    ),
  ];

  final materialInfoMock = [
    MaterialInfo.empty().copyWith(
        materialNumber:
            updatedRecentOrderItemsWithImagesMock[0].materialNumber),
    MaterialInfo.empty().copyWith(
        materialNumber:
            updatedRecentOrderItemsWithImagesMock[1].materialNumber),
  ];

  group('Recent Order Bloc', () {
    blocTest(
      'Fetch recently ordered products success',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => recentOrderRepository.getRecentlyOrderedProducts(
              salesOrgConfig: salesOrgConfigMock,
              customerCodeInfo: customerCodeInfoMock,
              shipToInfo: shipToInfoMock,
            )).thenAnswer(
          (invocation) async => Right(recentOrderItemsMock),
        );

        when(() => favoriteRepository.getFavouritesForList(
              salesConfigs: salesOrgConfigMock,
              list: recentOrderItemsMock,
            )).thenAnswer(
          (invocation) async => Right(updatedRecentOrderItemsMock),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.fetchRecentlyOrderedProducts(
          configs: salesOrgConfigMock,
          customerCodeInfo: customerCodeInfoMock,
          shipToInfo: shipToInfoMock,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          isFetching: true,
          recentlyOrderedProducts: <RecentOrderItem>[],
        ),
        RecentOrderState.initial().copyWith(
          recentlyOrderedProducts: recentOrderItemsMock,
          apiFailureOrSuccessOption: some(
            Right(
              recentOrderItemsMock,
            ),
          ),
        ),
        RecentOrderState.initial().copyWith(
          recentlyOrderedProducts: updatedRecentOrderItemsMock,
          apiFailureOrSuccessOption: some(
            Right(
              updatedRecentOrderItemsMock,
            ),
          ),
        ),
      ],
      verify: (RecentOrderBloc bloc) =>
          bloc.state.toMaterialInfo == materialInfoMock,
    );

    blocTest(
      'Fetch recently ordered products failure',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => recentOrderRepository.getRecentlyOrderedProducts(
              salesOrgConfig: salesOrgConfigMock,
              customerCodeInfo: customerCodeInfoMock,
              shipToInfo: shipToInfoMock,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.fetchRecentlyOrderedProducts(
          configs: salesOrgConfigMock,
          customerCodeInfo: customerCodeInfoMock,
          shipToInfo: shipToInfoMock,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          isFetching: true,
          recentlyOrderedProducts: <RecentOrderItem>[],
        ),
        RecentOrderState.initial().copyWith(
          apiFailureOrSuccessOption: some(
            const Left(
              ApiFailure.other('mock-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Fetch products favorite failure',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => favoriteRepository.getFavouritesForList(
              salesConfigs: salesOrgConfigMock,
              list: recentOrderItemsMock,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.fetchProductsFavouriteStatus(
          configs: salesOrgConfigMock,
          productList: recentOrderItemsMock,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          apiFailureOrSuccessOption: some(
            const Left(
              ApiFailure.other('mock-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Add favorite success',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => favoriteRepository.addToFavourites(
              materialNumber: mockMaterialNumber,
              list: <RecentOrderItem>[],
            )).thenAnswer(
          (invocation) async => Right(updatedRecentOrderItemsMock),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.addFavourite(
          materialCode: mockMaterialNumber,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          recentlyOrderedProducts: updatedRecentOrderItemsMock,
          apiFailureOrSuccessOption: some(
            Right(updatedRecentOrderItemsMock),
          ),
        ),
      ],
    );

    blocTest(
      'Add favorite failure',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => favoriteRepository.addToFavourites(
              materialNumber: mockMaterialNumber,
              list: <RecentOrderItem>[],
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.addFavourite(
          materialCode: mockMaterialNumber,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          apiFailureOrSuccessOption: some(
            const Left(
              ApiFailure.other('mock-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Delete favorite success',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => favoriteRepository.removeFromFavourites(
                  materialNumber: mockMaterialNumber,
                  list: <RecentOrderItem>[],
                ))
            .thenAnswer(
                (invocation) async => Right(updatedRecentOrderItemsMock));
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.deleteFavourite(
          materialCode: mockMaterialNumber,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          recentlyOrderedProducts: updatedRecentOrderItemsMock,
          apiFailureOrSuccessOption: some(
            Right(
              updatedRecentOrderItemsMock,
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Delete favorite failure',
      build: () => RecentOrderBloc(
        recentOrderRepository: recentOrderRepository,
        favouriteRepository: favoriteRepository,
      ),
      setUp: () {
        when(() => favoriteRepository.removeFromFavourites(
              materialNumber: mockMaterialNumber,
              list: <RecentOrderItem>[],
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (RecentOrderBloc bloc) => bloc.add(
        RecentOrderEvent.deleteFavourite(
          materialCode: mockMaterialNumber,
        ),
      ),
      expect: () => [
        RecentOrderState.initial().copyWith(
          apiFailureOrSuccessOption: some(
            const Left(
              ApiFailure.other('mock-error'),
            ),
          ),
        ),
      ],
    );
  });
}
