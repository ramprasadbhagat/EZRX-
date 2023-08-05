import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_template_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

List<MaterialItem> getItemList(List<CartItem> cartItemList) {
  final saveOrderItems = cartItemList
      .map((cartItem) => cartItem.toSavedOrderMaterial())
      .toList()
      .expand((element) => element)
      .toList();

  return saveOrderItems;
}

class MockConfig extends Mock implements Config {}

class OrderTemplateLocalDataSourceMock extends Mock
    implements OrderTemplateLocalDataSource {}

class OrderTemplateRemoteDataSourceMock extends Mock
    implements OrderTemplateRemoteDataSource {}

void main() {
  late OrderTemplateRepository orderTemplateRepository;
  late Config mockConfig;
  late OrderTemplateLocalDataSource orderTemplateLocalDataSource;
  late OrderTemplateRemoteDataSource orderTemplateRemoteDataSource;
  final mockUser = User.empty().copyWith(id: '1');

  final mockOrderTemplate = OrderTemplate(
    items: <MaterialItem>[],
    templateId: '1231',
    templateName: 'fake-name',
    user: mockUser.copyWith(
      role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
      id: '1',
      username: Username('user'),
      email: EmailAddress('user@gmail.com'),
      customerCode: CustomerCode('100007654'),
    ),
  );

  // final cartList = [
  //   MaterialItem.empty().copyWith(
  //     materialNumber: MaterialNumber('123'),
  //     materialGroup4: MaterialGroup.four('4'),
  //     qty: 1,
  //     type: MaterialItemType('Comm'),
  //     materialDescription: 'Description',
  //     hidePrice: false,
  //   ),
  // ];
  final cartItemList = [
    CartItem(
      itemType: CartItemType.material,
      materials: [
        PriceAggregate.empty().copyWith(
          quantity: 1,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('123'),
            materialGroup4: MaterialGroup.four('4'),
            materialDescription: 'Description',
            hidePrice: false,
          ),
        ),
      ],
    ),
  ];
  final tempObj = OrderTemplate(
    templateId: '1231',
    templateName: 'fake-name',
    items: <MaterialItem>[],
    user: mockUser.copyWith(
      role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
      id: '1',
      username: Username('user'),
      email: EmailAddress('user@gmail.com'),
      customerCode: CustomerCode('100007654'),
    ),
  );
  final saveTemplateListMock = [tempObj];

  setUpAll(() async {
    mockConfig = MockConfig();
    orderTemplateLocalDataSource = OrderTemplateLocalDataSourceMock();
    orderTemplateRemoteDataSource = OrderTemplateRemoteDataSourceMock();

    orderTemplateRepository = OrderTemplateRepository(
      config: mockConfig,
      orderTemplateLocalDataSource: orderTemplateLocalDataSource,
      orderTemplateRemoteDataSource: orderTemplateRemoteDataSource,
    );
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
      when(
        () => orderTemplateRemoteDataSource.getOrderTemplates(
          userId: mockUser.id,
        ),
      ).thenAnswer((invocation) async => <OrderTemplate>[]);

      final result =
          await orderTemplateRepository.getOrderTemplateList(user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderTemplate fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderTemplateRemoteDataSource.getOrderTemplates(
          userId: mockUser.id,
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderTemplateRepository.getOrderTemplateList(
        user: mockUser.copyWith(id: '2345677'),
      );
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
        cartList: <CartItem>[],
        templateName: '',
      );
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
        cartList: <CartItem>[],
        templateName: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get save orderTemplate successfully remote', () async {
      final materialList = getItemList(cartItemList);
      final cartListOfMap = List.from(materialList)
          .map((e) => MaterialItemDto.fromDomain(e).toJson())
          .toList();
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderTemplateRemoteDataSource.saveOrderTemplate(
          templateName: 'fake-saved-template',
          userID: '1',
          cartList: cartListOfMap,
        ),
      ).thenAnswer((invocation) async {
        await Future.delayed(const Duration(seconds: 1));
        return mockOrderTemplate;
      });

      saveTemplateListMock.insert(
        0,
        mockOrderTemplate,
      );

      final result = await orderTemplateRepository.saveOrderTemplate(
        templateName: 'fake-saved-template',
        userID: '1',
        cartList: cartItemList,
        templateList: saveTemplateListMock,
      );

      expect(
        result.isRight(),
        true,
      );
    });
    test('get save orderTemplate fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => orderTemplateRemoteDataSource.saveOrderTemplate(
          templateName: 'fake-saved-template',
          userID: '',
          cartList: [],
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await orderTemplateRepository.saveOrderTemplate(
        userID: mockUser.id,
        templateName: '',
        cartList: cartItemList,
        templateList: saveTemplateListMock,
      );

      expect(
        result.isLeft(),
        true,
      );
    });
    test('get delete orderTemplate successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(
        () => orderTemplateRemoteDataSource.deleteOrderTemplate(
          templateId: '1231',
        ),
      ).thenAnswer((invocation) async {
        final isItemPresent = <OrderTemplate>[].contains(tempObj);
        assert(isItemPresent == false);
        return mockOrderTemplate;
      });

      final isItemPresent = <OrderTemplate>[].contains(tempObj);
      assert(isItemPresent == false);
      final result = await orderTemplateRepository.deleteOrderTemplate(
        templateList: [
          OrderTemplate(
            templateId: '1298jjh',
            templateName: '',
            items: [],
            user: User.empty(),
          )
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
            user: User.empty(),
          ),
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
      when(
        () => orderTemplateRemoteDataSource.deleteOrderTemplate(templateId: ''),
      ).thenThrow((invocation) async => MockException());
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
