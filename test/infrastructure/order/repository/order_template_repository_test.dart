import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_template_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderTemplateLocalDataSourceMock extends Mock
    implements OrderTemplateLocalDataSource {}

class OrderTemplateRemoteDataSourceMock extends Mock
    implements OrderTemplateRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late OrderTemplateRepository orderTemplateRepository;
  late Config mockConfig;
  late OrderTemplateLocalDataSource orderTemplateLocalDataSource;
  late OrderTemplateRemoteDataSource orderTemplateRemoteDataSource;
  final mockUser = User.empty().copyWith(id: '1');
  late CountlyService countlyServiceMock;

  final mockOrderTemplate = OrderTemplate(
    items: <OrderTemplateMaterial>[],
    templateId: '1231',
    templateName: 'fake-name',
    user: mockUser.copyWith(
        role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        id: '1',
        username: Username('user'),
        email: EmailAddress('user@gmail.com'),
        customerCode: CustomerCode('100007654')),
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
  final tempObj = OrderTemplate(
    templateId: '1231',
    templateName: 'fake-name',
    items: <OrderTemplateMaterial>[],
    user: mockUser.copyWith(
        role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        id: '1',
        username: Username('user'),
        email: EmailAddress('user@gmail.com'),
        customerCode: CustomerCode('100007654')),
  );
  final saveTemplateListMock = [tempObj];

  setUpAll(() async {
    countlyServiceMock = CountlyServiceMock();

    mockConfig = MockConfig();
    orderTemplateLocalDataSource = OrderTemplateLocalDataSourceMock();
    orderTemplateRemoteDataSource = OrderTemplateRemoteDataSourceMock();

    orderTemplateRepository = OrderTemplateRepository(
        config: mockConfig,
        orderTemplateLocalDataSource: orderTemplateLocalDataSource,
        countlyService: countlyServiceMock, //CountlyServiceMock(),
        orderTemplateRemoteDataSource: orderTemplateRemoteDataSource);
  });

  group('orderTemplateRepository should - ', () {
    test('get orderTemplate successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderTemplateLocalDataSource.getOrderTemplates())
          .thenAnswer((invocation) async => <OrderTemplate>[]);

      final result =
          await orderTemplateRepository.getOrderTemplateList(user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderTemplate fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderTemplateLocalDataSource.getOrderTemplates())
          .thenThrow((invocation) async => MockException());

      final result =
          await orderTemplateRepository.getOrderTemplateList(user: mockUser);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get orderTemplate successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderTemplateRemoteDataSource.getOrderTemplates(
              userId: mockUser.id))
          .thenAnswer((invocation) async => <OrderTemplate>[]);

      final result =
          await orderTemplateRepository.getOrderTemplateList(user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderTemplate fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderTemplateRemoteDataSource.getOrderTemplates(
              userId: mockUser.id))
          .thenThrow((invocation) async => MockException());

      final result = await orderTemplateRepository.getOrderTemplateList(
          user: mockUser.copyWith(id: '2345677'));
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get save orderTemplate successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderTemplateLocalDataSource.saveOrderTemplate())
          .thenAnswer((invocation) async => mockOrderTemplate);

      final result = await orderTemplateRepository.saveOrderTemplate(
          templateList: <OrderTemplate>[],
          userID: mockUser.id,
          cartList: <OrderTemplateMaterial>[],
          templateName: '');
      expect(
        result.isRight(),
        true,
      );
    });
    test('get save orderTemplate fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderTemplateLocalDataSource.saveOrderTemplate())
          .thenThrow((invocation) async => MockException());

      final result = await orderTemplateRepository.saveOrderTemplate(
          templateList: <OrderTemplate>[],
          userID: mockUser.id,
          cartList: <OrderTemplateMaterial>[],
          templateName: '');
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get save orderTemplate successfully remote', () async {
      final mockcartList = {
        'materialNumber': '123',
        'materialGroup4': '4',
        'qty': 1,
        'type': 'Comm',
        'principalName': 'Name',
        'materialDescription': 'Description',
        'hidePrice': false,
        'hasValidTenderContract': true,
        'taxClassification': 'tax'
      };
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderTemplateRemoteDataSource.saveOrderTemplate(
          templateName: 'fake-saved-template',
          userID: '1',
          cartList: [mockcartList])).thenAnswer((invocation) async {
        saveTemplateListMock.insert(
          0,
          OrderTemplate(
            templateId: 'id',
            templateName: 'fake-saved-template',
            items: cartList,
            user: mockUser,
          ),
        );
        return mockOrderTemplate;
      });

      when(() => countlyServiceMock.addCountlyEvent(
            'save_as_template',
          )).thenAnswer((invocation) => Future.value());

      final result = await orderTemplateRepository.saveOrderTemplate(
        templateName: 'fake-saved-template',
        userID: '1',
        cartList: cartList,
        templateList: saveTemplateListMock,
      );

      expect(
        result.isRight(),
        true,
      );
    });
    test('get save orderTemplate fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderTemplateRemoteDataSource.saveOrderTemplate(
          templateName: 'fake-saved-template',
          userID: '',
          cartList: [])).thenThrow((invocation) async => MockException());

      final result = await orderTemplateRepository.saveOrderTemplate(
        userID: mockUser.id,
        templateName: '',
        cartList: cartList,
        templateList: saveTemplateListMock,
      );

      expect(
        result.isLeft(),
        true,
      );
    });
    test('get delete orderTemplate successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderTemplateRemoteDataSource.deleteOrderTemplate(
          templateId: '1231')).thenAnswer((invocation) async {
        final isItemPresent = <OrderTemplate>[].contains(tempObj);
        assert(isItemPresent == false);
        return mockOrderTemplate;
      });

      when(() => countlyServiceMock.addCountlyEvent(
            'Delete template',
          )).thenAnswer((invocation) => Future.value());

      final isItemPresent = <OrderTemplate>[].contains(tempObj);
      assert(isItemPresent == false);
      final result = await orderTemplateRepository.deleteOrderTemplate(
        templateList: [
          OrderTemplate(
              templateId: '1298jjh',
              templateName: '',
              items: [],
              user: User.empty())
        ],
        templateItem: tempObj,
      );

      expect(
        result.isRight(),
        true,
      );
    });
    test('get delete orderTemplate successfully local', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      final isItemPresent = <OrderTemplate>[].contains(tempObj);
      assert(isItemPresent == false);
      final result = await orderTemplateRepository.deleteOrderTemplate(
        templateList: <OrderTemplate>[],
        templateItem: tempObj,
      );

      expect(
        result.isRight(),
        true,
      );
    });
    test('get delete orderTemplate fail local', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await orderTemplateRepository.deleteOrderTemplate(
        templateList: [
          OrderTemplate(
              templateId: '1298',
              templateName: '',
              items: [],
              user: User.empty()),
        ],
        templateItem: mockOrderTemplate.copyWith(templateId: '1298jjh'),
      );

      expect(
        result.isLeft(),
        false,
      );
    });
    test('get delete orderTemplate fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
              orderTemplateRemoteDataSource.deleteOrderTemplate(templateId: ''))
          .thenThrow((invocation) async => MockException());
      final result = await orderTemplateRepository.deleteOrderTemplate(
        templateItem: mockOrderTemplate.copyWith(templateId: '1298jjh'),
        templateList: [],
      );

      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
