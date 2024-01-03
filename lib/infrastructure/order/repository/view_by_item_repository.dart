import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_filter_dto.dart';

import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

class ViewByItemRepository implements IViewByItemRepository {
  final Config config;
  final ViewByItemLocalDataSource viewByItemLocalDataSource;
  final ViewByItemRemoteDataSource viewByItemRemoteDataSource;

  ViewByItemRepository({
    required this.config,
    required this.viewByItemLocalDataSource,
    required this.viewByItemRemoteDataSource,
  });

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItems({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required ShipToInfo shipTo,
    required User user,
    required int pageSize,
    required int offset,
    required ViewByItemFilter viewByItemFilter,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderHistoryItemsList =
            await viewByItemLocalDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    final applyNoDateFiler =
        searchKey.validateNotEmpty && viewByItemFilter.dateRangeEmpty;

    try {
      final orderHistoryItemList =
          await viewByItemRemoteDataSource.getViewByItems(
        shipTo: shipTo.shipToCustomerCode,
        soldTo: soldTo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        language: user.preferredLanguage.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        filterQuery: ViewByItemFilterDto.fromDomain(
          applyNoDateFiler
              ? viewByItemFilter.copyWith(
                  orderDateFrom: DateTimeStringValue(
                    getDateStringByDateTime(DateTime(1900)),
                  ),
                  orderDateTo: DateTimeStringValue(
                    getDateStringByDateTime(DateTime.now()),
                  ),
                )
              : viewByItemFilter,
        ).toJson(),
        searchKey: searchKey.getOrCrash(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, OrderHistory>> getViewByItemDetails({
    required SalesOrganisationConfigs salesOrgConfig,
    required CustomerCodeInfo soldTo,
    required User user,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderHistoryItemsList =
            await viewByItemLocalDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList =
          await viewByItemRemoteDataSource.getViewByItemDetails(
        soldTo: soldTo.customerCodeSoldTo,
        language: salesOrganisation.salesOrg.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        orderNumber: searchKey.getOrCrash(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, OrderHistory>> searchOrderHistory({
    required CustomerCodeInfo soldTo,
    required User user,
    required SearchKey searchKey,
    required SalesOrganisation salesOrganisation,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final orderHistoryItemsList =
            await viewByItemLocalDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList =
          await viewByItemRemoteDataSource.searchOrderHistory(
        soldTo: soldTo.customerCodeSoldTo,
        language: user.preferredLanguage.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        searchKey: searchKey.getOrCrash(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<StringValue, InvoiceData>>>
      getOrdersInvoiceData({
    required List<OrderNumber> orderNumbers,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ordersInvoiceData =
            await viewByItemLocalDataSource.getInvoiceDataForOrders();

        final invoiceDataMap =
            _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

        return Right(invoiceDataMap);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final queryOrderNumbers = orderNumbers
          .where((e) => e.isValid())
          .map((e) => e.getOrCrash())
          .toList();

      final ordersInvoiceData = await viewByItemRemoteDataSource
          .getInvoiceDataForOrders(orderNumbers: queryOrderNumbers);

      final invoiceDataMap =
          _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

      return Right(invoiceDataMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Map<StringValue, InvoiceData> _getInvoiceMapData({
    required List<InvoiceData> ordersInvoiceData,
  }) {
    return ordersInvoiceData.fold<Map<StringValue, InvoiceData>>(
      <StringValue, InvoiceData>{},
      (map, invoiceData) => map..[invoiceData.hashId] = invoiceData,
    );
  }
}
