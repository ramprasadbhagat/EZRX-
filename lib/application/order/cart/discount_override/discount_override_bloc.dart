import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_discount_override_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_override_event.dart';
part 'discount_override_state.dart';
part 'discount_override_bloc.freezed.dart';

class DiscountOverrideBloc
    extends Bloc<DiscountOverrideEvent, DiscountOverrideState> {
  final IDiscountOverrideRepository repository;
  DiscountOverrideBloc({
    required this.repository,
  }) : super(DiscountOverrideState.initial()) {
    on<DiscountOverrideEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    DiscountOverrideEvent event,
    Emitter<DiscountOverrideState> emit,
  ) async {
    await event.map(
      fetch: (_Fetch e) async {
        final failureOrSuccess = await repository.getMaterialPriceWithOverride(
          customerCodeInfo: e.customerCode,
          salesOrganisation: e.salesOrganisation,
          price: e.price,
        );
        await failureOrSuccess.fold(
          (_) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (price) async {
            emit(
              state.copyWith(
                materialPrice: price.copyWith(
                  zdp8Override: e.price.zdp8Override,
                  isPriceOverride: e.price.isPriceOverride,
                  priceOverride: e.price.priceOverride,
                ),
                apiFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      update: (_Update e) {
        emit(
          state.copyWith(
            materialPrice: e.price,
            showErrorMessages: e.showErrorMessages,
            apiFailureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}
