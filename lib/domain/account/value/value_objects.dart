import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bu_contact.dart';
import 'package:ezrxmobile/domain/account/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/material.dart';

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

  String get languageCode {
    return salesOrgLanguageCode(country);
  }

  String get languageCodeForAnnouncement {
    return announcementLanguageCode(country);
  }

  String get country {
    return salesOrgCountry(value.getOrElse(() => ''));
  }

  String get contactEmail {
    return salesOrgEmail(value.getOrElse(() => ''));
  }

  BuContact get contact {
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

  bool get needUpdatePaymentGateway => isMY || isVN;

  bool get isPaymentNeedOpenWebView => !isSg;

  bool get isValidCountryOrderTypeEligible {
    return countrySupportOrderType(country);
  }

  bool get isPaymentClaimEnabled => isPH;

  int get countWhenValid => isValid() ? 1 : 0;

  Locale get locale => Locale(languageCode, country);
  Locale get announcementLocale => Locale(languageCodeForAnnouncement, country);

  String get announcementVariablePath => countryAnnouncementPath(country);

  String get articleVariablePath => countryArticlePath(country);

  String get aboutUsVariablePath => countryAboutUsPath(country);

  String get countryFlag => getCountryFlag(country);
  String get faqVariablePath => countryFaqPath(country);
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

  bool get adminOrderAccess {
    return isAdmin(value.getOrElse(() => ''));
  }

  String get purchaseOrderType {
    return roleOrderType(value.getOrElse(() => ''));
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

  // it indicate both check the customer with role type as user or client user
  bool get isClientUser {
    return value.getOrElse(() => '') == 'client_user' || isUser;
  }

  // it indicate the customer with role type as user
  bool get isUser {
    return value.getOrElse(() => '') == 'user';
  }

  bool get isInternalSalesRep {
    return value.getOrElse(() => '') == 'internal_sales_rep';
  }

  bool get isExternalSalesRep {
    return value.getOrElse(() => '') == 'external_sales_rep';
  }

  String get orderSource => getOrderSource(value.getOrElse(() => ''));

  bool get isReturnRequestor {
    return value.getOrElse(() => '') == 'return_requestor';
  }

  bool get isReturnApprover {
    return value.getOrElse(() => '') == 'return_approver';
  }

  bool get isReturnRole {
    return isReturnApprover || isReturnAdmin || isReturnRequestor;
  }

  bool get isCustomer {
    return isClientAdmin || isClientUser;
  }

  bool get isSalesRepRole {
    return isInternalSalesRep || isExternalSalesRep;
  }

  bool get isReturnApproverAccount =>
      isReturnApprover || isRootAdmin || isReturnAdmin;

  bool get isPaymentsAccessible =>
      isRootAdmin || isZPAdmin || isClientAdmin || isClientUser;

  bool get isReturnsOverviewAccessible =>
      isRootAdmin ||
      isReturnAdmin ||
      isZPAdmin ||
      isClientUser ||
      isSalesRepRole ||
      isReturnRequestor;

  String get getEZReachRoleType {
    return isSalesRepRole ? 'salesrep' : 'customer';
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
    return value.getOrElse(() => '').toLowerCase() == 'vnd';
  }

  bool get isTH {
    return value.getOrElse(() => '').toLowerCase() == 'thb';
  }

  bool get isMM {
    return value.getOrElse(() => '').toLowerCase() == 'mmk' ||
        value.getOrElse(() => '').toLowerCase() == 'usd';
  }

  bool get isKH {
    return value.getOrElse(() => '').toLowerCase() == 'khr' ||
        value.getOrElse(() => '').toLowerCase() == 'cop' ||
        value.getOrElse(() => '').toLowerCase() == 'usd';
  }

  bool get isPH {
    return value.getOrElse(() => '').toLowerCase() == 'php';
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

class FutureDeliveryDay extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FutureDeliveryDay(String input) =>
      FutureDeliveryDay._(validateStringNotEmpty(input));

  const FutureDeliveryDay._(this.value);

  String get validatedFutureDeliveryDate =>
      removeDash(value.getOrElse(() => ''));
}

class SalesDealNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SalesDealNumber(String input) {
    return SalesDealNumber._(validateStringNotEmpty(input));
  }

  const SalesDealNumber._(this.value);
}

class GreenDeliveryUserRole extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory GreenDeliveryUserRole(int input) {
    return GreenDeliveryUserRole._(Right(input));
  }

  bool get isAllUsers {
    return value.getOrElse(() => 0) == 1;
  }

  bool get isCustomer {
    return value.getOrElse(() => 0) == 2;
  }

  bool get isSalesReps {
    return value.getOrElse(() => 0) == 3;
  }

  const GreenDeliveryUserRole._(this.value);
}

class ComboDealUserRole extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ComboDealUserRole(int input) {
    return ComboDealUserRole._(Right(input));
  }

  bool get isAllUsers {
    return value.getOrElse(() => 0) == 1;
  }

  bool get isCustomerOnly {
    return value.getOrElse(() => 0) == 2;
  }

  bool get isSalesRepOnly {
    return value.getOrElse(() => 0) == 3;
  }

  const ComboDealUserRole._(this.value);
}

class PaymentMethod extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentMethod(String input) {
    return PaymentMethod._(validateStringNotEmpty(input));
  }

  const PaymentMethod._(this.value);
}

class PaymentAdviceResponseMessage extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentAdviceResponseMessage(String input) {
    return PaymentAdviceResponseMessage._(validateStringNotEmpty(input));
  }

  bool get isEdit => paymentAdviceEdit(value.getOrElse(() => ''));

  const PaymentAdviceResponseMessage._(this.value);
}
