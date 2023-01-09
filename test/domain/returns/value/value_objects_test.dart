import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const lightSecondary = Color.fromRGBO(227, 236, 147, 1.0);
  const lightRed = Color.fromRGBO(251, 208, 208, 1);
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
}
