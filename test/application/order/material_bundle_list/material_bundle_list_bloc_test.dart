import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/order/repository/customer_material_price_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialBundleListRepositoryMock extends Mock
    implements MaterialBundleListRepository {}

class CustomerMaterialPriceDetailsRepositoryMock extends Mock
    implements CustomerMaterialPriceDetailsRepository {}

void main() {
  late MaterialBundleListRepository materialBundleListRepositoryMock;
  late CustomerMaterialPriceDetailsRepository
      customerMaterialPriceDetailsRepositoryMock;

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();

  group(
    'Testing MaterialBundleListBloc',
    () {
      setUp(() {
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
            (invocation) async => Right(
              [
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test',
                      bundleCode: '1234',
                    ),
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test2',
                      bundleCode: '1235',
                    ),
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test3',
                      bundleCode: '1234',
                    ),
                  ],
                ),
              ],
            ),
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
          ),
          MaterialBundleListState.initial().copyWith(
            bundleList: [
              Bundle.empty().copyWith(
                bundleName: 'test',
                bundleCode: '1234',
              ),
              Bundle.empty().copyWith(
                bundleName: 'test2',
                bundleCode: '1235',
              ),
            ],
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
            (invocation) async => Right(
              [
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test',
                      bundleCode: '1234',
                    ),
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test2',
                      bundleCode: '1235',
                    ),
                  ],
                ),
                MaterialInfo.empty().copyWith(
                  bundles: [
                    Bundle.empty().copyWith(
                      bundleName: 'test3',
                      bundleCode: '1234',
                    ),
                  ],
                ),
              ],
            ),
          );
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
            bundleList: [
              Bundle.empty().copyWith(
                bundleName: 'test',
                bundleCode: '1234',
              ),
              Bundle.empty().copyWith(
                bundleName: 'test2',
                bundleCode: '1235',
              ),
            ],
            canLoadMore: false,
            nextPageIndex: 1,
          ),
        ],
      );
    },
  );
}
