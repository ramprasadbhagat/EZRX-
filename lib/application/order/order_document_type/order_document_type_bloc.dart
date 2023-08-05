import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_document_type_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_document_type_event.dart';
part 'order_document_type_state.dart';
part 'order_document_type_bloc.freezed.dart';

class OrderDocumentTypeBloc
    extends Bloc<OrderDocumentTypeEvent, OrderDocumentTypeState> {
  final IOrderDocumentTypeRepository orderDocumentTypeRepository;
  OrderDocumentTypeBloc({required this.orderDocumentTypeRepository})
      : super(OrderDocumentTypeState.initial()) {
    on<OrderDocumentTypeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderDocumentTypeEvent event,
    Emitter<OrderDocumentTypeState> emit,
  ) async {
    await event.map(
      initialized: (_) {
        add(const OrderDocumentTypeEvent.deleteOrderTypeFromStorage());
      },
      deleteOrderTypeFromStorage: (_) async {
        final failureOrSuccess =
            await orderDocumentTypeRepository.deleteOrderTypeFromCartStorage();
        failureOrSuccess.fold(
          (failure) {
            emit(OrderDocumentTypeState.initial());
          },
          (orderDocumentType) {
            emit(OrderDocumentTypeState.initial());
          },
        );
      },
      fetch: (e) async {
        emit(
          OrderDocumentTypeState.initial().copyWith(
            isSubmitting: true,
          ),
        );
        final failureOrSuccess =
            await orderDocumentTypeRepository.getOrderDocumentTypList(
          salesOrganisation: e.salesOrganisation,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              orderDocumentTypeListFailureOrSuccessOption:
                  optionOf(failureOrSuccess),
              isSubmitting: false,
            ),
          ),
          (orderDocumentTypeList) {
            if (e.isEDI) {
              orderDocumentTypeList
                  .removeWhere((item) => item.documentType.isZPOR);
            }
            final storedOrderType = _getOrderTypeFromStorage();
            final selectedOrderType =
                storedOrderType != OrderDocumentType.empty()
                    ? orderDocumentTypeList.contains(storedOrderType)
                        ? storedOrderType
                        : orderDocumentTypeList.first
                    : orderDocumentTypeList.first;
            add(
              OrderDocumentTypeEvent.selectedOrderType(
                selectedOrderType: selectedOrderType,
                isReasonSelected: false,
              ),
            );
            emit(
              state.copyWith(
                orderDocumentTypeListFailureOrSuccessOption:
                    optionOf(failureOrSuccess),
                isSubmitting: false,
                orderDocumentTypeList: orderDocumentTypeList,
              ),
            );
          },
        );
      },
      selectedOrderType: (e) async {
        final failureOrSuccess = await orderDocumentTypeRepository
            .putOrderTypeToCartStorage(orderType: e.selectedOrderType);
        failureOrSuccess.fold(
          (failure) => _emitterAfterOrderTypeSelected(
            isReasonSelected: e.isReasonSelected,
            selectedOrderType: e.selectedOrderType,
            emit: emit,
          ),
          (orderDocumentType) => _emitterAfterOrderTypeSelected(
            isReasonSelected: e.isReasonSelected,
            selectedOrderType: e.selectedOrderType,
            emit: emit,
          ),
        );
      },
    );
  }

  void _emitterAfterOrderTypeSelected({
    required bool isReasonSelected,
    required OrderDocumentType selectedOrderType,
    required Emitter<OrderDocumentTypeState> emit,
  }) {
    if (isReasonSelected) {
      emit(
        state.copyWith(
          isReasonSelected: true,
          selectedReason: selectedOrderType,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isOrderTypeSelected: true,
          selectedOrderType: selectedOrderType,
        ),
      );
    }
  }

  OrderDocumentType _getOrderTypeFromStorage() {
    final orderTypeFromStorage =
        orderDocumentTypeRepository.getOrderTypeFromCartStorage();

    return orderTypeFromStorage.fold(
      (failure) {
        return OrderDocumentType.empty();
      },
      (orderDocumentType) {
        return orderDocumentType;
      },
    );
  }
}
