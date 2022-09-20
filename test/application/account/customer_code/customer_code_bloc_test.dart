import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CustomerCodeMockRepo extends Mock implements CustomerCodeRepository {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class SearchMockBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

class SearchStateMock extends Mock implements SearchState {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockRepo extends Mock implements SalesOrgRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late List<CustomerCodeInfo> customerMockData;
  final CustomerCodeRepository customerCodeMockRepo = CustomerCodeMockRepo();
  final UserBloc userMockBloc = UserMockBloc();
  final SalesOrgBloc salesOrgMockBloc = SalesOrgMockBloc();
  final SearchBloc searchMockBloc = SearchMockBloc();

  var customerCodeState = CustomerCodeState.initial();
  var fakeUser = 'fake-user';
  var fakeRole = 'fake-role';
  var salesOrgCustomerInfos = [
    SalesOrgCustomerInfo(
        customerCodeSoldTo: CustomerCode('fake-customer-code'), shipToInfos: [])
  ];
  var fakeSaleOrg = SalesOrganisation(
    salesOrg: SalesOrg('fake-1234'),
    customerInfos: [],
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    customerMockData = await CustomerCodeLocalDataSource().getCustomerInfo(
        salesOrg: fakeSaleOrg.salesOrg.getOrCrash(),
        customerCode:
            salesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
        loginUserType: fakeRole);
  });

  group('Customer Code Bloc', () {
    blocTest('Customer code Intial',
        build: () => CustomerCodeBloc(
            salesOrgBloc: salesOrgMockBloc,
            userBloc: userMockBloc,
            searchBloc: searchMockBloc,
            customerCodeRepository: customerCodeMockRepo),
        setUp: () {
          when(() => salesOrgMockBloc.state)
              .thenAnswer((invocation) => SalesOrgState.initial());
        },
        act: (CustomerCodeBloc bloc) {
          bloc.add(const CustomerCodeEvent.initialized());
        },
        expect: () => [CustomerCodeState.initial()]);

    blocTest('Customer Code Selected',
      build: () => CustomerCodeBloc(
          salesOrgBloc: salesOrgMockBloc,
          userBloc: userMockBloc,
          searchBloc: searchMockBloc,
          customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => salesOrgMockBloc.state)
            .thenAnswer((invocation) => SalesOrgState.initial());
      },
      act: (CustomerCodeBloc bloc) {
        bloc.add(CustomerCodeEvent.selected(
            customerCodeInfo: CustomerCodeInfo.empty()));
      },
      expect: () => [
        customerCodeState.copyWith(
            customeCodeInfo: CustomerCodeInfo.empty())
      ]);

    blocTest(
      'Customer Code Fetch fail',
      build: () => CustomerCodeBloc(
            salesOrgBloc: salesOrgMockBloc,
            userBloc: userMockBloc,
            searchBloc: searchMockBloc,
            customerCodeRepository: customerCodeMockRepo),
      setUp: () {
        when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
          return SalesOrgState.initial();
        });
        when(() => searchMockBloc.state).thenAnswer((invocation) {
          return SearchState.initial();
        });
       when(() => customerCodeMockRepo.getCustomerCode(
            fakeSaleOrg,
            salesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
            false,
            0,
            fakeRole,
            fakeUser)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (CustomerCodeBloc bloc) => bloc.add(CustomerCodeEvent.fetch(
          hidecustomer: false,
          pageIndex: 0,
          salesOrgCustomerInfo: salesOrgCustomerInfos,
          salesOrganisation: fakeSaleOrg,
          userName: fakeUser,
          userRoleType: fakeRole,
        )
      ),
      expect: () => [
        customerCodeState,
        customerCodeState.copyWith(isFetching: true),
        customerCodeState.copyWith(
          customerCodeList: [CustomerCodeInfo.empty()],
          customeCodeInfo: CustomerCodeInfo.empty(),
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isLoadMore: false,
          isFetching: false,
        ),
      ],
    );

    blocTest('Customer Code Fetch Success',
        build: () => CustomerCodeBloc(
          salesOrgBloc: salesOrgMockBloc,
          userBloc: userMockBloc,
          searchBloc: searchMockBloc,
          customerCodeRepository: customerCodeMockRepo),
        setUp: () {
          when(() => salesOrgMockBloc.state).thenAnswer((invocation) {
            return SalesOrgState.initial();
          });
          when(() => searchMockBloc.state).thenAnswer((invocation) {
            return SearchState.initial();
          });
          when(() => customerCodeMockRepo.getCustomerCode(
              fakeSaleOrg,
              salesOrgCustomerInfos.first.customerCodeSoldTo.getOrCrash(),
              false,
              0,
              fakeRole,
              fakeUser)).thenAnswer(
            (invocation) async => Right(
              customerMockData,
            ),
          );
        },
        act: (CustomerCodeBloc bloc) => bloc.add(CustomerCodeEvent.fetch(
            hidecustomer: false,
            pageIndex: 0,
            salesOrgCustomerInfo: salesOrgCustomerInfos,
            salesOrganisation: fakeSaleOrg,
            userName: fakeUser,
            userRoleType: fakeRole,
          )
        ),
        expect: () => [
          customerCodeState,
          customerCodeState.copyWith(isFetching: true),
          customerCodeState.copyWith(
            isFetching: false,
            customeCodeInfo: customerMockData.first,
            customerCodeList: customerMockData,
            apiFailureOrSuccessOption: none(),
            isLoadMore: false,
          ),
      ],
      verify: (CustomerCodeBloc bloc) => expect(
        bloc.state.customerCodeList,
        customerMockData,
      ),
    );
  });
}
