import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const lightSecondary = Color.fromRGBO(227, 236, 147, 1.0);
  const lightRed = Color.fromRGBO(251, 208, 208, 1);
  const displayDate = '11 Oct 2022';
  group('returnsAllowed display value object', () {
    test(
      '=> should return Yes when returnsAllowed is True',
      () async {
        const input = true;
        final returnsAllowed = ReturnsAllowed(input);
        final result = returnsAllowed.display;
        expect(result, 'Yes');
      },
    );
    test(
      '=> should return No when returnsAllowed is False',
      () async {
        const input = false;
        final returnsAllowed = ReturnsAllowed(input);
        final result = returnsAllowed.display;
        expect(result, 'No');
      },
    );
  });
  group('returnsAllowed labelColor value object', () {
    test(
      '=> should return ZPColors.lightSecondary when returnsAllowed is True',
      () async {
        const input = true;
        final returnsAllowed = ReturnsAllowed(input);
        final result = returnsAllowed.labelColor;
        expect(result, lightSecondary);
      },
    );
    test(
      '=> should return ZPColors.lightRed when returnsAllowed is False',
      () async {
        const input = false;
        final returnsAllowed = ReturnsAllowed(input);
        final result = returnsAllowed.labelColor;
        expect(result, lightRed);
      },
    );
  });

  group('DateTimeStringValue value object', () {
    test(
      '=> should return human readable date',
      () async {
        const input = '20221011';
        final simpleDate = DateTimeStringValue(input);
        final result = simpleDate.toValidDateString;
        expect(result, displayDate);
      },
    );
  });

  group('InvoiceDate value object', () {
    test(
      'should return DateTimeStringValue',
      () async {
        final input =getDateStringByDateTime( DateTime.now());
        final simpleInvoiceDate = DateTimeStringValue(input);
        final dateTimeByDateString = simpleInvoiceDate.apiDateTimeFormat;
        expect(dateTimeByDateString, input);
      },
    );

    test(
      'should return Formated Date String (yyyyMMdd)',
      () async {
        final input = DateTime.now();
        final simpleInvoiceDate = DateTimeStringValue(getDateStringByDateTime(input));
        final apiParameterValueOrEmpty = simpleInvoiceDate.apiDateTimeFormat;
        expect(apiParameterValueOrEmpty,
            DateFormat(DateTimeFormatString.apiFormat).format(input));
      },
    );
  });

  group('FilterStatus value object', () {
    test(
      'FilterStatus All lable test',
      () async {
        final filterStatus = FilterStatus('ALL');
        expect(filterStatus.label, 'All');
      },
    );
    test(
      'FilterStatus pending lable test',
      () async {
        final filterStatus = FilterStatus('PENDING');
        expect(filterStatus.label, 'Pending Review');
      },
    );
    test(
      'FilterStatus All lable test',
      () async {
        final filterStatus = FilterStatus('COMPLETED');
        expect(filterStatus.label, 'Completed');
      },
    );

    test(
      'FilterStatus All apiSortValue test',
      () async {
        final filterStatus = FilterStatus('ALL');
        expect(filterStatus.apiSortValueOrEmpty, '');
      },
    );
    test(
      'FilterStatus pending apiSortValue test',
      () async {
        const input = 'PENDING';
        final filterStatus = FilterStatus(input);
        expect(filterStatus.apiSortValueOrEmpty, input);
      },
    );
    test(
      'FilterStatus complete apiSortValue test',
      () async {
        const input = 'COMPLETED';
        final filterStatus = FilterStatus(input);
        expect(filterStatus.apiSortValueOrEmpty, input);
      },
    );
  });
}
