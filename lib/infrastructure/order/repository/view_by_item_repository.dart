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
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_local.dart';
import 'package:ezrxmobile/infrastructure/core/product_image/datasource/product_image_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_filter_dto.dart';

class ViewByItemRepository implements IViewByItemRepository {
  final Config config;
  final ViewByItemLocalDataSource localDataSource;
  final OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;
  final ProductImageLocalDataSource productImageLocalDataSource;
  final ProductImageRemoteDataSource productImageRemoteDataSource;

  ViewByItemRepository({
    required this.productImageLocalDataSource,
    required this.productImageRemoteDataSource,
    required this.config,
    required this.localDataSource,
    required this.orderHistoryRemoteDataSource,
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
        final orderHistoryItemsList = await localDataSource.getViewByItems();

        return Right(orderHistoryItemsList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final orderHistoryItemList =
          await orderHistoryRemoteDataSource.getViewByItems(
        shipTo: shipTo.shipToCustomerCode,
        soldTo: soldTo.customerCodeSoldTo,
        pageSize: pageSize,
        offset: offset,
        language: user.preferredLanguage.languageCode,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        filterQuery: ViewByItemFilterDto.fromDomain(viewByItemFilter).toJson(),
        searchKey: searchKey.getOrCrash(),
      );

      return Right(orderHistoryItemList);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Map<OrderNumber, InvoiceData>>>
      getOrdersInvoiceData({
    required List<OrderNumber> orderNumbers,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final ordersInvoiceData =
            await localDataSource.getInvoiceDataForOrders();

        final invoiceDataMap =
            _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

        return Right(invoiceDataMap);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final queryOrderNumbers =
          orderNumbers.map((e) => e.getOrCrash()).toList();

      final ordersInvoiceData = await orderHistoryRemoteDataSource
          .getInvoiceDataForOrders(orderNumbers: queryOrderNumbers);

      final invoiceDataMap =
          _getInvoiceMapData(ordersInvoiceData: ordersInvoiceData);

      return Right(invoiceDataMap);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  Map<OrderNumber, InvoiceData> _getInvoiceMapData({
    required List<InvoiceData> ordersInvoiceData,
  }) {
    return ordersInvoiceData.fold<Map<OrderNumber, InvoiceData>>(
      <OrderNumber, InvoiceData>{},
      (map, invoiceData) => map..[invoiceData.orderNumber] = invoiceData,
    );
  }
}
