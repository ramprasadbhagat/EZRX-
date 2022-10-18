import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/material/stock_information/stock_information_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/entities/principal_data.dart';
import 'package:ezrxmobile/domain/material/entities/stock_info.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/material/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/material/repository/stock_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class StockInfoMockRepo extends Mock implements StockInfoRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late List<StockInfo> stockInfoMockData;
  late List<StockInfo> stockInfoListMockData;
  late StockInfoLocalDataSource stockInfoLocalDataSource;

  final StockInfoRepository stockInfoMockRepo = StockInfoMockRepo();

  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final fakeShipToInfo = ShipToInfo.empty().copyWith(plant: '');
  final fakeCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '0000002613');
  final enablebatchSalesOrganisationConfigsConfigs =
      SalesOrganisationConfigs.empty().copyWith(enableBatchNumber: true);
  final disablebatchSalesOrganisationConfigsConfigs =
      SalesOrganisationConfigs.empty().copyWith(enableBatchNumber: false);
  final fakeMaterial = MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023245612'),
      principalData:
          PrincipalData.empty().copyWith(principalCode: '0000100813'));

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    stockInfoLocalDataSource = StockInfoLocalDataSource();
    stockInfoMockData = [await stockInfoLocalDataSource.getStockInfo()];
    stockInfoListMockData = await stockInfoLocalDataSource.getStockInfoList();
  });

  group('Customer Code Bloc', () {
    blocTest('Customer code Initial',
        build: () =>
            StockInformationBloc(stockInfoRepository: stockInfoMockRepo),
        act: (StockInformationBloc bloc) {
          bloc.add(const StockInformationEvent.initialized());
        },
        expect: () => [StockInformationState.initial()]);

    blocTest(
      'Stock Info List Fetch fail when batch number disable',
      build: () => StockInformationBloc(stockInfoRepository: stockInfoMockRepo),
      setUp: () {
        when(() => stockInfoMockRepo.getStockInfoList(
            material: fakeMaterial,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                disablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-data'),
          ),
        );
      },
      act: (StockInformationBloc bloc) {
        bloc.add(StockInformationEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            material: fakeMaterial,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                disablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo));
      },
      expect: () => [
        StockInformationState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: false),
        StockInformationState.initial().copyWith(
          stockInfoListFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-data'),
            ),
          ),
          isSubmitting: false,
          showErrorMessages: true,
        ),
      ],
    );

    blocTest(
      'Stock Info List Fetch fail when batch number enable',
      build: () => StockInformationBloc(stockInfoRepository: stockInfoMockRepo),
      setUp: () {
        when(() => stockInfoMockRepo.getStockInfoList(
            material: fakeMaterial,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                enablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-data'),
          ),
        );
      },
      act: (StockInformationBloc bloc) {
        bloc.add(StockInformationEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            material: fakeMaterial,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                disablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo));
      },
      expect: () => [
        StockInformationState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: false),
        StockInformationState.initial().copyWith(
          stockInfoListFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-data'),
            ),
          ),
          isSubmitting: false,
          showErrorMessages: true,
        ),
      ],
    );

    blocTest(
      'Stock Info List Fetch success when batch number disable',
      build: () => StockInformationBloc(stockInfoRepository: stockInfoMockRepo),
      setUp: () {
        when(() => stockInfoMockRepo.getStockInfoList(
            material: fakeMaterial,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                disablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo)).thenAnswer(
          (invocation) async => Right(stockInfoMockData),
        );
      },
      act: (StockInformationBloc bloc) {
        bloc.add(StockInformationEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            material: fakeMaterial,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                disablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo));
      },
      expect: () => [
        StockInformationState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: false),
        StockInformationState.initial().copyWith(
          stockInfoListFailureOrSuccessOption: optionOf(
            Right(
              stockInfoMockData,
            ),
          ),
          isSubmitting: false,
          stockInfoList: stockInfoMockData,
        ),
      ],
    );

    blocTest(
      'Stock Info List Fetch success when batch number enable',
      build: () => StockInformationBloc(stockInfoRepository: stockInfoMockRepo),
      setUp: () {
        when(() => stockInfoMockRepo.getStockInfoList(
            material: fakeMaterial,
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                enablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo)).thenAnswer(
          (invocation) async => Right(stockInfoListMockData),
        );
      },
      act: (StockInformationBloc bloc) {
        bloc.add(StockInformationEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            material: fakeMaterial,
            salesOrganisation: fakeSalesOrganisation,
            salesOrganisationConfigs:
                enablebatchSalesOrganisationConfigsConfigs,
            shipToInfo: fakeShipToInfo));
      },
      expect: () => [
        StockInformationState.initial()
            .copyWith(isSubmitting: true, showErrorMessages: false),
        StockInformationState.initial().copyWith(
          stockInfoListFailureOrSuccessOption: optionOf(
            Right(
              stockInfoListMockData,
            ),
          ),
          isSubmitting: false,
          stockInfoList: stockInfoListMockData,
        ),
      ],
    );
  });
}
