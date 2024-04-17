part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingState with _$DeepLinkingState {
  const factory DeepLinkingState.initial() = _Initial;
  const factory DeepLinkingState.linkPending(
    EzrxLink link, {
    EZReachBanner? banner,
  }) = _LinkPending;
  const factory DeepLinkingState.redirectBundleDetail(
    MaterialNumber materialNumber, {
    EZReachBanner? banner,
  }) = _RedirectBundleDetail;
  const factory DeepLinkingState.redirectProductDetail(
    MaterialNumber materialNumber, {
    EZReachBanner? banner,
  }) = _RedirectProductDetail;
  const factory DeepLinkingState.redirectProductSuggestion(
    SearchKey searchKey,
  ) = _RedirectProductSuggestion;
  const factory DeepLinkingState.redirectOrderDetail(
    OrderNumber orderNumber,
  ) = _RedirectOrderDetail;
  const factory DeepLinkingState.redirectReturnDetail(
    ReturnRequestsId returnId,
  ) = _RedirectReturnDetail;
  const factory DeepLinkingState.redirectPaymentDetail(
    PaymentSummaryDetails paymentIdentifierInfo,
  ) = _RedirectPaymentDetail;
  const factory DeepLinkingState.redirectPaymentHome() = _RedirectPaymentHome;
  const factory DeepLinkingState.redirectInvoiceDetail(
    String invoiceNumber,
  ) = _RedirectInvoiceDetail;
  const factory DeepLinkingState.redirectFAQ() = _RedirectFAQ;
  const factory DeepLinkingState.redirectAboutUs() = _RedirectAboutUs;
  const factory DeepLinkingState.redirectContactUs(
    AppMarket market,
  ) = _RedirectContactUs;
  const factory DeepLinkingState.redirectUserGuide() = _RedirectUserGuide;
  const factory DeepLinkingState.error(ApiFailure failure) = _Error;
  const factory DeepLinkingState.redirectResetPassword(
    ResetPasswordCred resetPasswordCred,
  ) = _RedirectResetPassword;
}
