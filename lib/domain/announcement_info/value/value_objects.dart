import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class HtmlContent extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory HtmlContent(String input) {
    return HtmlContent._(right(input));
  }

  String get appendedImgSrcWithBaseUrl =>
      addBaseUrlToImgSrc(value.getOrElse(() => ''));

  String get appendedImgSrcWithBaseUrlWithMedia =>
      addBaseUrlToImgSrcWithMedia(value.getOrElse(() => ''));

  const HtmlContent._(this.value);
}

class Manufacturer extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Manufacturer(String input) {
    return Manufacturer._(right(input));
  }

  String get getManufacturerLabel =>
      constructManufacturerBy(value.getOrElse(() => ''));

  const Manufacturer._(this.value);
}

class Source extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Source(String input) {
    return Source._(right(input));
  }

  String get getSourceLabel => constructSourceBy(value.getOrElse(() => ''));

  const Source._(this.value);
}
