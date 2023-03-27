import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:intl/intl.dart';

String stringCapitalize(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

  return '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}';
}

// a simple string => A Simple String
String stringTitleCase(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

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
  return text.length > 16 ? text.substring(0, 16) : text;
}

// String getParsedString(String textString) {
//   if (textString.isEmpty) {
//     return '';
//   }
//   var parsed = textString.toString();
//   parsed = parsed.replaceAll('\'', '\\\'');

//   return parsed.toString();
// }
bool isMinCharacter({required String input, required int minLength}) =>
    input.length >= minLength;

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

String displayDateStringOrEmpty(String text) {
  if (isNumericOnly(text) && int.parse(text) <= 0) {
    return '-';
  }
  final parsedDate = DateTime.tryParse(text);
  if (parsedDate == null) {
    return '';
  }

  return DateFormat(DateTimeFormatString.displayFormat).format(parsedDate);
}
bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

String formattedDateTimeForAPI(String text) {
  final parsedDate = DateTime.tryParse(text);
  if (parsedDate == null) {
    return '';
  }

  return DateFormat(DateTimeFormatString.apiFormat).format(parsedDate);
}

DateTime getDateTimeByDateString(String value) =>
    DateTime.tryParse(value) ?? DateTime.now();

String getDateStringByDateTime(DateTime dateTime) =>
    DateFormat(DateTimeFormatString.apiFormat).format(dateTime);

String emptyIfZero(double value) {
  return value == 0 ? '' : value.toString();
}

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
