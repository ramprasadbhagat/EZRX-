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
    required String returnRequestId,
    required SalesOrg salesOrg,
  }) = _NewRequestState;

  factory NewRequestState.initial() => NewRequestState(
        selectedItems: <ReturnMaterial>[],
        invoiceDetails: <InvoiceDetails>[],
        showErrorMessages: false,
        isSubmitting: false,
        returnReference: '',
        specialInstructions: '',
        failureOrSuccessOption: none(),
        returnRequestId: '',
        salesOrg: SalesOrg(''),
      );

  bool get isSelectedItemsValid =>
      salesOrg.isSg ||
      selectedItems.every(
        (item) => selectedItems.first.principalCode == item.principalCode,
      );

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

  bool isIncludeBonus(String uuid) =>
      getReturnItemDetails(uuid) != ReturnItemDetails.empty();

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

  double _returnTax(SalesOrganisationConfigs config) =>
      returnTotal * config.vatValue / 100;

  double returnSubtotalWithTax(SalesOrganisationConfigs config) =>
      returnTotal + _returnTax(config);

  Map<String, dynamic> mixpanelTrackingInfo({
    required List<Usage> reasonList,
  }) =>
      {
        MixpanelProps.returnId: returnRequestId,
        MixpanelProps.totalQty: allItemDetails.fold<int>(
          0,
          (sum, e) => sum + e.returnQuantity.getIntValue,
        ),
        MixpanelProps.totalPrice: returnTotal,
        MixpanelProps.isSingle: invoiceDetails.length == 1,
        MixpanelProps.isBonusIncluded: selectedItems
            .map((e) => e.bonusItems)
            .flattened
            .any((bonus) => isIncludeBonus(bonus.uuid)),
        MixpanelProps.returnReason: allItemDetails
            .map(
              (e) =>
                  reasonList
                      .firstWhereOrNull(
                        (reason) => reason.usageCode == e.returnReason,
                      )
                      ?.usageDescription ??
                  e.returnReason,
            )
            .toList(),
        MixpanelProps.productName: allItemDetails
            .map(
              (e) => getReturnMaterial(e.itemNumber).materialDescription,
            )
            .toList(),
        MixpanelProps.productManufacturer: allItemDetails
            .map(
              (e) => getReturnMaterial(e.itemNumber).principalName.name,
            )
            .toList(),
        MixpanelProps.unitPrice:
            allItemDetails.map((e) => getUnitPrice(e.itemNumber)).toList(),
      };
}
