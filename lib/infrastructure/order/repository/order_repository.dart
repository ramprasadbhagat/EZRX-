import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/encryption/encryption.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;
  final ViewByOrderDetailsLocalDataSource orderDetailLocalDataSource;
  final ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final Encryption encryption;

  late MixpanelService mixpanelService;

  OrderRepository({
    required this.config,
    required this.mixpanelService,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.encryption,
    required this.orderDetailLocalDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
    required this.stockInfoRemoteDataSource,
    required this.stockInfoLocalDataSource,
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
    required DeliveryInfoData data,
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
        final savedOrder = await localDataSource.createDraftOrder();
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

  @override
  Future<Either<ApiFailure, SavedOrder>> updateDraftOrder({
    required List<CartItem> cartItems,
    required DeliveryInfoData data,
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

  List<MaterialItem> _getItemList(List<CartItem> cartItemList) => cartItemList
      .map((cartItem) => cartItem.toSavedOrderMaterial())
      .toList()
      .expand((element) => element)
      .toList();

  @override
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required DeliveryInfoData data,
    required OrderDocumentType orderDocumentType,
    required SalesOrganisationConfigs configs,
  }) async {
    final submitOrder = _getSubmitOrderRequest(
      shipToInfo: shipToInfo,
      user: user,
      data: data,
      cartProducts: cartProducts,
      orderValue: orderValue,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      configs: configs,
    );

    if (config.appFlavor == Flavor.mock) {
      try {
        final submitOrderResponse = await localDataSource.submitOrder();

        return Right(submitOrderResponse);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final encription = encryption.encryptionData(
        data: SubmitOrderDto.fromDomain(
          submitOrder,
        ).toJson(),
      );

      final submitOrderResponse =
          await remoteDataSource.submitOrder(orderEncryption: encription);
      _trackOrderSuccessEvent(cartProducts, grandTotal);

      return Right(submitOrderResponse);
    } catch (e) {
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

  @override
  Future<Either<ApiFailure, OrderHistoryDetails>> getOrderConfirmationDetail({
    required SubmitOrderResponse orderResponse,
    required User user,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = user.role.type.isSalesRepRole
            ? await orderDetailLocalDataSource
                .getOrderHistoryDetailsForSalesRep()
            : await orderDetailLocalDataSource.getOrderHistoryDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    var apiRetryCounter = 15;
    var orderHistoryDetails = OrderHistoryDetails.empty();
    do {
      try {
        orderHistoryDetails = user.role.type.isSalesRepRole
            ? await orderHistoryDetailsRemoteDataSource
                .getOrderHistoryDetailsForSalesRep(
                companyName: '',
                orderId: orderResponse.salesDocument,
                language: user.preferredLanguage,
                userName: user.username.getOrCrash(),
              )
            : await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
                orderId: orderResponse.salesDocument,
                language: user.preferredLanguage,
              );
      } catch (e) {
        apiRetryCounter--;
        if (apiRetryCounter == 0) {
          return Left(
            FailureHandler.handleFailure(e),
          );
        }
      }
    } while (apiRetryCounter > 0 &&
        orderHistoryDetails == OrderHistoryDetails.empty());

    return Right(orderHistoryDetails);
  }

  @override
  Future<Either<ApiFailure, List<MaterialStockInfo>>>
      getConfirmedOrderStockInfo({
    required OrderHistoryDetails orderHistoryDetails,
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCodeInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final stockInfoList =
            await stockInfoLocalDataSource.getMaterialStockInfoList();
            
        return Right(stockInfoList);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final stockInfoList =
          await stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: orderHistoryDetails.orderHistoryDetailsOrderItem
            .map((e) => e.materialNumber.getOrDefaultValue(''))
            .toList(),
        salesOrg: salesOrg.getOrCrash(),
        selectedCustomerCode: customerCodeInfo.customerCodeSoldTo,
      );

      return Right(stockInfoList);
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
    required DeliveryInfoData data,
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
      country: shipToInfo.country,
      postCode1: shipToInfo.postalCode,
      specialInstructions: data.deliveryInstruction.getValue(),
      poReference: data.poReference.getValue(),
      payTerm: data.paymentTerm.getValue(),
      // collectiveNo: data.collectiveNumber.getValue(),
      totalOrderValue: grandTotal,
      draftorder: true,
      address1: shipToInfo.shipToAddress.street,
      address2: shipToInfo.shipToAddress.street2,
      city: shipToInfo.city1,
      phonenumber: data.mobileNumber.getValue(),
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
    required DeliveryInfoData data,
    required List<PriceAggregate> cartProducts,
    required double orderValue,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
  }) {
    return SubmitOrder.empty().copyWith(
      userName: data.contactPerson.getValue().isNotEmpty
          ? data.contactPerson.getValue()
          : user.fullName.toString(),
      poReference: data.poReference.getValue(),
      referenceNotes: data.referenceNote.getOrDefaultValue(''),
      specialInstructions: data.deliveryInstruction.getOrDefaultValue(''),
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      requestedDeliveryDate: data.deliveryDate.getValue(),
      poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      telephone: data.mobileNumber.getTelephone,
      collectiveNumber: '',
      paymentTerms: data.paymentTerm.getPaymentTerm,
      customer: _getSubmitOrderCustomer(
        customerCodeInfo: customerCodeInfo,
        salesOrganisation: salesOrganisation,
        shipToInfo: shipToInfo,
      ),
      blockOrder: configs.enablePrincipalList,
      // && cartItems.any((item) => item.checkSalesCutOff)
      products: _getMaterialInfoList(cartProducts: cartProducts),
      poDocuments: data.poDocuments,
      orderValue: orderValue,
      language: user.settings.languagePreference.getValue(),
      paymentMethod: 'Bank Transfer',
    );
  }

  void _trackOrderSuccessEvent(
    List<PriceAggregate> cartItems,
    double grandTotal,
  ) {
    final isBannerClicked = cartItems
        .map(
          (e) => e.banner != BannerItem.empty(),
        )
        .toList();
    final props = {
      MixpanelProps.grandTotal: grandTotal,
      MixpanelProps.productName:
          cartItems.map((e) => e.materialInfo.materialDescription).toList(),
      MixpanelProps.productNumber: cartItems
          .map((e) => e.getMaterialNumber.getOrDefaultValue(''))
          .toList(),
      MixpanelProps.productManufacturer: cartItems
          .map(
            (e) => e.materialInfo.principalData.principalName
                .getOrDefaultValue(''),
          )
          .toList(),
      MixpanelProps.productCategory: cartItems
          .map((e) => e.materialInfo.materialGroup4.getMaterialGroup4Type)
          .toList(),
      MixpanelProps.productQty: cartItems.map((e) => e.quantity).toList(),
      MixpanelProps.bonusName: cartItems
          .map(
            (e) => e.addedBonusList.map((e) => e.materialDescription).toList(),
          )
          .toList(),
      MixpanelProps.bonusManufacturer: cartItems
          .map(
            (e) => e.addedBonusList
                .map(
                  (e) => e.materialInfo.principalData.principalName
                      .getOrDefaultValue(''),
                )
                .toList(),
          )
          .toList(),
      MixpanelProps.bannerClicked: isBannerClicked,
      MixpanelProps.bannerId:
          cartItems.map((e) => e.banner.id.toString()).toList(),
      MixpanelProps.bannerTitle: cartItems.map((e) => e.banner.title).toList(),
      MixpanelProps.bannerType:
          cartItems.map((e) => e.banner.category).toList(),
    };

    mixpanelService.trackEvent(
      eventName: MixpanelEvents.orderSuccess,
      properties: props,
    );
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
  required List<PriceAggregate> cartProducts,
}) =>
    cartProducts
        .expand(
          (element) => !element.materialInfo.type.typeBundle
              ? [element.toSubmitMaterialInfo()]
              : element.bundle.materials.map(
                  (el) => PriceAggregate.empty()
                      .copyWith(
                        materialInfo: el,
                        quantity: el.quantity,
                        salesOrgConfig: element.salesOrgConfig,
                        bundle: element.bundle,
                      )
                      .toSubmitMaterialInfo(),
                ),
        )
        .toList();
