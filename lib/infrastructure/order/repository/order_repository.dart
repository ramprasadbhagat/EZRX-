import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/material_banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:upgrader/upgrader.dart';

class OrderRepository implements IOrderRepository {
  final Config config;
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;
  final ViewByOrderDetailsLocalDataSource orderDetailLocalDataSource;
  final ViewByOrderDetailsRemoteDataSource orderHistoryDetailsRemoteDataSource;
  final StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final StockInfoLocalDataSource stockInfoLocalDataSource;
  final Encryption encryption;
  final DeviceStorage deviceStorage;
  final MaterialBannerStorage materialBannerStorage;
  final RemoteConfigService remoteConfigService;
  final MixpanelService mixpanelService;
  final ClevertapService clevertapService;
  final Upgrader upgrader;

  OrderRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.encryption,
    required this.orderDetailLocalDataSource,
    required this.orderHistoryDetailsRemoteDataSource,
    required this.stockInfoRemoteDataSource,
    required this.stockInfoLocalDataSource,
    required this.deviceStorage,
    required this.remoteConfigService,
    required this.materialBannerStorage,
    required this.mixpanelService,
    required this.clevertapService,
    required this.upgrader,
  });

  @override
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required double aplSmallOrderFee,
    required double zpSmallOrderFee,
    required double mpSmallOrderFee,
    required double totalTax,
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
      totalTax: totalTax,
      mpSmallOrderFee: mpSmallOrderFee,
      zpSmallOrderFee: zpSmallOrderFee,
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
      final submitOrderData = SubmitOrderDto.fromDomain(
        submitOrder,
      ).toJson();

      // If request without this field in ID market, API return error with message "Internal server error"
      // This field must be a null string when the order value is >= salesOrganisation.salesOrg.smallOrderThreshold, other wise the small order fee should go on this field
      if (salesOrganisation.salesOrg.isID) {
        if (orderValue >= salesOrganisation.salesOrg.smallOrderThreshold) {
          submitOrderData.addAll({'deliveryFee': 'null'});
        } else {
          submitOrderData.addAll({'deliveryFee': aplSmallOrderFee.toString()});
        }
      }
      if (submitOrder.orderType.isNotEmpty) {
        submitOrderData.addAll({'orderType': submitOrder.orderType});
      }

      final encryptedData = encryption.encryptionData(
        data: submitOrderData,
        secretKey: config.orderEncryptionSecret,
      );
      final enableMarketPlace = remoteConfigService.enableMarketPlaceMarkets
          .contains(deviceStorage.currentMarket());

      final submitOrderResponse = await remoteDataSource.submitOrder(
        orderEncryption: encryptedData,
        enableMarketPlace: enableMarketPlace,
      );

      return Right(submitOrderResponse);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<OrderHistoryDetails>>>
      getOrderConfirmationDetail({
    required SubmitOrderResponse orderResponse,
    required User user,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required List<PriceAggregate> cartProducts,
    required ShipToInfo shipToInfo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result =
            await orderDetailLocalDataSource.getOrderHistoryDetailsList();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }

    try {
      final enableMarketPlace = remoteConfigService.enableMarketPlaceMarkets
          .contains(deviceStorage.currentMarket());

      if (enableMarketPlace) {
        final orderHistoryDetailsList =
            await orderHistoryDetailsRemoteDataSource
                .getOrderHistoryDetailsList(
          orderNumbers: orderResponse.salesDocuments,
          language: user.preferredLanguage.languageCode,
          soldTo: customerCodeInfo.customerCodeSoldTo,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          shipTo: shipToInfo.shipToCustomerCode,
          market: deviceStorage.currentMarket(),
        );
        for (final orderHistoryDetails in orderHistoryDetailsList) {
          await _trackOrderSuccess(
            orderHistoryDetails,
          );
        }
        await materialBannerStorage.clear();

        return Right(
          orderHistoryDetailsList
              .map((e) => e.copyWithMaterialInfo(priceAggregates: cartProducts))
              .toList(),
        );
      }

      final orderHistoryDetails =
          await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
        searchKey: orderResponse.salesDocument,
        language: user.preferredLanguage.languageCode,
        soldTo: customerCodeInfo.customerCodeSoldTo,
        salesOrg: salesOrganisation.salesOrg.getOrCrash(),
        shipTo: shipToInfo.shipToCustomerCode,
        market: deviceStorage.currentMarket(),
      );
      await _trackOrderSuccess(
        orderHistoryDetails,
      );
      await materialBannerStorage.clear();

      return Right(
        [
          orderHistoryDetails.copyWithMaterialInfo(
            priceAggregates: cartProducts,
          ),
        ],
      );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  Future<void> _trackOrderSuccess(
    OrderHistoryDetails orderDetail,
  ) async {
    final orderQueueNumber = orderDetail.orderNumber.getOrDefaultValue('');

    mixpanelService.trackEvent(
      eventName: TrackingEvents.placeOrderSuccessOriginal,
      properties: {
        if (orderDetail.processingStatus.isInQueue)
          TrackingProps.queueNumber: orderQueueNumber,
        TrackingProps.orderNumber: orderDetail.trackingOrderId,
        TrackingProps.grandTotal: orderDetail.totalValue,
        TrackingProps.totalQty: orderDetail.orderItemsCount,
        TrackingProps.requestDeliveryDate:
            orderDetail.requestedDeliveryDate.dateOrNaString,
        TrackingProps.lineNumber:
            orderDetail.orderHistoryDetailsOrderItem.length,
        TrackingProps.forceUpgradeVersionInfo:
            upgrader.state.versionInfo.toString(),
        TrackingProps.forceUpgradeAlertTooSoon: upgrader.isTooSoon(),
        TrackingProps.forceUpgradeIgnoredAlert:
            upgrader.alreadyIgnoredThisVersion(),
      },
    );

    clevertapService.trackEvent(
      eventName: TrackingEvents.placeOrderSuccessOriginal,
      properties: {
        if (orderDetail.processingStatus.isInQueue)
          TrackingProps.queueNumber: orderQueueNumber,
        TrackingProps.orderNumber: orderDetail.trackingOrderId,
        TrackingProps.grandTotal: orderDetail.totalValue,
        TrackingProps.lineNumber:
            orderDetail.orderHistoryDetailsOrderItem.length,
      },
    );

    for (final item in orderDetail.orderHistoryDetailsOrderItem) {
      final isOffer = item.showOfferTag;
      final productTag = item.productTag;

      final tags = <String>[];
      if (isOffer) tags.add('On Offer');
      if (productTag.getOrDefaultValue('').isNotEmpty) {
        tags.add(productTag.displayStatusText);
      }
      final bannerData = (await materialBannerStorage.get(
        materialNumber: item.productType.typeBundle
            ? '${MaterialNumber(item.parentId).displayMatNo}_${item.materialNumber.displayMatNo}'
            : item.materialNumber.displayMatNo,
      ))
          .toDomain();

      mixpanelService.trackEvent(
        eventName: TrackingEvents.successfulOrderItem,
        properties: {
          TrackingProps.orderNumber: orderQueueNumber,
          TrackingProps.productName: item.materialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productQty: item.qty,
          TrackingProps.grandTotal: item.totalPrice,
          TrackingProps.unitPrice: item.unitPrice,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.fromBanner: bannerData.isNotEmpty,
          TrackingProps.bannerId: bannerData.id,
          TrackingProps.bannerTitle: bannerData.title,
          TrackingProps.tag: tags.join(', '),
        },
      );

      clevertapService.trackEvent(
        eventName: TrackingEvents.successfulOrderItem,
        properties: {
          TrackingProps.orderNumber: orderQueueNumber,
          TrackingProps.productName: item.materialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productQty: item.qty,
          TrackingProps.grandTotal: item.totalPrice,
          TrackingProps.unitPrice: item.unitPrice,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.fromBanner: bannerData.isNotEmpty,
          TrackingProps.bannerId: bannerData.id,
          TrackingProps.bannerTitle: bannerData.title,
          TrackingProps.tag: tags.join(', '),
        },
      );
    }
  }

  SubmitOrder _getSubmitOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required DeliveryInfoData data,
    required List<PriceAggregate> cartProducts,
    required double orderValue,
    required double totalTax,
    required double zpSmallOrderFee,
    required double mpSmallOrderFee,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required SalesOrganisationConfigs configs,
  }) {
    return SubmitOrder(
      userName: data.contactPerson.getValue().isNotEmpty
          ? data.contactPerson.getValue()
          : user.username.getOrDefaultValue(''),
      poReference: data.poReference.getValue(),
      referenceNotes: data.referenceNote.getOrDefaultValue(''),
      specialInstructions: data.deliveryInstruction.getOrDefaultValue(''),
      companyName: CompanyName(shipToInfo.shipToName.toString()),
      requestedDeliveryDate: data.deliveryDate.getOrDefaultValue(''),
      poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      telephone: data.mobileNumber.getOrDefaultValue(''),
      collectiveNumber: '',
      paymentTerms:
          cartProducts.tenderContractSubmitted.contractPaymentTerm.isNotEmpty
              ? cartProducts.tenderContractSubmitted.contractPaymentTerm
                  .getOrDefaultValue('')
              : data.paymentTerm.getPaymentTerm,
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
      totalTax: totalTax,
      language: user.settings.languagePreference.languageCode,
      paymentMethod: 'Bank Transfer',
      orderType: getOrderType(
        cartItems: cartProducts,
        customerCodeInfo: customerCodeInfo,
        salesOrg: salesOrganisation.salesOrg,
      ),
      purchaseOrderType: user.role.type.purchaseOrderType,
      smallOrderFeeDetail: SmallOrderFeeDetail(
        zpSmallOrderFee: zpSmallOrderFee,
        mpSmallOrderFee: mpSmallOrderFee,
        currency: configs.currency,
      ),
      orderReason: _getOrderReason(
        cartItems: cartProducts,
        customerCodeInfo: customerCodeInfo,
      ),
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
    cartProducts.expand<SubmitMaterialInfo>(
      (element) {
        if (element.materialInfo.type.typeMaterial) {
          return [element.toSubmitMaterialInfo()];
        }
        if (element.materialInfo.type.typeBundle) {
          return element.bundle.materials.map(
            (el) => PriceAggregate.empty()
                .copyWith(
                  materialInfo: el,
                  quantity: el.quantity.intValue,
                  salesOrgConfig: element.salesOrgConfig,
                  bundle: element.bundle,
                )
                .toSubmitMaterialInfo(),
          );
        }
        if (element.materialInfo.type.typeCombo) {
          return element.comboMaterials.map(
            (comboMaterial) => comboMaterial.toSubmitMaterialInfo(),
          );
        }

        return <SubmitMaterialInfo>[];
      },
    ).toList();

String getOrderType({
  required List<PriceAggregate> cartItems,
  required CustomerCodeInfo customerCodeInfo,
  required SalesOrg salesOrg,
}) {
  final hasFocMaterial =
      cartItems.any((element) => element.materialInfo.isFOCMaterial);

  if (hasFocMaterial) {
    if (salesOrg.isSg && customerCodeInfo.customerAttr7.isZEV) {
      return 'ZPFC';
    } else if (salesOrg.isPH && customerCodeInfo.customerGrp4.isVP) {
      return 'ZPVF';
    } else if (salesOrg.isPH && customerCodeInfo.customerGrp4.isVR) {
      return 'ZPFV';
    }
  }

  return '';
}

String _getOrderReason({
  required List<PriceAggregate> cartItems,
  required CustomerCodeInfo customerCodeInfo,
}) {
  if (cartItems.containCovidMaterial && customerCodeInfo.customerGrp4.isVR) {
    return '802';
  }

  return cartItems.tenderContractSubmitted.tenderOrderReason
      .getOrDefaultValue('');
}
