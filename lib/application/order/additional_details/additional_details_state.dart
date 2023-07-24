part of 'additional_details_bloc.dart';

@freezed
class AdditionalDetailsState with _$AdditionalDetailsState {
  const AdditionalDetailsState._();

  const factory AdditionalDetailsState({
    required DeliveryInfoData deliveryInfoData,
    required String orderId,
    required bool isValidated,
    required bool isLoading,
    required bool showErrorMessages,
    DeliveryInfoLabel? focusTo,
  }) = _AdditionalDetailsState;

  factory AdditionalDetailsState.initial() => AdditionalDetailsState(
        deliveryInfoData: DeliveryInfoData.empty(),
        orderId: '',
        isValidated: false,
        isLoading: false,
        showErrorMessages: false,
      );
}
