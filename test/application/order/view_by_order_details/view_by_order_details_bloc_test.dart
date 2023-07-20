import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/repository/product_images_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductImagesRepositoryMock extends Mock
    implements ProductImagesRepository {}

class ViewByOrderDetailsRepositoryMock extends Mock
    implements ViewByOrderDetailsRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderDetailsRepository viewByOrderDetailsRepositoryMock;
  late ProductImagesRepository productImagesRepositoryMock;
  late OrderHistoryDetails orderHistoryDetailsMock;
  late List productImages;
  group(
    'ViewByOrderDetailsBloc Test',
    () {
      setUpAll(() async {
        orderHistoryDetailsMock =
            await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
        productImages = orderHistoryDetailsMock.orderHistoryDetailsOrderItem;
      });

      setUp(() {
        viewByOrderDetailsRepositoryMock = ViewByOrderDetailsRepositoryMock();
        productImagesRepositoryMock = ProductImagesRepositoryMock();
      });

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Initialized Event',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productImagesRepository: productImagesRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ViewByOrderDetailsEvent.initialized(),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial(),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Success with Product Image Fetch Success',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productImagesRepository: productImagesRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: User.empty(),
              orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            ),
          ).thenAnswer((invocation) async => Right(orderHistoryDetailsMock));
          when(
            () => productImagesRepositoryMock.getProductImages(
              list: orderHistoryDetailsMock.orderHistoryDetailsOrderItem,
            ),
          ).thenAnswer((invocation) async => Right(productImages));
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetch(
            orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: none(),
            materials: {
              for (final item in orderHistoryDetailsMock.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in orderHistoryDetailsMock.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
          ViewByOrderDetailsState.initial().copyWith(
            isImageLoading: true,
            isLoading: false,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: none(),
            materials: {
              for (final item in orderHistoryDetailsMock.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in orderHistoryDetailsMock.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            isImageLoading: false,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: none(),
            materials: {
              for (final item in orderHistoryDetailsMock.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in orderHistoryDetailsMock.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Product Image Fetch Failure',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productImagesRepository: productImagesRepositoryMock,
        ),
        setUp: () {
          when(
            () => productImagesRepositoryMock.getProductImages(
              list: orderHistoryDetailsMock.orderHistoryDetailsOrderItem,
            ),
          ).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        seed: () => ViewByOrderDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryDetails: orderHistoryDetailsMock,
          failureOrSuccessOption: none(),
          materials: {
            for (final item in orderHistoryDetailsMock.items)
              item.orderItem.queryInfo: item.toPriceAggregate,
          },
          isLoadingTenderContract: {
            for (final item in orderHistoryDetailsMock.items)
              if (item.orderItem.isTenderContractMaterial)
                item.orderItem.queryInfo: true,
          },
        ),
        act: (bloc) => bloc.add(
          const ViewByOrderDetailsEvent.fetchProductImage(),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial().copyWith(
            isImageLoading: true,
            isLoading: false,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption: none(),
            materials: {
              for (final item in orderHistoryDetailsMock.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in orderHistoryDetailsMock.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            isImageLoading: false,
            orderHistoryDetails: orderHistoryDetailsMock,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            materials: {
              for (final item in orderHistoryDetailsMock.items)
                item.orderItem.queryInfo: item.toPriceAggregate,
            },
            isLoadingTenderContract: {
              for (final item in orderHistoryDetailsMock.items)
                if (item.orderItem.isTenderContractMaterial)
                  item.orderItem.queryInfo: true,
            },
          ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Failure',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productImagesRepository: productImagesRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: User.empty(),
              orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            ),
          ).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetch(
            orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: true,
          ),
          ViewByOrderDetailsState.initial().copyWith(
            isLoading: false,
            showErrorMessage: true,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
          ),
        ],
      );

      //TODO:Need To Revisit when tender contract is implemented for V3

      // blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      //   'For UpdateMaterialTenderContract Event',
      //   build: () => ViewByOrderDetailsBloc(
      //     viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
      //     productImagesRepository: productImagesRepositoryMock,
      //   ),
      //   act: (bloc) => bloc.add(
      //     ViewByOrderDetailsEvent.updateMaterialTenderContract(
      //       queryInfo: MaterialQueryInfo.empty(),
      //       selectedTenderContract: TenderContract.empty(),
      //     ),
      //   ),
      //   seed: () => ViewByOrderDetailsState.initial().copyWith(
      //     isLoading: false,
      //     orderHistoryDetails: orderHistoryDetailsMock,
      //     failureOrSuccessOption: none(),
      //     materials: {
      //       for (final item in orderHistoryDetailsMock.items)
      //         item.orderItem.queryInfo: item.toPriceAggregate,
      //     },
      //     isLoadingTenderContract: {
      //       for (final item in orderHistoryDetailsMock.items)
      //         if (item.orderItem.isTenderContractMaterial)
      //           item.orderItem.queryInfo: true,
      //     },
      //   ),
      //   expect: () => [],
      // );
    },
  );
}
