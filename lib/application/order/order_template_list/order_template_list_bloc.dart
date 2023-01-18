import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_template_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
          (currentTemplateList) {
            emit(state.copyWith(
              orderTemplateList: currentTemplateList,
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
      templateNameChanged: (e) {
        emit(
          state.copyWith(
            templateName: TemplateName(e.templateNameStr),
          ),
        );
      },
      save: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            isSubmitting: true,
            showErrorMessages: false,
            orderTemplateList: e.templateList,
          ),
        );
        final isTemplateNameValid = state.templateName.isValid();
        if (isTemplateNameValid) {
          final failureOrSuccess =
              await orderTemplateRepository.saveOrderTemplate(
            templateName: state.templateName.getValue(),
            userID: e.userID,
            cartList: e.cartList,
            templateList: e.templateList,
          );

          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                  isSubmitting: false,
                ),
              );
            },
            (templateList) {
              emit(
                state.copyWith(
                  orderTemplateList: templateList,
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                  isSubmitting: false,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              isFetching: false,
              isSubmitting: false,
              showErrorMessages: true,
            ),
          );
        }
      },
    );
  }
}
