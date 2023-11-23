import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringValue Value Object', () {
    test(
      'StringValue display dash If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayDashIfEmpty,
          '-',
        );
      },
    );
    test(
      'StringValue display NA If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayNAIfEmpty,
          'NA',
        );
      },
    );

    test(
      'StringValue display Zeros If Empty',
      () {
        final valObj = StringValue('');
        expect(
          valObj.displayZerosIfEmpty,
          '00000000',
        );
      },
    );
  });

  group('IntegerValue Value Object', () {
    test(
      'IntegerValue display integer when input is double ',
      () {
        final valObj = IntegerValue('1.000');
        expect(
          valObj.apiParameterValue,
          '1',
        );
      },
    );

    test(
      'IntegerValue display empty when input is 0 ',
      () {
        final valObj = IntegerValue('0');
        expect(
          valObj.apiParameterValue,
          '',
        );
      },
    );

    test(
      'IntegerValue display empty when input is empty ',
      () {
        final valObj = IntegerValue('');
        expect(
          valObj.apiParameterValue,
          '',
        );
      },
    );
  });

  group('DateTimeStringValue Value Object', () {
    test('should create a valid DateTimeStringValue', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.value.isRight(), true);
      expect(dateTimeStringValue.value.getOrElse(() => ''), dateTimeString);
    });

    test('should create a valid DateTimeStringValue for announcement', () {
      const dateTimeString = '7/20/2023 10:30 AM';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.value.isRight(), true);
      expect(dateTimeStringValue.value.getOrElse(() => ''), dateTimeString);
    });

    test('should return a valid date string', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.dateString, '20 Jul 2023');
    });

    test(
        'should return NA if DateTimeStringValue is empty when getting a valid date string',
        () {
      final dateTimeStringValue = DateTimeStringValue('');

      expect(dateTimeStringValue.dateOrNaString, 'NA');
    });

    test('should return a valid simple date time string', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.simpleDateString, 'Jul 2023');
    });

    test('should check if DateTimeStringValue is not empty', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.isNotEmpty, true);
    });

    test('should return a valid API date time format', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.apiDateTimeString, '20230720');
    });

    test('should return a valid API date with dash format', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.apiDateWithDashString, '2023-07-20');
    });

    test('should return a DateTime object from a date string', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(
        dateTimeStringValue.dateTime,
        DateTime.utc(2023, 7, 20, 12, 00).toLocal(),
      );
    });

    test('should return a DateTime object from an announcement date string',
        () {
      const dateTimeString = '7/20/2023 10:30 AM';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.dateTime, DateTime(2023, 7, 20, 10, 30));
    });

    test('should check if a DateTime object is before another DateTime', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(
        dateTimeStringValue.dateTime.isBefore(DateTime(2023, 7, 21)),
        true,
      );
    });

    test('should return a valid DateTime int value', () {
      const dateTimeString = '20230720120000';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.intValue, 20230720120000);
    });

    test('should return a valid date string', () {
      const dateTimeString = '2023-07-20 12:00:00';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.dateString, '20 Jul 2023');
    });

    test(
        'should return dash (-) if DateTimeStringValue is empty when getting a valid date string',
        () {
      final dateTimeStringValue = DateTimeStringValue('');

      expect(dateTimeStringValue.dateTimeOrDashString, '-');
    });

    test('should return a valid date time string', () {
      const dateTimeString = '7/20/2023 10:30 AM';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.dateOrDashString, '20 Jul 2023');
    });

    test('should return a valid date time string with time part', () {
      const dateTimeString = '7/20/2023 10:30 AM';
      final dateTimeStringValue = DateTimeStringValue(dateTimeString);

      expect(dateTimeStringValue.dateTimeOrDashString, '20 Jul 2023 10:30:00');
    });
  });

  group('FilterStatus Value Object', () {
    test(
      'FilterStatus display dash If Empty',
      () {
        final valObj = FilterStatus('');
        expect(
          valObj.stringValue,
          '-',
        );
      },
    );
    test(
      'check true false if status is processed or successful',
      () {
        final valObjForSuccess = FilterStatus('Successful');
        expect(
          valObjForSuccess.getIsSuccessfulOrProcessed,
          true,
        );
        final valObjForProcessed = FilterStatus('Processed');
        expect(
          valObjForProcessed.getIsSuccessfulOrProcessed,
          true,
        );
      },
    );
  });

  group('Return NA if datetime string is all ZEROs(00000000)', () {
    test(
      'Return NA if datetime string is all ZEROs(00000000)',
      () {
        final dateTimeStringValue = DateTimeStringValue('00000000');
        expect(dateTimeStringValue.dateOrNaString, 'NA');
      },
    );
  });

  group('OosMaterial test', () {
    test(
      'OosMaterial true oosMaterialTag OOS-Preorder',
      () {
        final oosMaterial = OosMaterial(true);
        expect(oosMaterial.oosMaterialTag, 'OOS-Preorder');
      },
    );

    test(
      'OosMaterial false oosMaterialTag Out of stock',
      () {
        final oosMaterial = OosMaterial(false);
        expect(oosMaterial.oosMaterialTag, 'Out of stock');
      },
    );
  });

  group('FilterStatus OOS-Preorder test', () {
    test(
      'FilterStatus OOS-Preorder ',
      () {
        final statusType = FilterStatus('OOS-Preorder');
        expect(statusType.getValue(), 'OOS-Preorder');
        expect(statusType.getValue(), 'OOS-Preorder');
        expect(statusType.displayStatusTextColor, ZPColors.black);
        expect(statusType.displayStatusLabelColor, ZPColors.lightYellow);
      },
    );
  });

  group('FilterStatus value object', () {
    test(
      'FilterStatus All lable test',
      () async {
        final filterStatus = FilterStatus('ALL');
        expect(filterStatus.sortLabel, 'All');
      },
    );
    test(
      'FilterStatus pending lable test',
      () async {
        final filterStatus = FilterStatus('PENDING');
        expect(filterStatus.sortLabel, 'Pending Review');
      },
    );
    test(
      'FilterStatus All lable test',
      () async {
        final filterStatus = FilterStatus('COMPLETED');
        expect(filterStatus.sortLabel, 'Completed');
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
