import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';

class AnnouncementType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementType(String input) {
    return AnnouncementType._(validateStringNotEmpty(input));
  }

  const AnnouncementType._(this.value);
}

class AnnouncementDislayTime extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementDislayTime(String input) {
    return AnnouncementDislayTime._(validateStringNotEmpty(input));
  }

  const AnnouncementDislayTime._(this.value);

  bool get isPreLogin => value.getOrElse(() => '') == 'Pre';

  bool get isPostLogin => value.getOrElse(() => '') == 'Post';

  bool get isPreAndPost => value.getOrElse(() => '') == 'Pre and Post';
}

class AnnouncementDislayModule extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AnnouncementDislayModule(String input) {
    return AnnouncementDislayModule._(validateStringNotEmpty(input));
  }

  const AnnouncementDislayModule._(this.value);

  bool get isOrder => value.getOrElse(() => '') == 'Orders';

  bool get isPayment => value.getOrElse(() => '') == 'Payments';

  bool get isReturn => value.getOrElse(() => '') == 'Returns';
}
