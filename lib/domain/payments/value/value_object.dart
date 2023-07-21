
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

class Amount extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Amount(double value) => Amount._(Right(value));

  String get displayAmount => value.getOrElse(() => 0).toString();

  const Amount._(this.value);
}

class SoaData extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SoaData(String input) {
    return SoaData._(validateStringNotEmpty(input));
  }

  String get toDate => displayDateTimeStringOrEmpty(
        findDate(value.getOrElse(() => '')),
        DateTimeFormatString.displaySimpleDateFormat,
      );

  const SoaData._(this.value);
}

class CreditLimitValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CreditLimitValue(String input) {
    return CreditLimitValue._(validateStringNotEmpty(input));
  }

  double get _toUnsigned => toUnsignedDouble(value.getOrElse(() => ''));

  String get displayAmount => _toUnsigned.toString();
  const CreditLimitValue._(this.value);
}
