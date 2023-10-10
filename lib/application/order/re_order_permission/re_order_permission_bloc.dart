import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
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
      initialized: (_) async => emit(ReOrderPermissionState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            orderNumberWillUpsert: e.orderNumberWillUpsert,
          ),
        );

        final failureOrSuccess =
            await reOrderPermissionRepository.getReorderPermission(
          salesOrganisation: e.salesOrganisation,
          materialNumbers: e.orderHistoryDetailsOrderItems
              .map((e) => e.materialNumber)
              .toList(),
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (reOrderPermission) {
            final validOrderHistoryDetailsOrderItems =
                e.orderHistoryDetailsOrderItems
                    .where(
                      (orderHistoryDetailsOrderItem) =>
                          reOrderPermission.validMaterials
                              .map((e) => e.materialNumber)
                              .contains(
                                orderHistoryDetailsOrderItem.materialNumber,
                              ) &&
                          orderHistoryDetailsOrderItem.type.isMaterialTypeComm,
                    )
                    .toList();

            emit(
              state.copyWith(
                isFetching: false,
                validOrderHistoryDetailsOrderItems:
                    validOrderHistoryDetailsOrderItems,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      resetOrderNumberWillUpsert: (_ResetOrderNumberWillUpsert e) async => emit(
        state.copyWith(
          orderNumberWillUpsert: e.orderNumberWillUpsert,
        ),
      ),
    );
  }
}
