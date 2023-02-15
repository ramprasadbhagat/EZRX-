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

  bool get _dateFilterNotApplied =>
      !approverReturnFilter.fromInvoiceDate.isValid() &&
      !approverReturnFilter.toInvoiceDate.isValid();

  bool get _validDateFilter => _dateFilterNotApplied || _dateFilterApplied;

  bool get allFilterValid {
    return approverReturnFilter.returnId.isValid() &&
        approverReturnFilter.createdBy.isValid() &&
        approverReturnFilter.shipTo.isValid() &&
        approverReturnFilter.soldTo.isValid() &&
        _validDateFilter;
  }

  bool get anyFilterApplied =>
      approverReturnFilter.returnId.validFilterSearchKey ||
      approverReturnFilter.createdBy.validFilterSearchKey ||
      approverReturnFilter.shipTo.validFilterSearchKey ||
      approverReturnFilter.soldTo.validFilterSearchKey ||
      _dateFilterApplied;

  List<FilterStatus> get sortParameters =>
      approverReturnStatus.map((e) => FilterStatus(e)).toList();

  FilterStatus get activeSort => approverReturnFilter.sortBy;
}

const List<String> approverReturnStatus = [
  'ALL',
  'PENDING',
  'COMPLETED',
];
