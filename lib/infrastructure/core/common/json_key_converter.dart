
import 'dart:convert';

// This method is used to convert all keys in lowercase from raw Json

dynamic makeResponseCamelCase(String resp) {
  final camelCaseJsonKeys = resp.replaceAllMapped(
    RegExp(
      '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
    ),
    (Match m) {
      return m.group(0)![0].toLowerCase() + m.group(0)!.substring(1);
    },
  );

  return jsonDecode(camelCaseJsonKeys);
}