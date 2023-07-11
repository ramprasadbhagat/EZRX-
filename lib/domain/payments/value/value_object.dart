import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
