import 'dart:async';
import 'package:ezrxmobile/domain/account/error/cart_exception.dart';
import 'package:ezrxmobile/domain/payments/error/payment_exception.dart';
import 'package:universal_io/io.dart';

import 'package:ezrxmobile/domain/account/error/price_override_exception.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/auth/error/auth_exception.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:flutter/services.dart';

class FailureHandler {
  static ApiFailure handleFailure(Object error) {
    if (error is AuthException) {
      return error.map(
        invalidEmailAndPasswordCombination: (_) =>
            const ApiFailure.invalidEmailAndPasswordCombination(),
        accountLocked: (_) => const ApiFailure.accountLocked(),
        accountExpired: (_) => const ApiFailure.accountExpired(),
        invalidUserName: (_) => const ApiFailure.userNameNotFound(),
      );
    } else if (error is UserException) {
      return error.map(
        userNotFound: (_) => const ApiFailure.userNotFound(),
      );
    } else if (error is PriceException) {
      return error.map(
        priceNotFound: (_) => const ApiFailure.priceOverrideNotFound(),
      );
    } else if (error is CartException) {
      return error.map(
        cartHasDifferentAddress: (_) =>
            const ApiFailure.cartHasDifferentAddress(),
        addAnimalHealthWithNormalProductToCart: (_) =>
            const ApiFailure.addAnimalHealthWithNormalProductToCart(),
      );
    } else if (error is PaymentException) {
      return error.map(
        missingzzHtmcs: (_) => const ApiFailure.missingzzHtmcs(),
      );
    } else {
      switch (error.runtimeType) {
        case MockException:
          return ApiFailure.other((error as MockException).message);
        case CacheException:
          return ApiFailure.other((error as CacheException).message);
        case ServerException:
          final message = (error as ServerException).message.toLowerCase();
          if (message == 'authentication failed' ||
              message ==
                  'status: 401, message: token has either expired or its not valid') {
            return const ApiFailure.authenticationFailed();
          }

          return ApiFailure.serverError(message);
        case SocketException:
          return const ApiFailure.poorConnection();
        case TimeoutException:
          return const ApiFailure.serverTimeout();
        case PlatformException:
          return ApiFailure.other('${(error as PlatformException).message}');
        case OtherException:
          return ApiFailure.other((error as OtherException).message);

        default:
          return ApiFailure.other(error.toString());
      }
    }
  }
}
