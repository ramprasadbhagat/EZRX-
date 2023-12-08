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
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';
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
  Future<Either<ApiFailure, SubmitOrderResponse>> submitOrder({
    required ShipToInfo shipToInfo,
    required User user,
    required List<PriceAggregate> cartProducts,
    required double grandTotal,
    required double orderValue,
    required double smallOrderFee,
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
          submitOrderData.addAll({'deliveryFee': smallOrderFee.toString()});
        }
      }

      final encryptedData = encryption.encryptionData(
        data: submitOrderData,
      );

      final submitOrderResponse =
          await remoteDataSource.submitOrder(orderEncryption: encryptedData);

      return Right(submitOrderResponse);
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
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required List<PriceAggregate> cartProducts,
    required ShipToInfo shipToInfo,
  }) async {
    const apiRetryCounter = 15;

    if (config.appFlavor == Flavor.mock) {
      try {
        final result =
            await orderDetailLocalDataSource.getOrderHistoryDetails();

        return Right(result);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    for (var i = 1; i <= apiRetryCounter; i++) {
      await Future.delayed(const Duration(seconds: 2));

      try {
        final orderHistoryDetails =
            await orderHistoryDetailsRemoteDataSource.getOrderHistoryDetails(
          searchKey: orderResponse.salesDocument,
          language: user.preferredLanguage.languageCode,
          soldTo: customerCodeInfo.customerCodeSoldTo,
          salesOrg: salesOrganisation.salesOrg.getOrCrash(),
          shipTo: shipToInfo.shipToCustomerCode,
        );

        final orderHistoryDetailsWithMaterialInfo =
            orderHistoryDetails.copyWith(
          orderHistoryDetailsOrderItem:
              orderHistoryDetails.orderHistoryDetailsOrderItem.map(
            (e) {
              final priceAggregate = cartProducts.firstWhere(
                (element) {
                  return element.getMaterialNumber ==
                      MaterialNumber(e.parentId);
                },
                orElse: () => PriceAggregate.empty(),
              );

              return e.copyWith(
                material: MaterialInfo.empty().copyWith(
                  materialNumber: priceAggregate.getMaterialNumber,
                  bundle: priceAggregate.bundle,
                ),
              );
            },
          ).toList(),
        );

        return Right(orderHistoryDetailsWithMaterialInfo);
      } catch (e) {
        if (i == apiRetryCounter) {
          return Left(
            FailureHandler.handleFailure(e),
          );
        }
      }
    }

    return Right(OrderHistoryDetails.empty());
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

  SubmitOrder _getSubmitOrderRequest({
    required ShipToInfo shipToInfo,
    required User user,
    required DeliveryInfoData data,
    required List<PriceAggregate> cartProducts,
    required double orderValue,
    required double totalTax,
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
      totalTax: totalTax,
      language: user.settings.languagePreference.languageCode,
      paymentMethod: 'Bank Transfer',
      orderType: getOrderType(
        cartItems: cartProducts,
        customerCodeInfo: customerCodeInfo,
      ),
      purchaseOrderType: user.role.type.purchaseOrderType,
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
}) {
  final hasFocMaterial =
      cartItems.any((element) => element.materialInfo.isFOCMaterial);

  if (hasFocMaterial) {
    if (customerCodeInfo.customerGrp4.isVP) {
      return 'ZPFV';
    } else if (customerCodeInfo.customerGrp4.isVR) {
      return 'ZPVF';
    }
  }

  return 'ZPOR';
}
