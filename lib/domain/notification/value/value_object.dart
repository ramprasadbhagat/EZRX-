import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/notification/value/value_transformers.dart';
import 'package:flutter/material.dart';

class NotificationTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NotificationTitle(String input) {
    return NotificationTitle._(validateStringNotEmpty(input));
  }
  IconData get iconData => notificationIcon(value.getOrElse(() => ''));

  Color get iconBgColor => getIconBGColor(value.getOrElse(() => ''));

  Color get iconColor => getIconColor(value.getOrElse(() => ''));
  const NotificationTitle._(this.value);
}
