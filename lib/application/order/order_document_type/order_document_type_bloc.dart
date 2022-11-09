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

  Future<void> _onEvent(event, emit) async {
    await event.map(
        initialized: (_) => emit(OrderDocumentTypeState.initial()),
        fetch: (e) async {
          emit(state.copyWith(isSubmitting: true,));
          final failureOrSuccess =
              await orderDocumentTypeRepository.getOrderDocumentTypList(
                  salesOrganisation: e.salesOrganisation,);
          failureOrSuccess.fold(
            (failure) => emit(state.copyWith(
              orderDocumentTypeListFailureOrSuccessOption:
                  optionOf(failureOrSuccess),
              isSubmitting: false,
            )),
            (orderDocumentTypeList) => emit(state.copyWith(
              orderDocumentTypeListFailureOrSuccessOption:
                  optionOf(failureOrSuccess),
              isSubmitting: false,
              orderDocumentTypeList: orderDocumentTypeList,
            )),
          );
        },
        selectedOrderType: (e) {
          if(e.isReasonSelected){
            emit(state.copyWith(
              isReasonSelected: true,
              selectedReason: e.selectedOrderType,
            ));
          }else{
            emit(state.copyWith(
              isOrderTypeSelected: true,
              selectedOrderType: e.selectedOrderType,
            ));
          }
        },
        );
  }
}
