import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class CustomerCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerCode(String input) {
    return CustomerCode._(validateStringNotEmpty(input));
  }

  const CustomerCode._(this.value);
}

class SalesOrg extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SalesOrg(String input) {
    return SalesOrg._(validateStringNotEmpty(input.trim()));
  }

  String get buName {
    return salesOrgBuName(value.getOrElse(() => ''));
  }

  String get fullName {
    return '${value.getOrElse(() => '')} - $buName';
  }

  String get country {
    return salesOrgCountry(value.getOrElse(() => ''));
  }

  String get contactEmail {
    return salesOrgEmail(value.getOrElse(() => ''));
  }

  Contact get contact {
    return salesOrgContact(value.getOrElse(() => ''));
  }

  String get contactPersonName {
    return salesOrgContactPerson(value.getOrElse(() => ''));
  }

  const SalesOrg._(this.value);
}

class RoleType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RoleType(String input) {
    return RoleType._(validateStringNotEmpty(input));
  }

  bool get canLoginOnBehalf {
    return isAdminRole(value.getOrElse(() => ''));
  }

  String get loginUserType {
    return userType(value.getOrElse(() => ''));
  }

  bool get isSalesRep {
    return loginUserType == 'salesRep';
  }

  String get purchaseOrderType {
    return orderType(value.getOrElse(() => ''));
  }

  const RoleType._(this.value);
}

class Currency extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Currency(String input) {
    return Currency._(validateStringNotEmpty(input));
  }

  String get symbol {
    return currencySymbol(value.getOrElse(() => ''));
  }

  const Currency._(this.value);
}
