part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsState with _$AdditionalDetailsState {
  const AdditionalDetailsState._();

  const factory AdditionalDetailsState({
    required AdditionalDetailsData additionalDetailsData,
    required String orderId,
    required bool isValidated,
    required bool isLoading,
    required bool showErrorMessages,
  }) = _AdditionalDetailsState;

  factory AdditionalDetailsState.initial() => AdditionalDetailsState(
        additionalDetailsData: AdditionalDetailsData.empty(),
        orderId: '',
        isValidated: false,
        isLoading: false,
        showErrorMessages: false,
      );
}
