import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/encryption.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_encryption.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_dto.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_order_details_remote.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class MockConfig extends Mock implements Config {}

class ViewByOrderDetailsRemoteDataSourceMock extends Mock
    implements ViewByOrderDetailsRemoteDataSource {}

class EncryptionMock extends Mock implements Encryption {}

class ViewByOrderDetailsLocalDataSourceMock extends Mock
    implements ViewByOrderDetailsLocalDataSource {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class OrderLocalDataSourceMock extends Mock implements OrderLocalDataSource {}

class OrderRemoteDataSourceMock extends Mock implements OrderRemoteDataSource {}

void main() {
  late Config mockConfig;
  late Encryption encryption;
  late SubmitOrder submitOrderMock;
  late OrderRepository orderRepository;
  late MixpanelService mixpanelService;
  late DeliveryInfoData deliveryInfoData;
  late List<PriceAggregate> cartMaterials;
  late OrderEncryption orderEncryptionMock;
  late OrderLocalDataSource orderLocalDataSource;
  late List<MaterialStockInfo> stockInfoListMock;
  late SubmitOrderResponse submitOrderResponseMock;
  late OrderHistoryDetails orderHistoryDetailsMock;
  late OrderRemoteDataSource orderRemoteDataSource;
  late StockInfoLocalDataSource stockInfoLocalDataSource;
  late StockInfoRemoteDataSource stockInfoRemoteDataSource;
  final mockShipToInfo = fakeCustomerCodeInfo.shipToInfos.first;
  late ViewByOrderDetailsLocalDataSource viewByOrderDetailsLocalDataSource;
  late ViewByOrderDetailsRemoteDataSource viewByOrderDetailsRemoteDataSource;
  const fakeSecretKey = 'fake-key';
  final fakeError = MockException(message: 'fake-exception');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    mockConfig = MockConfig();
    orderLocalDataSource = OrderLocalDataSourceMock();
    orderRemoteDataSource = OrderRemoteDataSourceMock();

    mixpanelService = MixpanelServiceMock();
    viewByOrderDetailsLocalDataSource = ViewByOrderDetailsLocalDataSourceMock();
    viewByOrderDetailsRemoteDataSource =
        ViewByOrderDetailsRemoteDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    encryption = EncryptionMock();
    orderEncryptionMock = OrderEncryption(
      data: 'fake-data',
      hash: 'fake-hash',
    );
    orderRepository = OrderRepository(
      config: mockConfig,
      localDataSource: orderLocalDataSource,
      remoteDataSource: orderRemoteDataSource,
      mixpanelService: mixpanelService,
      encryption: encryption,
      orderDetailLocalDataSource: viewByOrderDetailsLocalDataSource,
      orderHistoryDetailsRemoteDataSource: viewByOrderDetailsRemoteDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
    );
    final materialListResponse =
        await MaterialListLocalDataSource().getProductList();
    cartMaterials = materialListResponse.products
        .map(
          (e) => PriceAggregate.empty().copyWith(
            materialInfo: e.copyWith(isFOCMaterial: false),
            salesOrgConfig: fakeMYSalesOrgConfigs,
            quantity: 1,
          ),
        )
        .toList();
    deliveryInfoData = DeliveryInfoData.empty().copyWith(
      poReference: PoReference('CO REF'),
      contactPerson: ContactPerson('PERSON'),
      mobileNumber: MobileNumber('123456'),
      paymentTerm: PaymentTerm(''),
      deliveryDate: DateTimeStringValue('01/02/2023'),
      deliveryInstruction: DeliveryInstruction('test'),
      referenceNote: ReferenceNote('note'),
    );

    submitOrderMock = SubmitOrder.empty().copyWith(
      purchaseOrderType: fakeClientUser.role.type.purchaseOrderType,
      paymentMethod: 'Bank Transfer',
      orderValue: 100.0,
      totalTax: 100.0,
      orderType: 'ZPOR',
      userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
          ? deliveryInfoData.contactPerson.getValue()
          : fakeClientUser.fullName.toString(),
      poReference: deliveryInfoData.poReference.getValue(),
      referenceNotes: deliveryInfoData.referenceNote.getValue(),
      specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
      companyName: CompanyName(mockShipToInfo.shipToName.toString()),
      requestedDeliveryDate: fakePHSalesOrgConfigs.enableFutureDeliveryDay
          ? deliveryInfoData.deliveryDate.getValue()
          : '',
      poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      telephone: deliveryInfoData.mobileNumber.getTelephone,
      collectiveNumber: '',
      paymentTerms:
          cartMaterials.first.tenderContract.contractPaymentTerm.getValue(),
      customer: SubmitOrderCustomer.empty().copyWith(
        customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
        customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
        division: fakeCustomerCodeInfo.division,
        salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
      ),
      language: 'EN',
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList,
      products: cartMaterials
          .expand(
            (element) => !element.materialInfo.type.typeBundle
                ? [element.toSubmitMaterialInfo()]
                : element.bundle.materials.map(
                    (el) => PriceAggregate.empty()
                        .copyWith(
                          materialInfo: el,
                          quantity: el.quantity.intValue,
                          salesOrgConfig: element.salesOrgConfig,
                          bundle: element.bundle,
                        )
                        .toSubmitMaterialInfo(),
                  ),
          )
          .toList(),
    );

    submitOrderResponseMock = await OrderLocalDataSource().submitOrder();
    orderHistoryDetailsMock =
        await ViewByOrderDetailsLocalDataSource().getOrderHistoryDetails();
    stockInfoListMock =
        await StockInfoLocalDataSource().getMaterialStockInfoList();
  });

  test('get submit order successfully locally ', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final cartMaterial = <PriceAggregate>[
      PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          principalData: PrincipalData.empty()
              .copyWith(principalCode: PrincipalCode('0000140332')),
        ),
        tenderContract: TenderContract.empty().copyWith(
          contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
          tenderOrderReason: TenderContractReason('reas'),
        ),
        salesOrgConfig: fakePHSalesOrgConfigs,
      )
    ];

    final submitOrder = SubmitOrder.empty().copyWith(
      userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
          ? deliveryInfoData.contactPerson.getValue()
          : fakeClientUser.fullName.toString(),
      poReference: deliveryInfoData.poReference.getValue(),
      referenceNotes: deliveryInfoData.referenceNote.getValue(),
      specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
      companyName: CompanyName(mockShipToInfo.shipToName.toString()),
      requestedDeliveryDate: deliveryInfoData.deliveryDate.getValue(),
      poDate: deliveryInfoData.deliveryDate.getValue(),
      telephone: deliveryInfoData.mobileNumber.getTelephone,
      collectiveNumber: '',
      paymentTerms: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        )
      ].first.tenderContract.contractPaymentTerm.getValue(),
      customer: SubmitOrderCustomer.empty().copyWith(
        customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
        customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
        division: fakeCustomerCodeInfo.division,
        salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
      ),
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
          cartMaterial.any((item) => item.checkSalesCutOff),
      products: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        )
      ].map((e) => e.toSubmitMaterialInfo()).toList(),
    );

    when(() => orderLocalDataSource.submitOrder()).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterial,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      orderDocumentType: OrderDocumentType.empty()
          .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      smallOrderFee: 12500.0,
    );
    expect(
      result,
      Right(submitOrderResponseMock),
    );
    expect(submitOrder.blockOrder, false);
  });

  test('get submit order successfully locally with payment term validation ',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final cartMaterial = <PriceAggregate>[
      PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          principalData: PrincipalData.empty()
              .copyWith(principalCode: PrincipalCode('0000140332')),
        ),
        tenderContract: TenderContract.empty().copyWith(
          contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
          tenderOrderReason: TenderContractReason('reas'),
        ),
        salesOrgConfig: fakePHSalesOrgConfigs,
      )
    ];

    final submitOrder = SubmitOrder.empty().copyWith(
      userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
          ? deliveryInfoData.contactPerson.getValue()
          : fakeClientUser.fullName.toString(),
      poReference: deliveryInfoData.poReference.getValue(),
      referenceNotes: deliveryInfoData.referenceNote.getValue(),
      specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
      companyName: CompanyName(mockShipToInfo.shipToName.toString()),
      requestedDeliveryDate: deliveryInfoData.deliveryDate.getValue(),
      poDate: deliveryInfoData.deliveryDate.getValue(),
      telephone: deliveryInfoData.mobileNumber.getTelephone,
      collectiveNumber: '',
      paymentTerms: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        )
      ].first.tenderContract.contractPaymentTerm.getValue(),
      customer: SubmitOrderCustomer.empty().copyWith(
        customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
        customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
        division: fakeCustomerCodeInfo.division,
        salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
      ),
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
          cartMaterial.any((item) => item.checkSalesCutOff),
      products: <PriceAggregate>[
        PriceAggregate.empty().copyWith(
          quantity: 2,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('000000000023001758'),
          ),
          tenderContract: TenderContract.empty().copyWith(
            contractPaymentTerm: TenderContractInfo.contractPaymentTerm('term'),
            tenderOrderReason: TenderContractReason('reas'),
          ),
        )
      ].map((e) => e.toSubmitMaterialInfo()).toList(),
    );

    when(() => orderLocalDataSource.submitOrder()).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterial,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      data: deliveryInfoData,
      orderDocumentType: OrderDocumentType.empty()
          .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      smallOrderFee: 12500.0,
    );
    expect(
      result,
      Right(submitOrderResponseMock),
    );
    expect(submitOrder.blockOrder, false);
  });
  test('get submit order fail locally ', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final cartMaterial = <PriceAggregate>[
      PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          principalData: PrincipalData.empty()
              .copyWith(principalCode: PrincipalCode('0000140332')),
        ),
      )
    ];
    final submitOrder = SubmitOrder.empty().copyWith(
      userName: '',
      companyName: CompanyName('name'),
      customer: SubmitOrderCustomer.empty().copyWith(
        division: 'div',
        salesOrganisation: '2601',
      ),
      products: [
        SubmitMaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023001758'),
          quantity: 2,
        )
      ],
      blockOrder: fakePHSalesOrgConfigs.enablePrincipalList &&
          cartMaterial.any((item) => item.checkSalesCutOff),
    );

    when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

    final result = await orderRepository.submitOrder(
      shipToInfo: ShipToInfo.empty(),
      user: User.empty().copyWith(
        email: EmailAddress('awsib@gmail.com'),
        username: Username('user'),
      ),
      cartProducts: cartMaterial,
      grandTotal: 100.0,
      customerCodeInfo: CustomerCodeInfo.empty().copyWith(division: 'div'),
      salesOrganisation: fakeSGSalesOrganisation,
      data:
          DeliveryInfoData.empty().copyWith(paymentTerm: PaymentTerm('A004-')),
      orderDocumentType: OrderDocumentType.empty()
          .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
      configs: fakePHSalesOrgConfigs,
      orderValue: 100.0,
      totalTax: 100,
      smallOrderFee: 12500.0,
    );
    expect(
      result,
      Left(FailureHandler.handleFailure(fakeError)),
    );
    expect(submitOrder.blockOrder, false);
  });

  group('OrderRepository => submitOrder', () {
    test('get submit order successfully locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully locally bonus item success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials
            .map(
              (e) => e.copyWith(
                bonusSampleItems: [
                  BonusSampleItem.empty().copyWith(
                    principalData: PrincipalData(
                      principalName: PrincipalName('fake-principle-name'),
                      principalCode: PrincipalCode('fake-principle-code'),
                    ),
                  )
                ],
              ),
            )
            .toList(),
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully locally fail for bundle', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => orderLocalDataSource.submitOrder()).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  type: MaterialInfoType.bundle(),
                ),
                bundle: Bundle.empty().copyWith(
                  materials: [e.materialInfo],
                ),
              ),
            )
            .toList(),
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test('get submit order successfully Remote fail ZPFC order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPFC',
              customer: submitOrderMock.customer.copyWith(
                salesOrganisation: fakeSGSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPFC'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerAttr7: CustomerAttr7('ZEV'),
        ),
        salesOrganisation: fakeSGSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPVF'), orderReason: ''),
        configs: fakeSGSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote fail ZPVF order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPVF',
              customer: submitOrderMock.customer.copyWith(
                division: 'mock_div',
                salesOrganisation: fakePHSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPVF'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerGrp4: CustomerGrp4('VP'),
          status: Status('fake_status'),
          customerName: CustomerName.empty().copyWith(name1: 'cust1'),
          division: 'mock_div',
        ),
        salesOrganisation: fakePHSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPVF'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote fail ZPFV order', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final focMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(isFOCMaterial: true),
            ),
          )
          .toList();

      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              orderType: 'ZPFV',
              customer: submitOrderMock.customer.copyWith(
                salesOrganisation: fakePHSalesOrganisation.salesOrg.getValue(),
              ),
            ),
          ).toJson()
            ..addAll({'orderType': 'ZPFV'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: focMaterial,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo.copyWith(
          customerGrp4: CustomerGrp4('VR'),
        ),
        salesOrganisation: fakePHSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPVF'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote success with bonus item',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final bonusCartMaterial = cartMaterials
          .map(
            (e) => e.copyWith(
              bonusSampleItems: [
                BonusSampleItem.empty().copyWith(
                  principalData: PrincipalData(
                    principalName: PrincipalName('fake-principle-name'),
                    principalCode: PrincipalCode('fake-principle-code'),
                  ),
                )
              ],
            ),
          )
          .toList();
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock.copyWith(
              products: bonusCartMaterial
                  .expand(
                    (element) => !element.materialInfo.type.typeBundle
                        ? [element.toSubmitMaterialInfo()]
                        : element.bundle.materials.map(
                            (el) => PriceAggregate.empty()
                                .copyWith(
                                  materialInfo: el,
                                  quantity: el.quantity.intValue,
                                  salesOrgConfig: element.salesOrgConfig,
                                  bundle: element.bundle,
                                )
                                .toSubmitMaterialInfo(),
                          ),
                  )
                  .toList(),
            ),
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: bonusCartMaterial,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test('get submit order successfully Remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order successfully Remote success with combo', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final materialListResponse =
          await MaterialListLocalDataSource().getProductList();

      final cartMaterialsCombo = materialListResponse.products
          .map(
            (e) => PriceAggregate.empty().copyWith(
              materialInfo: e.copyWith(
                type: MaterialInfoType.combo(),
              ),
              salesOrgConfig: fakeVNSalesOrgConfigs,
              quantity: 1,
              comboMaterials: [
                ComboMaterialItem.empty().copyWith(
                  comboDealType: 'K1',
                  quantity: 1,
                  listPrice: 15,
                  mandatory: true,
                  minQty: 1,
                  rate: 40,
                  finalIndividualPrice: 9,
                  isComboEligible: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('fake-material-combo'),
                    parentID: 'fake-material',
                    principalData: PrincipalData(
                      principalName: PrincipalName('fake-principal-name'),
                      principalCode: PrincipalCode('fake-principal-code'),
                    ),
                    type: MaterialInfoType.combo(),
                    remarks: 'fake-remark',
                    promoType: 'fake-promo-type',
                  ),
                ),
              ],
            ),
          )
          .toList();

      final submitOrderComboMock = SubmitOrder.empty().copyWith(
        purchaseOrderType: fakeClientUser.role.type.purchaseOrderType,
        paymentMethod: 'Bank Transfer',
        orderValue: 210.0,
        totalTax: 0.0,
        orderType: 'ZPOR',
        userName: deliveryInfoData.contactPerson.getValue().isNotEmpty
            ? deliveryInfoData.contactPerson.getValue()
            : fakeClientUser.fullName.toString(),
        poReference: deliveryInfoData.poReference.getValue(),
        referenceNotes: deliveryInfoData.referenceNote.getValue(),
        specialInstructions: deliveryInfoData.deliveryInstruction.getValue(),
        companyName: CompanyName(mockShipToInfo.shipToName.toString()),
        requestedDeliveryDate: fakeVNSalesOrgConfigs.enableFutureDeliveryDay
            ? deliveryInfoData.deliveryDate.getValue()
            : '',
        poDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        telephone: deliveryInfoData.mobileNumber.getTelephone,
        collectiveNumber: '',
        paymentTerms: cartMaterialsCombo
            .first.tenderContract.contractPaymentTerm
            .getValue(),
        customer: SubmitOrderCustomer.empty().copyWith(
          customerNumber: fakeCustomerCodeInfo.customerCodeSoldTo,
          customerNumberShipTo: mockShipToInfo.shipToCustomerCode,
          division: fakeCustomerCodeInfo.division,
          salesOrganisation: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
        language: 'EN',
        blockOrder: fakeVNSalesOrgConfigs.enablePrincipalList,
        products: cartMaterialsCombo
            .expand(
              (element) => element.comboMaterials.map(
                (comboMaterial) => comboMaterial.toSubmitMaterialInfo(),
              ),
            )
            .toList(),
      );
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderComboMock,
          ).toJson(),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterialsCombo,
        grandTotal: 210.0,
        orderValue: 210.0,
        smallOrderFee: 12500.0,
        totalTax: 0.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakePHSalesOrgConfigs,
      );
      expect(
        result,
        Right(submitOrderResponseMock),
      );
    });

    test(
        'submit order should contain deliveryFee as small order value string in ID market when order value <300000.00',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final submitOrderMockIDMarket = submitOrderMock.copyWith(
        requestedDeliveryDate: fakeIDSalesOrgConfigs.enableFutureDeliveryDay
            ? deliveryInfoData.deliveryDate.getValue()
            : '',
        customer: submitOrderMock.customer.copyWith(
          salesOrganisation:
              fakeIDSalesOrganisation.salesOrg.getOrDefaultValue(''),
        ),
      );
      when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);

      when(
        () => encryption.encryptionData(
          data: SubmitOrderDto.fromDomain(
            submitOrderMockIDMarket,
          ).toJson()
            ..addAll({'deliveryFee': '12500.0'}),
          secretKey: fakeSecretKey,
        ),
      ).thenReturn(orderEncryptionMock);
      when(
        () => orderRemoteDataSource.submitOrder(
          orderEncryption: orderEncryptionMock,
        ),
      ).thenAnswer(
        (invocation) async => submitOrderResponseMock,
      );

      final result = await orderRepository.submitOrder(
        shipToInfo: mockShipToInfo,
        user: fakeClientUser,
        cartProducts: cartMaterials,
        grandTotal: 100.0,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeIDSalesOrganisation,
        data: deliveryInfoData,
        orderDocumentType: OrderDocumentType.empty()
            .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
        configs: fakeIDSalesOrgConfigs,
        orderValue: 100.0,
        totalTax: 100,
        smallOrderFee: 12500.0,
      );

      expect(result, Right(submitOrderResponseMock));
    });
  });
  test(
      'submit order should contain deliveryFee as null string in ID market when order valye is >=300000.00',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    final submitOrderMockIDMarket = submitOrderMock.copyWith(
      orderValue: 310000.00,
      customer: submitOrderMock.customer.copyWith(
        salesOrganisation:
            fakeIDSalesOrganisation.salesOrg.getOrDefaultValue(''),
      ),
    );

    when(() => mockConfig.orderEncryptionSecret).thenReturn(fakeSecretKey);
    when(
      () => encryption.encryptionData(
        data: SubmitOrderDto.fromDomain(
          submitOrderMockIDMarket,
        ).toJson()
          ..addAll({'deliveryFee': 'null'}),
        secretKey: fakeSecretKey,
      ),
    ).thenReturn(orderEncryptionMock);
    when(
      () => orderRemoteDataSource.submitOrder(
        orderEncryption: orderEncryptionMock,
      ),
    ).thenAnswer(
      (invocation) async => submitOrderResponseMock,
    );

    final result = await orderRepository.submitOrder(
      shipToInfo: mockShipToInfo,
      user: fakeClientUser,
      cartProducts: cartMaterials,
      grandTotal: 100.0,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeIDSalesOrganisation,
      data: deliveryInfoData,
      orderDocumentType: OrderDocumentType.empty()
          .copyWith(documentType: DocumentType('ZPOR'), orderReason: ''),
      configs: fakePHSalesOrgConfigs,
      orderValue: 310000.00,
      totalTax: 100,
      smallOrderFee: 12500.0,
    );

    expect(result, Right(submitOrderResponseMock));
  });

  group('OrderRepository => getOrderHistoryDetails', () {
    test('get submit order getOrderHistoryDetails locally success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => viewByOrderDetailsLocalDataSource.getOrderHistoryDetails())
          .thenAnswer(
        (invocation) async => orderHistoryDetailsMock,
      );

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result,
        Right(orderHistoryDetailsMock),
      );
    });

    test('get submit order getOrderHistoryDetails locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => viewByOrderDetailsLocalDataSource.getOrderHistoryDetails())
          .thenThrow(fakeError);

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order getOrderHistoryDetails remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
          language: fakeClientUser.preferredLanguage.languageCode,
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          searchKey: submitOrderResponseMock.salesDocument,
          soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipTo: fakeShipToInfo.shipToCustomerCode,
        ),
      ).thenAnswer(
        (invocation) async => orderHistoryDetailsMock,
      );

      final result = await orderRepository.getOrderConfirmationDetail(
        user: fakeClientUser,
        cartProducts: cartMaterials,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        orderResponse: submitOrderResponseMock,
        shipToInfo: fakeShipToInfo,
      );
      expect(
        result,
        Right(orderHistoryDetailsMock),
      );
    });

    test(
      'get submit order getOrderHistoryDetails remote fail',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

        when(
          () => viewByOrderDetailsRemoteDataSource.getOrderHistoryDetails(
            language: fakeClientUser.preferredLanguage.languageCode,
            salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
            searchKey: submitOrderResponseMock.salesDocument,
            soldTo: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipTo: fakeShipToInfo.shipToCustomerCode,
          ),
        ).thenThrow(fakeError);

        final result = await orderRepository.getOrderConfirmationDetail(
          user: fakeClientUser,
          cartProducts: cartMaterials,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeSalesOrganisation,
          orderResponse: submitOrderResponseMock,
          shipToInfo: fakeShipToInfo,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      },
      timeout: const Timeout(
        Duration(seconds: 100),
      ),
    );
  });

  group('OrderRepository => getConfirmedOrderStockInfo', () {
    test('get submit order getConfirmedOrderStockInfo locally success',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => stockInfoLocalDataSource.getMaterialStockInfoList())
          .thenAnswer(
        (invocation) async => stockInfoListMock,
      );

      final result = await orderRepository.getConfirmedOrderStockInfo(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrg: fakeSalesOrganisation.salesOrg,
        orderHistoryDetails: orderHistoryDetailsMock,
      );
      expect(
        result,
        Right(stockInfoListMock),
      );
    });

    test('get submit order getConfirmedOrderStockInfo locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(() => stockInfoLocalDataSource.getMaterialStockInfoList())
          .thenThrow(fakeError);

      final result = await orderRepository.getConfirmedOrderStockInfo(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrg: fakeSalesOrganisation.salesOrg,
        orderHistoryDetails: orderHistoryDetailsMock,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });

    test('get submit order getConfirmedOrderStockInfo Remote success',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: orderHistoryDetailsMock.orderHistoryDetailsOrderItem
              .map((e) => e.materialNumber.getOrDefaultValue(''))
              .toList(),
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => stockInfoListMock,
      );

      final result = await orderRepository.getConfirmedOrderStockInfo(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrg: fakeSalesOrganisation.salesOrg,
        orderHistoryDetails: orderHistoryDetailsMock,
      );
      expect(
        result,
        Right(stockInfoListMock),
      );
    });

    test('get submit order getConfirmedOrderStockInfo Remote fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: orderHistoryDetailsMock.orderHistoryDetailsOrderItem
              .map((e) => e.materialNumber.getOrDefaultValue(''))
              .toList(),
          salesOrg: fakeSalesOrganisation.salesOrg.getValue(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenThrow(fakeError);

      final result = await orderRepository.getConfirmedOrderStockInfo(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrg: fakeSalesOrganisation.salesOrg,
        orderHistoryDetails: orderHistoryDetailsMock,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(fakeError)),
      );
    });
  });
}
