import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/returns/entities/return_price.dart';

import 'package:ezrxmobile/domain/returns/repository/i_return_price_repository.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';


part 'return_price_event.dart';
part 'return_price_state.dart';
part 'return_price_bloc.freezed.dart';

class ReturnPriceBloc extends Bloc<ReturnPriceEvent, ReturnPriceState> {
  final IReturnPriceRepository returnPriceRepository;
  ReturnPriceBloc({required this.returnPriceRepository})
      : super(ReturnPriceState.initial()) {
    on<ReturnPriceEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnPriceEvent event,
    Emitter<ReturnPriceState> emit,
  ) async {
    await event.map(
      fetchReturnPrice: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isFetching: true,
            returnPrice: <String, ReturnPrice>{},
          ),
        );
        final failureOrSuccess = await returnPriceRepository.fetchReturnPrice(
          salesOrg: value.salesOrg,
          returnItemsList: value.returnItemList,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (returnPrice) {
            emit(
              state.copyWith(
                returnPrice: returnPrice,
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}
