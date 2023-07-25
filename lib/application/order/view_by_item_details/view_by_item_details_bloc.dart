import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_details_event.dart';
part 'view_by_item_details_state.dart';
part 'view_by_item_details_bloc.freezed.dart';

class ViewByItemDetailsBloc
    extends Bloc<ViewByItemDetailsEvent, ViewByItemDetailsState> {
  final IViewByItemDetailsRepository viewByItemDetailsRepository;

  ViewByItemDetailsBloc({
    required this.viewByItemDetailsRepository,
  }) : super(ViewByItemDetailsState.initial()) {
    on<ViewByItemDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByItemDetailsEvent event,
    Emitter<ViewByItemDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ViewByItemDetailsState.initial()),
      fetch: (e) async {
        emit(
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByItemDetailsRepository.getViewByItemDetails(
          soldTo: e.soldTo,
          user: e.user,
          orderHistoryItem: e.orderHistoryItem,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (viewByItemDetails) {
            emit(
              state.copyWith(
                viewByItemDetails: viewByItemDetails,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
