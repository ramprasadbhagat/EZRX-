import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
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
import 'package:ezrxmobile/config.dart';

class CustomerCodeMockRepo extends Mock implements CustomerCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CustomerInformation customerMockData;
  final CustomerCodeRepository customerCodeMockRepo = CustomerCodeMockRepo();
  late Config config;
  final fakeSalesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
      customerCodeSoldTo: CustomerCode('fake-customer-code'),
      shipToInfos: [],
    )
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

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(type: RoleType('client')),
  );
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
    config = Config()..appFlavor = Flavor.mock;
  });

  group('Customer Code Bloc', () {
    blocTest(
      'Customer code Initial',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.initialized(
            hideCustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: fakeSaleOrg,
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
        )
      ],
    );

    blocTest(
      'Customer Code Fetch fail',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: [
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.fetch(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
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

    blocTest(
      'Customer Code Fetch Success',
      build: () => CustomerCodeBloc(
        config: config,
        customerCodeRepository: customerCodeMockRepo,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: SalesOrganisation(
          salesOrg: SalesOrg('2001'),
          customerInfos: [
            ...fakeSalesOrgCustomerInfos,
          ],
        ),
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: SalesOrganisation(
              salesOrg: SalesOrg('2001'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            customerCodes: [
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData,
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.fetch(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: SalesOrganisation(
            salesOrg: SalesOrg('2001'),
            customerInfos: [
              ...fakeSalesOrgCustomerInfos,
            ],
          ),
          isFetching: false,
          customerCodeList: customerMockData.soldToInformation,
          apiFailureOrSuccessOption: none(),
          canLoadMore: true,
        ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        customerMockData.soldToInformation,
      ),
    );

    blocTest(
      'Customer Code Validate Offset',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: SalesOrganisation(
          salesOrg: SalesOrg('2902'),
          customerInfos: [
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
            ...fakeSalesOrgCustomerInfos,
          ],
        ),
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: SalesOrganisation(
              salesOrg: SalesOrg('2902'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            customerCodes: [
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
              fakeSalesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 4,
              soldToInformation: [
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.fetch(),
        );
      },
      expect: () {
        return [
          CustomerCodeState.initial().copyWith(
            hideCustomer: false,
            userInfo: fakeUser,
            selectedSalesOrg: SalesOrganisation(
              salesOrg: SalesOrg('2902'),
              customerInfos: [
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
                ...fakeSalesOrgCustomerInfos,
              ],
            ),
            isFetching: false,
            customerCodeList: [
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
              customerMockData.soldToInformation.first,
            ],
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
          ),
        ];
      },
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        [
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first,
        ],
      ),
    );

    blocTest(
      'Customer Code Search Success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: ['fake-customer-code'],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 1,
              soldToInformation: [
                CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: 'fake-customer-code')
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.search(
            searchValue: SearchKey.searchFilter('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isSearchActive: true,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [
            CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-customer-code')
          ],
          searchKey: SearchKey('fake-customer-code'),
          canLoadMore: false,
          isSearchActive: true,
          isFetching: false,
        )
      ],
    );

    blocTest(
      'Customer Code Search Success when hide block customer is true',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: true,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: ['block-customer-code'],
            hideCustomer: true,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            CustomerInformation.empty(),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.search(
            searchValue: SearchKey.searchFilter('block-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: true,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isSearchActive: true,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey('block-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: true,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [],
          searchKey: SearchKey('block-customer-code'),
          canLoadMore: false,
          isSearchActive: true,
          isFetching: false,
        )
      ],
    );

    blocTest(
      'Customer Code Search Failure',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: [
              'fake-customer-code',
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.search(
            searchValue: SearchKey.searchFilter('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isSearchActive: true,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isFetching: false,
          searchKey: SearchKey('fake-customer-code'),
          canLoadMore: false,
          isSearchActive: true,
        ),
      ],
    );

    blocTest(
      'Customer Code Auto-Search Success',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: ['fake-customer-code'],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 1,
              soldToInformation: [
                CustomerCodeInfo.empty()
                    .copyWith(customerCodeSoldTo: 'fake-customer-code')
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.search(
            searchValue: SearchKey.searchFilter('fake-customer-code'),
          ),
        );
      },
      wait: const Duration(milliseconds: 1500),
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isSearchActive: true,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [
            CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-customer-code')
          ],
          searchKey: SearchKey('fake-customer-code'),
          canLoadMore: false,
          isFetching: false,
          isSearchActive: true,
        )
      ],
    );

    blocTest(
      'Customer Code Auto-Search Failure',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: ['fake-customer-code'],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          CustomerCodeEvent.search(
            searchValue: SearchKey.searchFilter('fake-customer-code'),
          ),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isSearchActive: true,
          isFetching: true,
          canLoadMore: false,
          searchKey: SearchKey('fake-customer-code'),
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          customerCodeList: [],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          searchKey: SearchKey('fake-customer-code'),
          canLoadMore: false,
          isFetching: false,
          isSearchActive: true,
        ),
      ],
    );

    blocTest(
      'Customer Code On Load More fail',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
        isFetching: false,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: [''],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.loadMore(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
        ),
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
          canLoadMore: true,
          // customerCodeList: customerMockData,
        )
      ],
    );

    blocTest<CustomerCodeBloc, CustomerCodeState>(
      '=> Test if apiSuccess',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      act: (bloc) {
        final isApiSuccess = CustomerCodeState.initial().apiSuccess;
        expect(isApiSuccess, true);
      },
    );

    blocTest(
      'Customer Code Fetch Success with finalCustomerCodeinfo length greater than one',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrgWithMultipleCustomerInfo,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrgWithMultipleCustomerInfo,
            customerCodes: [
              fakeMultipleSalesOrgCustomerInfos[0]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode,
              fakeMultipleSalesOrgCustomerInfos[1]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode,
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            customerMockData.copyWith(
              shipToCount: 2,
              soldToInformation: [
                customerMockData.soldToInformation.first,
                customerMockData.soldToInformation.first,
              ],
            ),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.fetch(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrgWithMultipleCustomerInfo,
          isFetching: false,
          customerCodeList: [
            customerMockData.soldToInformation.first,
            customerMockData.soldToInformation.first,
          ],
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
        ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        [
          customerMockData.soldToInformation.first,
          customerMockData.soldToInformation.first
        ],
      ),
    );

    blocTest(
      'Customer Code Fetch Success with finalCustomerCodeinfo length is zero',
      build: () => CustomerCodeBloc(
        customerCodeRepository: customerCodeMockRepo,
        config: config,
      ),
      seed: () => CustomerCodeState.initial().copyWith(
        hideCustomer: false,
        userInfo: fakeUser,
        selectedSalesOrg: fakeSaleOrg,
      ),
      setUp: () {
        when(
          () => customerCodeMockRepo.getCustomerCode(
            salesOrganisation: fakeSaleOrg,
            customerCodes: [
              fakeSalesOrgCustomerInfos[0]
                  .customerCodeSoldTo
                  .checkAllOrCustomerCode
            ],
            hideCustomer: false,
            offset: 0,
            user: fakeUser,
            pageSize: fakePageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(CustomerInformation.empty()),
        );
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(
          const CustomerCodeEvent.fetch(),
        );
      },
      expect: () => [
        CustomerCodeState.initial().copyWith(
          hideCustomer: false,
          userInfo: fakeUser,
          selectedSalesOrg: fakeSaleOrg,
          isFetching: false,
          customerCodeList: [],
          apiFailureOrSuccessOption: none(),
          canLoadMore: false,
        ),
      ],
    );

    //TODO: Fix test loadStoredCustomerCode from eligibilityBloc

    // blocTest(
    //   'loadStoredCustomerCode - Customer Code Storage returns success and offset is sent as 0 to fetch customerCodeList',
    //   build: () => CustomerCodeBloc(
    //     customerCodeRepository: customerCodeMockRepo,
    //     config: config,
    //   ),
    //   setUp: () {
    //     when(() => customerCodeMockRepo.getCustomerCodeStorage()).thenAnswer(
    //       (_) async => const Right(
    //         AccountSelector(
    //           salesOrg: 'mockSalesOrg',
    //           customerCode: 'mockCustomerCode',
    //           shippingAddress: 'mockShippingAddress',
    //         ),
    //       ),
    //     );

    //     when(
    //       () => customerCodeMockRepo.getCustomerCode(
    //         salesOrganisation: fakeSaleOrg,
    //         customerCodes: ['mockShippingAddress'],
    //         hideCustomer: false,
    //         offset: 0,
    //         user: fakeUser,
    //         pageSize: fakePageSize,
    //       ),
    //     ).thenAnswer(
    //       (invocation) async => Right([customerMockData.first]),
    //     );
    //   },
    //   seed: () => CustomerCodeState.initial().copyWith(
    //     hideCustomer: false,
    //     userInfo: fakeUser,
    //     selectedSalesOrg: fakeSaleOrg,
    //     customerCodeList: [CustomerCodeInfo.empty()],
    //   ),
    //   act: (CustomerCodeBloc bloc) {
    //     bloc.add(
    //       const CustomerCodeEvent.loadStoredCustomerCode(),
    //     );
    //   },
    //   expect: () => [
    //     CustomerCodeState.initial().copyWith(
    //       hideCustomer: false,
    //       userInfo: fakeUser,
    //       selectedSalesOrg: fakeSaleOrg,
    //       isSearchActive: true,
    //       isFetching: false,
    //       canLoadMore: false,
    //       customerCodeList: [customerMockData.first],
    //       searchKey: SearchKey('mockShippingAddress'),
    //     ),
    //   ],
    // );

    //   blocTest(
    //     'loadStoredCustomerCode - last saved customer code is not at the first index of customerCodeInfoList',
    //     build: () => CustomerCodeBloc(
    //       customerCodeRepository: customerCodeMockRepo,
    //       config: config,
    //     ),
    //     setUp: () {
    //       when(() => customerCodeMockRepo.getCustomerCodeStorage()).thenAnswer(
    //         (_) async => const Right(
    //           AccountSelector(
    //             salesOrg: 'mockSalesOrg',
    //             customerCode: '0000002011',
    //             shippingAddress: 'mockShippingAddress',
    //           ),
    //         ),
    //       );

    //       when(
    //         () => customerCodeMockRepo.getCustomerCode(
    //           salesOrganisation: fakeSaleOrg,
    //           customerCodes: ['mockShippingAddress'],
    //           hideCustomer: false,
    //           offset: 0,
    //           user: fakeUser,
    //           pageSize: fakePageSize,
    //         ),
    //       ).thenAnswer(
    //         (invocation) async => Right(customerMockData),
    //       );
    //     },
    //     seed: () => CustomerCodeState.initial().copyWith(
    //       hideCustomer: false,
    //       userInfo: fakeUser,
    //       selectedSalesOrg: fakeSaleOrg,
    //       customerCodeList: [CustomerCodeInfo.empty()],
    //     ),
    //     act: (CustomerCodeBloc bloc) {
    //       bloc.add(
    //         const CustomerCodeEvent.loadStoredCustomerCode(),
    //       );
    //     },
    //     expect: () => [
    //       CustomerCodeState.initial().copyWith(
    //         hideCustomer: false,
    //         userInfo: fakeUser,
    //         selectedSalesOrg: fakeSaleOrg,
    //         isSearchActive: true,
    //         isFetching: false,
    //         customerCodeList: customerMockData,
    //         searchKey: SearchKey('mockShippingAddress'),
    //       ),
    //     ],
    //   );
  });
}
