part of 'add_sales_district_bloc.dart';

@freezed
class AddSalesDistrictState with _$AddSalesDistrictState {
  const AddSalesDistrictState._();

  const factory AddSalesDistrictState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required SalesOrg salesOrg,
    required StringValue salesDistrictHeader,
    required StringValue salesDistrictLabel,
    required AddSalesDistrict addSalesDistrict,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AddPaymentMethodsState;

  factory AddSalesDistrictState.initial() => AddSalesDistrictState(
        isSubmitting: false,
        showErrorMessages: false,
        salesOrg: SalesOrg(''),
        salesDistrictHeader: StringValue(''),
        salesDistrictLabel: StringValue(''),
        addSalesDistrict: AddSalesDistrict.empty(),
        failureOrSuccessOption: none(),
      );

  bool get isSalesDistrictFieldIsValid =>
      salesOrg.isValid() &&
      salesDistrictHeader.isValid() &&
      salesDistrictLabel.isValid();
}
