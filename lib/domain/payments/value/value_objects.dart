import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class DocumentNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DocumentNumber(String input) {
    return DocumentNumber._(validateStringNotEmpty(input));
  }

  String get number {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const DocumentNumber._(this.value);
}
