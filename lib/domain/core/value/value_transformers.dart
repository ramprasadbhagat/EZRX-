import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

String stringCapitalize(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

  return '${text[0].toUpperCase()}${text.characters.getRange(1).toLowerCase()}';
}

bool isNotEmpty(String text) {
  final pattern =
      RegExp(r'^\s*$'); // matches any string is not empty or white space

  return !pattern.hasMatch(text);
}

bool hasLengthN(String text, int n) {
  final pattern = RegExp('^.{$n}\$'); // matches any string of length n

  return pattern.hasMatch(text);
}

bool hasLengthGreaterThanN(String text, int n) {
  final regex = RegExp('^.{$n,}\$'); // matches any string of length n or more

  return regex.hasMatch(text.replaceAll('\n', ' '));
}

bool hasLengthEqualOrGreaterThanN(String text, int n) =>
    hasLengthN(text, n) || hasLengthGreaterThanN(text, n);

// a simple string => A Simple String
// String stringTitleCase(String text) {
//   if (text.isEmpty) return '';
//   if (hasLengthN(text, 1)) return text;

//   return text
//       .trim()
//       .split(' ')
//       .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
//       .join(' ');
// }

String removeLeadingZero(String text) {
  return text.isEmpty ? '' : text.replaceAll(RegExp(r'^0+(?=.)'), '');
}

String naIfEmpty(String text) {
  return text.isEmpty ? 'NA' : text;
}

bool getInStock(String text) {
  return text == 'Yes';
}

String getMaterialInStockText(bool inStock) {
  return inStock ? 'Preorder' : 'Out of Stock';
}

String getTelephoneNotGreaterThan16(String text) {
  return hasLengthGreaterThanN(text, 16)
      ? text.characters.getRange(0, 16).toString()
      : text;
}

bool isMinCharacter({required String input, required int minLength}) =>
    hasLengthEqualOrGreaterThanN(input, minLength);

bool isAtLeastOneLowerCharacter({
  required String input,
}) =>
    RegExp(r'[a-z]').hasMatch(input);

bool isAtLeastOneUpperCharacter({
  required String input,
}) =>
    RegExp(r'[A-Z]').hasMatch(input);

bool isAtLeastOneNumericCharacter({
  required String input,
}) =>
    RegExp(r'[0-9]').hasMatch(input);

bool isAtLeastOneSpecialCharacter({
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

String displayDateTimeString(
  String text,
  String format,
) {
  final parsedDate = tryParseDateTime(text);
  if (parsedDate == null) {
    return text;
  }

  return DateFormat(format)
      .format(parsedDate)
      //remove time part if time is 00:00:00
      .replaceFirst(' 00:00:00', '');
}

bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

DateTime? tryParseDateTime(String input) {
  if (isNotEmpty(input)) {
    try {
      //input with format yyyyddmmhh
      if (getDateTimeIntValue(input) > 0) {
        final standardInput = input.padRight(14, '0');
        final year =
            int.parse(standardInput.characters.getRange(0, 4).toString());
        final month =
            int.parse(standardInput.characters.getRange(4, 6).toString());
        final day =
            int.parse(standardInput.characters.getRange(6, 8).toString());
        final hour =
            int.parse(standardInput.characters.getRange(8, 10).toString());
        final minute =
            int.parse(standardInput.characters.getRange(10, 12).toString());
        final second =
            int.parse(standardInput.characters.getRange(12, 14).toString());

        //if length is 10, then it convert dateTime till hour
        //yyyyddmmhh (only for principal Date)
        if (hasLengthN(input, 10)) {
          return DateTime.utc(year, month, day, hour).toLocal();
        }

        return DateTime(year, month, day, hour, minute, second);
      } else {
        try {
          //input for announcement date
          return DateFormat.yMd().add_jm().parse(input);
        } catch (_) {
          //input for invoices date string with format yyyy-MM-dd
          return DateTime.parse(input);
        }
      }
    } on FormatException {
      return null;
    }
  }

  return null;
}

DateTime getDateTimeByDateString(String value) =>
    tryParseDateTime(value) ?? DateTime.now();

String calculateDifferenceTime(String value) {
  final dateTime = getDateTimeByDateString(value);
  final difference = DateTime.now().difference(dateTime);
  final minutes = difference.inMinutes;
  if (minutes >= 1440) {
   final days = difference.inDays;

    return '$days d';
  } else if (minutes >= 60) {
    final hours = difference.inHours;

    return '$hours h';
  } else {
    return '$minutes m';
  }
}

String getDateStringByDateTime(DateTime dateTime) =>
    DateFormat(DateTimeFormatString.apiDateFormat).format(dateTime);

String emptyIfZero(num value) {
  return value == 0 ? '' : value.toString();
}

int getDateTimeIntValue(String value) =>
    isNumericOnly(value) ? int.parse(value) : 0;

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

int getIntegerReturnQuantity(String quantity) =>
    quantity.isEmpty ? 0 : int.parse(quantity);

bool isBundle(String type) => type == 'bundle';

bool isMaterial(String type) => type == 'material';

bool notZero(int number) => number != 0;

Color getStatusLabelColor(String statusType) {
  final lightSecondary = {
    'Processed': ZPColors.lightSecondary,
    'Successful': ZPColors.lightSecondary,
    'Approved for Return': ZPColors.lightSecondary,
    'FAILED': ZPColors.lightSecondary,
    'APPROVED': ZPColors.lightSecondary,
    'Preorder': ZPColors.lightYellow,
    'Bonus': ZPColors.primary,
  };

  final lightRedStatusColor = {
    'Cancelled': ZPColors.lightRedStatusColor,
    'Failed': ZPColors.lightRedStatusColor,
    'Cancelled - credit issue': ZPColors.lightRedStatusColor,
    'Cancelled - duplicate order': ZPColors.lightRedStatusColor,
    'Cancelled - license invalid / expired': ZPColors.lightRedStatusColor,
    'Cancelled - stock unavailable': ZPColors.lightRedStatusColor,
    'Cancelled by buyer': ZPColors.lightRedStatusColor,
    'Cancelled by Seller': ZPColors.lightRedStatusColor,
    'Overdue': ZPColors.lightRedStatusColor,
  };

  final lightYellow = {
    'Pending': ZPColors.lightYellow,
    'Preorder': ZPColors.lightYellow,
    'Picking in-progress': ZPColors.lightYellow,
    'Order Created': ZPColors.lightYellow,
    'Out for delivery': ZPColors.lightYellow,
    'Pending Approval': ZPColors.lightYellow,
    'Out for re-delivery': ZPColors.lightYellow,
    'Not Available': ZPColors.lightYellow,
    'In Process': ZPColors.lightYellow,
    'Order Creating': ZPColors.lightYellow,
    'On the way to you': ZPColors.lightYellow,
    'Order being prepared': ZPColors.lightYellow,
    'Pending release': ZPColors.lightYellow,
    'Pending release - credit check': ZPColors.lightYellow,
    'Pending release - license issue': ZPColors.lightYellow,
    'Pending release - month end closing': ZPColors.lightYellow,
    'Pending release - on backorder': ZPColors.lightYellow,
    'Pending release - seller approval required': ZPColors.lightYellow,
    'order pending': ZPColors.lightYellow,
    'Order packed and ready for delivery': ZPColors.lightYellow,
  };

  final secondary = {
    'Completed': ZPColors.secondary,
    'Delivered': ZPColors.secondary,
    'Delivered - partial rejection': ZPColors.secondary,
    'Delivered - rejected upon delivery': ZPColors.secondary,
  };

  final statusTypeMap = {
    ...lightSecondary,
    ...lightRedStatusColor,
    ...lightYellow,
    ...secondary,
    'Cleared': ZPColors.invoiceStatusGreen,
    'Open': ZPColors.invoiceStatusBlue,
    'In progress': ZPColors.invoiceStatusOrange,
    // 'In Progress': ZPColors.lightGray,
    'PENDING': ZPColors.lightRed,
    'REJECTED': ZPColors.darkGray,
  };

  return statusTypeMap[statusType] ?? ZPColors.lightYellow;
}

Color getDueDateColor(String statusType) {
  return statusType == 'Overdue' ? ZPColors.red : ZPColors.black;
}

Color getStatusTextColor(String statusType) {
  switch (statusType) {
    case 'PENDING':
    case 'APPROVED':
    case 'FAILED':
      return ZPColors.returnSummaryStatusTextColor;
    case 'REJECTED':
      return ZPColors.darkGray;
    case 'Preorder':
      return ZPColors.black;
    case 'Bonus':
      return ZPColors.white;

    default:
      return ZPColors.white;
  }
}

String getReturnSummaryStatus(String status) {
  switch (status) {
    case 'PENDING':
      return 'Pending Approval';
    case 'APPROVED':
    case 'FAILED':
      return 'Approved';
    case 'REJECTED':
      return 'Rejected';
    default:
      return 'Return Completed';
  }
}

String getPaymentStatus(String status) {
  switch (status) {
    case 'OPEN':
      return 'Open';
    case 'OVERDUE':
      return 'Overdue';
    default:
      return status;
  }
}

String getReturnByRequestStatus(String status) {
  switch (status) {
    case 'PENDING':
      return 'Pending Review';
    case 'REVIEWED':
      return 'Reviewed';
    case 'FAILED':
      return 'Failed';
    default:
      return status;
  }
}

String getReturnSummaryFilterByStatus(String filter) => filter == 'Active'
    ? 'PENDING'
    : filter != 'All'
        ? 'COMPLETED'
        : '';

String getReturnSummaryStatusInList(String statusType) {
  switch (statusType) {
    case 'PENDING':
      return 'Active';
    case 'APPROVED':
    case 'FAILED':
    case 'REJECTED':
      return 'Completed';

    default:
      return statusType;
  }
}

String getStatusMessage(
  String status,
  PaymentSummaryDetails paymentSummaryDetails,
) {
  return isSuccessful(status)
      ? 'Payment date: ${paymentSummaryDetails.createdDate.dateString}'
      : 'Expires in ${paymentSummaryDetails.adviceExpiry.displayDashIfEmpty}';
}

String getPaymentDate(
  String status,
  String date,
) {
  return isSuccessful(status) ? date : '-';
}

String getAdviceExpiry(
  String status,
  String data,
) {
  return isSuccessful(status) ? 'NA' : 'in $data';
}

bool isSuccessful(String status) => status == 'Successful';

Color getDisplayStatusTextColor(String status) {
  return isSuccessful(status) ? ZPColors.black : ZPColors.red;
}

bool isApproved(String status) {
  return status == 'APPROVED';
}

String sAPROCreationValue(
  String status,
  String bapiStatus,
  String bapiSalesDocNumber,
) {
  switch (status) {
    case 'APPROVED':
    case 'COMPLETED':
    case 'PENDING':
      return bapiStatusType(bapiStatus, bapiSalesDocNumber);

    case 'REJECTED':
      return '-';

    default:
      return '-';
  }
}

String bapiStatusType(String bapiStatus, String bapiSalesDocNumber) {
  switch (bapiStatus) {
    case 'FAILED':
      return 'Request Failed';
    case 'PENDING':
      return 'Pending';
    case 'SUCCESS':
      return bapiSalesDocNumber;
    case '':
      return '-';

    default:
      return '-';
  }
}

bool isBapiStatusFailed(String status) {
  return status == 'FAILED';
}

String getOrderStatus(String status) {
  switch (status) {
    case 'Pending release':
    case 'Pending release on backorder':
    case 'Pending release - on backorder':
    case 'Pending release - seller approval required':
      return 'Pending release';

    default:
      return status;
  }
}

IconData getOrderStatusIcon(String status) {
  switch (status) {
    case 'Order Created':
      return Icons.inventory;
    case 'Pending release':
      return Icons.query_builder;
    case 'Picking in progress':
      return Icons.inventory_2;
    case 'Out for delivery':
      return Icons.electric_rickshaw;
    case 'Delivered':
      return Icons.check;
    case 'Cancelled':
      return Icons.cancel;
    default:
      return Icons.inventory;
  }
}

List<String> getOrderStatusDetails(String status) {
  switch (status) {
    case 'Order being prepared':
      return [
        'Order being prepared',
        'Order Created',
      ];

    case 'Cancelled':
      return [
        'Cancelled',
        'Order Created',
      ];

    default:
      final orderStatusList = <String>[
        'Delivered',
        'Out for delivery',
        'Picking in progress',
        'Pending release',
        'Order Created',
      ];
      return orderStatusList
          .skip(
            orderStatusList.indexWhere(
              (item) =>
                  item.toLowerCase() == getOrderStatus(status).toLowerCase(),
            ),
          )
          .toList();
  }
}

bool isEligibleStatusForZyllem(String status) {
  return getOrderStatus(status).toLowerCase() ==
          'Out for delivery'.toLowerCase() ||
      getOrderStatus(status).toLowerCase() == 'Delivered'.toLowerCase();
}

String getCountryFlag(String country) {
  return 'assets/svg/flags/${country.toLowerCase()}.svg';
}
