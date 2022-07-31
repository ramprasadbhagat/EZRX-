import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/user/value/value_transformers.dart';

class CustomerCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCode(String input) {
    return CustomerCode._(Right(input));
  }

  const CustomerCode._(this.value);
}

class SalesOrg extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SalesOrg(String input) {
    return SalesOrg._(Right(input));
  }

  String get buName {
    return salesOrgBuName(value.getOrElse(() => ''));
  }

  const SalesOrg._(this.value);
}

class RoleName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RoleName(String input) {
    return RoleName._(Right(input));
  }

  bool get canLoginOnBehalf {
    return canProxyLogin(value.getOrElse(() => ''));
  }

  const RoleName._(this.value);
}
