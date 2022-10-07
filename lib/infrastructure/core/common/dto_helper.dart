String dateTimeStringFormatCheck(Map json, String key) =>
    DateTime.tryParse(json[key] ?? '') != null
        ? json[key]
        : '1970-01-01 00:00:00';
