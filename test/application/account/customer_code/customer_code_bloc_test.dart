import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CustomerCodeMockRepo extends Mock implements CustomerCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late List<CustomerCodeInfo> customerMockData;
  final CustomerCodeRepository customerCodeMockRepo = CustomerCodeMockRepo();

  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  ];

  final fakeMultipleSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code-1'),
      shipToInfos: [],
    ),
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code-2'),
      shipToInfos: [],
    )
  ];

  final fakeShipToInfo = ShipToInfo.empty().copyWith(building: 'fakeBuilding');
  final fakeCustomerInfo =
      CustomerCodeInfo.empty().copyWith(shipToInfos: [fakeShipToInfo]);
  final fakeUser = User.empty().copyWith(
      username: Username('fake-user'),
      role: Role.empty().copyWith(type: RoleType('client')));
  final fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeSalesOrgCustomerInfos,
  );

  final fakeSaleOrgWithMultipleCustomerInfo = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: fakeMultipleSalesOrgCustomerInfos,
  );

  const fakePageSize = 24;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();

    customerMockData =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });

  group('Customer Code Bloc', () {
    blocTest('Customer code Initial',
        build: () =>
            CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
        act: (CustomerCodeBloc bloc) {
          bloc.add(const CustomerCodeEvent.initialized());
        },
        expect: () => [CustomerCodeState.initial()]);

    blocTest('Customer Code Selected',
        build: () =>
            CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
        setUp: () {
          when(
            () => customerCodeMockRepo.storeCustomerInfo(
              customerCode: fakeCustomerInfo.customerCodeSoldTo,
              shippingAddress:
                  fakeCustomerInfo.shipToInfos.first.shipToCustomerCode,
            ),
          ).thenAnswer((invocation) async => const Right(unit));
        },
        act: (CustomerCodeBloc bloc) {
          bloc.add(CustomerCodeEvent.selected(
            customerCodeInfo: fakeCustomerInfo,
            shipToInfo: fakeCustomerInfo.shipToInfos.first,
          ));
        },
        expect: () => [
              CustomerCodeState.initial().copyWith(
                customerCodeInfo: fakeCustomerInfo,
                shipToInfo: fakeCustomerInfo.shipToInfos.first,
              )
            ]);

    blocTest(
      'Customer Code Fetch fail',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(
          () => customerCodeMockRepo.storeCustomerInfo(
            customerCode: fakeCustomerInfo.customerCodeSoldTo,
            shippingAddress:
                fakeCustomerInfo.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));

        when(
          () => customerCodeMockRepo.getCustomerCodeStorage(),
        ).thenAnswer(
          (invocation) async => Right(
            AccountSelector.empty(),
          ),
        );

        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
                  .getOrCrash(),
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );

        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: AccountSelector.empty().customerCode,
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.fetch(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          customerCodeList: [],
          customerCodeInfo: CustomerCodeInfo.empty(),
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          canLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    // blocTest(
    //   'Customer Code Fetch Success',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(
    //       () => customerCodeMockRepo.storeCustomerCode(
    //         customerCode: customerMockData.first.customerCodeSoldTo,
    //       ),
    //     ).thenAnswer((invocation) async => const Right(unit));

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   act: (CustomerCodeBloc bloc) {
    //     bloc.add(CustomerCodeEvent.fetch(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg));
    //   },
    //   expect: () => [
    //     CustomerCodeState.initial(),
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       customerCodeInfo: customerMockData.first,
    //       customerCodeList: customerMockData,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //     ),
    //   ],
    //   verify: (CustomerCodeBloc bloc) => expect(
    //     bloc.state.customerCodeList,
    //     customerMockData,
    //   ),
    // );

    test('Check if state does not have DefaultShipToInfo', () {
      final customerCodeState = CustomerCodeState.initial();
      expect(customerCodeState.haveShipToInfo, false);
      expect(customerCodeState.defaultShipToInfo, ShipToInfo.empty());
    });

    test('Check if state has DefaultShipToInfo in first index', () {
      final customerCodeState = CustomerCodeState.initial()
          .copyWith(customerCodeInfo: fakeCustomerInfo);
      expect(customerCodeState.defaultShipToInfo, fakeShipToInfo);
    });

    test('Check if state has DefaultShipToInfo in predefined index', () {
      final customerCodeState = CustomerCodeState.initial().copyWith(
          customerCodeInfo: fakeCustomerInfo.copyWith(shipToInfos: [
        fakeShipToInfo,
        fakeShipToInfo.copyWith(
            building: 'fakeBuilding2', defaultShipToAddress: true)
      ]));
      expect(
          customerCodeState.defaultShipToInfo,
          fakeShipToInfo.copyWith(
              building: 'fakeBuilding2', defaultShipToAddress: true));
    });

    blocTest(
      'Customer Code Search Success',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      seed: () => CustomerCodeState.initial().copyWith(
        shipToInfo: fakeShipToInfo,
      ),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: 'fake-customer-code',
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right(
            [
              CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-customer-code')
            ],
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.search(
            searchValue: 'fake-customer-code',
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
            isSearchActive: true,
            isFetching: true,
            shipToInfo: fakeShipToInfo,
            searchKey: SearchKey('fake-customer-code')),
        CustomerCodeState.initial().copyWith(
            customerCodeList: [
              CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-customer-code')
            ],
            shipToInfo: fakeShipToInfo,
            searchKey: SearchKey('fake-customer-code'),
            canLoadMore: false,
            isSearchActive: true,
            isFetching: false)
      ],
    );

    blocTest(
      'Customer Code Search Failure',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: 'fake-customer-code',
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.search(
            searchValue: 'fake-customer-code',
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
            isSearchActive: true,
            isFetching: true,
            searchKey: SearchKey('fake-customer-code')),
        CustomerCodeState.initial().copyWith(
            customerCodeList: [],
            customerCodeInfo: CustomerCodeInfo.empty(),
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            searchKey: SearchKey('fake-customer-code'),
            canLoadMore: false,
            isSearchActive: true),
      ],
    );

    blocTest(
      'Customer Code Auto-Search Success',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: 'fake-customer-code',
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right(
            [
              CustomerCodeInfo.empty()
                  .copyWith(customerCodeSoldTo: 'fake-customer-code')
            ],
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.autoSearch(
            searchValue: 'fake-customer-code',
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
            isSearchActive: true,
            isFetching: true,
            searchKey: SearchKey('fake-customer-code')),
        CustomerCodeState.initial().copyWith(
          customerCodeList: [
            CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-customer-code')
          ],
          searchKey: SearchKey('fake-customer-code'),
          canLoadMore: false,
          isSearchActive: true,
        )
      ],
    );

    blocTest(
      'Customer Code Auto-Search Failure',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: 'fake-customer-code',
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.search(
            searchValue: 'fake-customer-code',
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
            isSearchActive: true,
            isFetching: true,
            searchKey: SearchKey('fake-customer-code')),
        CustomerCodeState.initial().copyWith(
            customerCodeList: [],
            customerCodeInfo: CustomerCodeInfo.empty(),
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            searchKey: SearchKey('fake-customer-code'),
            canLoadMore: false,
            isSearchActive: true),
      ],
    );

    blocTest(
      'Customer Code On Load More fail',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
                  .getOrCrash(),
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      // seed: () => CustomerCodeState.initial().copyWith(
      //   customerCodeList: customerMockData,
      // ),
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.loadMore(
          hidecustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
        ));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          isFetching: true,
          // customerCodeList: customerMockData,
        ),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          // customerCodeList: customerMockData,
        )
      ],
    );
    // blocTest(
    //   'Customer Code On Load More Success',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   // seed: () => CustomerCodeState.initial().copyWith(
    //   //   customerCodeList: customerMockData,
    //   // ),
    //   act: (CustomerCodeBloc bloc) => bloc
    //     ..add(CustomerCodeEvent.loadMore(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg)),
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: true,
    //       // customerCodeList: customerMockData,
    //     ),
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       customerCodeList: [
    //         ...customerMockData,
    //       ],
    //     )
    //   ],
    // );

    // blocTest(
    //   'Customer Code On Load More Success with search key',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   seed: () => CustomerCodeState.initial().copyWith(
    //     searchKey: SearchKey('fake-customer-code'),
    //   ),
    //   act: (CustomerCodeBloc bloc) => bloc
    //     ..add(CustomerCodeEvent.loadMore(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg)),
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: true,
    //       searchKey: SearchKey('fake-customer-code'),
    //       // customerCodeList: customerMockData,
    //     ),
    //     CustomerCodeState.initial().copyWith(
    //       isFetching: false,
    //       searchKey: SearchKey('fake-customer-code'),
    //       apiFailureOrSuccessOption: none(),
    //       canLoadMore: true,
    //       customerCodeList: [
    //         ...customerMockData,
    //       ],
    //     )
    //   ],
    // );

    // blocTest(
    //   'loadStoredCustomerCode - Customer Code Storage returns failure',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(
    //       () => customerCodeMockRepo.storeCustomerCode(
    //         customerCode: customerMockData.first.customerCodeSoldTo,
    //       ),
    //     ).thenAnswer((invocation) async => const Right(unit));

    //     when(() => customerCodeMockRepo.getCustomerCodeStorage())
    //         .thenAnswer((_) async => const Left(ApiFailure.serverTimeout()));

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   act: (CustomerCodeBloc bloc) {
    //     bloc.add(CustomerCodeEvent.loadStoredCustomerCode(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg));
    //   },
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial(),
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial().copyWith(
    //         customerCodeInfo: customerMockData.first,
    //         isFetching: false,
    //         customerCodeList: customerMockData),
    //   ],
    // );

    // blocTest(
    //   'loadStoredCustomerCode - Customer Code Storage returns success but Get Customer Code returns failure',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(
    //       () => customerCodeMockRepo.storeCustomerCode(
    //         customerCode: customerMockData.first.customerCodeSoldTo,
    //       ),
    //     ).thenAnswer((invocation) async => const Right(unit));

    //     when(() => customerCodeMockRepo.getCustomerCodeStorage()).thenAnswer(
    //         (_) async => const Right(AccountSelector(
    //             customerCode: 'mockCustomerCode',
    //             salesOrg: 'mockSalesOrg',
    //             shippingAddress: 'mockShippingAddress')));

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: 'mockCustomerCode',
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => const Left(
    //         ApiFailure.serverTimeout(),
    //       ),
    //     );

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   act: (CustomerCodeBloc bloc) {
    //     bloc.add(CustomerCodeEvent.loadStoredCustomerCode(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg));
    //   },
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial(),
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial().copyWith(
    //         customerCodeInfo: customerMockData.first,
    //         isFetching: false,
    //         customerCodeList: customerMockData),
    //   ],
    // );

    // blocTest(
    //   'loadStoredCustomerCode - Customer Code Storage returns success and Get Customer Code returns success with empty list',
    //   build: () =>
    //       CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
    //   setUp: () {
    //     when(
    //       () => customerCodeMockRepo.storeCustomerCode(
    //         customerCode: customerMockData.first.customerCodeSoldTo,
    //       ),
    //     ).thenAnswer((invocation) async => const Right(unit));

    //     when(() => customerCodeMockRepo.getCustomerCodeStorage()).thenAnswer(
    //         (_) async => const Right(AccountSelector(
    //             salesOrg: 'mockSalesOrg',
    //             customerCode: 'mockCustomerCode',
    //             shippingAddress: 'mockShippingAddress')));

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: 'mockCustomerCode',
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => const Right([]),
    //     );

    //     when(() => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
    //               .getOrCrash(),
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         )).thenAnswer(
    //       (invocation) async => Right(
    //         customerMockData,
    //       ),
    //     );
    //   },
    //   act: (CustomerCodeBloc bloc) {
    //     bloc.add(CustomerCodeEvent.loadStoredCustomerCode(
    //         hidecustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg));
    //   },
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial(),
    //     CustomerCodeState.initial().copyWith(isFetching: true),
    //     CustomerCodeState.initial().copyWith(
    //         customerCodeInfo: customerMockData.first,
    //         isFetching: false,
    //         customerCodeList: customerMockData),
    //   ],
    // );

    blocTest(
      'loadStoredCustomerCode - Customer Code Storage returns success and Get Customer Code returns success with populated list',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(
          () => customerCodeMockRepo.storeCustomerInfo(
            customerCode: customerMockData.first.customerCodeSoldTo,
            shippingAddress:
                customerMockData.first.shipToInfos.first.shipToCustomerCode,
          ),
        ).thenAnswer((invocation) async => const Right(unit));

        when(() => customerCodeMockRepo.getCustomerCodeStorage()).thenAnswer(
            (_) async => const Right(AccountSelector(
                salesOrg: 'mockSalesOrg',
                customerCode: 'mockCustomerCode',
                shippingAddress: 'mockShippingAddress')));

        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: 'mockCustomerCode',
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right([customerMockData.first]),
        );

        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: fakeSalesOrgCustomerInfos.first.customerCodeSoldTo
                  .getOrCrash(),
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.loadStoredCustomerCode(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg));
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isSearchActive: true,
          customerCodeInfo: customerMockData.first,
          isFetching: false,
          customerCodeList: [customerMockData.first],
          searchKey: SearchKey(
            customerMockData.first.customerCodeSoldTo,
          ),
          shipToInfo: customerMockData.first.shipToInfos.first,
        ),
      ],
    );

    blocTest<CustomerCodeBloc, CustomerCodeState>(
      '=> Test if apiSuccess',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
      ),
      act: (bloc) {
        final isApiSuccess = CustomerCodeState.initial().apiSuccess;
        expect(isApiSuccess, true);
      },
    );

    blocTest(
      'Customer Code Fetch Success with finalCustomerCodeinfo length greater than one',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrgWithMultipleCustomerInfo,
              customerCode: fakeMultipleSalesOrgCustomerInfos[0]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode,
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right([customerMockData.first]),
        );
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrgWithMultipleCustomerInfo,
              customerCode: fakeMultipleSalesOrgCustomerInfos[1]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode,
              hideCustomer: false,
              offset: 1,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => Right([customerMockData.first]),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrgWithMultipleCustomerInfo,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeInfo: customerMockData.first,
          customerCodeList: [
            customerMockData.first,
            customerMockData.first,
          ],
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
          shipToInfo: customerMockData.first.shipToInfos.first,
        ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        [customerMockData.first, customerMockData.first],
      ),
    );

    blocTest(
      'Customer Code Fetch Success with finalCustomerCodeinfo length is zero',
      build: () =>
          CustomerCodeBloc(customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => customerCodeMockRepo.getCustomerCode(
              salesOrganisation: fakeSaleOrg,
              customerCode: fakeSalesOrgCustomerInfos[0]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode,
              hideCustomer: false,
              offset: 0,
              user: fakeUser,
              pageSize: fakePageSize,
            )).thenAnswer(
          (invocation) async => const Right(<CustomerCodeInfo>[]),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.fetch(
            hidecustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeInfo: CustomerCodeInfo.empty(),
          customerCodeList: [],
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
        ),
      ],
    );
  });
}
