class ZPRegexes {
  //============================================================
  //  Generic Key
  //============================================================
  static RegExp get onlyDecimal => RegExp(r'^\d+\.?\d{0,10}');
  static RegExp get onlyDigits => RegExp('[0-9]');
  static RegExp get leadingZero => RegExp(r'^0+');
  static RegExp get specialCharacters =>
      RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-[]]');
}
