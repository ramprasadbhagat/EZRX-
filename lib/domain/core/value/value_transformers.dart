import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:intl/intl.dart';

String stringCapitalize(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

  return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
}

bool isNotEmpty(String text) {
  final pattern =
      RegExp(r'^\s*$'); // matches any string is not empty or white space

  return !pattern.hasMatch(text);
}

bool hasLengthN(String text, int n) {
  final pattern = RegExp('^.{$n}\$'); // matches any string of length n

  return pattern.hasMatch(text);
}

bool hasLengthGreaterThanN(String text, int n) {
  final regex = RegExp('^.{$n,}\$'); // matches any string of length n or more

  return regex.hasMatch(text.replaceAll('\n', ' '));
}

bool hasLengthEqualOrGreaterThanN(String text, int n) =>
    hasLengthN(text, n) || hasLengthGreaterThanN(text, n);

// a simple string => A Simple String
String stringTitleCase(String text) {
  if (text.isEmpty) return '';
  if (hasLengthN(text, 1)) return text;

  return text
      .trim()
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join(' ');
}

String removeLeadingZero(String text) {
  return text.isEmpty ? '' : text.replaceAll(RegExp(r'^0+(?=.)'), '');
}

String naIfEmpty(String text) {
  return text.isEmpty ? 'NA' : text;
}

bool getInStock(String text) {
  return text == 'Yes';
}

String getTelephoneNotGreaterThan16(String text) {
  return hasLengthGreaterThanN(text, 16) ? text.substring(0, 16) : text;
}

bool isMinCharacter({required String input, required int minLength}) =>
    hasLengthEqualOrGreaterThanN(input, minLength);

bool isAtleastOneLowerCharacter({
  required String input,
}) =>
    RegExp(r'[a-z]').hasMatch(input);

bool isAtleastOneUpperCharacter({
  required String input,
}) =>
    RegExp(r'[A-Z]').hasMatch(input);

bool isAtleastOneNumericCharacter({
  required String input,
}) =>
    RegExp(r'[0-9]').hasMatch(input);

bool isAtleastOneSpecialCharacter({
  required String input,
}) =>
    RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input);

bool isMustNotContainUserNameOrName({
  required String input,
  required User user,
}) =>
    input.isNotEmpty &&
    (!input.toLowerCase().contains(user.username.getValue().toLowerCase()) &&
        !input.toLowerCase().contains(user.fullName.firstName.toLowerCase()) &&
        !input.toLowerCase().contains(user.fullName.lastName.toLowerCase()));

String getTenderContractNumber(String text) {
  if (text.isEmpty) return text;

  return text == 'No contract (Price remains same)'
      ? 'Tender Contract available'
      : 'Contract: $text';
}

DateTime getDeliveryDateTime(String input) {
  final deliveryDate = DateTime.tryParse(input);
  final defaultDeliveryDate = DateTime.now().add(const Duration(days: 1));

  if (deliveryDate == null || deliveryDate.isBefore(defaultDeliveryDate)) {
    return defaultDeliveryDate;
  }

  return deliveryDate;
}

String displayDateTimeStringOrEmpty(String text, String format) {
  if (getDateTimeIntValue(text) <= 0 && !text.contains('-')) {
    return '-';
  }
  final parsedDate = tryParseDateTime(text);
  if (parsedDate == null) {
    return '';
  }

  return DateFormat(format).format(parsedDate);
}

bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

String formattedDateTimeForAPI(String text) {
  final parsedDate = DateTime.tryParse(text);
  if (parsedDate == null) {
    return '';
  }

  return DateFormat(DateTimeFormatString.apiDateFormat).format(parsedDate);
}

DateTime? tryParseDateTime(String input) {
  if (isNotEmpty(input)) {
    try {
      //input with format yyyyddmmhh
      if (getDateTimeIntValue(input) > 0) {
        final standardInput = input.padRight(14, '0');
        final year = int.parse(standardInput.substring(0, 4));
        final month = int.parse(standardInput.substring(4, 6));
        final day = int.parse(standardInput.substring(6, 8));
        final hour = int.parse(standardInput.substring(8, 10));
        final minute = int.parse(standardInput.substring(10, 12));
        final second = int.parse(standardInput.substring(12, 14));

        //if length is 10, then it convert dateTime till hour
        //yyyyddmmhh (only for principal Date)
        if (hasLengthN(input, 10)) {
          return DateTime.utc(year, month, day, hour).toLocal();
        }

        return DateTime(year, month, day, hour, minute, second);
      }
      //input for invoices date string with format yyyy-MM-dd
      else {
        return DateTime.parse(input);
      }
    } on FormatException {
      return null;
    }
  }

  return null;
}

DateTime? tryParseAnnouncementDateTime(String input) {
  try {
    return DateFormat.yMd().add_jm().parse(input);
  } catch (_) {
    return null;
  }
}

DateTime getDateTimeByDateString(String value) =>
    tryParseDateTime(value) ?? DateTime.now();

DateTime getDateTimeByAnnouncementDateString(String value) =>
    tryParseAnnouncementDateTime(value) ?? DateTime.now();

String getDateStringByDateTime(DateTime dateTime) =>
    DateFormat(DateTimeFormatString.apiDateFormat).format(dateTime);

String emptyIfZero(double value) {
  return value == 0 ? '' : value.toString();
}

int getDateTimeIntValue(String value) =>
    isNumericOnly(value) ? int.parse(value) : 0;

String getLanguageString(String apiLanguageCode) {
  switch (apiLanguageCode) {
    case ApiLanguageCode.thai:
      return 'ภาษาไทย';
    case ApiLanguageCode.mandarin:
      return '繁體中文';
    case ApiLanguageCode.burmese:
      return 'ဗမာဘာသာစကား';
    case ApiLanguageCode.vietnamese:
      return 'Tiếng Việt';
    case ApiLanguageCode.khmer:
      return 'ភាសាខ្មែរ';
    case ApiLanguageCode.english:
    default:
      return 'English';
  }
}

String dashIfEmpty(String text) {
  return text.isEmpty ? '-' : text;
}

int getIntegerReturnQuantity(String quantity) =>
    quantity.isEmpty ? 0 : int.parse(quantity);
