import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';

bool checkIsInvoice(String documentType) {
  return isEqualsIgnoreCase(documentType, 'I');
}

bool checkIsCredit(String documentType) {
  return isEqualsIgnoreCase(documentType, 'C');
}

String findDate(String input) {
  //Need two regex expressions as we have a difference between the file format
  //of MY and other markets.

  final dateFinderRgx = RegExp(r'(\d{6})_(\d{6})\.pdf');
  final dateFinderRgxMyMarket = RegExp(r'(20\d{2})[0-1](\d{1})[0-3](\d{1})');

  if (dateFinderRgxMyMarket.hasMatch(input)) {
    return dateFinderRgxMyMarket.allMatches(input).last.group(0) ?? '';
  }

  if (dateFinderRgx.hasMatch(input)) {
    final extractedDate = dateFinderRgx.firstMatch(input)?.group(2) ?? '';

    return extractedDate.padRight(extractedDate.length + 2, '01');
  }

  return '';
}

bool checkIsQrCode(String paymentMethodValue) =>
    isEqualsIgnoreCase(paymentMethodValue, 'QR Code');

bool checkIsPaymentGateway(String paymentMethodValue) =>
    isEqualsIgnoreCase(paymentMethodValue, 'Payment Gateway');

bool checkIsBankIn(String paymentMethodValue) =>
    isEqualsIgnoreCase(paymentMethodValue, 'Bank-In');

bool checkIsAPL(String paymentMethodValue) =>
    isEqualsIgnoreCase(paymentMethodValue, 'Virtual Accounts Transfer');

//Get the amount string from paymentDue string (Ex: MYR 18940.000000)
String getTotalAmount(String paymentDue) {
  return StringUtils.displayNumber(
    double.tryParse(paymentDue.split(' ').last) ?? 0,
  );
}

//Get the expiry days number from adviceExpiry string (Ex: 15 days)
int getExpiryDays(String adviceExpiry) =>
    int.tryParse(adviceExpiry.split(' ').first) ?? 0;

bool checkIsBNI(String bankOptionId) => isEqualsIgnoreCase(bankOptionId, 'BNI');

bool checkIsBCA(String bankOptionId) => isEqualsIgnoreCase(bankOptionId, 'BCA');

bool checkIsDebitByCode(String debitCreditCode) =>
    isEqualsIgnoreCase(debitCreditCode, 'S');

bool checkIsCreditByCode(String debitCreditCode) =>
    isEqualsIgnoreCase(debitCreditCode, 'H');

String getReferenceListString(String referenceId) => referenceId.isNotEmpty
    ? referenceId.split(',').map((e) => '#${e.trim()}').join(', ')
    : naIfEmpty('');
