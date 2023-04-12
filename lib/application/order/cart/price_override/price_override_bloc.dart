import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/order/repository/i_price_override_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_override_event.dart';
part 'price_override_state.dart';
part 'price_override_bloc.freezed.dart';

class PriceOverrideBloc extends Bloc<PriceOverrideEvent, PriceOverrideState> {
  final IPriceOverrideRepository priceOverrideRepository;
  PriceOverrideBloc({
    required this.priceOverrideRepository,
  }) : super(PriceOverrideState.initial()) {
    on<PriceOverrideEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PriceOverrideEvent event,
    Emitter<PriceOverrideState> emit,
  ) async {
    await event.map(
      fetch: (_Fetch value) async {
        final isPriceOverrideValue = state.priceOverrideValue.isValid();

        if (isPriceOverrideValue) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              isFetching: true,
              showErrorMessages: false,
            ),
          );
          final failureOrSuccess =
              await priceOverrideRepository.updateItemPrice(
            newPrice: state.priceOverrideValue.getOrCrash(),
            customerCodeInfo: value.customerCodeInfo,
            item: value.item,
            salesOrganisation: value.salesOrganisation,
          );
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  showErrorMessages: true,
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                ),
              );
            },
            (itemPrice) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                  showErrorMessages: false,
                  cartItemList: itemPrice
                      .map(
                        (e) => e.copyWith(
                          zdp8Override: value.item.price.zdp8Override,
                          priceOverride: state.priceOverrideValue,
                          isPriceOverride: true,
                        ),
                      )
                      .toList(),
                ),
              );
            },
          );
        } else {
          emit(state.copyWith(showErrorMessages: true));
        }
      },
      initialized: (_Initialized value) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
            priceOverrideValue: PriceOverrideValue(0.0),
          ),
        );
      },
      priceOverrideValueChanged: (_PriceOverrideValueChanged value) {
        emit(
          state.copyWith(
            priceOverrideValue: PriceOverrideValue(
              double.parse(value.newPrice),
            ),
            showErrorMessages: false,
          ),
        );
      },
    );
  }
}
