part of 'order_document_type_bloc.dart';

@freezed
class OrderDocumentTypeState with _$OrderDocumentTypeState {
  const OrderDocumentTypeState._();
  const factory OrderDocumentTypeState({
    required bool isSubmitting,
    required Option<Either<ApiFailure, List<OrderDocumentType>>>
        orderDocumentTypeListFailureOrSuccessOption,
    required List<OrderDocumentType> orderDocumentTypeList,
    required bool isOrderTypeSelected,
    required OrderDocumentType selectedOrderType,
    required bool isReasonSelected,
    required OrderDocumentType selectedReason,
  }) = _OrderDocumentTypeState;

  factory OrderDocumentTypeState.initial() => OrderDocumentTypeState(
        isSubmitting: false,
        orderDocumentTypeListFailureOrSuccessOption: none(),
        orderDocumentTypeList: <OrderDocumentType>[],
        isOrderTypeSelected: false,
        selectedOrderType: OrderDocumentType.empty(),
        isReasonSelected: false,
        selectedReason: OrderDocumentType.empty(),
      );

  List<OrderDocumentType> get reasonList => orderDocumentTypeList
      .where(
        (el) =>
            el.documentType == selectedOrderType.documentType &&
            el.orderReason.isNotEmpty,
      )
      .toList();

  List<OrderDocumentType> get uniqueOrderTypeList {
    final uniqueSet = <String>{};

    return orderDocumentTypeList
        .where((e) => uniqueSet.add(e.documentType.getOrCrash()))
        .toList();
  }

  bool get isSpecialOrderType =>
      selectedOrderType.documentType.isSpecialOrderType;

  bool get isReasonFieldEnable =>
      isOrderTypeSelected &&
      selectedOrderType.documentType.isSpecialOrderType &&
      reasonList.isNotEmpty;
}
