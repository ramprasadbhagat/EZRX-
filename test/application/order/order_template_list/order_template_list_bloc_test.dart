import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_template_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateRepositoryMock extends Mock
    implements OrderTemplateRepository {}

void main() {
  final templateRepository = OrderTemplateRepositoryMock();

  final mockUser = User.empty();
  late final List<OrderTemplate> templateListMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    templateListMock = await OrderTemplateLocalDataSource().getOrderTemplates();
  });

  group('Order Template List BLOC', () {
    blocTest(
      'Initialize',
      build: () =>
          OrderTemplateListBloc(orderTemplateRepository: templateRepository),
      act: ((OrderTemplateListBloc bloc) =>
          bloc.add(const OrderTemplateListEvent.initialized())),
      expect: () => [OrderTemplateListState.initial()],
    );

    blocTest(
      'Get Template List Failure',
      build: () =>
          OrderTemplateListBloc(orderTemplateRepository: templateRepository),
      setUp: () {
        when(
          () => templateRepository.getOrderTemplateList(user: mockUser),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (OrderTemplateListBloc bloc) =>
          bloc.add(OrderTemplateListEvent.fetch(mockUser)),
      expect: () => [
        OrderTemplateListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          orderTemplateList: [],
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get Template List Success',
      build: () =>
          OrderTemplateListBloc(orderTemplateRepository: templateRepository),
      setUp: () {
        when(() => templateRepository.getOrderTemplateList(
              user: mockUser,
            )).thenAnswer(
          (invocation) async => Right(templateListMock),
        );
      },
      act: (OrderTemplateListBloc bloc) =>
          bloc.add(OrderTemplateListEvent.fetch(mockUser)),
      expect: () => [
        OrderTemplateListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          orderTemplateList: templateListMock,
          apiFailureOrSuccessOption: none(),
        ),
      ],
    );

    const tempObj = OrderTemplate(
        templateId: '1231',
        templateName: 'fake-name',
        items: <OrderTemplateMaterial>[],
        user: <String, dynamic>{});

    blocTest(
      'Delete Existing Template Item',
      build: () =>
          OrderTemplateListBloc(orderTemplateRepository: templateRepository),
      setUp: () {
        when(() => templateRepository.deleteOrderTemplate(
              templateList: templateListMock,
              templateItem: tempObj,
            )).thenAnswer((invocation) async {
          final isItemPresent = templateListMock.contains(tempObj);
          assert(isItemPresent == false);
          return Right(templateListMock);
        });
      },
      act: (OrderTemplateListBloc bloc) {
        return bloc.add(const OrderTemplateListEvent.delete(tempObj));
      },
      seed: () {
        return OrderTemplateListState.initial().copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          orderTemplateList: templateListMock,
        );
      },
      expect: () => [
        OrderTemplateListState.initial().copyWith(
          isFetching: false,
          orderTemplateList: templateListMock,
          apiFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
}
