import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_document_type_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class OrderDocumentTypeRepositoryMock extends Mock
    implements OrderDocumentTypeRepository {}

void main() {
  final orderDocumentTypeRepository = OrderDocumentTypeRepositoryMock();

  final mockSalesOrganisation = SalesOrganisation.empty();
  final selectedOrderDocumentType= OrderDocumentType.empty().copyWith(documentType: 'ZPOR');
  late final List<OrderDocumentType> orderDocumentTypeListMock;
  late final List<OrderDocumentType> orderDocumentTypeListEDICustomerMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    orderDocumentTypeListMock = await OrderDocumentTypeLocalDataSource().getOrderDocumentTypList();
    orderDocumentTypeListEDICustomerMock = await OrderDocumentTypeLocalDataSource().getOrderDocumentTypList();
    orderDocumentTypeListEDICustomerMock
        .removeWhere((element) => element.documentType.contains('ZPOR'));
  });

  group('Order DocumentType List BLOC', () {
    blocTest(
      'Initialize',
      build: () =>
          OrderDocumentTypeBloc(orderDocumentTypeRepository: orderDocumentTypeRepository),
      act: ((OrderDocumentTypeBloc bloc) =>
          bloc.add(const OrderDocumentTypeEvent.initialized())),
      expect: () => [OrderDocumentTypeState.initial()],
    );

    blocTest(
      'order Document Type List Failure',
      build: () =>
          OrderDocumentTypeBloc(orderDocumentTypeRepository: orderDocumentTypeRepository),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(salesOrganisation: mockSalesOrganisation),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OrderDocumentTypeBloc bloc) =>
          bloc.add(OrderDocumentTypeEvent.fetch(salesOrganisation: mockSalesOrganisation,isEDI: false)),
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
      build: () =>
          OrderDocumentTypeBloc(orderDocumentTypeRepository: orderDocumentTypeRepository),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(salesOrganisation: mockSalesOrganisation),
        ).thenAnswer(
          (invocation) async => Right(orderDocumentTypeListMock)
        );
      },
      act: (OrderDocumentTypeBloc bloc) =>
          bloc.add(OrderDocumentTypeEvent.fetch(salesOrganisation: mockSalesOrganisation, isEDI: false)),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
          orderDocumentTypeListFailureOrSuccessOption:
                  optionOf(Right(orderDocumentTypeListMock)),
              isSubmitting: false,
            orderDocumentTypeList: orderDocumentTypeListMock),
      ],
    );

    blocTest(
      'order Document Type List Success For EDI Customer',
      build: () => OrderDocumentTypeBloc(
          orderDocumentTypeRepository: orderDocumentTypeRepository),
      setUp: () {
        when(
          () => orderDocumentTypeRepository.getOrderDocumentTypList(
              salesOrganisation: mockSalesOrganisation),
        ).thenAnswer(
            (invocation) async => Right(orderDocumentTypeListEDICustomerMock));
      },
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
          OrderDocumentTypeEvent.fetch(
              salesOrganisation: mockSalesOrganisation, isEDI: true)),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isSubmitting: true,
        ),
        OrderDocumentTypeState.initial().copyWith(
            orderDocumentTypeListFailureOrSuccessOption:
                optionOf(Right(orderDocumentTypeListEDICustomerMock)),
            isSubmitting: false,
            orderDocumentTypeList: orderDocumentTypeListEDICustomerMock),
      ],
    );

    blocTest(
      'For order document type "selected" Event if reason is true',
      build: () =>  OrderDocumentTypeBloc(orderDocumentTypeRepository: orderDocumentTypeRepository),
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
          OrderDocumentTypeEvent.selectedOrderType(isReasonSelected: true,selectedOrderType: selectedOrderDocumentType)),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isReasonSelected: true,
          selectedReason: selectedOrderDocumentType,
        ),
      ],
    );

    blocTest(
      'For order document type "selected" Event if reason is false',
      build: () =>  OrderDocumentTypeBloc(orderDocumentTypeRepository: orderDocumentTypeRepository),
      act: (OrderDocumentTypeBloc bloc) => bloc.add(
          OrderDocumentTypeEvent.selectedOrderType(isReasonSelected: false,selectedOrderType: selectedOrderDocumentType)),
      expect: () => [
        OrderDocumentTypeState.initial().copyWith(
          isOrderTypeSelected: true,
          selectedOrderType: selectedOrderDocumentType,
        ),
      ],
    );
  });
}
