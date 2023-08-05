import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByOrderDetailsRepositoryMock extends Mock
    implements ViewByOrderDetailsRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ViewByOrderDetailsRepository viewByOrderDetailsRepositoryMock;
  late OrderHistoryDetails orderHistoryDetailsMock;
  group(
    'ViewByOrderDetailsBloc Test',
    () {
      setUpAll(() async {
        orderHistoryDetailsMock =
            await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
      });

      setUp(() {
        viewByOrderDetailsRepositoryMock = ViewByOrderDetailsRepositoryMock();
      });

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Initialized Event',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ViewByOrderDetailsEvent.initialized(),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial(),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Success',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: User.empty(),
              orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            ),
          ).thenAnswer((invocation) async => Right(orderHistoryDetailsMock));
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
            failureOrSuccessOption: optionOf(Right(orderHistoryDetailsMock)),
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
          // ViewByOrderDetailsState.initial().copyWith(
          //   isLoading: false,
          //   orderHistoryDetails: orderHistoryDetailsMock,
          //   failureOrSuccessOption: none(),
          //   materials: {
          //     for (final item in orderHistoryDetailsMock.items)
          //       item.orderItem.queryInfo: item.toPriceAggregate,
          //   },
          //   isLoadingTenderContract: {
          //     for (final item in orderHistoryDetailsMock.items)
          //       if (item.orderItem.isTenderContractMaterial)
          //         item.orderItem.queryInfo: true,
          //   },
          // ),
          // ViewByOrderDetailsState.initial().copyWith(
          //   isLoading: false,
          //   orderHistoryDetails: orderHistoryDetailsMock,
          //   failureOrSuccessOption: none(),
          //   materials: {
          //     for (final item in orderHistoryDetailsMock.items)
          //       item.orderItem.queryInfo: item.toPriceAggregate,
          //   },
          //   isLoadingTenderContract: {
          //     for (final item in orderHistoryDetailsMock.items)
          //       if (item.orderItem.isTenderContractMaterial)
          //         item.orderItem.queryInfo: true,
          //   },
          // ),
        ],
      );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Failure',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: User.empty(),
              orderHeader: OrderHistoryDetailsOrderHeader.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
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
