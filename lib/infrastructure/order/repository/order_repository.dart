import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;
  final CountlyService countlyService;

  OrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.countlyService,
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
        await countlyService.addCountlyEvent('Save order');

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

  List<MaterialItem> _getItemList(List<PriceAggregate> cartItemList) {
    return cartItemList
        .map((cartItem) => cartItem.toSavedOrderMaterial())
        .toList();
  }

  @override
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Map<AdditionalInfoLabelList, String> data,
    required String orderType,
    required SalesOrganisationConfigs configs,
  }) async {
    final submitOrder = _getSubmitOrderRequest(
      shipToInfo: shipToInfo,
      user: user,
      data: data,
      cartItems: cartItems,
      orderType: orderType,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      configs: configs,
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        final submitOrderResponse = await localDataSource.submitOrder(
          submitOrder: SubmitOrderDto.fromDomain(submitOrder),
        );

        return Right(submitOrderResponse);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final submitOrderResponse = await remoteDataSource.submitOrder(
        submitOrder: SubmitOrderDto.fromDomain(submitOrder),
      );

      return Right(submitOrderResponse);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
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

  SubmitOrder _getSubmitOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required Map<AdditionalInfoLabelList, String> data,
    required List<PriceAggregate> cartItems,
    required String orderType,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
  }) {
    return SubmitOrder.empty().copyWith(
      userName: data[AdditionalInfoLabelList.contactPerson] != null &&
              data[AdditionalInfoLabelList.contactPerson]!.isNotEmpty
          ? data[AdditionalInfoLabelList.contactPerson]!
          : user.fullName.toString(),
      poReference: data[AdditionalInfoLabelList.customerPoReference] ?? '',
      referenceNotes: data[AdditionalInfoLabelList.referenceNote] ?? '',
      specialInstructions:
          data[AdditionalInfoLabelList.specialInstruction] ?? '',
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      requestedDeliveryDate: data[AdditionalInfoLabelList.deliveryDate] ?? '',
      poDate: data[AdditionalInfoLabelList.deliveryDate] ?? '',
      telephone: data[AdditionalInfoLabelList.contactNumber]!.length > 16
          ? data[AdditionalInfoLabelList.contactNumber]!.substring(0, 16)
          : data[AdditionalInfoLabelList.contactNumber]!,
      trackingLevel: 'items',
      collectiveNumber: '',
      subscribeStatusChange: true,
      orderType:
          getOrderType(orderType: orderType, cartItems: cartItems, user: user),
      orderReason: gettenderAvailability(cartItem: cartItems.last)
          ? 'tenderOrderReason'
          : '',
      purchaseOrderType: orderType,
      shippingCondition: '',
      paymentTerms: gettenderAvailability(cartItem: cartItems.last)
          ? 'contractPaymentTerm'
          : data[AdditionalInfoLabelList.paymentTerm]!,
      customer: _getSubmitOrderCustomer(
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      ),
      blockOrder: false, //TODO: principle list from sales org config
      materials: _getMaterialInfoList(cartItems: cartItems),
    );
  }

  @override
  bool checkMinOrderValue({
    required List<PriceAggregate> cartItems,
    required SalesOrganisation salesOrg,
    required SalesOrganisationConfigs configs,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipInfo,
    required String orderType,
    required User user,
  }) {
    if (!_hasPrinciple(cartItems, user.role.type.isSalesRep)) {
      if (orderType.isNotEmpty &&
          (orderType.contains('ZPFC') || orderType.contains('ZPFB'))) {
        return true;
      }
      if (cartItems
          .where((element) => element.materialInfo.materialGroup4.isFOC)
          .isNotEmpty) {
        return true;
      }

      return !shipInfo.status.isSuspended &&
              !customerCodeInfo.status.isSuspended
          ? cartItems
                  .where((element) => (!element.materialInfo.isSampleMaterial))
                  .isNotEmpty
              ? grandTotal >= double.parse(configs.minOrderAmount)
                  ? true
                  : false
              : true
          : false;
    }

    return false;
  }

  bool _hasPrinciple(List<PriceAggregate> cartItems, bool isSalesRep) {
    return isSalesRep
        ? cartItems.where((element) => element.hasSalesRepPrinciple).isNotEmpty
        : cartItems.where((element) => element.hasClientPrinciple).isNotEmpty;
  }
}

SubmitOrderCustomer _getSubmitOrderCustomer({
  required ShipToInfo shipToInfo,
  required SalesOrganisation salesOrganisation,
  required CustomerCodeInfo customerCodeInfo,
}) {
  return SubmitOrderCustomer.empty().copyWith(
    customerNumber: customerCodeInfo.customerCodeSoldTo,
    customerNumberShipTo: shipToInfo.shipToCustomerCode,
    division: customerCodeInfo.division,
    salesOrganisation: salesOrganisation.salesOrg.getOrCrash(),
  );
}

List<SubmitMaterialInfo> _getMaterialInfoList({
  required List<PriceAggregate> cartItems,
}) {
  return cartItems.map((e) => e.toSubmitMaterialInfo()).toList();
}

bool gettenderAvailability({
  required PriceAggregate cartItem,
}) {
  //TODO : also need to check if tenderContractDetails is null or not, it will come from tenderContractDetails query
  return cartItem.materialInfo.hasValidTenderContract ||
          cartItem.materialInfo.hasMandatoryTenderContract
      ? true
      : false;
}

String getOrderType({
  required String orderType,
  required List<PriceAggregate> cartItems,
  required User user,
}) {
  if (cartItems
          .where((element) => element.materialInfo.materialGroup4.isFOC)
          .length >
      1) {
    return 'ZPFC';
  } else if (user.role.type.isSalesRep && orderType.isEmpty) {
    return 'ZPOR';
  } else if (user.role.type.isSalesRep && orderType.isNotEmpty) {
    if (orderType.contains('ZPFB')) {
      return 'ZPFB';
    } else if (orderType.contains('ZPFC')) {
      return 'ZPFC';
    } else {
      return 'ZPOR';
    }
  } else if (user.role.type.isClient) {
    return 'ZPOR';
  }

  return 'ZPOR';
}
