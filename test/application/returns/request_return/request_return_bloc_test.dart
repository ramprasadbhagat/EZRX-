import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/request_return_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestRepositoryMock extends Mock
    implements RequestReturnRepository {}

const _defaultPageSize = 20;

void main() {
  final repository = ReturnRequestRepositoryMock();
  final fakeSalesOrg = SalesOrganisation.empty();
  final fakeShipToInfo = ShipToInfo.empty();
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty();
  final fakeRequestReturnFilter = RequestReturnFilter.empty();

  late ReturnRequest requestReturn;
  final loadedReturnItems = <ReturnItem>[];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requestReturn =
        await RequestReturnLocalDatasource().searchReturnMaterials();
    loadedReturnItems.addAll(requestReturn.items);
    loadedReturnItems.addAll(requestReturn.items);
  });

  group(
    'Request Return Bloc =>',
    () {
      blocTest<RequestReturnBloc, RequestReturnState>(
        'Initialize',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        act: (bloc) => bloc.add(
          const RequestReturnEvent.initialized(),
        ),
        expect: () => [
          RequestReturnState.initial(),
        ],
      );
      blocTest<RequestReturnBloc, RequestReturnState>(
        'Fetch with Failure',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        setUp: () {
          when(() => repository.searchReturnRequestList(
                salesOrganisation: fakeSalesOrg,
                shipToInfo: fakeShipToInfo,
                customerCodeInfo: fakeCustomerCodeInfo,
                offSet: 0,
                pageSize: _defaultPageSize,
                requestReturnFilter: fakeRequestReturnFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          RequestReturnEvent.fetch(
            salesOrg: fakeSalesOrg,
            shipInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            requestReturnFilter: fakeRequestReturnFilter,
          ),
        ),
        expect: () => [
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            returnItemList: [],
            isLoading: true,
          ),
          RequestReturnState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Fetch with Success',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        setUp: () {
          when(() => repository.searchReturnRequestList(
                salesOrganisation: fakeSalesOrg,
                shipToInfo: fakeShipToInfo,
                customerCodeInfo: fakeCustomerCodeInfo,
                offSet: 0,
                pageSize: _defaultPageSize,
                requestReturnFilter: fakeRequestReturnFilter,
              )).thenAnswer(
            (invocation) async => Right(
              requestReturn,
            ),
          );
        },
        act: (bloc) => bloc.add(
          RequestReturnEvent.fetch(
            salesOrg: fakeSalesOrg,
            shipInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            requestReturnFilter: fakeRequestReturnFilter,
          ),
        ),
        expect: () => [
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            returnItemList: [],
            isLoading: true,
          ),
          RequestReturnState.initial().copyWith(
            returnItemList: requestReturn.items,
            canLoadMore: requestReturn.items.length >= _defaultPageSize,
            failureOrSuccessOption: none(),
            isLoading: false,
          ),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Load more with Failure',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: requestReturn.items,
        ),
        setUp: () {
          when(() => repository.searchReturnRequestList(
                salesOrganisation: fakeSalesOrg,
                shipToInfo: fakeShipToInfo,
                customerCodeInfo: fakeCustomerCodeInfo,
                offSet: requestReturn.items.length,
                pageSize: _defaultPageSize,
                requestReturnFilter: fakeRequestReturnFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          RequestReturnEvent.loadMore(
            salesOrg: fakeSalesOrg,
            shipInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            requestReturnFilter: fakeRequestReturnFilter,
          ),
        ),
        expect: () => [
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
            returnItemList: requestReturn.items,
          ),
          RequestReturnState.initial().copyWith(
            isLoading: false,
            returnItemList: requestReturn.items,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Load more with Success',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: requestReturn.items,
        ),
        setUp: () {
          when(() => repository.searchReturnRequestList(
                salesOrganisation: fakeSalesOrg,
                shipToInfo: fakeShipToInfo,
                customerCodeInfo: fakeCustomerCodeInfo,
                offSet: requestReturn.items.length,
                pageSize: _defaultPageSize,
                requestReturnFilter: fakeRequestReturnFilter,
              )).thenAnswer(
            (invocation) async => Right(
              requestReturn,
            ),
          );
        },
        act: (bloc) => bloc.add(
          RequestReturnEvent.loadMore(
            salesOrg: fakeSalesOrg,
            shipInfo: fakeShipToInfo,
            customerCodeInfo: fakeCustomerCodeInfo,
            requestReturnFilter: fakeRequestReturnFilter,
          ),
        ),
        expect: () => [
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
            returnItemList: requestReturn.items,
          ),
          RequestReturnState.initial().copyWith(
            isLoading: false,
            returnItemList: loadedReturnItems,
            failureOrSuccessOption: none(),
          ),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Sort by Date',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: requestReturn.items,
        ),
        act: (bloc) => bloc
          ..add(const RequestReturnEvent.sortByDate(sortDirection: 'desc'))
          ..add(const RequestReturnEvent.sortByDate(sortDirection: 'asc')),
        expect: () => [
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            returnItemList: _getSortedList(
                List<ReturnItem>.from(requestReturn.items), 'desc'),
          ),
          RequestReturnState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            sortDirection: 'asc',
            returnItemList: _getSortedList(
                List<ReturnItem>.from(requestReturn.items), 'asc'),
          ),
        ],
      );
    },
  );
}

List<ReturnItem> _getSortedList(List<ReturnItem> items, String order) => items
  ..sort(
    (a, b) => _compareTo(a.expiryDate, b.expiryDate, order),
  );

int _compareTo(DateTimeStringValue a, DateTimeStringValue b, String direction) {
  switch (direction) {
    case 'asc':
      return a.getOrDefaultValue('').compareTo(b.getOrDefaultValue(''));
    case 'desc':
      return b.getOrDefaultValue('').compareTo(a.getOrDefaultValue(''));
    default:
      return 1;
  }
}
