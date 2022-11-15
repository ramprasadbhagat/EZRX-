import 'dart:async';
import 'dart:io';

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
      );
    } else if (error is UserException) {
      return error.map(
        userNotFound: (_) => const ApiFailure.userNotFound(),
      );
    } else if (error is PriceException) {
      return error.map(
        priceNotFound: (_) => const ApiFailure.priceOverrideNotFound(),
      );
    } else {
      switch (error.runtimeType) {
        case MockException:
          return ApiFailure.other((error as MockException).message);
        case CacheException:
          return ApiFailure.other((error as CacheException).message);
        case ServerException:
          return ApiFailure.serverError((error as ServerException).message);
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
