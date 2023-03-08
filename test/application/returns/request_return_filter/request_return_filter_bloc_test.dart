import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final toInvoiceDate = DateTime.now();
  final fromInvoiceDate = DateTime.now().subtract(const Duration(days: 10));
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  group(
    'Request Return Filter Bloc => ',
    () {
      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'Initialized',
        build: () => RequestReturnFilterBloc(),
        act: (bloc) => bloc.add(
          const RequestReturnFilterEvent.initialized(),
        ),
        expect: () => [
          RequestReturnFilterState.initial(),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'assignmentNumberChanged',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc.add(
          RequestReturnFilterEvent.assignmentNumberChanged(
            SearchKey.searchFilter('1080004890').getOrDefaultValue(''),
          ),
        ),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              assignmentNumber: SearchKey.searchFilter('1080004890'),
            ),
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'batchChanged',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc.add(
          RequestReturnFilterEvent.batchChanged(
            SearchKey.searchFilter('230721').getOrDefaultValue(''),
          ),
        ),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              batch: SearchKey.searchFilter('230721'),
            ),
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'materialDescriptionSearchChanged',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc.add(
          RequestReturnFilterEvent.materialDescriptionSearchChanged(
            SearchKey.searchFilter('Physiogel CR A.I. Cream 50ml')
                .getOrDefaultValue(''),
          ),
        ),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              materialDescription:
                  SearchKey.searchFilter('Physiogel CR A.I. Cream 50ml'),
            ),
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'materialNumberSearchChanged',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc.add(
          RequestReturnFilterEvent.materialNumberSearchChanged(
            SearchKey.searchFilter('000000000021026760').getOrDefaultValue(''),
          ),
        ),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              materialNumber: SearchKey.searchFilter('000000000021026760'),
            ),
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'principalSearchChanged',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc.add(
          RequestReturnFilterEvent.principalSearchChanged(
            SearchKey.searchFilter('GSK Consumer Healthcare')
                .getOrDefaultValue(''),
          ),
        ),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              principalSearch:
                  SearchKey.searchFilter('GSK Consumer Healthcare'),
            ),
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'Date Filter',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc
          ..add(
            RequestReturnFilterEvent.setInvoiceDate(
              invoiceDateRange:
                  DateTimeRange(start: fromInvoiceDate, end: toInvoiceDate),
            ),
          )
          ..add(const RequestReturnFilterEvent.filterRequestReturn()),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              fromInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(fromInvoiceDate),
              ),
            ),
          ),
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              fromInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(fromInvoiceDate),
              ),
              toInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(toInvoiceDate),
              ),
            ),
            isSubmitting: true,
            showErrorMessages: false,
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'Date Filter with Same Date',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) => bloc
          ..add(
            RequestReturnFilterEvent.setInvoiceDate(
              invoiceDateRange: DateTimeRange(
                start: toInvoiceDate,
                end: toInvoiceDate,
              ),
            ),
          )
          ..add(const RequestReturnFilterEvent.filterRequestReturn()),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              fromInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(toInvoiceDate),
              ),
            ),
          ),
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              fromInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(toInvoiceDate),
              ),
              toInvoiceDate: DateTimeStringValue(
                getDateStringByDateTime(toInvoiceDate),
              ),
            ),
            isSubmitting: true,
            showErrorMessages: false,
          ),
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'filterRequestReturn',
        build: (() => RequestReturnFilterBloc()),
        act: (bloc) =>
            bloc.add(const RequestReturnFilterEvent.filterRequestReturn()),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: false,
          ),
          RequestReturnFilterState.initial().copyWith(
            isSubmitting: true,
          )
        ],
      );

      blocTest<RequestReturnFilterBloc, RequestReturnFilterState>(
        'filterRequestReturn with inValid',
        build: (() => RequestReturnFilterBloc()),
        seed: () => RequestReturnFilterState.initial().copyWith(
          requestReturnFilter: RequestReturnFilter.empty().copyWith(
            assignmentNumber: SearchKey(''),
          ),
        ),
        act: (bloc) =>
            bloc.add(const RequestReturnFilterEvent.filterRequestReturn()),
        expect: () => [
          RequestReturnFilterState.initial().copyWith(
            requestReturnFilter: RequestReturnFilter.empty().copyWith(
              assignmentNumber: SearchKey(
                const Left(
                  ValueFailure<String>.empty(failedValue: ''),
                ).fold((l) => l.failedValue, (r) => r),
              ),
            ),
            showErrorMessages: true,
            isSubmitting: false,
          )
        ],
      );
    },
  );
}
