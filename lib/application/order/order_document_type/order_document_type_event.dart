part of 'order_document_type_bloc.dart';

@freezed
class OrderDocumentTypeEvent with _$OrderDocumentTypeEvent {
  const factory OrderDocumentTypeEvent.initialized() = _Initialized;
  const factory OrderDocumentTypeEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _FetchOrderDocumentType;
  const factory OrderDocumentTypeEvent.selectedOrderType({
    required OrderDocumentType selectedOrderType,
    required bool isReasonSelected,
  }) = _SelectedOrderType;
}