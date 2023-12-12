import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_re_order_permission_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 're_order_permission_bloc.freezed.dart';
part 're_order_permission_event.dart';
part 're_order_permission_state.dart';

class ReOrderPermissionBloc
    extends Bloc<ReOrderPermissionEvent, ReOrderPermissionState> {
  final IReOrderPermissionRepository reOrderPermissionRepository;

  ReOrderPermissionBloc({
    required this.reOrderPermissionRepository,
  }) : super(ReOrderPermissionState.initial()) {
    on<ReOrderPermissionEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ReOrderPermissionEvent event,
    Emitter<ReOrderPermissionState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(
        ReOrderPermissionState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToInfo: e.shipToInfo,
        ),
      ),
      fetchOrder: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            orderNumberWillUpsert: e.orderNumberWillUpsert,
          ),
        );

        final failureOrSuccess =
            await reOrderPermissionRepository.getReorderPermission(
          salesOrganisation: state.salesOrganisation,
          materialNumbers: e.orderHistoryDetailsOrderItems
              .map((e) => e.materialNumber)
              .toList(),
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (reOrderPermission) {
            final validMaterialNumbers =
                reOrderPermission.validMaterials.map((e) => e.materialNumber);
            final validOrderItem = e.orderHistoryDetailsOrderItems
                .where(
                  (item) =>
                      validMaterialNumbers.contains(item.materialNumber) &&
                      item.type.isMaterialTypeComm,
                )
                .map((item) => item.reOrderMaterialInfo)
                .toList();

            emit(
              state.copyWith(
                isFetching: false,
                validOrderItems: validOrderItem,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      fetchItem: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final reOrderItem = e.item.isBonusMaterial
            ? e.orderHistoryDetail.getParentMaterial(e.item)
            : e.item;
        final validOrderItem = reOrderItem.reOrderMaterialInfo;

        final failureOrSuccess =
            await reOrderPermissionRepository.getReorderPermission(
          salesOrganisation: state.salesOrganisation,
          materialNumbers: [reOrderItem.materialNumber],
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (reOrderPermission) {
            final validMaterialNumbers =
                reOrderPermission.validMaterials.map((e) => e.materialNumber);

            emit(
              state.copyWith(
                isFetching: false,
                validOrderItems: [
                  if (validMaterialNumbers
                      .contains(validOrderItem.materialNumber))
                    validOrderItem,
                ],
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      resetOrderNumberWillUpsert: (e) async => emit(
        state.copyWith(
          orderNumberWillUpsert: e.orderNumberWillUpsert,
        ),
      ),
    );
  }
}
