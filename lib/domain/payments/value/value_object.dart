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

  bool get displayWarningAnnoucement => isBankIn || isQrCode;

  const PaymentMethodValue._(this.value);
}
