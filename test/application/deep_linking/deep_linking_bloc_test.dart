import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeepLinkingRepositoryMock extends Mock
    implements IDeepLinkingRepository {}

class UniversalLinkServiceMock extends Mock implements DeepLinkingService {}

void main() {
  late IDeepLinkingRepository repository;
  late DeepLinkingService service;
  const fakeStream = Stream.empty();
  final fakeSubscription = fakeStream.listen((_) {});
  final fakeCustomerCode = CustomerCodeInfo.empty();
  final fakeShipToCode = ShipToInfo.empty();
  const orderDetailLink = '/my-account/orders/order-detail';

  setUp(() {
    repository = DeepLinkingRepositoryMock();
    service = UniversalLinkServiceMock();
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(() => service.init()).thenAnswer((_) async => fakeSubscription);
    },
    verify: (_) {
      verify(() => service.init()).called(1);
    },
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Add pending link',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.addPendingLink(
        Uri(scheme: 'fakeScheme', host: 'fakeHost'),
      ),
    ),
    expect: () => [
      DeepLinkingState.linkPending(
        Uri(scheme: 'fakeScheme', host: 'fakeHost'),
      )
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume pending link when state is not DeepLinkingState.linkPending',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    seed: () => const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume an unsupported pending link',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    seed: () => DeepLinkingState.linkPending(
      Uri(scheme: 'fakeScheme', host: 'fakeHost'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link success',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(Right(OrderNumber('fake-order-history')));
    },
    seed: () => DeepLinkingState.linkPending(Uri(path: orderDetailLink)),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      DeepLinkingState.redirectOrderDetail(OrderNumber('fake-order-history')),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link failure',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    setUp: () {
      when(
        () => repository.extractOrderNumber(
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(path: orderDetailLink),
        ),
      ).thenReturn(
        const Left(ApiFailure.orderDetailRoute()),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: orderDetailLink),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(ApiFailure.orderDetailRoute()),
    ],
  );
}
