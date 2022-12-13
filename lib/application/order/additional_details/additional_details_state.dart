part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsState with _$AdditionalDetailsState {
  const AdditionalDetailsState._();

  const factory AdditionalDetailsState({
    required AdditionalDetailsData additionalDetailsData,
    required bool isValidated,
    required bool showErrorMessages,
  }) = _AdditionalDetailsState;

  factory AdditionalDetailsState.initial() => AdditionalDetailsState(
        additionalDetailsData: AdditionalDetailsData.empty(),
        isValidated: false,
        showErrorMessages: false,
      );
}
