import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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

  group(
    'Order Template List BLOC',
        () {
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

      blocTest(
        'Delete Existing Template Item Failure',
        build: () =>
            OrderTemplateListBloc(orderTemplateRepository: templateRepository),
        setUp: () {
          when(() => templateRepository.deleteOrderTemplate(
            templateList: templateListMock,
            templateItem: tempObj,
          )).thenAnswer((invocation) async {
            final isItemPresent = templateListMock.contains(tempObj);
            assert(isItemPresent == false);
            return const Left(
              ApiFailure.other('fake-error'),
            );
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
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      final cartList = [
        OrderTemplateMaterial(
          materialNumber: MaterialNumber('123'),
          materialGroup4: MaterialGroup.four('4'),
          qty: 1,
          type: 'Comm',
          principalName: 'Name',
          materialDescription: 'Description',
          hidePrice: false,
          hasValidTenderContract: true,
          taxClassification: MaterialTaxClassification('tax'),
        ),
      ];

      blocTest(
        'Save Order Template success',
        build: () =>
            OrderTemplateListBloc(orderTemplateRepository: templateRepository),
        setUp: () {
          when(() => templateRepository.saveOrderTemplate(
            userID: mockUser.id,
            templateName: 'fake-saved-template',
            cartList: cartList,
            templateList: templateListMock,
          )).thenAnswer((invocation) async {
            templateListMock.insert(
              0,
              OrderTemplate(
                templateId: 'id',
                templateName: 'fake-saved-template',
                items: cartList,
                user: {
                  'id': mockUser.id,
                },
              ),
            );
            return Right(templateListMock);
          });
          when(() => templateRepository.getOrderTemplateList(user: mockUser))
              .thenAnswer((invocation) async => Right(templateListMock));
        },
        act: (OrderTemplateListBloc bloc) {
          bloc.add(
            OrderTemplateListEvent.save(
              templateName: 'fake-saved-template',
              userID: mockUser.id,
              templateList: templateListMock,
              cartList: cartList,
            ),
          );
        },
        expect: () => [
          OrderTemplateListState.initial().copyWith(
            isFetching: true,
            orderTemplateList: templateListMock,
          ),
          OrderTemplateListState.initial().copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(Right(templateListMock)),
            orderTemplateList: templateListMock,
          ),
        ],
      );

      blocTest(
        'Save Order template error',
        build: () =>
            OrderTemplateListBloc(orderTemplateRepository: templateRepository),
        setUp: () {
          when(
                () => templateRepository.saveOrderTemplate(
              userID: mockUser.id,
              templateName: 'fake-saved-template',
              cartList: cartList,
              templateList: templateListMock,
            ),
          ).thenAnswer(
                (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => OrderTemplateListState.initial().copyWith(
          orderTemplateList: templateListMock,
          isFetching: false,
        ),
        act: (OrderTemplateListBloc bloc) {
          bloc.add(
            OrderTemplateListEvent.save(
              templateName: 'fake-saved-template',
              userID: mockUser.id,
              templateList: templateListMock,
              cartList: cartList,
            ),
          );
        },
        expect: () => [
          OrderTemplateListState.initial().copyWith(
            isFetching: true,
            orderTemplateList: templateListMock,
          ),
          OrderTemplateListState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isFetching: false,
            orderTemplateList: templateListMock,
          )
        ],
      );
    },
  );
}

