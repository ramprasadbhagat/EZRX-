import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

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

bool checkIfTrimmedValueNotEmpty(String text) => text.trim().isNotEmpty;

bool getInStock(String text) {
  return text == 'Yes';
}

String getValidPhoneNumber(String text) {
  return text.replaceAll(RegExp(r'[^\d]+'), '').characters.take(16).toString();
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

String getTenderContractNumber(String text) {
  if (text.isEmpty) return text;

  return text == 'No contract (Price remains same)'
      ? 'Tender Contract available'
      : 'Contract: $text';
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

bool containsSubstringFromSourceOfSizeThree({
  required String textToValidate,
  required String sourceString,
}) {
  for (var i = 0; i <= sourceString.length - 3; i++) {
    final substring =
        sourceString.characters.getRange(i, i + 3).string.toLowerCase();
    if (textToValidate.toLowerCase().contains(substring)) return true;
  }

  return false;
}

bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

DateTime? tryParseDateTime(String input) {
  if (isNotEmpty(input)) {
    try {
      //Case 'date|time' example: '20230905|1693894295'
      if (RegExp(r'^\d{8}\|\d*$').hasMatch(input)) {
        final parts = input.split('|');
        final dateStr = parts.first;
        final date = DateTime.parse(dateStr);

        final timeStr = parts[1];
        if (timeStr.isEmpty) {
          return DateTime.utc(
            date.year,
            date.month,
            date.day,
          ).toLocal();
        } else {
          final timestamp = int.parse(timeStr);
          final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

          return DateTime.utc(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
            time.second,
          ).toLocal();
        }
      }

      //Case Date and Time(YYYY-MM-DD HH:mm:ss)example: '2023-11-20 07:36:33'
      if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$').hasMatch(input)) {
        return DateFormat('yyyy-MM-dd HH:mm:ss').parse(input, true).toLocal();
      }

      //Case Date and Time(MM/dd/yyyy HH:mm)example: '01/30/2024 04:32'
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2}$').hasMatch(input)) {
        return DateFormat(DateTimeFormatString.announcementDateFormat)
            .parse(input, false)
            .toLocal();
      }

      //Case Date and Time and(MM/dd/yyyy HH:mm a)example: '01/30/2024 04:32 PM'
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2} (AM|PM)$')
          .hasMatch(input)) {
        return DateFormat(DateTimeFormatString.announcementDateFormat)
            .parse(input, false)
            .toLocal();
      }

      //input with format yyyyddmmhh
      final intVal = getDateTimeIntValue(input);
      if (intVal > 0) {
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
          return input.replaceAll(RegExp(r'^0+(?=.)'), '') == '0'
              ? null
              : DateTime.parse(input);
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

String getTimeZoneAbbreviation(Duration timeZoneOffset) {
  final abbreviationMap = {
    -8: 'PST',
    -7: 'MST',
    -6: 'CST',
    -5: 'EST',
    -4: 'AST',
    -3: 'ADT',
    0: 'GMT',
    1: 'CET',
    7: 'ICT',
    8: 'SGT',
  };

  return abbreviationMap[timeZoneOffset.inHours] ?? '';
}

String dashIfEmpty(String text) {
  return text.isEmpty ? '-' : text;
}

int getIntegerReturnQuantity(String quantity) =>
    quantity.isEmpty ? 0 : int.parse(quantity);

String getNoun(String qty) => int.tryParse(qty) == 1 ? 'item' : 'items';

bool isBundle(String type) => type == 'bundle';

bool isMaterial(String type) => type.toLowerCase() == 'material';

bool isBonus(String type) => type.toLowerCase() == 'bonus';

bool isDealsBonus(String type) => type == 'Deals';

bool isCombo(String type) => type == 'combo';

bool notZero(int number) => number != 0;

Color getStatusLabelColor(String statusType) {
  final lightSecondary = {
    'Processed': ZPColors.lightSecondary,
    'Successful': ZPColors.lightSecondary,
    'Approved for Return': ZPColors.lightSecondary,
    'Approved': ZPColors.lightSecondary,
    'Reviewed': ZPColors.lightSecondary,
    'Bonus': ZPColors.primary,
    'Active': ZPColors.lightSecondary,
    'Payment Received': ZPColors.lightSecondary,
  };

  final lightRedStatusColor = {
    'Cancelled': ZPColors.lightRedStatusColor,
    'Failed': ZPColors.lightRedStatusColor,
    'Cancelled - credit issue': ZPColors.lightRedStatusColor,
    'Cancelled - duplicate order': ZPColors.lightRedStatusColor,
    'Cancelled - license invalid / expired': ZPColors.lightRedStatusColor,
    'Cancelled - stock unavailable': ZPColors.lightRedStatusColor,
    'Cancelled by buyer': ZPColors.lightRedStatusColor,
    'Cancelled by seller': ZPColors.lightRedStatusColor,
    'Overdue': ZPColors.lightRedStatusColor,
    'Rejected': ZPColors.lightRedStatusColor,
    'PoFailed': ZPColors.lightRedStatusColor,
    'FAILED': ZPColors.lightRedStatusColor,
  };

  final lightYellow = {
    'Pending': ZPColors.lightYellow,
    'OOS-Preorder': ZPColors.lightYellow,
    'Picking in progress': ZPColors.lightYellow,
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
    'Expiring': ZPColors.lightYellow,
    'In progress': ZPColors.lightYellow,
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
    'Order created': ZPColors.invoiceStatusBlue,
    'Order received': ZPColors.invoiceStatusBlue,
    'Order Creating': ZPColors.invoiceStatusBlue,
    'Cleared': ZPColors.invoiceStatusGreen,
    'Open': ZPColors.invoiceStatusBlue,
    'In progress': ZPColors.invoiceStatusOrange,
    // 'In Progress': ZPColors.lightGray,
    'PENDING': ZPColors.lightRed,
    'REJECTED': ZPColors.darkGray,
    'Out of stock': ZPColors.lightGray,
    'Expired': ZPColors.lightGray,
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
    case 'OOS-Preorder':
      return ZPColors.black;
    case 'Bonus':
      return ZPColors.white;
    case 'Out of stock':
      return ZPColors.black;

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

String getThreeDaysAfterString(DateTime dateTime) => DateFormat(
      DateTimeFormatString.defaultDateTimeFormat,
    ).format(dateTime.add(const Duration(days: 3)));

int paymentAttentionExpiryInDays(
  DateTime date,
) =>
    date.add(const Duration(days: 3)).difference(DateTime.now()).inDays;

bool differenceNGTWeek(DateTime date) {
  final diff = DateTime.now().difference(date).inDays;

  return (!diff.isNegative) && diff < 7;
}

bool checkIfDateMoreThanAWeekAway(DateTime date) {
  final diff = date.difference(DateTime.now()).inDays;

  return diff > 7;
}

bool isApproved(String status) {
  return status == 'APPROVED';
}

bool isRejected(String status) => status == 'REJECTED';

String bapiStatusType(String bapiStatus) {
  switch (bapiStatus) {
    case 'FAILED':
      return 'Request Failed';
    case 'PENDING':
      return 'Pending';
    case 'SUCCESS':
      return 'Success';
    case '':
      return '-';

    default:
      return '-';
  }
}

bool isBapiStatusFailed(String status) {
  return status == 'FAILED';
}

IconData getReturnStatusIcon(String status) {
  switch (status) {
    case 'Return request submitted':
      return Icons.inventory_outlined;
    case 'Pending review':
      return Icons.query_builder;
    case 'Reviewed':
    case 'Approved':
      return Icons.check;
    case 'Rejected':
    case 'Failed':
      return Icons.cancel;
    default:
      return Icons.inventory_outlined;
  }
}

List<StatusType> getReturnByItemStatusDetail(String status) => [
      if (status != 'Pending Approval') StatusType(status),
      StatusType('Pending review'),
      StatusType('Return request submitted'),
    ];

List<StatusType> getReturnStatusDetails(String status) {
  final returnStatusList = <StatusType>[
    StatusType('Pending review'),
    StatusType('Return request submitted'),
  ];
  switch (status) {
    case 'FAILED':
      return [
        StatusType('Failed'),
        ...returnStatusList,
      ];

    case 'PENDING':
      return returnStatusList;
    case 'REVIEWED':
      return [
        StatusType('Reviewed'),
        ...returnStatusList,
      ];

    default:
      final normalizedStatus = bapiStatusType(status).toLowerCase();

      return returnStatusList
          .skipWhile(
            (item) =>
                item.getOrDefaultValue('').toLowerCase() != normalizedStatus,
          )
          .toList();
  }
}

String getMarketName(String country) {
  final marketNameMap = {
    'hk': 'Hong Kong',
    'kh': 'Cambodia',
    'kr': 'Korea',
    'mm': 'Myanmar',
    'ph': 'Philippines',
    'sg': 'Singapore',
    'th': 'Thailand',
    'tw': 'Taiwan',
    'vn': 'Vietnam',
    'my': 'Malaysia',
    'id': 'Indonesia',
  };

  return marketNameMap[country] ?? 'Malaysia';
}

String getMarketDomain(String country) {
  final marketDomainMap = {
    'hk': 'hk',
    'kh': 'kh',
    'kr': 'kr2',
    'mm': 'mm',
    'ph': 'ph',
    'sg': 'sg',
    'th': 'th',
    'tw': 'tw',
    'vn': 'vn',
    'my': 'my',
    'id': 'id',
  };

  return marketDomainMap[country] ?? 'my';
}

List<String> getAvailableMarketDomain(String country) {
  final marketDomainMap = {
    'hk': ['hk'],
    'kh': ['kh'],
    'kr': ['kr2'],
    'mm': ['mm'],
    'ph': ['ph'],
    'sg': ['sg'],
    'th': ['th'],
    'tw': ['tw'],
    'vn': ['vn', 'vns', 'vnm', 'vnp'],
    'my': ['my'],
    'id': ['id'],
  };

  return marketDomainMap[country] ?? [];
}

String getCurrency(String country) {
  final marketCurrencyMap = {
    'sg': 'SGD',
    'my': 'MYR',
    'hk': 'HKD',
    'th': 'THB',
    'vn': 'VND',
    'ph': 'PHP',
    'mm': 'MMK',
    'kh': 'USD',
    'kr': 'KRW',
    'tw': 'TWD',
    'id': 'IDR',
    'bn': 'BTN',
  };

  return marketCurrencyMap[country] ?? 'MYR';
}

String getLocale(String country) {
  final marketLocaleMap = {
    'sg': 'en-US',
    'my': 'en-US',
    'hk': 'en-US',
    'th': 'th-TH',
    'vn': 'vi-VN',
    'ph': 'en-US',
    'mm': 'my-MM',
    'kh': 'km-KH',
    'kr': 'ko-KR',
    'tw': 'zh-TW',
    'id': 'id-ID',
    'bn': 'ms-BN',
  };

  return marketLocaleMap[country] ?? 'en-US';
}

SalesOrg marketToSalesOrg(String market) {
  final marketSalesOrgMap = {
    'my': '2001',
    'mm': '2200',
    'ph': '2500',
    'sg': '2601',
    'tw': '2800',
    'th': '2900',
    'vn': '3000',
    'kr': '3101',
    'kh': '1500',
    'id': '1900',
    //TODO: Revisit to update the value when HK has its own sales org
    'hk': '2001',
  };

  return SalesOrg(marketSalesOrgMap[market] ?? 'Unknown');
}

String getCountryFlag(String country) {
  return 'assets/svg/flags/${country.toLowerCase()}.svg';
}

String getOosMaterialTag(bool value) => value ? 'OOS-Preorder' : 'Out of stock';

Color getOosMaterialTagColor(bool value) =>
    value ? ZPColors.warning : ZPColors.lightGray;

Color getOosMaterialTagLabelColor(bool value) {
  return value ? ZPColors.darkerGrey : ZPColors.black;
}

String getOosTag() => 'Out of stock';

Color getOosTagLabelColor() => ZPColors.black;

bool isSuccessfulOrProcessed(String status) =>
    status == 'Successful' ||
    status == 'Processed' ||
    status == 'Payment Received' ||
    status == 'success' ||
    status == 'expired' ||
    status == 'canceled';

bool getExpiredOrCanceled(String status) =>
    status == 'expired' || status == 'canceled';

bool getSuccessful(String status) =>
    status == 'Successful' || status == 'success' || status == 'Processed';

bool getPaymentReceived(String status) => status == 'Payment Received';

Color getDisplayStatusTextColor(String status) =>
    isSuccessfulOrProcessed(status) ? ZPColors.black : ZPColors.red;

Color getAdviceExpiryColor(String status) =>
    isSuccessfulOrProcessed(status) ? ZPColors.white : ZPColors.red;

bool isFailed(String status) => status == 'Failed';

bool isPending(String status) => status == 'Pending';

bool isInProgress(String status) =>
    status == 'creating' ||
    status == 'In Progress' ||
    status == 'waiting' ||
    status == 'processing';

Color getAdviceExpiryColorFailed(String status) {
  return isInProgress(status) ||
          isFailed(status) ||
          getExpiredOrCanceled(status)
      ? ZPColors.red
      : ZPColors.white;
}

String getSortLabel(String sort) {
  switch (sort) {
    case 'COMPLETED':
      return 'Completed';
    case 'ALL':
      return 'All';

    default:
      return 'Pending Review';
  }
}

String covertApiSortValue(String value) =>
    value.isNotEmpty && value != 'ALL' ? value : '';

List<String> getApiSatuses(String statusText) {
  switch (statusText) {
    case 'In progress':
      return <String>[
        'waiting',
        'creating',
        'processing',
      ];
    case 'Expired':
      return <String>[
        'expired',
      ];
    case 'Successful':
      return <String>[
        'success',
        'failed',
      ];
    case 'Cancelled':
      return <String>[
        'canceled',
      ];
    default:
      return <String>[
        statusText,
      ];
  }
}

String getStatusText(String apiStatus) {
  switch (apiStatus) {
    case 'canceled':
      return 'Cancelled';
    case 'success':
    case 'failed':
      return 'Successful';
    case 'expired':
      return 'Expired';
    case 'waiting':
    case 'creating':
    case 'processing':
      return 'In progress';
    default:
      return apiStatus;
  }
}

String getUpperCaseValue(String value) => value.toUpperCase();

String getLanguageString(String apiLanguageCode) {
  final languageString = {
    'TH': 'ภาษาไทย',
    'ZH': '繁體中文',
    'MY': 'ဗမာဘာသာစကား',
    'VI': 'Tiếng Việt',
    'KM': 'ភាសាខ្មែរ',
    'ID': 'Indonesia',
  };

  return languageString[apiLanguageCode] ?? 'English';
}

String languageCodeToLanguageCumCountryCode(String languageCode) {
  final languageCodesMap = {
    'en': 'en-US',
    'th': 'th-TH',
    'vi': 'vi-VN',
    'my': 'my-MM',
    'km': 'km-KH',
    'ko': 'ko-KR',
    'zh': 'zh-TW',
    'id': 'id-ID',
    'ms': 'ms-BN',
  };

  return languageCodesMap[languageCode.toLowerCase()] ??
      languageCode.toLowerCase();
}

bool checkIfMandarin(String languageCode) => languageCode == 'ZH';

bool checkIfIndonesian(String languageCode) => languageCode == 'ID';

String toSupportedLanguage(String value) {
  final supportedLanguageList = ['TH', 'ZH', 'MY', 'VI', 'ID', 'KM'];

  return supportedLanguageList.contains(value) ? value : 'EN';
}

Locale toLocale(String apiLanguageCode) =>
    Locale(apiLanguageCode.toLowerCase());

String fileNameFromPath(String source) => path.basename(source);

String fileTypeFromPath(String source) {
  return path.extension(source);
}

/// Filters and extracts the query parameter from the provided [uri] that contains ezrx domain.
/// This is necessary when the redirecting URI is passed as a query parameter
/// to the original URI.
/// Example url -> EZRX://clicktime.symantec.com/15tStdWWRBCjGxB6bujRD?h=zRUjvnB-oJ7CeZWGKRQJobPyV8b1EJMcAlvzEMzuV0Y=&amp;u=https://uat-my.ezrx.com/login/set-password?username%3D****%26token%3D******
Uri getFilteredResetPasswordUri(Uri uri) {
  final link = uri.queryParameters.values.firstWhere(
    (element) => element.contains(GetIt.instance<Config>().domain),
    orElse: () => uri.toString(),
  );

  return Uri.parse(link);
}

bool isResetPasswordLink(String path) => path == '/login/set-password';

bool isDealOrOverrideBonus(String type) => type == 'Deals' || type == 'Bonus';

String getPoReferenceHintText(bool value) =>
    value ? 'Enter your PO reference' : 'Enter your PO reference (Optional)';

bool isProductDetailLink(String path) => path.startsWith('/product-details');

bool isProductListLink(String path) => path == '/product-listing';

bool isBundleDetailLink(String path) => path.startsWith('/bundle-details');

bool isOrderDetailLink(String path) =>
    path == '/my-account/orders/order-detail';

bool isReturnSummaryDetailLink(String path) =>
    path == '/my-account/return-summary-details';

bool isZPPaymentSummaryDetailLink(String path) =>
    path == '/payments/payment-summary/invoice-details';

bool isMPPaymentSummaryDetailLink(String path) =>
    path == '/marketplace-payments/payment-summary/invoice-details';

bool isZPInvoiceDetailLink(String path) =>
    path == '/payments/account-summary/invoice-details';

bool isMPInvoiceDetailLink(String path) =>
    path == '/marketplace-payments/account-summary/invoice-details';

bool isMyAccountPaymentLink(String path) => path == '/my-account/payments';

bool isContactUsLink(String path) => path == '/contact-us';

bool isFaqLink(String path) => path == '/faq';

bool isAboutUsLink(String path) => path == '/about-us';

bool isUserGuideLink(String path) => path == '/user-guide';

String getViewByItemTitle(int value) {
  switch (value) {
    case 0:
      return 'All';
    case 1:
      return 'MP items';
    case 2:
      return 'ZP items';
    default:
      return '';
  }
}

String getViewByOrderHistoryTitle(int value) {
  switch (value) {
    case 0:
      return 'All';
    case 1:
      return 'MP orders';
    case 2:
      return 'ZP orders';
    default:
      return '';
  }
}
