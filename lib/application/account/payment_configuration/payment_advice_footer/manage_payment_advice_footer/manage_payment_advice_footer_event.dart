part of 'manage_payment_advice_footer_bloc.dart';

@freezed
class ManagePaymentAdviceFooterEvent with _$ManagePaymentAdviceFooterEvent {
  const factory ManagePaymentAdviceFooterEvent.initialized() = _Initialized;
  const factory ManagePaymentAdviceFooterEvent.addManagePaymentAdviceFooter() =
      _AddManagePaymentAdviceFooter;
const factory ManagePaymentAdviceFooterEvent.salesOrgOnChange({
    required SalesOrg salesOrg,
  }) = _SalesOrgOnChange;
  const factory ManagePaymentAdviceFooterEvent.salesDistrictOnChange({
    required SalesDistrictInfo salesDistrictInfo,
  }) = _SalesDistrictOnChange;
  const factory ManagePaymentAdviceFooterEvent.onValueChange({
    required ManagePaymentAdviceFooterLabel label,
    required String newValue,
  }) = _OnValueChange;
  const factory ManagePaymentAdviceFooterEvent.headerTextToggle(bool value) =
      _HeaderTextToggle;
  const factory ManagePaymentAdviceFooterEvent.addFile({
    required PickFrom pickFrom,
  }) = _AddFile;
  const factory ManagePaymentAdviceFooterEvent.removePickedFile() =
      _RemovePickedFile; 
}

enum ManagePaymentAdviceFooterLabel {
  headerText,
  footer,
  note,
}
enum PickFrom { file, gallery }
