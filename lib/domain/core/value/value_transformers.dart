import 'package:ezrxmobile/domain/account/entities/user.dart';

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
  return text == 'No contract (Price remains same)'
      ? 'Tender Contract available'
      : 'Contract: $text';
}
