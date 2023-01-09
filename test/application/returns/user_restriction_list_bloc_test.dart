import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRestrictionMockRepository extends Mock
    implements UserRestrictionRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late String mockSearchKey;
  late SalesOrg mockSalesOrg;
  late List<String> mockUserNamesList;
  late UserRestrictionRepository userRestrictionRepositoryMock;
  late UserRestrictionListState userRestrictionListStateMock;

  setUpAll(() {
    mockSalesOrg = SalesOrg('2601');
    userRestrictionRepositoryMock = UserRestrictionMockRepository();
    mockUserNamesList = [
      'mockUser',
      'mockPerson',
      'mockAgedPerson',
      'mockYoungPerson',
    ];
    mockSearchKey = 'Person';
    userRestrictionListStateMock = UserRestrictionListState.initial().copyWith(
      usernames: mockUserNamesList,
    );
  });

  group('User Restriction List Bloc Test', () {
    blocTest(
      'User Restriction List Initial',
      build: () => UserRestrictionListBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (UserRestrictionListBloc bloc) {
        bloc.add(const UserRestrictionListEvent.initialized());
      },
      expect: () => [UserRestrictionListState.initial()],
    );

    blocTest(
      'User Restriction List Fetch',
      build: () => UserRestrictionListBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(() => userRestrictionRepositoryMock
                .getUserRestrictionsList(mockSalesOrg))
            .thenAnswer((invocation) async => Right(mockUserNamesList));
      },
      act: (UserRestrictionListBloc bloc) {
        bloc.add(UserRestrictionListEvent.fetch(salesOrg: mockSalesOrg));
      },
      expect: () => [
        UserRestrictionListState.initial().copyWith(isFetching: true),
        userRestrictionListStateMock,
      ],
    );

    blocTest(
      'User Restriction List Fetch Failed',
      build: () => UserRestrictionListBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(() => userRestrictionRepositoryMock
            .getUserRestrictionsList(mockSalesOrg)).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mockError'),
          ),
        );
      },
      act: (UserRestrictionListBloc bloc) {
        bloc.add(UserRestrictionListEvent.fetch(salesOrg: mockSalesOrg));
      },
      expect: () => [
        UserRestrictionListState.initial().copyWith(isFetching: true),
        UserRestrictionListState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('mockError'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'User Restriction List Update Search Key test',
      build: () => UserRestrictionListBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (UserRestrictionListBloc bloc) {
        bloc.add(UserRestrictionListEvent.updateSearchKey(mockSearchKey));
      },
      expect: () => [
        UserRestrictionListState.initial().copyWith(searchKey: mockSearchKey),
      ],
    );
  });
}
