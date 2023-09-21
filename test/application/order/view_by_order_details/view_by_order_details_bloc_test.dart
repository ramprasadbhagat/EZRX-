import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/view_by_order_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ViewByOrderDetailsRepositoryMock extends Mock
    implements ViewByOrderDetailsRepository {}

class ProductDetailsRepositoryMock extends Mock
    implements ProductDetailRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeInfo customerCodeInfo;
  late SalesOrganisation salesOrganisation;
  late ViewByOrderDetailsRepository viewByOrderDetailsRepositoryMock;
  late ProductDetailRepository productDetailRepositoryMock;
  //late OrderHistoryDetails orderHistoryDetailsMock;
  group(
    'ViewByOrderDetailsBloc Test',
    () {
      setUpAll(() async {
        //orderHistoryDetailsMock =
        //  await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
        customerCodeInfo = CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: 'fake-sold-to',
          shipToInfos: [ShipToInfo.empty()],
        );
        salesOrganisation = SalesOrganisation.empty()
            .copyWith(salesOrg: SalesOrg('fake-sales-org'));
      });

      setUp(() {
        viewByOrderDetailsRepositoryMock = ViewByOrderDetailsRepositoryMock();
        productDetailRepositoryMock = ProductDetailsRepositoryMock();
      });

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Initialized Event',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ViewByOrderDetailsEvent.initialized(),
        ),
        expect: () => [
          ViewByOrderDetailsState.initial(),
        ],
      );

      // blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
      //   'For Fetch Event Success',
      //   build: () => ViewByOrderDetailsBloc(
      //     viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
      //     productDetailRepository: productDetailRepositoryMock,
      //   ),
      //   setUp: () {
      //     when(
      //       () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
      //         user: User.empty(),
      //         orderHeader: OrderHistoryDetailsOrderHeader.empty(),
      //         customerCodeInfo: customerCodeInfo,
      //         salesOrganisation: salesOrganisation,
      //       ),
      //     ).thenAnswer((invocation) async => Right(orderHistoryDetailsMock));
      //   },
      //   act: (bloc) => bloc.add(
      //     ViewByOrderDetailsEvent.fetch(
      //       orderHeader: OrderHistoryDetailsOrderHeader.empty(),
      //       user: User.empty(),
      //       customerCodeInfo: customerCodeInfo,
      //       salesOrganisation: salesOrganisation,
      //     ),
      //   ),
      //   expect: () => [
      //     ViewByOrderDetailsState.initial().copyWith(
      //       isLoading: true,
      //     ),
      //     ViewByOrderDetailsState.initial().copyWith(
      //       isLoading: false,
      //       isFetchingList: false,
      //       orderHistoryDetails: orderHistoryDetailsMock,
      //       failureOrSuccessOption: optionOf(Right(orderHistoryDetailsMock)),
      //       productDetailAggregateList: [ProductDetailAggregate.empty()],
      //       materials: {
      //         for (final item in orderHistoryDetailsMock.items)
      //           item.orderItem.queryInfo: item.toPriceAggregate,
      //       },
      //       isLoadingTenderContract: {
      //         for (final item in orderHistoryDetailsMock.items)
      //           if (item.orderItem.isTenderContractMaterial)
      //             item.orderItem.queryInfo: true,
      //       },
      //     ),
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
      //   ],
      // );

      blocTest<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
        'For Fetch Event Failure',
        build: () => ViewByOrderDetailsBloc(
          viewByOrderDetailsRepository: viewByOrderDetailsRepositoryMock,
          productDetailRepository: productDetailRepositoryMock,
        ),
        setUp: () {
          when(
            () => viewByOrderDetailsRepositoryMock.getViewByOrderDetails(
              user: User.empty(),
              orderNumber: OrderNumber(''),
              customerCodeInfo: customerCodeInfo,
              salesOrganisation: salesOrganisation,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          ViewByOrderDetailsEvent.fetch(
            orderNumber: OrderNumber(''),
            user: User.empty(),
            customerCodeInfo: customerCodeInfo,
            salesOrganisation: salesOrganisation,
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
