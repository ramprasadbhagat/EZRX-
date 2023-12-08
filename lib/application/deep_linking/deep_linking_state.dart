part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingState with _$DeepLinkingState {
  const factory DeepLinkingState.initial() = _Initial;
  const factory DeepLinkingState.linkPending(Uri link) = _LinkPending;
  const factory DeepLinkingState.redirectBundleDetail(
    MaterialNumber materialNumber,
  ) = _RedirectBundleDetail;
  const factory DeepLinkingState.redirectProductDetail(
    MaterialNumber materialNumber,
  ) = _RedirectProductDetail;
  const factory DeepLinkingState.redirectOrderDetail(
    OrderNumber orderNumber,
  ) = _RedirectOrderDetail;
  const factory DeepLinkingState.redirectReturnDetail(
    ReturnRequestsId returnId,
  ) = _RedirectReturnDetail;
  const factory DeepLinkingState.redirectPaymentDetail(
    StringValue paymentBatchAdditionalInfo,
  ) = _RedirectPaymentDetail;
  const factory DeepLinkingState.error(ApiFailure failure) = _Error;
}
