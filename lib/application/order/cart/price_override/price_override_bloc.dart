import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
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
      initialized: (e) async => emit(PriceOverrideState.initial()),
      onPriceValueChange: (e) async {
        final newCounterOfferPrice = CounterOfferValue(e.newPrice);
        if (!newCounterOfferPrice.isValid()) {
          emit(state.copyWith(showErrorMessages: true));

          return;
        }
        emit(
          state.copyWith(
            showErrorMessages: false,
            counterOfferDetails: state.counterOfferDetails.copyWith(
              counterOfferPrice: newCounterOfferPrice,
            ),
          ),
        );
      },
      onRemarksValueChange: (e) async => emit(
        state.copyWith(
          counterOfferDetails: state.counterOfferDetails.copyWith(
            comment: StringValue(e.newRemarks),
          ),
        ),
      ),
      fetch: (_Fetch value) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
            showErrorMessages: false,
          ),
        );
        final failureOrSuccess = await priceOverrideRepository.updateItemPrice(
          newPrice:
              state.counterOfferDetails.counterOfferPrice.counterOfferValue,
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
                overriddenMaterialPrice: itemPrice.copyWith(
                  isPriceOverride: true,
                ),
                cartItemList: [
                  itemPrice.copyWith(
                    zdp8Override: value.item.price.zdp8Override,
                    priceOverride: state.priceOverrideValue,
                    isPriceOverride: true,
                  ),
                ],
              ),
            );
          },
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
