import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BankBeneficiaryRepositoryMock extends Mock
    implements BankBeneficiaryRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late BankBeneficiaryRepository bankBeneficiaryRepositoryMock;
  late List<BankBeneficiary> bankBeneficiaryList;
  late List<SalesDistrict> salesDistrictList;
  late BankBeneficiaryResponse beneficiaryDeleteResponse,
      beneficiaryAddOrUpdateResponse;

  group(
    'Bank Beneficiary Bloc Testing',
    () {
      setUp(() async {
        bankBeneficiaryRepositoryMock = BankBeneficiaryRepositoryMock();
        bankBeneficiaryList =
            await BankBeneficiaryLocalDataSource().getBankBeneficiaries();
        salesDistrictList =
            await BankBeneficiaryLocalDataSource().getSalesDistrict();
        beneficiaryDeleteResponse =
            await BankBeneficiaryLocalDataSource().deleteBeneficiary();
        beneficiaryAddOrUpdateResponse =
            await BankBeneficiaryLocalDataSource().addOrUpdateBeneficiary();
      });

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetch" Event with Success',
        setUp: () =>
            when(() => bankBeneficiaryRepositoryMock.getBankBeneficiaries())
                .thenAnswer(
          (invocation) async => Right(bankBeneficiaryList),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ManageBankBeneficiaryEvent.fetch()),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            beneficiaryList: bankBeneficiaryList,
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetch" Event with Failure',
        setUp: () =>
            when(() => bankBeneficiaryRepositoryMock.getBankBeneficiaries())
                .thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ManageBankBeneficiaryEvent.fetch()),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetchSalesDistrict" Event with Success from Add Beneficiary',
        setUp: () => when(() => bankBeneficiaryRepositoryMock.getSalesDistrict(
            salesOrg: SalesOrg('3050'))).thenAnswer(
          (invocation) async => Right(salesDistrictList),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageBankBeneficiaryEvent.fetchSalesDistrict(
            salesOrg: SalesOrg('3050'),
            fromAdd: true,
          ),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            salesDistrict: salesDistrictList,
            beneficiaryData: BankBeneficiary.empty().copyWith(
                salesDistrict: salesDistrictList
                    .first.salesDistrictInfo.first.salesDistrictHeader
                    .getValue()),
            failureOrSuccessOption: none(),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetch Sales District" Event with Failure from Add Beneficiary',
        setUp: () => when(() => bankBeneficiaryRepositoryMock.getSalesDistrict(
              salesOrg: SalesOrg('3050'),
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(ManageBankBeneficiaryEvent.fetchSalesDistrict(
          salesOrg: SalesOrg('3050'),
          fromAdd: true,
        )),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetchSalesDistrict" Event with Success from Edit Beneficiary',
        setUp: () => when(() => bankBeneficiaryRepositoryMock.getSalesDistrict(
            salesOrg: SalesOrg('3050'))).thenAnswer(
          (invocation) async => Right(salesDistrictList),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageBankBeneficiaryEvent.fetchSalesDistrict(
            salesOrg: SalesOrg('3050'),
            fromAdd: false,
          ),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            salesDistrict: salesDistrictList,
            beneficiaryData: BankBeneficiary.empty(),
            failureOrSuccessOption: none(),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "fetch Sales District" Event with Failure from Edit Beneficiary',
        setUp: () => when(() => bankBeneficiaryRepositoryMock.getSalesDistrict(
              salesOrg: SalesOrg('3050'),
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(ManageBankBeneficiaryEvent.fetchSalesDistrict(
          salesOrg: SalesOrg('3050'),
          fromAdd: false,
        )),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: true,
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
          'For "onValueChange" Event',
          build: () => ManageBankBeneficiaryBloc(
                bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
              ),
          act: (bloc) => bloc
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.selectSalesOrg, newValue: '3050'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.selectSalesDistrict, newValue: 'HCM'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.beneficiaryName,
                  newValue: 'TestName'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.bankName, newValue: 'TestBank'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.branch, newValue: 'TestBranch'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.bankCode, newValue: 'TestCode'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.bankAccount, newValue: '123456789'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.hdbcSwiftCode,
                  newValue: 'TestSwiftCode'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.bankAddress,
                  newValue: 'TestBankAddress'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.payNowUen, newValue: 'PayNowTest'),
            )
            ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.emailId,
                  newValue: 'testabc@gmail.com'),
            ),
          expect: () => [
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty()
                      .copyWith(salesOrg: SalesOrg('3050')),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                      salesOrg: SalesOrg('3050'), salesDistrict: 'HCM'),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                      salesOrg: SalesOrg('3050'),
                      salesDistrict: 'HCM',
                      beneficiaryName: StringValue('TestName'),
                      bankName: StringValue('TestBank'),
                      branch: 'TestBranch'),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                      salesOrg: SalesOrg('3050'),
                      salesDistrict: 'HCM',
                      beneficiaryName: StringValue('TestName'),
                      bankName: StringValue('TestBank'),
                      branch: 'TestBranch',
                      bankCode: 'TestCode',
                      bankAccount: StringValue('123456789'),
                      hdbcSwiftCode: 'TestSwiftCode'),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                    hdbcSwiftCode: 'TestSwiftCode',
                    bankAddress: 'TestBankAddress',
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                    hdbcSwiftCode: 'TestSwiftCode',
                    bankAddress: 'TestBankAddress',
                    payNowUen: 'PayNowTest',
                  ),
                ),
                ManageBankBeneficiaryState.initial().copyWith(
                  beneficiaryData: BankBeneficiary.empty().copyWith(
                      salesOrg: SalesOrg('3050'),
                      salesDistrict: 'HCM',
                      beneficiaryName: StringValue('TestName'),
                      bankName: StringValue('TestBank'),
                      branch: 'TestBranch',
                      bankCode: 'TestCode',
                      bankAccount: StringValue('123456789'),
                      hdbcSwiftCode: 'TestSwiftCode',
                      bankAddress: 'TestBankAddress',
                      payNowUen: 'PayNowTest',
                      emailId: EmailAddress.optional('testabc@gmail.com')),
                ),
              ]);
      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "setBeneficiary" Event',
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageBankBeneficiaryEvent.setBeneficiary(
            beneficiary: BankBeneficiary.empty().copyWith(
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com')),
          ),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            beneficiaryData: BankBeneficiary.empty().copyWith(
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com')),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "delete Beneficiary" Event with SUCCESS',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.deleteBeneficiary(
              salesOrg: SalesOrg('3050'), salesDistrict: 'HCM'),
        ).thenAnswer(
          (invocation) async => Right(beneficiaryDeleteResponse),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
            ManageBankBeneficiaryState.initial().copyWith(beneficiaryList: [
          BankBeneficiary.empty().copyWith(
            key: 12345,
            salesOrg: SalesOrg('3050'),
            salesDistrict: 'HCM',
            beneficiaryName: StringValue('TestName'),
            bankName: StringValue('TestBank'),
            branch: 'TestBranch',
            bankCode: 'TestCode',
            bankAccount: StringValue('123456789'),
            hdbcSwiftCode: 'TestSwiftCode',
            bankAddress: 'TestBankAddress',
            payNowUen: 'PayNowTest',
            emailId: EmailAddress.optional('testabc@gmail.com'),
            isDeleteInProgress: false,
          )
        ]),
        act: (bloc) => bloc.add(
          ManageBankBeneficiaryEvent.deleteBeneficiary(
              beneficiary: BankBeneficiary.empty().copyWith(
            key: 12345,
            salesOrg: SalesOrg('3050'),
            salesDistrict: 'HCM',
            beneficiaryName: StringValue('TestName'),
            bankName: StringValue('TestBank'),
            branch: 'TestBranch',
            bankCode: 'TestCode',
            bankAccount: StringValue('123456789'),
            hdbcSwiftCode: 'TestSwiftCode',
            bankAddress: 'TestBankAddress',
            payNowUen: 'PayNowTest',
            emailId: EmailAddress.optional('testabc@gmail.com'),
            isDeleteInProgress: false,
          )),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            beneficiaryList: [
              BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: true,
              ),
            ],
            failureOrSuccessOption: none(),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
              isSubmitting: false,
              beneficiaryList: [],
              response: beneficiaryDeleteResponse,
              failureOrSuccessOption: none())
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "delete Beneficiary" Event with FAILURE',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.deleteBeneficiary(
              salesOrg: SalesOrg('3050'), salesDistrict: 'HCM'),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
            ManageBankBeneficiaryState.initial().copyWith(beneficiaryList: [
          BankBeneficiary.empty().copyWith(
            key: 12345,
            salesOrg: SalesOrg('3050'),
            salesDistrict: 'HCM',
            beneficiaryName: StringValue('TestName'),
            bankName: StringValue('TestBank'),
            branch: 'TestBranch',
            bankCode: 'TestCode',
            bankAccount: StringValue('123456789'),
            hdbcSwiftCode: 'TestSwiftCode',
            bankAddress: 'TestBankAddress',
            payNowUen: 'PayNowTest',
            emailId: EmailAddress.optional('testabc@gmail.com'),
            isDeleteInProgress: false,
          )
        ]),
        act: (bloc) => bloc.add(
          ManageBankBeneficiaryEvent.deleteBeneficiary(
              beneficiary: BankBeneficiary.empty().copyWith(
            key: 12345,
            salesOrg: SalesOrg('3050'),
            salesDistrict: 'HCM',
            beneficiaryName: StringValue('TestName'),
            bankName: StringValue('TestBank'),
            branch: 'TestBranch',
            bankCode: 'TestCode',
            bankAccount: StringValue('123456789'),
            hdbcSwiftCode: 'TestSwiftCode',
            bankAddress: 'TestBankAddress',
            payNowUen: 'PayNowTest',
            emailId: EmailAddress.optional('testabc@gmail.com'),
            isDeleteInProgress: false,
          )),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            beneficiaryList: [
              BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: true,
              ),
            ],
            failureOrSuccessOption: none(),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: false,
            beneficiaryList: [
              BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: false,
              )
            ],
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "addOrUpdateBeneficiary" for add event with SUCCESS',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.addOrUpdateBeneficiary(
              beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('testabc@gmail.com'),
              isDeleteInProgress: false,
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(beneficiaryAddOrUpdateResponse),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryData: BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: false,
              )
            ),
        act: (bloc) => bloc.add(
          const ManageBankBeneficiaryEvent
              .addOrUpdateBeneficiary(isEdit: false),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: false,
            beneficiaryData: BankBeneficiary.empty().copyWith(
                    key: 12345,
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                    hdbcSwiftCode: 'TestSwiftCode',
                    bankAddress: 'TestBankAddress',
                    payNowUen: 'PayNowTest',
                    emailId: EmailAddress.optional('testabc@gmail.com'),
                    isDeleteInProgress: false,
                )
          ),
          ManageBankBeneficiaryState.initial().copyWith(
              isSubmitting: false,
              beneficiaryList: [
                  BankBeneficiary.empty().copyWith(
                    key: 12345,
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                    hdbcSwiftCode: 'TestSwiftCode',
                    bankAddress: 'TestBankAddress',
                    payNowUen: 'PayNowTest',
                    emailId: EmailAddress.optional('testabc@gmail.com'),
                    isDeleteInProgress: false,
                )
              ],
              response: beneficiaryAddOrUpdateResponse,
              failureOrSuccessOption: none(),
          )
        ],
      );

    blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "addOrUpdateBeneficiary" for add event with failure',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.addOrUpdateBeneficiary(
              beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('testabc@gmail.com'),
              isDeleteInProgress: false,
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
            ManageBankBeneficiaryState.initial().copyWith(
              beneficiaryData: BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: false,
              )
            ),
        act: (bloc) => bloc.add(
          const ManageBankBeneficiaryEvent
              .addOrUpdateBeneficiary(isEdit: false),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: false,
            beneficiaryData: BankBeneficiary.empty().copyWith(
                    key: 12345,
                    salesOrg: SalesOrg('3050'),
                    salesDistrict: 'HCM',
                    beneficiaryName: StringValue('TestName'),
                    bankName: StringValue('TestBank'),
                    branch: 'TestBranch',
                    bankCode: 'TestCode',
                    bankAccount: StringValue('123456789'),
                    hdbcSwiftCode: 'TestSwiftCode',
                    bankAddress: 'TestBankAddress',
                    payNowUen: 'PayNowTest',
                    emailId: EmailAddress.optional('testabc@gmail.com'),
                    isDeleteInProgress: false,
                )
          ),
          ManageBankBeneficiaryState.initial().copyWith(
              isSubmitting: false,
              beneficiaryList: [],
              beneficiaryData:BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('testabc@gmail.com'),
                isDeleteInProgress: false,
              ),
              failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            )
          )
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "addOrUpdateBeneficiary" for edit event with SUCCESS',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.addOrUpdateBeneficiary(
              beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('abcVN@hotmail.com'),
              isDeleteInProgress: false,
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(beneficiaryAddOrUpdateResponse),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
          ManageBankBeneficiaryState.initial().copyWith(
            beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('testabc@gmail.com'),
              isDeleteInProgress: false,
            )
          ),
        act: (bloc) => bloc
        ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.emailId,
                  newValue: 'abcVN@hotmail.com'),
            )
        ..add(
          const ManageBankBeneficiaryEvent
              .addOrUpdateBeneficiary(isEdit: true),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            beneficiaryData: BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('abcVN@hotmail.com'),
                isDeleteInProgress : false
            ),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: false,
            beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('abcVN@hotmail.com'),
              isDeleteInProgress: false,
            )
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: false,
            beneficiaryList: [
              BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('abcVN@hotmail.com'),
                isDeleteInProgress: false,
              )
            ],
            response: beneficiaryAddOrUpdateResponse,
            failureOrSuccessOption: none(),
          )
        ],
      );

      blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
        'For "addOrUpdateBeneficiary" for edit event with failure',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.addOrUpdateBeneficiary(
              beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('abcVN@hotmail.com'),
              isDeleteInProgress: false,
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () =>
          ManageBankBeneficiaryState.initial().copyWith(
            beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('testabc@gmail.com'),
              isDeleteInProgress: false,
            )
          ),
        act: (bloc) => bloc
        ..add(
              const ManageBankBeneficiaryEvent.onValueChange(
                  label: BeneficiaryLabel.emailId,
                  newValue: 'abcVN@hotmail.com'),
            )
        ..add(
          const ManageBankBeneficiaryEvent
              .addOrUpdateBeneficiary(isEdit: true),
        ),
        expect: () => [
          ManageBankBeneficiaryState.initial().copyWith(
            beneficiaryData: BankBeneficiary.empty().copyWith(
                key: 12345,
                salesOrg: SalesOrg('3050'),
                salesDistrict: 'HCM',
                beneficiaryName: StringValue('TestName'),
                bankName: StringValue('TestBank'),
                branch: 'TestBranch',
                bankCode: 'TestCode',
                bankAccount: StringValue('123456789'),
                hdbcSwiftCode: 'TestSwiftCode',
                bankAddress: 'TestBankAddress',
                payNowUen: 'PayNowTest',
                emailId: EmailAddress.optional('abcVN@hotmail.com'),
                isDeleteInProgress : false
            ),
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: true,
            showErrorMessages: false,
            beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('abcVN@hotmail.com'),
              isDeleteInProgress: false,
            )
          ),
          ManageBankBeneficiaryState.initial().copyWith(
            isSubmitting: false,
            beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('abcVN@hotmail.com'),
              isDeleteInProgress: false,
            ),
            beneficiaryList: [],
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            )
          )
        ],
      );

    blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      'For "addOrUpdateBeneficiary" for add Event with Validation ERROR', 
      build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () => ManageBankBeneficiaryState.initial().copyWith(
          beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('test12345'),
              isDeleteInProgress: false,
          )
        ),
        act: (bloc) => bloc.add(
          const ManageBankBeneficiaryEvent
            .addOrUpdateBeneficiary(isEdit: false),
        ),
        expect: ()=> [
          ManageBankBeneficiaryState.initial().copyWith(
          beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg('3050'),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional('test12345'),
              isDeleteInProgress: false,
          ),
          showErrorMessages: true,
        ),
        ]
      );

    blocTest<ManageBankBeneficiaryBloc, ManageBankBeneficiaryState>(
      'For "addOrUpdateBeneficiary" for Edit Event with Validation ERROR', 
      build: () => ManageBankBeneficiaryBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        seed: () => ManageBankBeneficiaryState.initial().copyWith(
          beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg(''),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional(''),
              isDeleteInProgress: false,
          )
        ),
        act: (bloc) => bloc.add(
          const ManageBankBeneficiaryEvent
            .addOrUpdateBeneficiary(isEdit: true),
        ),
        expect: ()=> [
          ManageBankBeneficiaryState.initial().copyWith(
          beneficiaryData: BankBeneficiary.empty().copyWith(
              key: 12345,
              salesOrg: SalesOrg(''),
              salesDistrict: 'HCM',
              beneficiaryName: StringValue('TestName'),
              bankName: StringValue('TestBank'),
              branch: 'TestBranch',
              bankCode: 'TestCode',
              bankAccount: StringValue('123456789'),
              hdbcSwiftCode: 'TestSwiftCode',
              bankAddress: 'TestBankAddress',
              payNowUen: 'PayNowTest',
              emailId: EmailAddress.optional(''),
              isDeleteInProgress: false,
          ),
          showErrorMessages: true,
        ),
        ]
      );
    },
  );
}
