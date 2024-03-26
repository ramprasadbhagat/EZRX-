import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SalesRepRepositoryMock extends Mock implements SalesRepRepository {}

void main() {
  late SalesRepRepository salesRepRepositoryMock;
  late User userData;
  setUpAll(() {
    userData = User.empty().copyWith(username: Username('hjho'));
  });

  group('Sales Rep Bloc Testing', () {
    setUp(() {
      salesRepRepositoryMock = SalesRepRepositoryMock();
    });
    blocTest<SalesRepBloc, SalesRepState>(
      'For "initialized" Event',
      build: () => SalesRepBloc(salesRepRepository: salesRepRepositoryMock),
      act: (bloc) => bloc.add(const SalesRepEvent.initialized()),
      expect: () => [SalesRepState.initial()],
    );
    blocTest<SalesRepBloc, SalesRepState>(
      'For "fetch" Event with error',
      build: () => SalesRepBloc(salesRepRepository: salesRepRepositoryMock),
      setUp: () {
        when(() => salesRepRepositoryMock.getSalesRepInfo(user: userData))
            .thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake Error')),
        );
      },
      act: (bloc) => bloc.add(SalesRepEvent.fetch(user: userData)),
      expect: () => [
        SalesRepState.initial().copyWith(
          salesRepFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake Error'),
            ),
          ),
        ),
      ],
    );
    blocTest<SalesRepBloc, SalesRepState>(
      'For "fetch" Event with Data',
      build: () => SalesRepBloc(salesRepRepository: salesRepRepositoryMock),
      setUp: () {
        when(() => salesRepRepositoryMock.getSalesRepInfo(user: userData))
            .thenAnswer(
          (invocation) async => Right(
            SalesRepresentativeInfo.empty().copyWith(count: 2),
          ),
        );
      },
      act: (bloc) => bloc.add(SalesRepEvent.fetch(user: userData)),
      expect: () => [
        SalesRepState.initial().copyWith(
          salesRepInfo: SalesRepresentativeInfo.empty().copyWith(count: 2),
          salesRepFailureOrSuccessOption: none(),
        ),
      ],
    );
    blocTest<SalesRepBloc, SalesRepState>(
      'For "Stream Listener"',
      build: () => SalesRepBloc(salesRepRepository: salesRepRepositoryMock),
      setUp: () {
        userData = userData.copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')),
        );
        when(() => salesRepRepositoryMock.getSalesRepInfo(user: userData))
            .thenAnswer(
          (invocation) async => Right(SalesRepresentativeInfo.empty()),
        );
      },
      act: (bloc) => bloc.add(SalesRepEvent.fetch(user: userData)),
      expect: () => [
        SalesRepState.initial().copyWith(
          salesRepInfo: SalesRepresentativeInfo.empty(),
          salesRepFailureOrSuccessOption: none(),
        ),
      ],
    );
  });
}
