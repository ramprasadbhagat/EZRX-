import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
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
  Future<Either<ApiFailure, bool>> createDraftOrder({
    required ShipToCodeState shipToCodeState,
    required UserState userState,
    required CartState cartState,
    required CustomerCodeState customerCodeState,
    required SalesOrgState salesOrgStateState,
  }) async {
    final draftOrder = _getCreateDraftOrderRequest(
      shipToCodeState: shipToCodeState,
      userState: userState,
      cartState: cartState,
      customerCodeState: customerCodeState,
      salesOrgStateState: salesOrgStateState,
    );
    if (config.appFlavor == Flavor.mock) {
      try {
        return const Right(true);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    throw UnimplementedError();
  }

  List<MaterialItem> _getItemList(CartState cartState) {
    final cartItemList = cartState.cartItemList;

    return cartItemList
        .map((item) => MaterialItem.empty().copyWith(
              materialNumber: item.materialInfo.materialNumber,
              qty: item.quantity,
              defaultMaterialDescription: item.materialInfo.materialDescription,
              type: 'Comm',
              itemRegistrationNumber: item.materialInfo.itemRegistrationNumber,
              unitOfMeasurement: item.materialInfo.unitOfMeasurement,
              zdp8Override: item.isOverride,
              hidePrice: item.materialInfo.hidePrice,
              materialGroup2: item.materialInfo.materialGroup2,
              materialGroup4: item.materialInfo.materialGroup4,
            ))
        .toList();
  }

//TODO : Will revisit
  SavedOrder _getCreateDraftOrderRequest({
    required ShipToCodeState shipToCodeState,
    required UserState userState,
    required CartState cartState,
    required CustomerCodeState customerCodeState,
    required SalesOrgState salesOrgStateState,
  }) {
    //bonus calculation

    return SavedOrder.empty().copyWith(
      deliveryDocument: shipToCodeState.shipToInfo.shipToName.name1,
      billingDocument: customerCodeState.customerCodeInfo.customerName.name1,
      salesOrganization:
          salesOrgStateState.salesOrganisation.salesOrg.getOrCrash(),
      principal: '',
      soldToParty:
          SoldToParty(customerCodeState.customerCodeInfo.customerCodeSoldTo),
      shipToParty: ShipToParty(shipToCodeState.shipToInfo.shipToCustomerCode),
      processingStatus: 'Draft',
      companyName:
          CompanyName(shipToCodeState.shipToInfo.shipToName.toString()),
      country: shipToCodeState.shipToInfo.region,
      postCode1: shipToCodeState.shipToInfo.postalCode,
      specialInstructions:
          data[AdditionalInfoLabelList.specialInstruction] ?? '',
      poReference: data[AdditionalInfoLabelList.customerPoReference] ?? '',
      payTerm: data[AdditionalInfoLabelList.paymentTerm] ?? '',
      collectiveNo: data[AdditionalInfoLabelList.collectiveNumber] ?? '',
      totalOrderValue: cartState.grandTotal,
      draftorder: true,
      address1: shipToCodeState.shipToInfo.shipToAddress.street,
      address2: shipToCodeState.shipToInfo.shipToAddress.street2,
      city: shipToCodeState.shipToInfo.city1,
      phonenumber: data[AdditionalInfoLabelList.contactNumber] ?? '',
      user: userState.user.id,
      contactPerson: data[AdditionalInfoLabelList.contactPerson] ?? '',
      referenceNotes: data[AdditionalInfoLabelList.referenceNote] ?? '',
      items: _getItemList(cartState),
    );
  }
}
