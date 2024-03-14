import 'package:ezrxmobile/domain/core/error/failure.dart';
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
  const factory ApiFailure.emptyCreditUrl() = _EmptyCreditUrl;
}

extension ApiFailureExt on ApiFailure {
  //ignore:long-method
  Failure get failureMessage => map(
        other: (other) => Failure(other.message),
        serverError: (serverError) => Failure(serverError.message),
        poorConnection: (_) => const Failure('Poor Internet connection'),
        serverTimeout: (_) => const Failure('Server time out'),
        userNotFound: (_) => const Failure('User not found.'),
        invalidEmailAndPasswordCombination: (_) => const Failure(
          'Incorrect username and/or password.',
        ),
        accountLocked: (_) => const Failure('Account is Locked'),
        accountExpired: (_) => const Failure('Account is Expired'),
        tokenExpired: (_) => const Failure('Session token is Expired'),
        authenticationFailed: (_) => const Failure('Your session has expired'),
        deviceNotSupportBiometric: (_) =>
            const Failure('Device not support biometric'),
        cannotCheckBiometrics: (_) =>
            const Failure('Unable to check your biometric'),
        noSupportedBiometrics: (_) => const Failure('No supported biometric'),
        invalidBiometric: (_) => const Failure('Incorrect biometric'),
        priceOverrideNotFound: (_) =>
            const Failure('Price override not found!'),
        proxyLoginRolePermissionNotMatch: (_) => const Failure(
          'Only Root Admin and ZP Admin can login on behalf',
        ),
        proxyLoginZPSalesOrgNotMatch: (_) => const Failure(
          'ZP Admin can only login on behalf of users from the same Sales Org',
        ),
        proxyLoginZPTargetRoleNotMatch: (_) => const Failure(
          'ZP Admin can only login on behalf of Sales Rep and Customer users',
        ),
        productOutOfStock: (_) => const Failure('Product Not Available'),
        photoPermissionFailed: (_) => const Failure(
          'Please enable Photos permission from the app settings',
        ),
        storagePermissionFailed: (_) => const Failure(
          'Please enable Storage permission from the app settings',
        ),
        invalidFileFormat: (_) => const Failure(
          'Unable to upload file as either file format not supported or something wrong with the file',
        ),
        uploadCountExcideLimit: (_) =>
            const Failure('Number of files exceeds the criteria'),
        productDetailRoute: (_) => const Failure(
          'This product is not available on your account',
        ),
        orderDetailRoute: (_) =>
            const Failure('This order is not available on your account'),
        returnDetailRoute: (_) => const Failure(
          'This return request is not available on your account',
        ),
        paymentDetailRoute: (_) => const Failure(
          'This payment advice is not available on your account',
        ),
        invoiceDetailRoute: (_) => const Failure(
          'This invoice is not available on your account',
        ),
        passwordResetFail: (_) => const Failure('Unable to reset password'),
        languageChangeFail: (_) => const Failure('Unable to change language'),
        scannedProductNotFound: (scannedProduct) => Failure(
          'Unable to fetch Material {productNumber}',
          arguments: {'productNumber': scannedProduct.productNumber},
        ),
        cameraPermissionFailed: (_) =>
            const Failure('Camera Permission Denied'),
        userNameNotFound: (_) => const Failure('Incorrect username'),
        uploadedFileSizeExceed: (_) => const Failure(
          'Maximum file size should be 20MB',
        ),
        paymentAdviceDeleteFailed: (paymentAdvice) => Failure(
          'PA #{adviceNumber} delete failed',
          arguments: {'adviceNumber': paymentAdvice.adviceNumber},
        ),
        allReorderItemInvalid: (_) =>
            const Failure('All reorder materials are invalid'),
        maximumCartQuantityExceed: (maximumException) => Failure(
          'In cart quantity should not be more than {maximumNumber}.',
          arguments: {'maximumNumber': maximumException.maximumNumber},
        ),
        cartHasDifferentAddress: (_) => const Failure(
          'shipToAddress changed from existing cart. Delete the cart and then add new item',
        ),
        articleannuncementTagFetchingError: (_) => const Failure(
          'Error while fetching announcement article tag list!',
        ),
        attachmentDownloadError: (_) => const Failure('File download failed'),
        marketplaceTnCAcceptanceError: (_) => const Failure(
          'Unable to update acceptance status',
        ),
        emptyCreditUrl: (_) => const Failure(
          'eCredit url is empty',
        ),
      );
  String get nonTranslatedFailureMessage {
    var fullMessage = failureMessage.message;
    if (failureMessage.arguments.isEmpty) {
      return fullMessage;
    }
    failureMessage.arguments.forEach(
      (String key, String value) =>
          fullMessage = fullMessage.replaceAll(RegExp('{$key}'), value),
    );

    return fullMessage;
  }
}
