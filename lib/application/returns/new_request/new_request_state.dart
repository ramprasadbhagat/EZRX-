part of 'new_request_bloc.dart';

@freezed
class NewRequestState with _$NewRequestState {
  const NewRequestState._();
  const factory NewRequestState({
    required List<ReturnMaterial> selectedItems,
    required List<InvoiceDetails> invoiceDetails,
    required String returnReference,
    required String specialInstructions,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ApiFailure, String>> failureOrSuccessOption,
  }) = _NewRequestState;

  factory NewRequestState.initial() => NewRequestState(
        selectedItems: <ReturnMaterial>[],
        invoiceDetails: <InvoiceDetails>[],
        showErrorMessages: false,
        isSubmitting: false,
        returnReference: '',
        specialInstructions: '',
        failureOrSuccessOption: none(),
      );

  bool get isSelectedItemsValid => selectedItems
      .every((item) => selectedItems.first.principalCode == item.principalCode);

  bool get isAdditionInfoValid =>
      allItemDetails.isNotEmpty &&
      allItemDetails.every((details) => details.isValid);

  bool get isReturnQuantityValid => !allItemDetails.any(
        (details) =>
            details.returnQuantity.getIntValue >
            getReturnMaterial(details.itemNumber)
                .balanceQuantity
                .getOrDefaultValue(0),
      );

  List<ReturnItemDetails> get allItemDetails =>
      invoiceDetails.expand((e) => e.returnItemDetailsList).toList();

  ReturnItemDetails getReturnItemDetails(String uuid) =>
      allItemDetails.firstWhere(
        (element) => element.uuid == uuid,
        orElse: () => ReturnItemDetails.empty(),
      );

  InvoiceDetails getInvoiceDetail(String assignmentNumber) =>
      invoiceDetails.firstWhere(
        (element) => element.invoiceNumber == assignmentNumber,
        orElse: () => InvoiceDetails.empty(),
      );

  ReturnMaterial getReturnMaterial(String itemNumber) {
    var existedItem = selectedItems.firstWhere(
      (element) => element.itemNumber == itemNumber,
      orElse: () => ReturnMaterial.empty(),
    );
    if (existedItem.itemNumber.isEmpty) {
      final bonusItems =
          selectedItems.map((item) => item.bonusItems).flattened.toList();
      existedItem = bonusItems.firstWhere(
        (element) => element.itemNumber == itemNumber,
        orElse: () => ReturnMaterial.empty(),
      );
    }

    return existedItem;
  }

  double getUnitPrice(String itemNumber) =>
      getReturnMaterial(itemNumber).unitPrice.getOrDefaultValue(0);

  double returnItemTotal(String assignmentNumber) =>
      getInvoiceDetail(assignmentNumber).returnItemDetailsList.fold<double>(
            0,
            (sum, item) =>
                sum +
                item.returnValue(
                  getUnitPrice(item.itemNumber),
                ),
          );

  double get returnTotal => allItemDetails.fold<double>(
        0,
        (sum, item) =>
            sum +
            item.returnValue(
              getUnitPrice(item.itemNumber),
            ),
      );
}
