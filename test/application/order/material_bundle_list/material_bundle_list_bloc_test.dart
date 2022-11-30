import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialBundleListRepositoryMock extends Mock
    implements MaterialBundleListRepository {}

class CustomerMaterialPriceDetailsRepositoryMock extends Mock
    implements MaterialPriceDetailRepository {}

class MaterialBundleMockBloc
    extends MockBloc<MaterialBundleListEvent, MaterialBundleListState>
    implements MaterialBundleListBloc {}

void main() {
  late MaterialBundleListRepository materialBundleListRepositoryMock;
  late MaterialPriceDetailRepository customerMaterialPriceDetailsRepositoryMock;

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final bundleItemList = <Bundle>[
    Bundle.empty().copyWith(
      bundleName: BundleName('test'),
      bundleCode: '1234',
    ),
    Bundle.empty().copyWith(
      bundleName: BundleName('test2'),
      bundleCode: '1235',
    ),
    Bundle.empty().copyWith(
      bundleName: BundleName('test3'),
      bundleCode: '1236',
    ),
    Bundle.empty().copyWith(
      bundleName: BundleName('test4'),
      bundleCode: '1237',
    ),
  ];

  final materialInfoList = [
    MaterialInfo.empty().copyWith(
      bundles: [bundleItemList[0]],
    ),
    MaterialInfo.empty().copyWith(
      bundles: [bundleItemList[1]],
    ),
    MaterialInfo.empty().copyWith(
      bundles: [bundleItemList[2]],
    ),
    MaterialInfo.empty().copyWith(
      bundles: [bundleItemList[3]],
    ),
  ];

  final bundleAggregateList = [
    BundleAggregate(bundle: bundleItemList[0], materialInfos: [
      MaterialInfo.empty().copyWith(
        bundles: [bundleItemList[0]],
      ),
    ]),
    BundleAggregate(bundle: bundleItemList[1], materialInfos: [
      MaterialInfo.empty().copyWith(
        bundles: [bundleItemList[1]],
      ),
    ]),
    BundleAggregate(bundle: bundleItemList[2], materialInfos: [
      MaterialInfo.empty().copyWith(
        bundles: [bundleItemList[2]],
      ),
    ]),
    BundleAggregate(bundle: bundleItemList[3], materialInfos: [
      MaterialInfo.empty().copyWith(
        bundles: [bundleItemList[3]],
      ),
    ]),
  ];

  group(
    'Testing MaterialBundleListBloc',
    () {
      setUp(() async {
        WidgetsFlutterBinding.ensureInitialized();
        materialBundleListRepositoryMock = MaterialBundleListRepositoryMock();
        customerMaterialPriceDetailsRepositoryMock =
            CustomerMaterialPriceDetailsRepositoryMock();
      });
      blocTest<MaterialBundleListBloc, MaterialBundleListState>(
        'Initialize',
        build: () => MaterialBundleListBloc(
          materialBundleListRepository: materialBundleListRepositoryMock,
          customerMaterialPriceDetailsRepository:
              customerMaterialPriceDetailsRepositoryMock,
        ),
        act: (bloc) => bloc.add(const MaterialBundleListEvent.initialized()),
        expect: () => [
          MaterialBundleListState.initial(),
        ],
      );
      blocTest<MaterialBundleListBloc, MaterialBundleListState>(
        'For "fetch" Event with error',
        build: () => MaterialBundleListBloc(
          materialBundleListRepository: materialBundleListRepositoryMock,
          customerMaterialPriceDetailsRepository:
              customerMaterialPriceDetailsRepositoryMock,
        ),
        setUp: () {
          when(() => materialBundleListRepositoryMock.getMaterialBundleList(
                    customerCode: mockCustomerCodeInfo,
                    salesOrganisation: mockSalesOrg,
                    shipToCode: mockShipToInfo,
                    user: mockUser,
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake Error')));
        },
        act: (bloc) => bloc.add(MaterialBundleListEvent.fetch(
          user: mockUser,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          salesOrganisation: mockSalesOrg,
        )),
        expect: () => [
          MaterialBundleListState.initial().copyWith(
            isFetching: true,
          ),
          MaterialBundleListState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          )
        ],
      );
      blocTest<MaterialBundleListBloc, MaterialBundleListState>(
        'For "fetch" Event with Data',
        build: () => MaterialBundleListBloc(
          materialBundleListRepository: materialBundleListRepositoryMock,
          customerMaterialPriceDetailsRepository:
              customerMaterialPriceDetailsRepositoryMock,
        ),
        setUp: () {
          when(() => materialBundleListRepositoryMock.getMaterialBundleList(
                customerCode: mockCustomerCodeInfo,
                salesOrganisation: mockSalesOrg,
                shipToCode: mockShipToInfo,
                user: mockUser,
              )).thenAnswer(
            (invocation) async => Right(materialInfoList),
          );
        },
        act: (bloc) => bloc.add(MaterialBundleListEvent.fetch(
          user: mockUser,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          salesOrganisation: mockSalesOrg,
        )),
        expect: () => [
          MaterialBundleListState.initial().copyWith(
            isFetching: true,
            bundleList: [],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
          MaterialBundleListState.initial().copyWith(
            bundleList: bundleAggregateList,
            apiFailureOrSuccessOption: none(),
            isFetching: false,
            canLoadMore: false,
            nextPageIndex: 1,
          ),
        ],
      );
      blocTest<MaterialBundleListBloc, MaterialBundleListState>(
        'For "loadMore" Event with error',
        build: () => MaterialBundleListBloc(
          materialBundleListRepository: materialBundleListRepositoryMock,
          customerMaterialPriceDetailsRepository:
              customerMaterialPriceDetailsRepositoryMock,
        ),
        setUp: () {
          when(() => materialBundleListRepositoryMock.getMaterialBundleList(
                    customerCode: mockCustomerCodeInfo,
                    salesOrganisation: mockSalesOrg,
                    shipToCode: mockShipToInfo,
                    user: mockUser,
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake Error')));
        },
        act: (bloc) => bloc.add(MaterialBundleListEvent.loadMore(
          user: mockUser,
          customerCode: mockCustomerCodeInfo,
          shipToCode: mockShipToInfo,
          salesOrganisation: mockSalesOrg,
        )),
        expect: () => [
          MaterialBundleListState.initial().copyWith(
            isFetching: true,
          ),
          MaterialBundleListState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          )
        ],
      );

      blocTest<MaterialBundleListBloc, MaterialBundleListState>(
        'For "loadMore" Event with Data',
        build: () => MaterialBundleListBloc(
          materialBundleListRepository: materialBundleListRepositoryMock,
          customerMaterialPriceDetailsRepository:
              customerMaterialPriceDetailsRepositoryMock,
        ),
        setUp: () {
          when(() => materialBundleListRepositoryMock.getMaterialBundleList(
                customerCode: mockCustomerCodeInfo,
                salesOrganisation: mockSalesOrg,
                shipToCode: mockShipToInfo,
                user: mockUser,
              )).thenAnswer(
            (invocation) async => Right(materialInfoList),
          );
        },
        act: (MaterialBundleListBloc bloc) {
          bloc.add(MaterialBundleListEvent.loadMore(
            user: mockUser,
            customerCode: mockCustomerCodeInfo,
            shipToCode: mockShipToInfo,
            salesOrganisation: mockSalesOrg,
          ));
        },
        expect: () => [
          MaterialBundleListState.initial().copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            bundleList: [],
            canLoadMore: true,
            nextPageIndex: 0,
          ),
          MaterialBundleListState.initial().copyWith(
            isFetching: false,
            bundleList: bundleAggregateList,
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            nextPageIndex: 1,
          ),
        ],
      );
    },
  );
}
