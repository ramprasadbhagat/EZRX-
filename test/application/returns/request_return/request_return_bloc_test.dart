void main() {}
/*
class ReturnRequestRepositoryMock extends Mock
    implements RequestReturnRepository {}

const _defaultPageSize = 20;

void main() {
  final repository = ReturnRequestRepositoryMock();
  final fakeSalesOrg = SalesOrganisation.empty();
  final fakeShipToInfo = ShipToInfo.empty();
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty();
  final fakeRequestReturnFilter = RequestReturnFilter.empty();

  late ReturnItem updatedReturnItem;
  late ReturnRequest requestReturn;
  final loadedReturnItems = <ReturnItem>[];
  final documentList = [
    PoDocuments.empty().copyWith(name: 'fake-name', url: 'fake-url')
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requestReturn =
        await RequestReturnLocalDatasource().searchReturnMaterials();
    updatedReturnItem = requestReturn.items.first.copyWith(
      isSelected: true,
    );
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
                offset: 0,
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
                offset: 0,
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
                offset: requestReturn.items.length,
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
                offset: requestReturn.items.length,
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

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Update return details',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: requestReturn.items,
        ),
        act: (bloc) => bloc
          ..add(RequestReturnEvent.updateReturnDetails(
              updatedItem: requestReturn.items.first.copyWith(
            isSelected: true,
          ))),
        expect: () => [
          RequestReturnState.initial().copyWith(
              returnItemList: _updatedReturnItemList(
                  updatedReturnItem, requestReturn.items)),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Update return request reference number',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        act: (bloc) => bloc
          ..add(const RequestReturnEvent.updateReturnRequestReferenceNumber(
              referenceNumber: 'fake-refNumber')),
        expect: () => [
          RequestReturnState.initial()
              .copyWith(returnReferenceNumber: 'fake-refNumber'),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
          'initialize return request',
          build: () => RequestReturnBloc(returnRequestRepository: repository),
          seed: () => RequestReturnState.initial().copyWith(
                specialInstructions: 'fake-instructions',
                returnReferenceNumber: 'fake-number',
                returnItemList: [requestReturn.items.first],
              ),
          act: (bloc) => bloc
            ..add(const RequestReturnEvent.initializeSelectedReturnItems()),
          expect: () => [
                RequestReturnState.initial().copyWith(
                    specialInstructions: '',
                    returnReferenceNumber: '',
                    returnItemList: [
                      requestReturn.items.first.copyWith(
                        isSelected: false,
                        poDocuments: [],
                        returnQuantity: ReturnQuantity(''),
                        usage: Usage.empty(),
                      )
                    ]),
              ]);

      blocTest<RequestReturnBloc, RequestReturnState>(
        'Upload documents',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: requestReturn.items,
        ),
        act: (RequestReturnBloc bloc) {
          bloc.add(
            RequestReturnEvent.uploadAttachments(
                poDocuments: documentList,
                uniqueId: 'Value(Right(000000000021026760))1080004890'),
          );
        },
        expect: () => [
          RequestReturnState.initial().copyWith(
              returnItemList: _updatedReturnItemList(
                  requestReturn.items.first.copyWith(poDocuments: documentList),
                  requestReturn.items)),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'delete documents',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        seed: () => RequestReturnState.initial().copyWith(
          returnItemList: [
            requestReturn.items.first.copyWith(poDocuments: documentList)
          ],
        ),
        act: (RequestReturnBloc bloc) {
          bloc.add(
            RequestReturnEvent.deleteAttachment(
                poDocuments: documentList.first,
                uniqueId: 'Value(Right(000000000021026760))1080004890'),
          );
        },
        expect: () => [
          RequestReturnState.initial()
              .copyWith(returnItemList: [requestReturn.items.first]),
        ],
      );

      blocTest<RequestReturnBloc, RequestReturnState>(
        'update special instructions',
        build: () => RequestReturnBloc(returnRequestRepository: repository),
        act: (RequestReturnBloc bloc) {
          bloc.add(
            const RequestReturnEvent.updateSpecialInstructions(
                specialInstructions: 'fake-instructions'),
          );
        },
        expect: () => [
          RequestReturnState.initial()
              .copyWith(specialInstructions: 'fake-instructions'),
        ],
      );
    },
  );
}

List<ReturnItem> _updatedReturnItemList(
    ReturnItem updatedItem, List<ReturnItem> returnItemList) {
  final returnItemToUpdateIndex = returnItemList.indexWhere(
    (element) => element.uniqueId == updatedItem.uniqueId,
  );

  return List.from(returnItemList)
    ..removeAt(returnItemToUpdateIndex)
    ..insert(returnItemToUpdateIndex, updatedItem);
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
*/
