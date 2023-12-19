import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/payments/value/value_transformers.dart';

class AmountDocumentType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AmountDocumentType(String input) {
    return AmountDocumentType._(validateStringNotEmpty(input));
  }

  const AmountDocumentType._(this.value);

  bool get isInvoice => checkIsInvoice(value.getOrElse(() => ''));

  bool get isCredit => checkIsCredit(value.getOrElse(() => ''));
}

class SoaData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SoaData(String input) {
    return SoaData._(validateStringNotEmpty(input));
  }

  DateTimeStringValue get simpleDateStringValue => DateTimeStringValue(
        findDate(value.getOrElse(() => '')),
      );

  String get simpleDateString => displayDateTimeString(
        findDate(value.getOrElse(() => '')),
        DateTimeFormatString.displaySimpleDateFormat,
      );

  DateTime get date =>
      tryParseDateTime(findDate(value.getOrElse(() => ''))) ?? DateTime.now();

  const SoaData._(this.value);
}

class PaymentMethodValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentMethodValue(String input) {
    return PaymentMethodValue._(validateStringNotEmpty(input));
  }

  bool get isQrCode => checkIsQrCode(value.getOrElse(() => ''));

  bool get isPaymentGateway => checkIsPaymentGateway(value.getOrElse(() => ''));

  bool get isBankIn => checkIsBankIn(value.getOrElse(() => ''));

  bool get isAPL => checkIsAPL(value.getOrElse(() => ''));

  bool get displayWarningAnnoucement => isBankIn || isQrCode;

  const PaymentMethodValue._(this.value);
}

class BankOptionId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BankOptionId(String input) {
    return BankOptionId._(validateStringNotEmpty(input));
  }

  bool get isBNI => checkIsBNI(value.getOrElse(() => ''));

  bool get isBCA => checkIsBCA(value.getOrElse(() => ''));

  bool get banksOnlyAllowTransferSameBank => !isBNI && !isBCA;

  const BankOptionId._(this.value);
}

class PaymentDue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentDue(String input) {
    return PaymentDue._(validateStringNotEmpty(input));
  }

  String get totalAmount => getTotalAmount(value.getOrElse(() => ''));
  const PaymentDue._(this.value);
}

class AdviceExpiryValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AdviceExpiryValue(String input) {
    return AdviceExpiryValue._(validateStringNotEmpty(input));
  }

  int get expiryDays => getExpiryDays(value.getOrElse(() => ''));

  String get displayDashIfEmpty => dashIfEmpty((value.getOrElse(() => '')));
  const AdviceExpiryValue._(this.value);
}

class DebitCreditCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DebitCreditCode(String input) {
    return DebitCreditCode._(validateStringNotEmpty(input));
  }

  bool get isCredit => checkIsCreditByCode(value.getOrElse(() => ''));

  bool get isDedit => checkIsDebitByCode(value.getOrElse(() => ''));

  const DebitCreditCode._(this.value);
}

class ReferenceId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReferenceId(String input) {
    return ReferenceId._(validateStringNotEmpty(input));
  }

  String get referenceListString =>
      getReferenceListString(value.getOrElse(() => ''));

  const ReferenceId._(this.value);
}
