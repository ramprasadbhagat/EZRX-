import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class MaterialCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialCode(String input) {
    return MaterialCode._(validateStringNotEmpty(input));
  }

  String get materialNumber {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));
  }

  const MaterialCode._(this.value);
}
