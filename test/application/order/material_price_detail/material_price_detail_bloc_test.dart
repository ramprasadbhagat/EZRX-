import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/valid_customer_material_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialDetailRepositoryMock extends Mock
    implements MaterialPriceDetailRepository {}

class ValidCustomerMaterialRepositoryMock extends Mock
    implements ValidCustomerMaterialRepository {}

void main() {
  final MaterialPriceDetailRepository priceRepository =
      MaterialDetailRepositoryMock();
  final ValidCustomerMaterialRepository validRepository =
      ValidCustomerMaterialRepositoryMock();

  late final Map<MaterialQueryInfo, MaterialPriceDetail> mockDetails;
  late final Map<MaterialQueryInfo, MaterialPriceDetail>
      mockDetailsAfterRefresh;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-saleOrg'));
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');
  final fakeShipToInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code');
  final fakeSaleOrgConfig = SalesOrganisationConfigs.empty();
  final fakeUser = User.empty().copyWith(username: Username('fake-name'));

  final fakeQuery = [
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023210571'),
      qty: MaterialQty(1),
    ),
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023245612'),
      qty: MaterialQty(1),
    ),
  ];

  final fakeQueryFOC = [
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023210571'),
      qty: MaterialQty(1),
      materialGroup4: MaterialGroup.four('6A1'),
    ),
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023245612'),
      qty: MaterialQty(1),
      materialGroup4: MaterialGroup.four('6A1'),
    ),
  ];

  final fakeQueryMaterialNumbers = [
    MaterialNumber('000000000023210571'),
    MaterialNumber('000000000023245612'),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final detailData =
        await MaterialPriceDetailLocalDataSource().getMaterialDetailList();
    mockDetails = {
      for (var detail in detailData)
        MaterialQueryInfo.empty().copyWith(
          value: detail.price.materialNumber,
          qty: MaterialQty(1),
        ): detail,
    };
    mockDetailsAfterRefresh =
        Map<MaterialQueryInfo, MaterialPriceDetail>.from(mockDetails)
          ..remove(fakeQuery[0])
          ..remove(fakeQuery[1]);
  });
  group('Material Detail Bloc', () {
    blocTest(
      'Initialize',
      build: () => MaterialPriceDetailBloc(
        validateRepository: validRepository,
        priceRepository: priceRepository,
      ),
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        const MaterialPriceDetailEvent.initialized(),
      ),
      expect: () => [MaterialPriceDetailState.initial()],
    );

    // Need to modify this
    //
    // blocTest(
    //   'Fetch stop when already has these material details ',
    //   build: () => MaterialPriceDetailBloc(
    //     validateRepository: validRepository,
    //     priceRepository: priceRepository,
    //   ),
    //   seed: () => MaterialPriceDetailState.initial()
    //       .copyWith(materialDetails: mockDetails),
    //   act: (MaterialPriceDetailBloc bloc) => bloc.add(
    //     MaterialPriceDetailEvent.fetch(
    //       customerCode: fakeCustomerCodeInfo,
    //       salesOrganisation: fakeSaleOrg,
    //       salesOrganisationConfigs: fakeSaleOrgConfig,
    //       shipToCode: fakeShipToInfo,
    //       user: fakeUser,
    //       materialInfoList: fakeQuery,
    //     ),
    //   ),
    //   expect: () => [],
    // );

    // blocTest(
    //   'Fetch stop when already has these material details ',
    //   build: () => MaterialPriceDetailBloc(
    //     validateRepository: validRepository,
    //     priceRepository: priceRepository,
    //   ),
    //   seed: () => MaterialPriceDetailState.initial()
    //       .copyWith(materialDetails: mockDetails),
    //   act: (MaterialPriceDetailBloc bloc) => bloc.add(
    //     MaterialPriceDetailEvent.fetch(
    //       customerCode: fakeCustomerCodeInfo,
    //       salesOrganisation: fakeSaleOrg,
    //       salesOrganisationConfigs: fakeSaleOrgConfig,
    //       shipToCode: fakeShipToInfo,
    //       user: fakeUser,
    //       materialInfoList: fakeQuery,
    //     ),
    //   ),
    //   expect: () => [],
    // );

    blocTest('Fetch stop when valid material API is failure',
        build: () => MaterialPriceDetailBloc(
              validateRepository: validRepository,
              priceRepository: priceRepository,
            ),
        setUp: () {
          when(() => validRepository.getValidMaterialList(
                user: fakeUser,
                salesOrganisation: fakeSaleOrg,
                customerCodeInfo: fakeCustomerCodeInfo,
                shipToInfo: fakeShipToInfo,
                materialList: fakeQueryMaterialNumbers,
                focMaterialList: [],
                pickAndPack: '',
              )).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('fake-error')),
          );
        },
        act: (MaterialPriceDetailBloc bloc) => bloc.add(
              MaterialPriceDetailEvent.fetch(
                customerCode: fakeCustomerCodeInfo,
                salesOrganisation: fakeSaleOrg,
                salesOrganisationConfigs: fakeSaleOrgConfig,
                shipToCode: fakeShipToInfo,
                user: fakeUser,
                materialInfoList: fakeQuery,
                pickAndPack: '',
              ),
            ),
        expect: () => [
              MaterialPriceDetailState.initial().copyWith(
                isValidating: true,
              ),
              MaterialPriceDetailState.initial()
                  .copyWith(isValidating: true, materialDetails: {
                for (final material in fakeQuery)
                  material: MaterialPriceDetail.defaultWithPrice(
                    query: material,
                    price: Price.empty().copyWith(
                      isValidMaterial: false,
                      isFOC: false,
                    ),
                  ),
              }),
              MaterialPriceDetailState.initial().copyWith(
                  isValidating: false,
                  isFetching: true,
                  materialDetails: {
                    for (final material in fakeQuery)
                      material: MaterialPriceDetail.defaultWithPrice(
                        query: material,
                        price: Price.empty().copyWith(
                          isValidMaterial: false,
                          isFOC: false,
                        ),
                      ),
                  }),
              MaterialPriceDetailState.initial().copyWith(
                  isValidating: false,
                  isFetching: false,
                  materialDetails: {
                    for (final material in fakeQuery)
                      material: MaterialPriceDetail.defaultWithPrice(
                        query: material,
                        price: Price.empty().copyWith(
                          isValidMaterial: false,
                          isFOC: false,
                        ),
                      ),
                  }),
            ],
        verify: (MaterialPriceDetailBloc bloc) {
          expect(bloc.state.isValidMaterial(query: fakeQuery.first), false);
        });

    blocTest('Fetch stop when all material is FOC',
        build: () => MaterialPriceDetailBloc(
              validateRepository: validRepository,
              priceRepository: priceRepository,
            ),
        setUp: () {
          when(() => validRepository.getValidMaterialList(
                user: fakeUser,
                salesOrganisation: fakeSaleOrg,
                customerCodeInfo: fakeCustomerCodeInfo,
                shipToInfo: fakeShipToInfo,
                materialList: [],
                focMaterialList: fakeQueryMaterialNumbers,
                pickAndPack: '',
              )).thenAnswer(
            (invocation) async => Right(fakeQueryMaterialNumbers),
          );
        },
        act: (MaterialPriceDetailBloc bloc) => bloc.add(
              MaterialPriceDetailEvent.fetch(
                customerCode: fakeCustomerCodeInfo,
                salesOrganisation: fakeSaleOrg,
                salesOrganisationConfigs: fakeSaleOrgConfig,
                shipToCode: fakeShipToInfo,
                user: fakeUser,
                materialInfoList: fakeQueryFOC,
                pickAndPack: '',
              ),
            ),
        expect: () => [
              MaterialPriceDetailState.initial().copyWith(
                isValidating: true,
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: true,
                materialDetails: {
                  for (final material in fakeQueryFOC)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: true,
                materialDetails: {
                  for (final material in fakeQueryFOC)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: true,
                materialDetails: {
                  for (final material in fakeQueryFOC)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: true,
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: false,
                materialDetails: {
                  for (final material in fakeQueryFOC)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: true,
                      ),
                    ),
                },
              ),
            ],
        verify: (MaterialPriceDetailBloc bloc) {
          expect(bloc.state.isValidMaterial(query: fakeQueryFOC.first), true);
        });

    blocTest(
      'Fetch material detail failure',
      build: () => MaterialPriceDetailBloc(
        validateRepository: validRepository,
        priceRepository: priceRepository,
      ),
      setUp: () {
        when(
          () => priceRepository.getMaterialDetail(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSaleOrgConfig,
            shipToCodeInfo: fakeShipToInfo,
            materialQueryList: fakeQuery,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
        when(() => validRepository.getValidMaterialList(
              user: fakeUser,
              salesOrganisation: fakeSaleOrg,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeShipToInfo,
              materialList: fakeQueryMaterialNumbers,
              focMaterialList: [],
              pickAndPack: '',
            )).thenAnswer(
          (invocation) async => Right(fakeQueryMaterialNumbers),
        );
      },
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          user: fakeUser,
          materialInfoList: fakeQuery,
          pickAndPack: '',
        ),
      ),
      expect: () => [
        MaterialPriceDetailState.initial().copyWith(
          isValidating: true,
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: true,
          materialDetails: {
            for (final material in fakeQuery)
              material: MaterialPriceDetail.defaultWithPrice(
                query: material,
                price: Price.empty().copyWith(
                  isValidMaterial: true,
                  isFOC: false,
                ),
              ),
          },
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: true,
          materialDetails: {
            for (final material in fakeQuery)
              material: MaterialPriceDetail.defaultWithPrice(
                query: material,
                price: Price.empty().copyWith(
                  isValidMaterial: true,
                  isFOC: false,
                ),
              ),
          },
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: true,
          materialDetails: {
            for (final material in fakeQuery)
              material: MaterialPriceDetail.defaultWithPrice(
                query: material,
                price: Price.empty().copyWith(
                  isValidMaterial: true,
                  isFOC: false,
                  finalPrice: MaterialPrice.unavailable(),
                ),
              ),
          },
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: false,
          materialDetails: {
            for (final material in fakeQuery)
              material: MaterialPriceDetail.defaultWithPrice(
                query: material,
                price: Price.empty().copyWith(
                  isValidMaterial: true,
                  isFOC: false,
                  finalPrice: MaterialPrice.unavailable(),
                ),
              ),
          },
        ),
      ],
    );

    blocTest('Fetch material detail success',
        build: () => MaterialPriceDetailBloc(
              validateRepository: validRepository,
              priceRepository: priceRepository,
            ),
        setUp: () {
          when(
            () => priceRepository.getMaterialDetail(
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeSaleOrg,
              salesOrganisationConfigs: fakeSaleOrgConfig,
              shipToCodeInfo: fakeShipToInfo,
              materialQueryList: fakeQuery,
            ),
          ).thenAnswer(
            (_) async => Right(mockDetails),
          );
          when(() => validRepository.getValidMaterialList(
                user: fakeUser,
                salesOrganisation: fakeSaleOrg,
                customerCodeInfo: fakeCustomerCodeInfo,
                shipToInfo: fakeShipToInfo,
                materialList: fakeQueryMaterialNumbers,
                focMaterialList: [],
                pickAndPack: '',
              )).thenAnswer(
            (invocation) async => Right(fakeQueryMaterialNumbers),
          );
        },
        act: (MaterialPriceDetailBloc bloc) => bloc.add(
              MaterialPriceDetailEvent.fetch(
                customerCode: fakeCustomerCodeInfo,
                salesOrganisation: fakeSaleOrg,
                salesOrganisationConfigs: fakeSaleOrgConfig,
                shipToCode: fakeShipToInfo,
                user: fakeUser,
                materialInfoList: fakeQuery,
                pickAndPack: '',
              ),
            ),
        expect: () => [
              MaterialPriceDetailState.initial().copyWith(
                isValidating: true,
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: true,
                materialDetails: {
                  for (final material in fakeQuery)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: true,
                materialDetails: {
                  for (final material in fakeQuery)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: true,
                materialDetails: {
                  for (final material in fakeQuery)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                        finalPrice: MaterialPrice.unavailable(),
                      ),
                    ),
                },
              ),
              MaterialPriceDetailState.initial().copyWith(
                isValidating: false,
                isFetching: false,
                materialDetails: {
                  for (final material in fakeQuery)
                    material: MaterialPriceDetail.defaultWithPrice(
                      query: material,
                      price: Price.empty().copyWith(
                        isValidMaterial: true,
                        isFOC: false,
                        finalPrice: MaterialPrice.unavailable(),
                      ),
                    ),
                }..addAll(mockDetails),
              ),
            ],
        verify: (MaterialPriceDetailBloc bloc) {
          expect(bloc.state.isValidMaterial(query: fakeQuery.first), true);
        });

    blocTest(
      'Refresh price and got these material is invalid',
      build: () => MaterialPriceDetailBloc(
        validateRepository: validRepository,
        priceRepository: priceRepository,
      ),
      setUp: () {
        when(() => validRepository.getValidMaterialList(
              user: fakeUser,
              salesOrganisation: fakeSaleOrg,
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: fakeShipToInfo,
              materialList: fakeQueryMaterialNumbers,
              focMaterialList: [],
              pickAndPack: '',
            )).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      seed: () => MaterialPriceDetailState.initial()
          .copyWith(materialDetails: mockDetails),
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.refresh(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          user: fakeUser,
          materialInfoList: fakeQuery,
          pickAndPack: '',
        ),
      ),
      expect: () => [
        MaterialPriceDetailState.initial().copyWith(
          materialDetails: Map.from(mockDetailsAfterRefresh),
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: true,
          materialDetails: Map.from(mockDetailsAfterRefresh),
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: true,
          materialDetails: Map.from(mockDetailsAfterRefresh)
            ..addAll({
              for (final material in fakeQuery)
                material: MaterialPriceDetail.defaultWithPrice(
                  query: material,
                  price: Price.empty().copyWith(
                    isValidMaterial: false,
                    isFOC: false,
                  ),
                ),
            }),
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: true,
          materialDetails: Map.from(mockDetailsAfterRefresh)
            ..addAll({
              for (final material in fakeQuery)
                material: MaterialPriceDetail.defaultWithPrice(
                  query: material,
                  price: Price.empty().copyWith(
                    isValidMaterial: false,
                    isFOC: false,
                  ),
                ),
            }),
        ),
        MaterialPriceDetailState.initial().copyWith(
          isValidating: false,
          isFetching: false,
          materialDetails: Map.from(mockDetailsAfterRefresh)
            ..addAll({
              for (final material in fakeQuery)
                material: MaterialPriceDetail.defaultWithPrice(
                  query: material,
                  price: Price.empty().copyWith(
                    isValidMaterial: false,
                    isFOC: false,
                  ),
                ),
            }),
        ),
      ],
    );
  });
}
