import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/stock_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../auth/repository/auth_repository_test.dart';

class MockConfig extends Mock implements Config {}

class MockCartStorage extends Mock implements CartStorage {}

class MockCountlyService extends Mock implements CountlyService {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

void main() {
  late Config mockConfig;
  late CartStorage cartStorageMock;
  late StockInfoLocalDataSourceMock stockInfoLocalDataSource;
  late StockInfoRemoteDataSourceMock stockInfoRemoteDataSource;
  late CountlyService countlyServiceMock;
  late CartRepository cartRepositoryMock;
  final fakeCart = PriceAggregate(
    price: Price(
        materialNumber: MaterialNumber('0'),
        rules: [],
        tiers: [],
        bonuses: [],
        bundles: [],
        overrideRulePresent: false,
        zdp5MaxQuota: '',
        zdp5RemainingQuota: '',
        zmgDiscount: false,
        lastPrice: MaterialPrice(0.0),
        finalPrice: MaterialPrice(0.0),
        finalTotalPrice: MaterialPrice(0.0),
        additionalBonusEligible: false,
        isValid: true,
        isValidMaterial: true,
        isFOC: false,
        isPriceOverride: false,
        zdp8Override: Zdp8OverrideValue(0.0),
        priceOverride: PriceOverrideValue(0.0)),
    materialInfo: MaterialInfo(
        materialNumber: MaterialNumber('21211474'),
        materialDescription: '?Genotropin GQ 5.3MG SFDPO 1xPTCC DEMO',
        defaultMaterialDescription: '?Genotropin GQ 5.3MG SFDPO 1xPTCC DEMO',
        governmentMaterialCode: '',
        therapeuticClass: 'Growth hormones',
        itemBrand: 'Genotropin GQ 5.3MG',
        principalData: PrincipalData(
          principalName: 'Pfizer PFE Private Limited test',
          principalCode: PrincipalCode('0000103892'),
        ),
        itemRegistrationNumber: 'NA',
        unitOfMeasurement: 'EA',
        materialGroup2: MaterialGroup.two(''),
        materialGroup4: MaterialGroup.four('6GS'),
        isSampleMaterial: false,
        hidePrice: false,
        hasValidTenderContract: false,
        hasMandatoryTenderContract: false,
        taxClassification: MaterialTaxClassification(''),
        taxes: ['0'],
        bundles: [],
        isFOCMaterial: false,
        quantity: 0,
        remarks: ''),
    bundle: Bundle(
        materials: [],
        bundleName: BundleName('0'),
        bundleCode: '',
        bundleInformation: []),
    salesOrgConfig: SalesOrganisationConfigs(
        enableIRN: true,
        enableDefaultMD: false,
        disableProcessingStatus: false,
        currency: Currency('sgd'),
        hideCustomer: true,
        enableGimmickMaterial: true,
        languageFilter: false,
        languageValue: LanguageValue('M'),
        disablePrincipals: false,
        principalList: [],
        disableOrderType: false,
        enableBatchNumber: false,
        disableBundles: false,
        enableZDP5: false,
        enableVat: false,
        enableTaxAtTotalLevelOnly: true,
        enableTaxClassification: false,
        vatValue: 8,
        materialWithoutPrice: true,
        enableSpecialInstructions: true,
        enableReferenceNote: true,
        enableCollectiveNumber: true,
        enableMobileNumber: true,
        enableFutureDeliveryDay: true,
        enablePaymentTerms: false,
        futureDeliveryDay: '5',
        enableGMC: false,
        enableListPrice: true,
        priceOverride: true,
        disablePaymentTermsDisplay: false,
        disableDeliveryDate: false,
        enableBillTo: true,
        showPOAttachment: true,
        hideStockDisplay: false,
        expiryDateDisplay: true,
        batchNumDisplay: false,
        addOosMaterials: true,
        oosValue: OosValue(1),
        enableRemarks: true,
        enableOHPrice: true,
        ponRequired: true,
        enableTaxDisplay: false,
        netPriceOverride: true,
        displayOrderDiscount: true,
        minOrderAmount: '50',
        salesOrg: SalesOrg('2601'),
        enableZDP8Override: true,
        disableReturnsAccessSR: false,
        disableReturnsAccess: false),
    quantity: 1,
    discountedMaterialCount: 1,
    addedBonusList: [],
    stockInfo: StockInfo(
        materialNumber: MaterialNumber('21211474'),
        expiryDate: ExpiryDate('-'),
        batch: '-',
        inStock: MaterialInStock('No'),
        salesDistrict: ''),
    tenderContract: TenderContract(
      contractNumber: TenderContractNumber.tenderContractNumber(''),
      contractItemNumber: TenderContractNumber.tenderContractItemNumber(''),
      contractReference: TenderContractInfo.tenderContractReference(''),
      tenderOrderReason: TenderContractReason(''),
      tenderVisaNumber: TenderContractNumber.tenderVisaNumber(''),
      salesDistrict:
          TenderContractInfo.salesDistrict(''), // Value(const Right()),
      tenderPackageDescription: TenderContractInfo.packageDescription(
          'input'), // Value(const Right()),
      tenderPrice: TenderPrice(''), // Value(const Right(0)),
      pricingUnit: 0,
      remainingTenderQuantity: 0,
      contractQuantity: 0,
      contractExpiryDate:
          TenderContractInfo.contractExpiryDate(''), // Value(const Right()),
      announcementLetterNumber: TenderContractNumber.announcementLetterNumber(
          ''), // Value(const Right()),
      isNearToExpire: false,
      contractPaymentTerm: TenderContractInfo.contractPaymentTerm(''),
    ),
  );

  const emptyConstMaterialDto = MaterialDto(
    bundles: [],
    governmentMaterialCode: '',
    defaultMaterialDescription: '',
    hasMandatoryTenderContract: false,
    hasValidTenderContract: false,
    hidePrice: false,
    isSampleMaterial: false,
    itemBrand: '',
    itemRegistrationNumber: '',
    materialGroup2: '',
    materialDescription: '',
    materialGroup4: '6A1',
    principalCode: '',
    materialNumber: '',
    principalName: '',
    taxClassification: '',
    taxes: [],
    therapeuticClass: '',
    unitOfMeasurement: '',
    isFOCMaterial: true,
    quantity: 0,
    remarks: '',
  );

  const emptyPriceDto = PriceDto(
    additionalBonusEligible: false,
    bonuses: [],
    bundles: [],
    finalIndividualPrice: 0,
    finalTotalPrice: 0,
    isValid: false,
    listPrice: 0,
    materialNumber: '',
    overrideRulePresent: false,
    rules: [],
    tiers: [],
    zdp5MaxQuota: '',
    zdp5RemainingQuota: '',
    zmgDiscount: false,
    isPriceOverride: false,
    zdp8Override: 0,
    priceOverride: 0,
  );

  const emptySalesOrganisationConfigsDto = SalesOrganisationConfigsDto(
    salesOrg: '',
    enableIRN: false,
    currency: '',
    disableBundles: false,
    disableOrderType: false,
    disablePrincipals: false,
    disableProcessingStatus: false,
    enableBatchNumber: false,
    enableCollectiveNumber: false,
    enableDefaultMD: false,
    enableFutureDeliveryDay: false,
    enableGMC: false,
    enableGimmickMaterial: false,
    enableListPrice: false,
    enableMobileNumber: false,
    enablePaymentTerms: false,
    enableReferenceNote: false,
    enableSpecialInstructions: false,
    enableTaxClassification: false,
    enableVat: false,
    enableTaxAtTotalLevelOnly: false,
    enableZDP5: false,
    futureDeliveryDay: '',
    hideCustomer: false,
    languageValue: '',
    languageFilter: false,
    materialWithoutPrice: false,
    principalList: [],
    vatValue: 0,
    priceOverride: false,
    disablePaymentTermsDisplay: false,
    disableDeliveryDate: false,
    enableBillTo: false,
    showPOAttachment: false,
    hideStockDisplay: false,
    expiryDateDisplay: false,
    addOosMaterials: false,
    oosValue: 0,
    enableRemarks: false,
    enableOHPrice: true,
    ponRequired: false,
    enableTaxDisplay: false,
    netPriceOverride: false,
    batchNumDisplay: false,
    displayOrderDiscount: false,
    minOrderAmount: '0',
    enableZDP8Override: false,
    disableReturnsAccessSR: false,
    disableReturnsAccess: false,
  );

  const emptyBundleDto = BundleDto(
      bundleName: '', bundleCode: '', bundleInformation: [], materials: []);

  const emptyStockInfoDto = StockInfoDto(
    batch: '',
    expiryDate: '',
    inStock: '',
    materialNumber: '',
    salesDistrict: '',
  );

  const emptyTenderContractDto = TenderContractDto(
    contractNumber: '',
    contractItemNumber: '',
    contractReference: '',
    tenderOrderReason: '',
    tenderVisaNumber: '',
    salesDistrict: '',
    tenderPackageDescription: '',
    tenderPrice: '',
    pricingUnit: 0,
    remainingTenderQuantity: 0,
    contractQuantity: 0,
    contractExpiryDate: '',
    announcementLetterNumber: '',
    isNearToExpire: false,
    contractPaymentTerm: '',
  );

  final priceAggregateDtoList = [
    PriceAggregateDto(
        bonusItem: [],
        bundleDto: emptyBundleDto,
        materialDto: emptyConstMaterialDto,
        salesOrganisationConfigsDto: emptySalesOrganisationConfigsDto,
        priceDto: emptyPriceDto,
        quantity: 4,
        stockInfoDto: emptyStockInfoDto,
        tenderContractDto: emptyTenderContractDto,
        zmgMaterialCountOnCart: 4)
  ];
  final mockPriceAggregate = PriceAggregate.empty().copyWith(
    salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
      salesOrg: SalesOrg('2601'),
      batchNumDisplay: true,
      enableTaxDisplay: true,
      enableRemarks: true,
      displayOrderDiscount: true,
      disableDeliveryDate: true,
      currency: Currency('vnd'),
    ),
    price: Price.empty(),
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('1'),
    ),
  );
  setUpAll(() {
    mockConfig = MockConfig();
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    cartStorageMock = MockCartStorage();
    countlyServiceMock = CountlyServiceMock();
    cartRepositoryMock = CartRepository(
      config: mockConfig,
      cartStorage: cartStorageMock,
      countlyService: countlyServiceMock,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
    );
  });

  group('CartRepository should - ', () {
    test('int cart storage successfully', () async {
      when(() => cartStorageMock.init()).thenAnswer((invocation) async {
        return;
      });
      final result = await cartRepositoryMock.initCartStorage();

      expect(
        result.isRight(),
        true,
      );
    });
    test('init cart storage failed', () async {
      when(() => cartStorageMock.init())
          .thenThrow((invocation) async => MockException());

      final result = await cartRepositoryMock.initCartStorage();

      expect(
        result.isLeft(),
        true,
      );
    });
  });

  test('add to cart successfully', () async {
    when(() => cartStorageMock.add(
          PriceAggregateDto.fromDomain(fakeCart),
        )).thenAnswer((invocation) async {
      return Future.value();
    });
    await cartRepositoryMock.addToCart(cartItem: fakeCart);
    when(
      () => countlyServiceMock
          .addCountlyEvent('Add materials to cart', segmentation: {
        'materialNum': mockPriceAggregate.getMaterialNumber.getOrCrash(),
        'listPrice': mockPriceAggregate.listPrice,
        'price': mockPriceAggregate.price.finalPrice.getOrCrash(),
        'numItemInCart': 1, // cartStorageMock.cartBoxSize,
        'materialType': priceAggregateDtoList[0]
            .toDomain()
            .materialInfo
            .materialGroup4
            .getMaterialGroup4Type,
      }),
    ).thenAnswer((invocation) => Future.value());

    await cartRepositoryMock.fetchCartItems();
    verify(
      () => cartRepositoryMock.fetchCartItems(),
    ).called(1);
  });
  test('add to cart failed', () async {
    when(() => cartStorageMock.add(priceAggregateDtoList[0]))
        .thenThrow((invocation) async => MockException());

    verifyNever(
      () => cartRepositoryMock.fetchCartItems(),
    );
  });

  test('update cart storage successfully', () async {
    when(() => cartStorageMock
            .updateItem(PriceAggregateDto.fromDomain(mockPriceAggregate)))
        .thenAnswer((invocation) async {
      return;
    });
    await cartRepositoryMock.updateCartItem(cartItem: mockPriceAggregate);
    // final result =
    await cartRepositoryMock.fetchCartItems();
    // expect(
    //   result.isRight(),
    //   true,
    // );
    verify(
      () => cartRepositoryMock.fetchCartItems(),
    ).called(1);
  });
  test('update cart storage failed', () async {
    when(() => cartStorageMock.init())
        .thenThrow((invocation) async => MockException());

    final result = await cartRepositoryMock.initCartStorage();

    expect(
      result.isLeft(),
      true,
    );
  });
}
