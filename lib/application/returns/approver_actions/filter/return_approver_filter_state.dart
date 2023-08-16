part of 'return_approver_filter_bloc.dart';

@freezed
class ReturnApproverFilterState with _$ReturnApproverFilterState {
  const ReturnApproverFilterState._();
  const factory ReturnApproverFilterState({
    required ReturnApproverFilter approverReturnFilter,
    required bool isSubmitting,
    required bool showErrorMessages,
  }) = _ReturnApproverFilterState;

  factory ReturnApproverFilterState.initial() => ReturnApproverFilterState(
        isSubmitting: false,
        approverReturnFilter: ReturnApproverFilter.empty(),
        showErrorMessages: false,
      );

  bool get _dateFilterApplied =>
      approverReturnFilter.fromInvoiceDate.isValid() &&
      approverReturnFilter.toInvoiceDate.isValid();

  bool get areFiltersValid {
    return approverReturnFilter.returnId.isValid() &&
        approverReturnFilter.createdBy.isValid() &&
        approverReturnFilter.shipTo.isValid() &&
        approverReturnFilter.soldTo.isValid();
  }

  bool get anyFilterApplied =>
      approverReturnFilter.returnId.isNotEmpty ||
      approverReturnFilter.createdBy.isNotEmpty ||
      approverReturnFilter.shipTo.isNotEmpty ||
      approverReturnFilter.soldTo.isNotEmpty ||
      _dateFilterApplied;

  List<FilterStatus> get sortParameters =>
      approverReturnStatus.map((e) => FilterStatus(e)).toList();

  FilterStatus get activeSort => approverReturnFilter.sortBy;

  bool get approverReturnFilterIsEmpty =>
      approverReturnFilter == ReturnApproverFilter.empty();
}

const List<String> approverReturnStatus = [
  'ALL',
  'PENDING',
  'COMPLETED',
];
