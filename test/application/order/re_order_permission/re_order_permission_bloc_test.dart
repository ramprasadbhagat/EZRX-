import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/re_order_permission_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class ReOrderPermissionRepositoryMock extends Mock
    implements ReOrderPermissionRepository {}

void main() {
  late final ReOrderPermissionRepository repository;

  late final ReOrderPermission mockReOrderPermission;
  late final List<OrderHistoryDetailsOrderItem>
      mockValidOrderHistoryDetailsOrderItems;
  late List<OrderHistoryDetailsOrderItem> fakeOrderHistoryDetailsOrderItems;
  late ViewByOrder fakeViewByOrder;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ReOrderPermissionRepositoryMock();
    mockReOrderPermission =
        await ReOrderPermissionLocalDataSource().getPermission();
    fakeViewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    fakeOrderHistoryDetailsOrderItems =
        fakeViewByOrder.orderHeaders.first.orderHistoryDetailsOrderItem;

    mockValidOrderHistoryDetailsOrderItems = fakeOrderHistoryDetailsOrderItems
        .where(
          (orderHistoryDetailsOrderItem) =>
              mockReOrderPermission.validMaterials
                  .map((e) => e.materialNumber)
                  .contains(
                    orderHistoryDetailsOrderItem.materialNumber,
                  ) &&
              orderHistoryDetailsOrderItem.type.isMaterialTypeComm,
        )
        .toList();
  });

  group('ReOrder Permission Bloc', () {
    blocTest(
      'Initialize',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        const ReOrderPermissionEvent.initialized(),
      ),
      expect: () => [
        ReOrderPermissionState.initial(),
      ],
    );

    blocTest(
      'Fetch Reorder Permission success',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [
              fakeOrderHistoryDetailsOrderItems.first.materialNumber
            ],
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockReOrderPermission),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        ),
      ),
      expect: () => [
        ReOrderPermissionState.initial().copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          validOrderHistoryDetailsOrderItems:
              mockValidOrderHistoryDetailsOrderItems,
        ),
      ],
    );

    blocTest(
      'Fetch Reorder Permission failure',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [
              fakeOrderHistoryDetailsOrderItems.first.materialNumber
            ],
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        ),
      ),
      expect: () => [
        ReOrderPermissionState.initial().copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('mock-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Reset Order Number Will Upsert',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.resetOrderNumberWillUpsert(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        ReOrderPermissionState.initial().copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ],
    );
  });
}
