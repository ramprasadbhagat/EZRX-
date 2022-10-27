import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_template_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template_list_bloc.freezed.dart';
part 'order_template_list_event.dart';
part 'order_template_list_state.dart';

class OrderTemplateListBloc
    extends Bloc<OrderTemplateListEvent, OrderTemplateListState> {
  final IOrderTemplateRepository orderTemplateRepository;

  OrderTemplateListBloc({
    required this.orderTemplateRepository,
  }) : super(OrderTemplateListState.initial()) {
    on<OrderTemplateListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderTemplateListEvent event,
    Emitter<OrderTemplateListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(OrderTemplateListState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            orderTemplateList: <OrderTemplate>[],
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await orderTemplateRepository.getOrderTemplateList(user: e.user);
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (currentTempleteList) {
            emit(state.copyWith(
              orderTemplateList: currentTempleteList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ));
          },
        );
      },
      delete: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await orderTemplateRepository.deleteOrderTemplate(
          templateList: state.orderTemplateList,
          templateItem: e.tempItem,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (templateItems) {
            emit(state.copyWith(
              orderTemplateList: templateItems,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ));
          },
        );
      },
    );
  }
}

