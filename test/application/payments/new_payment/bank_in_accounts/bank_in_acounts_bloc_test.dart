import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
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
  late List<BankBeneficiary> bankInAccountList;

  group(
    'Bank In Accounts Bloc Testing',
    () {
      setUp(() async {
        bankBeneficiaryRepositoryMock = BankBeneficiaryRepositoryMock();
        bankInAccountList = await BankBeneficiaryLocalDataSource()
            .getBankBeneficiariesBySaleOrg();
      });

      blocTest<BankInAccountsBloc, BankInAccountsState>(
        'For "bankInFetch" Event with Success',
        setUp: () => when(
          () => bankBeneficiaryRepositoryMock.getBankBeneficiariesBySaleOrg(
            salesOrg: SalesOrg('3050'),
          ),
        ).thenAnswer(
          (invocation) async => Right(bankInAccountList),
        ),
        build: () => BankInAccountsBloc(
          bankBeneficiaryRepository: bankBeneficiaryRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          BankInAccountsEvent.bankInFetch(
            salesOrg: SalesOrg('3050'),
          ),
        ),
        expect: () => [
          BankInAccountsState.initial().copyWith(
            isFetching: true,
          ),
          BankInAccountsState.initial().copyWith(
            isFetching: false,
            bankInAccounts: bankInAccountList,
          ),
        ],
      );
    },
  );
}
