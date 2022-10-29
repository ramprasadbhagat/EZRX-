import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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

  bool get isVN {
    return country == 'VN';
  }

  bool get isSg {
    return country == 'SG';
  }

  bool get isVP {
    return country == 'VP';
  }

  bool get isPH {
    return country == 'PH';
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
    return roleCanLoginOnBehalf(value.getOrElse(() => ''));
  }

  String get loginUserType {
    return roleUserType(value.getOrElse(() => ''));
  }

  bool get isSalesRep {
    return loginUserType == 'salesRep';
  }

  String get purchaseOrderType {
    return roleOrderType(value.getOrElse(() => ''));
  }

  bool get isAupAudience {
    return roleIsAupAudience(value.getOrElse(() => ''));
  }

  bool get isTcAudience {
    return roleIsTcAudience(value.getOrElse(() => ''));
  }

  bool get isClient {
    return loginUserType == 'client';
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

  String get code {
    return currencyCode(value.getOrElse(() => ''));
  }

  bool get isVN {
    return value.getOrElse(() => '') == 'vnd';
  }

  const Currency._(this.value);
}

class CustomerAttr7 extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerAttr7(String input) {
    return CustomerAttr7._(validateStringNotEmpty(input));
  }

  bool get isZEV {
    return value.getOrElse(() => '') == 'ZEV';
  }

  const CustomerAttr7._(this.value);
}

class CustomerGrp4 extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerGrp4(String input) {
    return CustomerGrp4._(validateStringNotEmpty(input));
  }

  bool get isVR {
    return value.getOrElse(() => '') == 'VR';
  }

  bool get isVP {
    return value.getOrElse(() => '') == 'VP';
  }

  bool get canOrderCovidMaterial => isVR || isVP;

  const CustomerGrp4._(this.value);
}
