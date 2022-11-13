import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
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
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
        final failureOrSuccess =
            await priceOverrideRepository.updateItemPrice();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (itemPrice) {
            //update the cart with latest item
            // itemPrice.isOverride = true;

            emit(
              state.copyWith(
                cartItemList: itemPrice,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      initialized: (_Initialized value) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );
      },
    );
  }
}
