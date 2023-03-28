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
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;
  final CountlyService countlyService;
  late MixpanelService mixpanelService;

  OrderRepository({
    required this.config,
    required this.mixpanelService,
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
    required List<CartItem> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
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

  @override
  Future<Either<ApiFailure, SavedOrder>> updateDraftOrder({
    required List<CartItem> cartItems,
    required AdditionalDetailsData data,
    required double grandTotal,
    required String orderId,
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
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
        final savedOrder = await localDataSource.updateDraftOrder();

        return Right(savedOrder);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final savedOrder = await remoteDataSource.updateDraftOrder(
        updatedOrder: SavedOrderDto.fromDomain(
          draftOrder.copyWith(
            id: orderId,
          ),
        ),
      );

      return Right(savedOrder);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  List<MaterialItem> _getItemList(List<CartItem> cartItemList) {
    final saveOrderItems = cartItemList
        .map((cartItem) => cartItem.toSavedOrderMaterial())
        .toList()
        .expand((element) => element)
        .toList();

    return saveOrderItems;
  }

  @override
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs configs,
  }) async {
    final submitOrder = _getSubmitOrderRequest(
      shipToInfo: shipToInfo,
      user: user,
      data: data,
      cartItems: cartItems,
      orderDocumentType: orderDocumentType,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      configs: configs,
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        final submitOrderResponse = await localDataSource.submitOrder(
          submitOrder: SubmitOrderDto.fromDomain(
            submitOrder,
            configs.currency.getValue(),
          ),
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
        submitOrder:
            SubmitOrderDto.fromDomain(submitOrder, configs.currency.getValue()),
      );

      _trackOrderSuccessEvent(cartItems, grandTotal);

      return Right(submitOrderResponse);
    } catch (e) {
      await countlyService.addCountlyEvent('order_fail');
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.orderFailed,
        properties: {
          MixpanelProps.errorMessage: e.toString(),
        },
      );

      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, SavedOrder>> getSavedOrderDetail({
    required String orderId,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final savedOrder = await localDataSource.getSavedOrderDetail();

        return Right(savedOrder);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final orderDetail =
          await remoteDataSource.getSavedOrderDetail(orderId: orderId);

      return Right(orderDetail);
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
    required List<CartItem> cartItems,
    required double grandTotal,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required AdditionalDetailsData data,
  }) {
    //bonus calculation

    return SavedOrder.empty().copyWith(
      shippingCondition: data.greenDeliveryEnabled
          ? ShippingCondition.greenDelivery()
          : ShippingCondition(''),
      requestedDeliveryDate: data.deliveryDate.getValue(),
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
      specialInstructions: data.specialInstruction.getValue(),
      poReference: data.customerPoReference.getValue(),
      payTerm: data.paymentTerm.getValue(),
      collectiveNo: data.collectiveNumber.getValue(),
      totalOrderValue: grandTotal,
      draftorder: true,
      address1: shipToInfo.shipToAddress.street,
      address2: shipToInfo.shipToAddress.street2,
      city: shipToInfo.city1,
      phonenumber: data.contactNumber.getValue(),
      user: user.id,
      contactPerson: data.contactPerson.getValue().isNotEmpty
          ? data.contactPerson.getValue()
          : user.fullName.toString(),
      referenceNotes: data.referenceNote.getValue(),
      items: _getItemList(cartItems),
      poAttachent: data.poDocuments,
    );
  }

  SubmitOrder _getSubmitOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required AdditionalDetailsData data,
    required List<PriceAggregate> cartItems,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
    required OrderDocumentType orderDocumentType,
  }) {
    return SubmitOrder.empty().copyWith(
      userName: data.contactPerson.getValue().isNotEmpty
          ? data.contactPerson.getValue()
          : user.fullName.toString(),
      poReference: data.customerPoReference.getValue(),
      referenceNotes: data.referenceNote.getValue(),
      specialInstructions: data.specialInstruction.getValue(),
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      requestedDeliveryDate: data.deliveryDate.getValue(),
      poDate: data.deliveryDate.getValue(),
      telephone: data.contactNumber.getTelephone,
      trackingLevel: 'items',
      collectiveNumber: '',
      subscribeStatusChange: true,
      orderType: getOrderType(
        orderType: orderDocumentType.documentType.documentTypeCode,
        cartItems: cartItems,
        user: user,
      ),
      orderReason: cartItems
              .map((cartItem) =>
                  cartItem.tenderContract.tenderOrderReason.getValue())
              .contains('730')
          ? '730'
          : orderDocumentType.orderReason,
      purchaseOrderType: user.role.type.purchaseOrderType,
      shippingCondition: data.greenDeliveryEnabled
          ? ShippingCondition.greenDelivery()
          : ShippingCondition(''),
      paymentTerms: _getPaymentTerms(cartItems: cartItems, data: data),
      customer: _getSubmitOrderCustomer(
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      ),
      blockOrder: false,
      //TODO: principle list from sales org config
      materials: _getMaterialInfoList(cartItems: cartItems),
      poDocuments: data.poDocuments,
    );
  }

  void _trackOrderSuccessEvent(
    List<PriceAggregate> cartItems,
    double grandTotal,
  ) {
    mixpanelService.trackEvent(
      eventName: MixpanelEvents.orderSuccess,
      properties: {
        MixpanelProps.grandTotal: grandTotal,
        MixpanelProps.productName:
            cartItems.map((e) => e.materialInfo.materialDescription).toList(),
        MixpanelProps.productNumber: cartItems
            .map((e) => e.getMaterialNumber.getOrDefaultValue(''))
            .toList(),
        MixpanelProps.productManufacturer: cartItems
            .map((e) => e.materialInfo.principalData.principalName
                .getOrDefaultValue(''))
            .toList(),
        MixpanelProps.productCategory: cartItems
            .map((e) => e.materialInfo.materialGroup4.getMaterialGroup4Type)
            .toList(),
        MixpanelProps.productQty: cartItems.map((e) => e.quantity).toList(),
        MixpanelProps.bonusName: cartItems
            .map((e) =>
                e.addedBonusList.map((e) => e.materialDescription).toList())
            .toList(),
        MixpanelProps.bonusManufacturer: cartItems
            .map((e) => e.addedBonusList
                .map((e) => e.materialInfo.principalData.principalName
                    .getOrDefaultValue(''))
                .toList())
            .toList(),
      },
    );
  }
}

String _getPaymentTerms({
  required List<PriceAggregate> cartItems,
  required AdditionalDetailsData data,
}) {
  final priceAggregate = cartItems.firstWhere(
    (element) =>
        element.tenderContract != TenderContract.empty() &&
        element.tenderContract != TenderContract.noContract(),
    orElse: () => PriceAggregate.empty(),
  );

  final paymentTerm = data.paymentTerm.getOrDefaultValue('');

  return priceAggregate != PriceAggregate.empty()
      ? priceAggregate.tenderContract.contractPaymentTerm.getValue()
      : paymentTerm.isEmpty
          ? paymentTerm
          : paymentTerm.substring(0, paymentTerm.indexOf('-'));
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

String getOrderType({
  required String orderType,
  required List<PriceAggregate> cartItems,
  required User user,
}) {
  return cartItems
          .where((element) => element.materialInfo.materialGroup4.isFOC)
          .isNotEmpty
      ? 'ZPFC'
      : orderType.isEmpty
          ? 'ZPOR'
          : orderType;
}
