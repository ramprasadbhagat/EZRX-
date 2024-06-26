import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

// This method is used to convert all keys in lowercase from raw Json

dynamic makeResponseCamelCase(String resp) {
  final camelCaseJsonKeys = resp.replaceAllMapped(
    RegExp(
      '(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)',
    ),
    (Match m) {
      return m.group(0)![0].toLowerCase() +
          m.group(0)!.characters.getRange(1).toString();
    },
  );

  return jsonDecode(camelCaseJsonKeys);
}

dynamic valueOrNullToJson(String value) => value.isNotEmpty ? value : null;

  Map<String, String> mapFilterFieldData({
    required String field,
    required String date,
    required String type,
  }) {
    final dataMap = <String, String>{};
    dataMap.putIfAbsent('field', () => field);
    dataMap.putIfAbsent('value', () => date);
    dataMap.putIfAbsent('type', () => type);

    return dataMap;
  }

class StringToDoubleConverter extends JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) => double.tryParse(json) ?? 0;

  @override
  String toJson(double object) => object.toString();
}

class StringToIntConverter extends JsonConverter<int, String> {
  const StringToIntConverter();

  @override
  int fromJson(String json) => (double.tryParse(json) ?? 0).toInt();

  @override
  String toJson(int object) => object.toString();
}
