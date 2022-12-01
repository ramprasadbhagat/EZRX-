import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order_material.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;

  OrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<ApiFailure, List<SavedOrder>>> getSavedOrder({
    required User user,
    required SalesOrganisation salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required int pageSize,
    required int offset,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final savedOrders = await localDataSource.getSavedOrders();

        return Right(savedOrders);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final userId = user.id;
      final salesOrgName = salesOrg.salesOrg.getOrCrash();
      final customerCodeNumber = customerCode.customerCodeSoldTo;
      final shipToCodeNumber = shipToCode.shipToCustomerCode;

      final savedOrders = await remoteDataSource.getSavedOrder(
        userId: userId,
        saleOrgName: salesOrgName,
        shipToCode: shipToCodeNumber,
        customerCode: customerCodeNumber,
        pageSize: pageSize,
        offset: offset,
      );

      return Right(savedOrders);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<SavedOrder>>> deleteSavedOrder({
    required SavedOrder orderItem,
    required List<SavedOrder> ordersList,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final newOrdersList = List<SavedOrder>.from(ordersList)
          ..removeWhere((element) => element.id == orderItem.id);

        return Right(newOrdersList);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final deletedOrderItem =
          await remoteDataSource.deleteSavedOrder(itemId: orderItem.id);
      final newOrdersList = List<SavedOrder>.from(ordersList)
        ..removeWhere((element) => element.id == deletedOrderItem.id);

      return Right(newOrdersList);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, SavedOrder>> createDraftOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Map<AdditionalInfoLabelList, String> data,
  }) async {
    final draftOrder = _getCreateDraftOrderRequest(
      shipToInfo: shipToInfo,
      user: user,
      cartItems: cartItems,
      grandTotal: grandTotal,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      data: data,
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        final savedOrder = await localDataSource.createDraftOrder(
          draftOrder: SavedOrderDto.fromDomain(draftOrder),
        );
        if (savedOrder.isDraftOrder) {
          final newlyAddedDraftOrder = draftOrder.copyWith(id: savedOrder.id);

          return Right(newlyAddedDraftOrder);
        } else {
          return Left(
            FailureHandler.handleFailure('Order not saved'),
          );
        }
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final savedOrder = await remoteDataSource.createDraftOrder(
        draftOrder: SavedOrderDto.fromDomain(draftOrder),
      );

      if (savedOrder.isDraftOrder) {
        final newlyAddedDraftOrder = draftOrder.copyWith(id: savedOrder.id);

        return Right(newlyAddedDraftOrder);
      } else {
        return Left(
          FailureHandler.handleFailure('Order not saved'),
        );
      }
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  List<SavedOrderMaterial> _getItemList(List<PriceAggregate> cartItemList) {
    return cartItemList
        .map((cartItem) => cartItem.toSavedOrderMaterial())
        .toList();
  }

//TODO : Will revisit
  SavedOrder _getCreateDraftOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Map<AdditionalInfoLabelList, String> data,
  }) {
    //bonus calculation

    return SavedOrder.empty().copyWith(
      deliveryDocument: shipToInfo.shipToName.name1,
      billingDocument: customerCodeInfo.customerName.name1,
      salesOrganization: salesOrganisation.salesOrg.getOrCrash(),
      principal: '',
      soldToParty: SoldToParty(customerCodeInfo.customerCodeSoldTo),
      shipToParty: ShipToParty(shipToInfo.shipToCustomerCode),
      processingStatus: 'Draft',
      isDraftOrder: true,
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      country: shipToInfo.region,
      postCode1: shipToInfo.postalCode,
      specialInstructions:
          data[AdditionalInfoLabelList.specialInstruction] ?? '',
      poReference: data[AdditionalInfoLabelList.customerPoReference] ?? '',
      payTerm: data[AdditionalInfoLabelList.paymentTerm] ?? '',
      collectiveNo: data[AdditionalInfoLabelList.collectiveNumber] ?? '',
      totalOrderValue: grandTotal,
      draftorder: true,
      address1: shipToInfo.shipToAddress.street,
      address2: shipToInfo.shipToAddress.street2,
      city: shipToInfo.city1,
      phonenumber: data[AdditionalInfoLabelList.contactNumber] ?? '',
      user: user.id,
      contactPerson: data[AdditionalInfoLabelList.contactPerson] != null &&
              data[AdditionalInfoLabelList.contactPerson]!.isNotEmpty
          ? data[AdditionalInfoLabelList.contactPerson]!
          : user.fullName.toString(),
      referenceNotes: data[AdditionalInfoLabelList.referenceNote] ?? '',
      items: _getItemList(cartItems),
    );
  }
}
