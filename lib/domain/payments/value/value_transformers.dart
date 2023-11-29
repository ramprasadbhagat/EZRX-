import 'package:ezrxmobile/domain/utils/string_utils.dart';

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

bool checkIsQrCode(String paymentMethodValue) =>
    paymentMethodValue == 'QR Code';

bool checkIsPaymentGateway(String paymentMethodValue) =>
    paymentMethodValue == 'Payment Gateway';

bool checkIsBankIn(String paymentMethodValue) =>
    paymentMethodValue == 'Bank-In';

bool checkIsAPL(String paymentMethodValue) =>
    paymentMethodValue == 'Virtual Accounts Transfer';

//Get the amount string from paymentDue string (Ex: MYR 18940.000000)
String getTotalAmount(String paymentDue) {
  return StringUtils.displayNumber(
    double.tryParse(paymentDue.split(' ').last) ?? 0,
  );
}

//Get the expiry days number from adviceExpiry string (Ex: 15 days)
int getExpiryDays(String adviceExpiry) =>
    int.tryParse(adviceExpiry.split(' ').first) ?? 0;

bool checkIsBNI(String bankOptionId) => bankOptionId == 'BNI';

bool checkIsBCA(String bankOptionId) => bankOptionId == 'BCA';
