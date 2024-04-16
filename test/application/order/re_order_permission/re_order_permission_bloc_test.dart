import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/re_order_permission_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ReOrderPermissionRepositoryMock extends Mock
    implements ReOrderPermissionRepository {}

void main() {
  late final ReOrderPermissionRepository repository;

  late final ReOrderPermission mockReOrderPermission;
  late final List<OrderHistoryDetailsOrderItem>
      mockValidOrderHistoryDetailsOrderItems;
  late List<OrderHistoryDetailsOrderItem> fakeOrderHistoryDetailsOrderItems;
  late ViewByOrder fakeViewByOrder;
  late OrderHistory fakeViewByItemDetail;
  late OrderHistoryItem fakeOrderHistoryItem;
  final initializedState = ReOrderPermissionState.initial().copyWith(
    salesOrganisationConfigs: fakeMYSalesOrgConfigs,
    customerCodeInfo: fakeCustomerCodeInfo,
    salesOrganisation: fakeMYSalesOrganisation,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
    user: fakeSalesRepUser,
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ReOrderPermissionRepositoryMock();
    mockReOrderPermission =
        await ReOrderPermissionLocalDataSource().getPermission();
    fakeViewByOrder = await ViewByOrderLocalDataSource().getViewByOrders();
    fakeViewByItemDetail = await ViewByItemLocalDataSource().getViewByItems();
    fakeOrderHistoryItem = fakeViewByItemDetail.orderHistoryItems.first;
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
        ReOrderPermissionEvent.initialized(
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeSalesRepUser,
        ),
      ),
      expect: () => [initializedState],
    );

    blocTest(
      'Fetch order Reorder Permission success',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItems
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser, 
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockReOrderPermission),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
          validOrderItems: mockValidOrderHistoryDetailsOrderItems
              .map((e) => e.reOrderMaterialInfo)
              .toList(),
        ),
      ],
    );

    blocTest(
      'Fetch order Reorder Permission failure',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: fakeOrderHistoryDetailsOrderItems
                .map((e) => e.materialNumber)
                .toList(),
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchOrder(
          orderHistoryDetailsOrderItems: fakeOrderHistoryDetailsOrderItems,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
          orderNumberWillUpsert: fakeViewByOrder.orderHeaders.first.orderNumber,
        ),
        initializedState.copyWith(
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

    blocTest(
      'Fetch item Reorder Permission failure',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [
              fakeViewByItemDetail.orderHistoryItems.first.materialNumber,
            ],
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeViewByItemDetail.orderHistoryItems.first,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('mock-error')),
          ),
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success when item is not bonus',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [fakeOrderHistoryItem.materialNumber],
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
            user: fakeSalesRepUser,
          ),
        ).thenAnswer(
          (_) async => Right(
            ReOrderPermission(
              validMaterials: [
                ValidMaterial.empty().copyWith(
                  materialNumber: fakeOrderHistoryItem.materialNumber,
                ),
              ],
            ),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [fakeOrderHistoryItem.reOrderMaterialInfo],
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success when item is bonus',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [fakeOrderHistoryItem.materialNumber],
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            ReOrderPermission(
              validMaterials: [
                ValidMaterial.empty().copyWith(
                  materialNumber: fakeOrderHistoryItem.materialNumber,
                ),
              ],
            ),
          ),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem.copyWith(
            isBonusMaterial: true,
            lineNumber: LineNumber('12'),
          ),
          orderHistoryDetail: OrderHistory.empty().copyWith(
            orderHistoryItems: [
              fakeOrderHistoryItem.copyWith(
                isBonusMaterial: false,
                lineNumber: LineNumber('10'),
              ),
              fakeOrderHistoryItem.copyWith(
                isBonusMaterial: true,
                lineNumber: LineNumber('12'),
              ),
            ],
          ),
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [
            fakeOrderHistoryItem
                .copyWith(
                  isBonusMaterial: true,
                  lineNumber: LineNumber('12'),
                )
                .reOrderMaterialInfo,
          ],
        ),
      ],
    );

    blocTest(
      'Fetch item Reorder Permission success when item is not valid',
      build: () =>
          ReOrderPermissionBloc(reOrderPermissionRepository: repository),
      seed: () => initializedState,
      setUp: () {
        when(
          () => repository.getReorderPermission(
            customerCodeInfo: fakeCustomerCodeInfo,
            materialNumbers: [fakeOrderHistoryItem.materialNumber],
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeSalesRepUser,
            salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(ReOrderPermission.empty()),
        );
      },
      act: (ReOrderPermissionBloc bloc) => bloc.add(
        ReOrderPermissionEvent.fetchItem(
          item: fakeOrderHistoryItem,
          orderHistoryDetail: fakeViewByItemDetail,
        ),
      ),
      expect: () => [
        initializedState.copyWith(
          isFetching: true,
        ),
        initializedState.copyWith(
          isFetching: false,
          validOrderItems: [],
        ),
      ],
    );
  });
}
