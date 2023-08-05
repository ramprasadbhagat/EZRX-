import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_document_type_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderDocumentTypeRepositoryMock extends Mock
    implements OrderDocumentTypeRepository {}

class CartStorageMock extends Mock implements CartStorage {}

void main() {
  final orderDocumentTypeRepository = OrderDocumentTypeRepositoryMock();

  final mockSalesOrganisation = SalesOrganisation.empty();
  final selectedOrderDocumentType = OrderDocumentType.empty()
      .copyWith(documentType: DocumentType('ZP Regular Order (ZPOR)'));
  late final List<OrderDocumentType> orderDocumentTypeListMock;
  late OrderDocumentType orderTypeFromStorage;
  late final List<OrderDocumentType> orderDocumentTypeListEDICustomerMock;
  final fakeOrderDocumentTypeList = [
    OrderDocumentType.empty().copyWith(
      documentType: DocumentType('fake-document-type (ZPOR)'),
      orderReason: 'fake-reason',
    ),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    orderTypeFromStorage =
        OrderDocumentType.defaultSelected(salesOrg: SalesOrg('2601'));
    orderDocumentTypeListMock =
        await OrderDocumentTypeLocalDataSource().getOrderDocumentTypList();
    orderDocumentTypeListEDICustomerMock =
        await OrderDocumentTypeLocalDataSource().getOrderDocumentTypList();
    orderDocumentTypeListEDICustomerMock
        .removeWhere((element) => element.documentType.isZPOR);
  });

  group('Order DocumentType List BLOC', () {
    blocTest(
      'Initialize',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.deleteOrderTypeFromCartStorage(),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: ((OrderDocumentTypeBloc bloc) =>
          bloc.add(const OrderDocumentTypeEvent.initialized())),
      expect: () => [OrderDocumentTypeState.initial()],
    );

    blocTest(
      'Initialize with error while deleting',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.deleteOrderTypeFromCartStorage(),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        );
      },
      act: ((OrderDocumentTypeBloc bloc) =>
          bloc.add(const OrderDocumentTypeEvent.initialized())),
      expect: () => [OrderDocumentTypeState.initial()],
    );

    blocTest(
      'order Document Type List Failure',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(
            salesOrganisation: mockSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.fetch(
          salesOrganisation: mockSalesOrganisation,
          isEDI: false,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          isSubmitting: false,
        ),
      ],
    );

    blocTest(
      'order Document Type List Success',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(
            salesOrganisation: mockSalesOrganisation,
          ),
        ).thenAnswer((invocation) async => Right(orderDocumentTypeListMock));
        when(
          () => orderDocumentTypeRepository.getOrderTypeFromCartStorage(),
        ).thenAnswer((invocation) => Right(orderTypeFromStorage));
        when(
          () => orderDocumentTypeRepository.putOrderTypeToCartStorage(
            orderType: orderTypeFromStorage,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.fetch(
          salesOrganisation: mockSalesOrganisation,
          isEDI: false,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListMock)),
          isSubmitting: false,
          orderDocumentTypeList: orderDocumentTypeListMock,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListMock)),
          isSubmitting: false,
          isOrderTypeSelected: true,
          selectedOrderType: orderDocumentTypeListMock.first,
          orderDocumentTypeList: orderDocumentTypeListMock,
        ),
      ],
    );

    blocTest(
      'order Document Type List Success For EDI Customer',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(
            salesOrganisation: mockSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(orderDocumentTypeListEDICustomerMock),
        );
        when(
          () => orderDocumentTypeRepository.getOrderTypeFromCartStorage(),
        ).thenAnswer((invocation) => Right(orderTypeFromStorage));
        when(
          () => orderDocumentTypeRepository.putOrderTypeToCartStorage(
            orderType: orderDocumentTypeListEDICustomerMock.first,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.fetch(
          salesOrganisation: mockSalesOrganisation,
          isEDI: true,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListEDICustomerMock)),
          isSubmitting: false,
          orderDocumentTypeList: orderDocumentTypeListEDICustomerMock,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListEDICustomerMock)),
          isSubmitting: false,
          isOrderTypeSelected: true,
          selectedOrderType: orderDocumentTypeListEDICustomerMock.first,
          orderDocumentTypeList: orderDocumentTypeListEDICustomerMock,
        ),
      ],
    );

    blocTest(
      'Fetch Order Document Type when storage is empty and send error',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(
            salesOrganisation: mockSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(orderDocumentTypeListEDICustomerMock),
        );
        when(
          () => orderDocumentTypeRepository.getOrderTypeFromCartStorage(),
        ).thenAnswer(
          (invocation) => const Left(ApiFailure.other('Fake-Error')),
        );
        when(
          () => orderDocumentTypeRepository.putOrderTypeToCartStorage(
            orderType: orderDocumentTypeListEDICustomerMock.first,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.fetch(
          salesOrganisation: mockSalesOrganisation,
          isEDI: true,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListEDICustomerMock)),
          isSubmitting: false,
          orderDocumentTypeList: orderDocumentTypeListEDICustomerMock,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
              optionOf(Right(orderDocumentTypeListEDICustomerMock)),
          isSubmitting: false,
          isOrderTypeSelected: true,
          selectedOrderType: orderDocumentTypeListEDICustomerMock.first,
          orderDocumentTypeList: orderDocumentTypeListEDICustomerMock,
        ),
      ],
    );

    blocTest(
      'For order document type "selected" Event if reason is true',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.putOrderTypeToCartStorage(
            orderType: selectedOrderDocumentType,
          ),
        ).thenAnswer(
          (invocation) async => const Right(
            unit,
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.selectedOrderType(
          isReasonSelected: true,
          selectedOrderType: selectedOrderDocumentType,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isReasonSelected: true,
          selectedReason: selectedOrderDocumentType,
        ),
      ],
    );

    blocTest(
      'For order document type "selected" Event and putting to storage is Failure',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.putOrderTypeToCartStorage(
            orderType: selectedOrderDocumentType,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake-Error'),
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.selectedOrderType(
          isReasonSelected: true,
          selectedOrderType: selectedOrderDocumentType,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isReasonSelected: true,
          selectedReason: selectedOrderDocumentType,
        ),
      ],
    );

    blocTest(
      'For order document type "selected" Event if reason is false',
      build: () => OrderDocumentTypeBloc(
        orderDocumentTypeRepository: orderDocumentTypeRepository,
      ),
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
        OrderDocumentTypeEvent.selectedOrderType(
          isReasonSelected: false,
          selectedOrderType: selectedOrderDocumentType,
        ),
      ),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isOrderTypeSelected: true,
          selectedOrderType: selectedOrderDocumentType,
        ),
      ],
    );

    test(
      'Test reasonList',
      () {
        final reasonList = OrderDocumentTypeState.initial()
            .copyWith(
              orderDocumentTypeList: fakeOrderDocumentTypeList,
              selectedOrderType: fakeOrderDocumentTypeList.first,
            )
            .reasonList;
        expect(
          reasonList,
          fakeOrderDocumentTypeList,
        );
      },
    );

    test(
      'Test isReasonFieldEnable',
      () {
        final isReasonFieldEnable = OrderDocumentTypeState.initial()
            .copyWith(
              orderDocumentTypeList: fakeOrderDocumentTypeList,
              selectedOrderType: fakeOrderDocumentTypeList.first.copyWith(
                documentType: DocumentType('Test Ordertype (ZPFB)'),
              ),
              isOrderTypeSelected: true,
            )
            .isReasonFieldEnable;
        expect(
          isReasonFieldEnable,
          false,
        );
      },
    );
  });
}
