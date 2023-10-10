import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MaterialListRepositoryMock extends Mock
    implements MaterialListRepository {}

void main() {
  late final MaterialListRepository repository;
  late Config config;
  late MaterialResponse fakeMaterialListData;
  late List<BonusSampleItem> fakeSampleBonusItem;
  final fakePrincipalData = PrincipalData.empty().copyWith(
    principalName: PrincipalName('fake-principal-name'),
    principalCode: PrincipalCode('0000101246'),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    config = Config()..appFlavor = Flavor.mock;
    repository = MaterialListRepositoryMock();
    fakeMaterialListData = await MaterialListLocalDataSource().getProductList();
    fakeSampleBonusItem = [
      BonusSampleItem.empty().copyWith(
        qty: fakeMaterialListData.products.first.quantity,
        materialNumber: fakeMaterialListData.products.first.materialNumber,
        materialDescription:
            fakeMaterialListData.products.first.materialDescription,
        itemId: StringValue(''),
        principalData: fakeMaterialListData.products.first.principalData,
      )
    ];
  });

  group('Bonus Material Bloc', () {
    blocTest(
      'Fetch Bonus material success',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeSalesOrganisation,
            enableGimmickMaterial: false,
            offset: 0,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeEmptySalesConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey(''),
          ),
        ).thenAnswer(
          (_) async => Right(fakeMaterialListData),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.fetch(
          configs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
          searchKey: SearchKey(''),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Fetch Bonus material failure',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeSalesOrganisation,
            enableGimmickMaterial: false,
            offset: 0,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeEmptySalesConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey(''),
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.fetch(
          configs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
          searchKey: SearchKey(''),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
        ),
        BonusMaterialState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'LoadMore Bonus material Success',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      setUp: () {
        when(
          () => repository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeSalesOrganisation,
            enableGimmickMaterial: false,
            offset: fakeMaterialListData.products.length,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeEmptySalesConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey(''),
          ),
        ).thenAnswer(
          (_) async => Right(fakeMaterialListData),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.loadMoreBonusItem(
          configs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          canLoadMore: false,
          bonusItemList: [
            ...fakeMaterialListData.products,
            ...fakeMaterialListData.products,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'LoadMore Bonus material failure',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      setUp: () {
        when(
          () => repository.getMaterialBonusList(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            salesOrganisation: fakeSalesOrganisation,
            enableGimmickMaterial: false,
            offset: fakeMaterialListData.products.length,
            pageSize: config.pageSize,
            principalData: fakePrincipalData,
            salesOrgConfig: fakeEmptySalesConfigs,
            user: fakeRootAdminUser,
            searchKey: SearchKey(''),
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.loadMoreBonusItem(
          configs: fakeEmptySalesConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          isGimmickMaterialEnabled: false,
          principalData: fakePrincipalData,
          salesOrganisation: fakeSalesOrganisation,
          shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
          user: fakeRootAdminUser,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          isFetching: true,
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Validate Bonus Quantity',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.validateBonusQuantity(
          bonusMaterial: fakeMaterialListData.products.first,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          isBonusQtyValidated:
              fakeMaterialListData.products.first.quantity.intValue > 0,
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Update Added Bonus Items',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: fakeMaterialListData.products,
        addedBonusItemsList: fakeSampleBonusItem,
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateAddedBonusItems(
          addedBonusItemList: fakeSampleBonusItem,
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: fakeMaterialListData.products,
          addedBonusItemsList: [
            ...fakeSampleBonusItem,
            ...fakeSampleBonusItem,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );

    blocTest(
      'Update Bonus Item Quantity',
      build: () => BonusMaterialBloc(
        materialListRepository: repository,
        config: config,
      ),
      seed: () => BonusMaterialState.initial().copyWith(
        bonusItemList: [
          fakeMaterialListData.products.first,
          fakeMaterialListData.products.last,
        ],
        failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
      ),
      act: (BonusMaterialBloc bloc) => bloc.add(
        BonusMaterialEvent.updateBonusItemQuantity(
          updatedBonusItem: fakeMaterialListData.products.first
              .copyWith(quantity: MaterialQty(5)),
        ),
      ),
      expect: () => [
        BonusMaterialState.initial().copyWith(
          bonusItemList: [
            fakeMaterialListData.products.first
                .copyWith(quantity: MaterialQty(5)),
            fakeMaterialListData.products.last,
          ],
          failureOrSuccessOption: optionOf(Right(fakeMaterialListData)),
        ),
      ],
    );
  });
}
