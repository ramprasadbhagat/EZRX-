part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingEvent with _$DeepLinkingEvent {
  const factory DeepLinkingEvent.initialize() = _Initialize;
  const factory DeepLinkingEvent.stopConsumeLink() = _StopConsumeLink;
  const factory DeepLinkingEvent.addPendingLink(Uri link) = _AddPendingLink;
  const factory DeepLinkingEvent.consumePendingLink({
    required CustomerCodeInfo selectedCustomerCode,
    required ShipToInfo selectedShipTo,
  }) = _ConsumePendingLink;
}
