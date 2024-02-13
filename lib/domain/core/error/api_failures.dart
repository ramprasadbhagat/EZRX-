import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failures.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.other(String message) = _Other;
  const factory ApiFailure.serverError(String message) = _ServerError;
  const factory ApiFailure.poorConnection() = _PoorConnection;
  const factory ApiFailure.serverTimeout() = _ServerTimeout;

  //User failure
  const factory ApiFailure.userNotFound() = _UserNotFound;
  const factory ApiFailure.marketplaceTnCAcceptanceError() =
      _MarketPlaceTnCAcceptanceError;

  //Auth failure
  const factory ApiFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
  const factory ApiFailure.accountLocked() = _AccountLocked;
  const factory ApiFailure.accountExpired() = _AccountExpired;
  const factory ApiFailure.tokenExpired() = _TokenExpired;
  const factory ApiFailure.authenticationFailed() = _AuthenticationFailed;

  const factory ApiFailure.proxyLoginRolePermissionNotMatch() =
      _ProxyLoginRolePermissionNotMatch;
  const factory ApiFailure.proxyLoginZPTargetRoleNotMatch() =
      _ProxyLoginZPTargetRoleNotMatch;
  const factory ApiFailure.proxyLoginZPSalesOrgNotMatch() =
      _ProxyLoginZPSalesOrgNotMatch;
  const factory ApiFailure.passwordResetFail() = _PasswordResetFail;

  // Bio failure
  const factory ApiFailure.deviceNotSupportBiometric() =
      _DeviceNotSupportBiometric;
  const factory ApiFailure.cannotCheckBiometrics() = _CannotCheckBiometrics;
  const factory ApiFailure.noSupportedBiometrics() = _NoSupportedBiometrics;
  const factory ApiFailure.invalidBiometric() = _InvalidBiometric;
  const factory ApiFailure.priceOverrideNotFound() = _PriceOverrideNotFound;

  // Cart failure
  const factory ApiFailure.productOutOfStock() = _ProductOutOfStock;

  // permission failure
  const factory ApiFailure.photoPermissionFailed() = _PhotoPermissionFailed;
  const factory ApiFailure.storagePermissionFailed() = _StoragePermissionFailed;

  //po attachment failure
  const factory ApiFailure.invalidFileFormat() = _InvalidFileFormat;
  const factory ApiFailure.uploadCountExcideLimit() = _UploadCountExcideLimit;

  //deep link route failure
  const factory ApiFailure.productDetailRoute() = _ProductDetailRoute;
  const factory ApiFailure.orderDetailRoute() = _OrderDetailRoute;
  const factory ApiFailure.returnDetailRoute() = _ReturnDetailRoute;
  const factory ApiFailure.paymentDetailRoute() = _PaymentDetailRoute;
  const factory ApiFailure.invoiceDetailRoute() = _InvoiceDetailRoute;

  const factory ApiFailure.languageChangeFail() = _LanguageChangeFail;
  const factory ApiFailure.scannedProductNotFound(String productNumber) =
      _ScannedProductNotFound;
  const factory ApiFailure.cameraPermissionFailed() = _CameraPermissionFailed;
  const factory ApiFailure.userNameNotFound() = _UserNameNotFound;
  const factory ApiFailure.uploadedFileSizeExceed() = _UploadedFileSizeExceed;
  const factory ApiFailure.paymentAdviceDeleteFailed(String adviceNumber) =
      _PaymentAdviceDeleteFailed;
  //reorder failure
  const factory ApiFailure.allReorderItemInvalid() = _AllReorderItemInvalid;
  const factory ApiFailure.maximumCartQuantityExceed(String maximumNumber) =
      _MaximumCartQuantityExceed;
  const factory ApiFailure.cartHasDifferentAddress() = _CartHasDifferentAddress;
  const factory ApiFailure.articleannuncementTagFetchingError() =
      _ArticleannuncementTagFetchingError;
  const factory ApiFailure.attachmentDownloadError() = _AttachmentDownloadError;
}

extension ApiFailureExt on ApiFailure {
  String get failureMessage => map(
        other: (other) => other.message,
        serverError: (serverError) => serverError.message,
        poorConnection: (_) => 'Poor Internet connection',
        serverTimeout: (_) => 'Server time out',
        userNotFound: (_) => 'User not found.',
        invalidEmailAndPasswordCombination: (_) =>
            'Incorrect username and/or password.',
        accountLocked: (_) => 'Account is Locked',
        accountExpired: (_) => 'Account is Expired',
        tokenExpired: (_) => 'Session token is Expired',
        authenticationFailed: (_) => 'Your session has expired',
        deviceNotSupportBiometric: (_) => 'Device not support biometric',
        cannotCheckBiometrics: (_) => 'Unable to check your biometric',
        noSupportedBiometrics: (_) => 'No supported biometric',
        invalidBiometric: (_) => 'Incorrect biometric',
        priceOverrideNotFound: (_) => 'Price override not found!',
        proxyLoginRolePermissionNotMatch: (_) =>
            'Only Root Admin and ZP Admin can login on behalf',
        proxyLoginZPSalesOrgNotMatch: (_) =>
            'ZP Admin can only login on behalf of users from the same Sales Org',
        proxyLoginZPTargetRoleNotMatch: (_) =>
            'ZP Admin can only login on behalf of Sales Rep and Customer users',
        productOutOfStock: (_) => 'Product Not Available',
        photoPermissionFailed: (_) =>
            'Please enable Photos permission from the app settings',
        storagePermissionFailed: (_) =>
            'Please enable Storage permission from the app settings',
        invalidFileFormat: (_) =>
            'Unable to upload file as either file format not supported or something wrong with the file',
        uploadCountExcideLimit: (_) => 'Number of files exceeds the criteria',
        productDetailRoute: (_) =>
            'This product is not available on your account',
        orderDetailRoute: (_) => 'This order is not available on your account',
        returnDetailRoute: (_) =>
            'This return request is not available on your account',
        paymentDetailRoute: (_) =>
            'This payment advice is not available on your account',
        invoiceDetailRoute: (_) =>
            'This invoice is not available on your account',
        passwordResetFail: (_) => 'Unable to reset password',
        languageChangeFail: (_) => 'Unable to change language',
        scannedProductNotFound: (scannedProduct) =>
            'Unable to fetch Material ${scannedProduct.productNumber}',
        cameraPermissionFailed: (_) => 'Camera Permission Denied',
        userNameNotFound: (_) => 'Incorrect username',
        uploadedFileSizeExceed: (_) =>
            'Can’t upload.This file is larger than 20 MB',
        paymentAdviceDeleteFailed: (paymentAdvice) =>
            'PA #${paymentAdvice.adviceNumber} delete failed',
        allReorderItemInvalid: (_) => 'All reorder materials are invalid',
        maximumCartQuantityExceed: (maximumException) =>
            'In cart quantity should not be more than ${maximumException.maximumNumber}.',
        cartHasDifferentAddress: (_) =>
            'shipToAddress changed from existing cart. Delete the cart and then add new item',
        articleannuncementTagFetchingError: (_) =>
            'Error while fetching announcement article tag list!',
        attachmentDownloadError: (_) => 'File download failed',
        marketplaceTnCAcceptanceError: (_) =>
            'Unable to update acceptance status',
      );
}
