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

// String getParsedString(String textString) {
//   if (textString.isEmpty) {
//     return '';
//   }
//   var parsed = textString.toString();
//   parsed = parsed.replaceAll('\'', '\\\'');

//   return parsed.toString();
// }
