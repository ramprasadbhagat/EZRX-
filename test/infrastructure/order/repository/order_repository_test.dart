import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response_message.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/saved_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:flutter/material.dart';
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

class OrderLocalDataSourceMock extends Mock implements OrderLocalDataSource {}

class OrderRemoteDataSourceMock extends Mock implements OrderRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late OrderRepository orderRepository;
  late Config mockConfig;
  late OrderLocalDataSource orderLocalDataSource;
  late OrderRemoteDataSource orderRemoteDataSource;
  late CountlyService countlyService;
  final mockUser = User.empty();
  final mockSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final mockShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: '3487654',
    status: Status('fake_status'),
    city1: 'kolkata',
    shipToName: const ShipToName(
        name1: 'test1', name2: 'test2', name3: 'test3', name4: 'test4'),
    region: 'abc',
    postalCode: '700023',
    shipToAddress:
        ShipToAddress.empty().copyWith(street: 'new town', street2: 'new twon'),
  );
  final mockCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
      customerCodeSoldTo: '100000345',
      customerAttr7: CustomerAttr7('ZEV'),
      customerGrp4: CustomerGrp4('VR'),
      status: Status('fake_status'),
      customerName: CustomerName.empty().copyWith(name1: 'cust1'),
      division: 'mock_div');
  const fakeSavedOrderId = 'fake-id';

  final fakeUpdatedSavedOrder = SavedOrder.empty().copyWith(
    requestedDeliveryDate: DateFormat('yyyy-MM-dd').format(
      DateTime.now().add(
        const Duration(days: 1),
      ),
    ),
    id: fakeSavedOrderId,
    deliveryDocument: mockShipToInfo.shipToName.name1,
    billingDocument: mockCustomerCodeInfo.customerName.name1,
    salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
    principal: '',
    soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
    shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
    processingStatus: 'Draft',
    isDraftOrder: true,
    companyName: CompanyName(mockShipToInfo.shipToName.toString()),
    country: mockShipToInfo.region,
    postCode1: mockShipToInfo.postalCode,
    specialInstructions: '',
    poReference: '',
    payTerm: '',
    collectiveNo: '',
    totalOrderValue: 0,
    draftorder: true,
    address1: mockShipToInfo.shipToAddress.street,
    address2: mockShipToInfo.shipToAddress.street2,
    city: mockShipToInfo.city1,
    phonenumber: '',
    user: mockUser.id,
    contactPerson: mockUser.fullName.toString(),
    referenceNotes: '',
    items: [],
    poAttachent: [],
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockConfig = MockConfig();
    orderLocalDataSource = OrderLocalDataSourceMock();
    orderRemoteDataSource = OrderRemoteDataSourceMock();
    countlyService = CountlyServiceMock();

    orderRepository = OrderRepository(
      config: mockConfig,
      localDataSource: orderLocalDataSource,
      remoteDataSource: orderRemoteDataSource,
      countlyService: countlyService,
    );
  });

  group('OrderRepository should - ', () {
    test('get OrderRepository successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.getSavedOrders())
          .thenAnswer((invocation) async => <SavedOrder>[]);

      final result = await orderRepository.getSavedOrder(
          user: mockUser,
          salesOrg: mockSalesOrganisation,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          pageSize: 10,
          offset: 0);
      expect(
        result.isRight(),
        true,
      );
    });

    test('get OrderRepository fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.getSavedOrders())
          .thenThrow((invocation) async => MockException());

      final result = await orderRepository.getSavedOrder(
          user: mockUser,
          salesOrg: mockSalesOrganisation,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          pageSize: 10,
          offset: 0);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get deleteSavedOrder successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() =>
              orderLocalDataSource.deleteSavedOrder(item: SavedOrder.empty()))
          .thenAnswer((invocation) async => SavedOrder.empty());

      final result = await orderRepository.deleteSavedOrder(
        orderItem: SavedOrder.empty(),
        ordersList: [],
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get deleteSavedOrder fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() =>
              orderLocalDataSource.deleteSavedOrder(item: SavedOrder.empty()))
          .thenThrow((invocation) async => MockException());

      final result = await orderRepository.deleteSavedOrder(
        orderItem: SavedOrder.empty(),
        ordersList: [],
      );

      expect(
        result.isLeft(),
        false,
      );
    });

    test('get OrderRepository fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderLocalDataSource.deleteSavedOrder(
              item: SavedOrder.empty().copyWith(
            id: '6891',
            items: [
              MaterialItem.empty()
                  .copyWith(materialNumber: MaterialNumber('123'))
            ],
          ))).thenThrow((invocation) async => MockException());
      final result = await orderRepository.deleteSavedOrder(
        orderItem: SavedOrder.empty().copyWith(
          id: '6891',
          items: [
            MaterialItem.empty().copyWith(materialNumber: MaterialNumber('123'))
          ],
        ),
        ordersList: [
          SavedOrder.empty(),
          SavedOrder.empty(),
        ],
      );
      expect(
        result.isLeft(),
        false,
      );
    });
    test('get deleteSavedOrder success remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderRemoteDataSource.deleteSavedOrder(itemId: ''))
          .thenAnswer((invocation) async => SavedOrder.empty());

      final result = await orderRepository.deleteSavedOrder(
        orderItem: SavedOrder.empty(),
        ordersList: [],
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('get deleteSavedOrder fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderRemoteDataSource.deleteSavedOrder(itemId: ''))
          .thenThrow((invocation) async => MockException());

      final result = await orderRepository.deleteSavedOrder(
        orderItem: SavedOrder.empty(),
        ordersList: [],
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get submit order successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final submitOrder = SubmitOrder.empty().copyWith(
        userName: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        poReference: data.customerPoReference.getValue(),
        referenceNotes: data.referenceNote.getValue(),
        specialInstructions: data.specialInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: data.deliveryDate.getValue(),
        poDate: data.deliveryDate.getValue(),
        telephone: data.contactNumber.getTelephone,
        trackingLevel: 'items',
        collectiveNumber: '',
        subscribeStatusChange: true,
        orderType: 'ZPOR',
        orderReason: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ]
                .map((cartItem) =>
                    cartItem.tenderContract.tenderOrderReason.getValue())
                .contains('730')
            ? '730'
            : '',
        purchaseOrderType: 'MRXC', //user.role.type.purchaseOrderType,
        shippingCondition: '',
        paymentTerms: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].first.tenderContract.contractPaymentTerm.getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: mockCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: mockCustomerCodeInfo.division,
          salesOrganisation: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
        blockOrder: false,
        materials: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].map((e) => e.toSubmitMaterialInfo()).toList(),
      );

      when(() => orderLocalDataSource.submitOrder(
              submitOrder: SubmitOrderDto.fromDomain(submitOrder, 'PHP')))
          .thenAnswer((invocation) async => SubmitOrderResponse.empty()
                  .copyWith(salesDocument: 'fake-sales-document', messages: [
                SubmitOrderResponseMessage.empty().copyWith(
                  message: 'EZRX-b628ca8',
                  type: 'S',
                ),
              ]));

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: mockUser,
        cartItems: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
        orderType: 'ZPOR',
        configs: SalesOrganisationConfigs.empty()
            .copyWith(currency: Currency('PHP')),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get submit order fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder(
          submitOrder: SubmitOrderDto.fromDomain(
              SubmitOrder.empty().copyWith(
                  userName: '',
                  companyName: CompanyName('name'),
                  customer: SubmitOrderCustomer.empty().copyWith(
                    division: 'div',
                    salesOrganisation: '2601',
                  ),
                  materials: [
                    SubmitMaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('000000000023001758'),
                        quantity: 2)
                  ],
                  purchaseOrderType: 'ZPOR',
                  orderType: 'ZPOR',
                  subscribeStatusChange: true,
                  trackingLevel: 'items',
                  blockOrder: false),
              ''))).thenThrow((invocation) async => MockException());

      final result = await orderRepository.submitOrder(
        shipToInfo: ShipToInfo.empty(),
        user: User.empty().copyWith(
            email: EmailAddress('awsib@gmail.com'), username: Username('user')),
        cartItems: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty()
                .copyWith(materialNumber: MaterialNumber('000000000023001758')),
          )
        ],
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(division: 'div'),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        data: AdditionalDetailsData.empty(),
        orderType: 'ZPOR',
        configs: SalesOrganisationConfigs.empty()
            .copyWith(currency: Currency('PHP')),
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get submit order successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final submitOrder = SubmitOrder.empty().copyWith(
        userName: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        poReference: data.customerPoReference.getValue(),
        referenceNotes: data.referenceNote.getValue(),
        specialInstructions: data.specialInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: data.deliveryDate.getValue(),
        poDate: data.deliveryDate.getValue(),
        telephone: data.contactNumber.getTelephone,
        trackingLevel: 'items',
        collectiveNumber: '',
        subscribeStatusChange: true,
        orderType: 'ZPOR',
        orderReason: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ]
                .map((cartItem) =>
                    cartItem.tenderContract.tenderOrderReason.getValue())
                .contains('730')
            ? '730'
            : '',
        purchaseOrderType: 'MRXC', //user.role.type.purchaseOrderType,
        shippingCondition: '',
        paymentTerms: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].first.tenderContract.contractPaymentTerm.getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: mockCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: mockCustomerCodeInfo.division,
          salesOrganisation: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
        blockOrder: false,
        materials: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].map((e) => e.toSubmitMaterialInfo()).toList(),
      );

      when(() => orderRemoteDataSource.submitOrder(
              submitOrder: SubmitOrderDto.fromDomain(submitOrder, 'PHP')))
          .thenAnswer((invocation) async => SubmitOrderResponse.empty()
                  .copyWith(salesDocument: 'fake-sales-document', messages: [
                SubmitOrderResponseMessage.empty().copyWith(
                  message: 'EZRX-b628ca8',
                  type: 'S',
                ),
              ]));

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: mockUser,
        cartItems: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
        orderType: 'ZPOR',
        configs: SalesOrganisationConfigs.empty()
            .copyWith(currency: Currency('PHP')),
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(
        'get submit order successfully remote when additional data greenDeliveryEnabled true',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
        greenDeliveryEnabled: true,
      );

      final user = mockUser.copyWith(
        id: '123456',
        role: Role.empty().copyWith(type: RoleType('external_sales_rep')),
        fullName: const FullName(firstName: 'john', lastName: 'doe'),
        username: Username('mock_user'),
        email: EmailAddress('user@gmail.com'),
        customerCode: CustomerCode('100007654'),
      );

      final submitOrder = SubmitOrder.empty().copyWith(
        userName: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        poReference: data.customerPoReference.getValue(),
        referenceNotes: data.referenceNote.getValue(),
        specialInstructions: data.specialInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: data.deliveryDate.getValue(),
        poDate: data.deliveryDate.getValue(),
        telephone: data.contactNumber.getTelephone,
        trackingLevel: 'items',
        collectiveNumber: '',
        subscribeStatusChange: true,
        orderType: 'ZPOR',
        orderReason: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ]
                .map((cartItem) =>
                    cartItem.tenderContract.tenderOrderReason.getValue())
                .contains('730')
            ? '730'
            : '',
        purchaseOrderType: 'MRXC', //user.role.type.purchaseOrderType,
        shippingCondition: 'GD',
        paymentTerms: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].first.tenderContract.contractPaymentTerm.getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: mockCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: mockCustomerCodeInfo.division,
          salesOrganisation: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
        blockOrder: false,
        materials: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ].map((e) => e.toSubmitMaterialInfo()).toList(),
      );

      when(() => orderRemoteDataSource.submitOrder(
              submitOrder: SubmitOrderDto.fromDomain(submitOrder, 'PHP')))
          .thenAnswer((invocation) async => SubmitOrderResponse.empty()
                  .copyWith(salesDocument: 'fake-sales-document', messages: [
                SubmitOrderResponseMessage.empty().copyWith(
                  message: 'EZRX-b628ca8',
                  type: 'S',
                ),
              ]));

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: mockUser,
        cartItems: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('000000000023001758'),
            ),
            tenderContract: TenderContract.empty().copyWith(
              contractPaymentTerm:
                  TenderContractInfo.contractPaymentTerm('term'),
              tenderOrderReason: TenderContractReason('reas'),
            ),
          )
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
        orderType: 'ZPOR',
        configs: SalesOrganisationConfigs.empty()
            .copyWith(currency: Currency('PHP')),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get submit order fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderRemoteDataSource.submitOrder(
          submitOrder: SubmitOrderDto.fromDomain(
              SubmitOrder.empty().copyWith(
                  userName: '',
                  companyName: CompanyName('name'),
                  customer: SubmitOrderCustomer.empty().copyWith(
                    division: 'div',
                    salesOrganisation: '2601',
                  ),
                  materials: [
                    SubmitMaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('000000000023001758'),
                        quantity: 2)
                  ],
                  purchaseOrderType: 'ZPOR',
                  orderType: 'ZPOR',
                  subscribeStatusChange: true,
                  trackingLevel: 'items',
                  blockOrder: false),
              ''))).thenThrow((invocation) async => MockException());
      when(() => countlyService.addCountlyEvent('order_fail'))
          .thenAnswer((invocation) async {
        return;
      });
      final result = await orderRepository.submitOrder(
        shipToInfo: ShipToInfo.empty(),
        user: User.empty().copyWith(
            email: EmailAddress('awsib@gmail.com'), username: Username('user')),
        cartItems: <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty()
                .copyWith(materialNumber: MaterialNumber('000000000023001758')),
          )
        ],
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(division: 'div'),
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601')),
        data: AdditionalDetailsData.empty(),
        orderType: 'ZPOR',
        configs: SalesOrganisationConfigs.empty()
            .copyWith(currency: Currency('PHP')),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get OrderRepository successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderRemoteDataSource.getSavedOrder(
          userId: '1',
          saleOrgName: '2601',
          shipToCode: '3487654',
          customerCode: '100000345',
          pageSize: 10,
          offset: 0)).thenAnswer((invocation) async => <SavedOrder>[]);

      final result = await orderRepository.getSavedOrder(
          user: mockUser.copyWith(
              id: '1',
              username: Username('user'),
              email: EmailAddress('user@gmail.com'),
              customerCode: CustomerCode('100007654')),
          salesOrg: mockSalesOrganisation.copyWith(salesOrg: SalesOrg('2601')),
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          pageSize: 10,
          offset: 0);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get OrderRepository fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderRemoteDataSource.getSavedOrder(
            userId: '1',
            saleOrgName: '2601',
            shipToCode: '3487654',
            customerCode: '100000345',
            pageSize: 1,
            offset: 0,
          )).thenThrow((invocation) async => MockException());

      final result = await orderRepository.getSavedOrder(
          user: mockUser,
          salesOrg: mockSalesOrganisation,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          pageSize: 10,
          offset: 0);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('createDraftOrder  successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(
            materials: [
              PriceAggregate.empty().copyWith(
                price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0),
                ),
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('234567'),
                ),
              ),
            ],
            itemType: CartItemType.material,
          ),
        ]),
        poAttachent: [],
      );

      when(() => orderLocalDataSource.createDraftOrder(
          draftOrder: SavedOrderDto.fromDomain(draftOrder))).thenAnswer(
        (invocation) async {
          await Future.delayed(const Duration(seconds: 1));
          return SavedOrder.empty().copyWith(
            draftorder: true,
            isDraftOrder: true,
            id: '12345678',
          );
        },
      );

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                bundles: [],
                materialNumber: MaterialNumber('234567'),
                priceOverride: PriceOverrideValue(12.0),
                zdp8Override: Zdp8OverrideValue(2.0),
              ),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isRight(),
        true,
      );
    });

    test('createDraftOrder  with not isDraft  locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ]),
      );

      when(() => orderLocalDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(draftOrder)))
          .thenAnswer((invocation) async => SavedOrder.empty().copyWith(
                draftorder: true,
                isDraftOrder: false,
                id: '12345678',
              ));

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isLeft(),
        true,
      );
    });

    test('createDraftOrder with contact person empty', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson(''),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ]),
      );

      when(() => orderLocalDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(draftOrder)))
          .thenAnswer((invocation) async => SavedOrder.empty().copyWith(
                draftorder: true,
                isDraftOrder: true,
                id: '12345678',
              ));

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isRight(),
        true,
      );
    });

    test('createDraftOrder  fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(SavedOrder.empty().copyWith(
                  salesOrganization: '',
                  isDraftOrder: false,
                  companyName: CompanyName('fake-company-name'),
                  shipToParty: ShipToParty('fake_shipToParty'),
                  soldToParty: SoldToParty('fake_soldToPart')))))
          .thenThrow((invocation) async => MockException());

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: mockUser.copyWith(
            id: '1',
            username: Username('user'),
            email: EmailAddress('user@gmail.com'),
            customerCode: CustomerCode('100007654')),
        cartItems: [],
        grandTotal: 0.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: AdditionalDetailsData.empty().copyWith(
          customerPoReference: CustomerPoReference('CO REF'),
          contactPerson: ContactPerson('PERSON'),
          contactNumber: ContactNumber('123456'),
          paymentTerm: PaymentTerm('0001-TEST'),
          deliveryDate: DeliveryDate('01/02/2023'),
          specialInstruction: SpecialInstruction('test'),
          collectiveNumber: CollectiveNumber('543678909'),
          referenceNote: ReferenceNote('note'),
        ),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('createDraftOrder  successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ]),
      );

      when(() => orderRemoteDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(draftOrder)))
          .thenAnswer((invocation) async => SavedOrder.empty().copyWith(
                draftorder: true,
                isDraftOrder: true,
                id: '12345678',
              ));

      when(() => countlyService.addCountlyEvent(
            'Save order',
          )).thenAnswer((invocation) => Future.value());

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isRight(),
        true,
      );
    });

    test('createDraftOrder  with not isDraft  remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ]),
      );

      when(() => orderRemoteDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(draftOrder)))
          .thenAnswer((invocation) async => SavedOrder.empty().copyWith(
                draftorder: true,
                isDraftOrder: false,
                id: '12345678',
              ));

      when(() => countlyService.addCountlyEvent(
            'Save order',
          )).thenAnswer((invocation) => Future.value());

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isLeft(),
        true,
      );
    });

    test('createDraftOrder  fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final data = AdditionalDetailsData.empty().copyWith(
        customerPoReference: CustomerPoReference('CO REF'),
        contactPerson: ContactPerson('PERSON'),
        contactNumber: ContactNumber('123456'),
        paymentTerm: PaymentTerm('0001-TEST'),
        deliveryDate: DeliveryDate('01/02/2023'),
        specialInstruction: SpecialInstruction('test'),
        collectiveNumber: CollectiveNumber('543678909'),
        referenceNote: ReferenceNote('note'),
      );

      final user = mockUser.copyWith(
          id: '123456',
          fullName: const FullName(firstName: 'john', lastName: 'doe'),
          username: Username('mock_user'),
          email: EmailAddress('user@gmail.com'),
          customerCode: CustomerCode('100007654'));

      final draftOrder = SavedOrder.empty().copyWith(
        requestedDeliveryDate: '01/02/2023',
        deliveryDocument: mockShipToInfo.shipToName.name1,
        billingDocument: mockCustomerCodeInfo.customerName.name1,
        salesOrganization: mockSalesOrganisation.salesOrg.getOrCrash(),
        principal: '',
        soldToParty: SoldToParty(mockCustomerCodeInfo.customerCodeSoldTo),
        shipToParty: ShipToParty(mockShipToInfo.shipToCustomerCode),
        processingStatus: 'Draft',
        isDraftOrder: true,
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        country: mockShipToInfo.region,
        postCode1: mockShipToInfo.postalCode,
        specialInstructions: data.specialInstruction.getValue(),
        poReference: data.customerPoReference.getValue(),
        payTerm: data.paymentTerm.getValue(),
        collectiveNo: data.collectiveNumber.getValue(),
        totalOrderValue: 100.0,
        draftorder: true,
        address1: mockShipToInfo.shipToAddress.street,
        address2: mockShipToInfo.shipToAddress.street2,
        city: mockShipToInfo.city1,
        phonenumber: data.contactNumber.getValue(),
        user: user.id,
        contactPerson: data.contactPerson.getValue().isNotEmpty
            ? data.contactPerson.getValue()
            : user.fullName.toString(),
        referenceNotes: data.referenceNote.getValue(),
        items: getItemList([
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ]),
      );

      when(() => orderRemoteDataSource.createDraftOrder(
              draftOrder: SavedOrderDto.fromDomain(draftOrder)))
          .thenThrow((invocation) async => MockException());

      when(() => countlyService.addCountlyEvent(
            'Save order',
          )).thenAnswer((invocation) => Future.value());

      final result = await orderRepository.createDraftOrder(
        shipToInfo: mockShipToInfo,
        user: user,
        cartItems: [
          CartItem(materials: [
            PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                  bundles: [],
                  materialNumber: MaterialNumber('234567'),
                  priceOverride: PriceOverrideValue(12.0),
                  zdp8Override: Zdp8OverrideValue(2.0)),
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: MaterialNumber('234567'),
              ),
            ),
          ], itemType: CartItemType.material),
        ],
        grandTotal: 100.0,
        customerCodeInfo: mockCustomerCodeInfo,
        salesOrganisation: mockSalesOrganisation,
        data: data,
      );

      expect(
        result.isLeft(),
        true,
      );
    });

    test('get saved order detail success local', () async {
      const fakeSavedOrderId = 'fake-id';
      final fakeSavedOrder = SavedOrder.empty().copyWith(id: fakeSavedOrderId);
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.getSavedOrderDetail()).thenAnswer(
        (invocation) async => fakeSavedOrder,
      );

      final result =
          await orderRepository.getSavedOrderDetail(orderId: fakeSavedOrderId);
      expect(result.isRight(), true);
      expect(result.getOrElse(() => SavedOrder.empty()), fakeSavedOrder);
    });

    test('get saved order detail failure local', () async {
      const fakeSavedOrderId = 'fake-id';
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.getSavedOrderDetail()).thenThrow(
        () => MockException(),
      );

      final result =
          await orderRepository.getSavedOrderDetail(orderId: fakeSavedOrderId);
      expect(result.isLeft(), true);
    });

    test('get saved order detail success remote', () async {
      const fakeSavedOrderId = 'fake-id';
      final fakeSavedOrder = SavedOrder.empty().copyWith(id: fakeSavedOrderId);
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => orderRemoteDataSource.getSavedOrderDetail(
          orderId: fakeSavedOrderId)).thenAnswer(
        (invocation) async => fakeSavedOrder,
      );

      final result =
          await orderRepository.getSavedOrderDetail(orderId: fakeSavedOrderId);
      expect(result.isRight(), true);
      expect(result.getOrElse(() => SavedOrder.empty()), fakeSavedOrder);
    });

    test('get saved order detail failure remote', () async {
      const fakeSavedOrderId = 'fake-id';
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(() => orderRemoteDataSource.getSavedOrderDetail(
          orderId: fakeSavedOrderId)).thenThrow(
        () => MockException(),
      );

      final result =
          await orderRepository.getSavedOrderDetail(orderId: fakeSavedOrderId);
      expect(result.isLeft(), true);
    });

    test('update saved order success local', () async {
      final fakeSavedOrder = SavedOrder.empty().copyWith(id: fakeSavedOrderId);
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.updateDraftOrder()).thenAnswer(
        (invocation) async => fakeSavedOrder,
      );

      final result = await orderRepository.updateDraftOrder(
        user: mockUser,
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        shipToInfo: mockShipToInfo,
        data: AdditionalDetailsData.empty(),
        grandTotal: 0,
        orderId: fakeSavedOrderId,
        cartItems: [],
      );
      expect(result.isRight(), true);
      expect(result.getOrElse(() => SavedOrder.empty()), fakeSavedOrder);
    });

    test('Update saved order failure local', () async {
      const fakeSavedOrderId = 'fake-id';
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.updateDraftOrder()).thenThrow(
        () => MockException(),
      );

      final result = await orderRepository.updateDraftOrder(
        user: mockUser,
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        shipToInfo: mockShipToInfo,
        data: AdditionalDetailsData.empty(),
        grandTotal: 0,
        orderId: fakeSavedOrderId,
        cartItems: [],
      );

      expect(result.isLeft(), true);
    });

    test('Update saved order detail success remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => orderRemoteDataSource.updateDraftOrder(
          updatedOrder: SavedOrderDto.fromDomain(fakeUpdatedSavedOrder),
        ),
      ).thenAnswer(
        (invocation) async => fakeUpdatedSavedOrder,
      );

      final result = await orderRepository.updateDraftOrder(
        user: mockUser,
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        shipToInfo: mockShipToInfo,
        data: AdditionalDetailsData.empty(),
        grandTotal: 0,
        orderId: fakeSavedOrderId,
        cartItems: [],
      );
      expect(result.isRight(), true);
      expect(result.getOrElse(() => SavedOrder.empty()), fakeUpdatedSavedOrder);
    });

    test('Update saved order failure remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => orderRemoteDataSource.updateDraftOrder(
          updatedOrder: SavedOrderDto.fromDomain(
            fakeUpdatedSavedOrder,
          ),
        ),
      ).thenThrow(
        () => MockException(),
      );

      final result = await orderRepository.updateDraftOrder(
        user: mockUser,
        salesOrganisation: mockSalesOrganisation,
        customerCodeInfo: mockCustomerCodeInfo,
        shipToInfo: mockShipToInfo,
        data: AdditionalDetailsData.empty(),
        grandTotal: 0,
        orderId: fakeSavedOrderId,
        cartItems: [],
      );
      expect(result.isLeft(), true);
    });
  });
}
