import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeepLinkingRepositoryMock extends Mock
    implements IDeepLinkingRepository {}

class DynamicLinkServiceMock extends Mock implements DynamicLinksService {}

void main() {
  late IDeepLinkingRepository repository;
  late DynamicLinksService service;
  const fakeStream = Stream.empty();
  final fakeSubscription = fakeStream.listen((_) {});
  final fakeSalesOrg = SalesOrganisation.empty();
  final fakeCustomerCode = CustomerCodeInfo.empty();
  final fakeShipToCode = ShipToInfo.empty();

  setUp(() {
    repository = DeepLinkingRepositoryMock();
    service = DynamicLinkServiceMock();
  });

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Initialize',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    act: (bloc) => bloc.add(const DeepLinkingEvent.initialize()),
    setUp: () {
      when(
        () => service.initDynamicLinks(),
      ).thenAnswer(
        (invocation) async => fakeSubscription,
      );
    },
    verify: (_) {
      verify(() => service.initDynamicLinks()).called(1);
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
    seed: () => const DeepLinkingState.error(
      ApiFailure.materialDetailRoute(),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedSalesOrganisation: fakeSalesOrg,
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
        selectedSalesOrganisation: fakeSalesOrg,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect material detail pending link success',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    setUp: () {
      when(
        () => repository.extractMaterialNumber(
          selectedSalesOrganisation: fakeSalesOrg,
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(
            path: '/material_detail',
          ),
        ),
      ).thenReturn(
        const Right('fake-material-number'),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: '/material_detail'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedSalesOrganisation: fakeSalesOrg,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectMaterialDetail('fake-material-number'),
    ],
  );

  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect material detail pending link failure',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    setUp: () {
      when(
        () => repository.extractMaterialNumber(
          selectedSalesOrganisation: fakeSalesOrg,
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(
            path: '/material_detail',
          ),
        ),
      ).thenReturn(
        const Left(
          ApiFailure.materialDetailRoute(),
        ),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: '/material_detail'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedSalesOrganisation: fakeSalesOrg,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(
        ApiFailure.materialDetailRoute(),
      ),
    ],
  );
  blocTest<DeepLinkingBloc, DeepLinkingState>(
    'Consume redirect order history detail pending link success',
    build: () => DeepLinkingBloc(
      service: service,
      repository: repository,
    ),
    setUp: () {
      when(
        () => repository.extractOrderHistory(
          selectedSalesOrganisation: fakeSalesOrg,
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(
            path: '/history_details',
          ),
        ),
      ).thenReturn(
        const Right('fake-order-history'),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: '/history_details'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedSalesOrganisation: fakeSalesOrg,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.redirectHistoryDetail('fake-order-history'),
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
        () => repository.extractOrderHistory(
          selectedSalesOrganisation: fakeSalesOrg,
          selectedCustomerCode: fakeCustomerCode,
          selectedShipTo: fakeShipToCode,
          link: Uri(
            path: '/history_details',
          ),
        ),
      ).thenReturn(
        const Left(
          ApiFailure.historyDetailRoute(),
        ),
      );
    },
    seed: () => DeepLinkingState.linkPending(
      Uri(path: '/history_details'),
    ),
    act: (bloc) => bloc.add(
      DeepLinkingEvent.consumePendingLink(
        selectedCustomerCode: fakeCustomerCode,
        selectedSalesOrganisation: fakeSalesOrg,
        selectedShipTo: fakeShipToCode,
      ),
    ),
    expect: () => [
      const DeepLinkingState.error(
        ApiFailure.historyDetailRoute(),
      ),
    ],
  );
}
