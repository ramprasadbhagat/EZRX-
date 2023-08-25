
bool checkIsInvoice(String documentType) {
  return documentType == 'I';
}

bool checkIsCredit(String documentType) {
  return documentType == 'C';
}

String findDate(String input) {
  final dateFinderRgx = RegExp(r'(20\d{2})[0-1](\d{1})[0-3](\d{1})');

  return dateFinderRgx.allMatches(input).last.group(0) ?? '';
}

double toUnsignedDouble(String input) => (double.tryParse(input) ?? 0).abs();
