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

  String get checkAllOrCustomerCode {
    return checkAllOrDash(value.getOrElse(() => ''));
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

  String get taxCode {
    return salesOrgTaxCode(country);
  }

  bool get isVN {
    return country == 'VN';
  }

  bool get isSg {
    return country == 'SG';
  }

  bool get isPH {
    return country == 'PH';
  }

  bool get isTH {
    return country == 'TH';
  }

  bool get isMY {
    return country == 'MY';
  }

  bool get isTW {
    return country == 'TW';
  }

  bool get isOrderTypeEligible {
    return countrySupportOrderType(country);
  }

  const SalesOrg._(this.value);
}

class OosValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory OosValue(int input) {
    return OosValue._(Right(input));
  }

  bool get isOosValueZero {
    return isZero(value.getOrElse(() => 0));
  }

  const OosValue._(this.value);
}

class RoleType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RoleType(String input) {
    return RoleType._(validateStringNotEmpty(input));
  }

  bool get canLoginOnBehalf {
    return isAdmin(value.getOrElse(() => ''));
  }

  bool get hasReturnsAdminAccess {
    return isAdmin(value.getOrElse(() => ''));
  }

  String get loginUserType {
    return logInUserType(value.getOrElse(() => ''));
  }

  bool get isSalesRep {
    return loginUserType == 'salesRep';
  }

  String get purchaseOrderType {
    return roleOrderType(value.getOrElse(() => ''));
  }

  bool get isClient {
    return loginUserType == 'client';
  }

  bool get isZPAdmin {
    return value.getOrElse(() => '') == 'zp_admin';
  }

  bool get isRootAdmin {
    return value.getOrElse(() => '') == 'root_admin';
  }

  bool get isEligibleLoginRoleForZPAdmin {
    return roleCanLoginOnBehalfByZPAdmin(value.getOrElse(() => ''));
  }

  bool get isReturnAdmin {
    return value.getOrElse(() => '') == 'return_admin';
  }

  bool get isClientAdmin {
    return value.getOrElse(() => '') == 'client_admin';
  }

  bool get isZpAdminAttachments {
    return value.getOrElse(() => '') == 'zp_admin_attachments';
  }

  bool get isClientUser {
    return value.getOrElse(() => '') == 'client_user';
  }

  bool get isInternalSalesRep {
    return value.getOrElse(() => '') == 'internal_sales_rep';
  }

  bool get isExternalSalesRep {
    return value.getOrElse(() => '') == 'external_sales_rep';
  }

  bool get isReturnRequestor {
    return value.getOrElse(() => '') == 'return_requestor';
  }

  bool get isReturnApprover {
    return value.getOrElse(() => '') == 'return_approver';
  }

  bool get isReturnRole {
    return isReturnApprover || isReturnAdmin || isReturnRequestor;
  }

  const RoleType._(this.value);
}

class RoleName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RoleName(String input) {
    return RoleName._(validateStringNotEmpty(input));
  }

  String get getRoleType {
    return roleNameToRoleType(value.getOrElse(() => ''));
  }

  bool get isEligibleLoginRoleForZPAdmin {
    return roleCanLoginOnBehalfByZPAdmin(getRoleType);
  }

  const RoleName._(this.value);
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

class Status extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Status(String input) {
    return Status._(validateStringNotEmpty(input));
  }

  bool get isContain01 {
    return value.getOrElse(() => '').contains('01');
  }

  bool get isContainZ1 {
    return value.getOrElse(() => '').contains('Z1');
  }

  bool get isEDI {
    return value.getOrElse(() => '') == 'EDI';
  }

  bool get isSuspended => isContain01 || isContainZ1;

  const Status._(this.value);
}

class LanguageValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LanguageValue(String input) {
    return LanguageValue._(validateStringNotEmpty(input));
  }

  const LanguageValue._(this.value);
}

class FutureDeliveryDay extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FutureDeliveryDay(String input) =>
      FutureDeliveryDay._(validateStringNotEmpty(input));

  const FutureDeliveryDay._(this.value);

  String get validatedFutureDeliveryDate =>
      removeDash(value.getOrElse(() => ''));
}
