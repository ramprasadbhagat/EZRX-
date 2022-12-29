import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/approver/approver_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/approver_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApproverMockRepository extends Mock implements ApproverRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ApproverRepository approverRepositoryMock;
  late User mockUser;
  late ApproverState mockApproverState;

  setUpAll(() {
    approverRepositoryMock = ApproverMockRepository();
    mockUser = User.empty().copyWith(
      username: Username('mockUserName'),
    );
    mockApproverState = ApproverState.initial().copyWith(
      isApprover: true,
    );
  });

  group('Approver Bloc Test', () {
    blocTest(
      'Approver Initial',
      build: () => ApproverBloc(
        approverRepository: approverRepositoryMock,
      ),
      act: (ApproverBloc bloc) {
        bloc.add(const ApproverEvent.initialized());
      },
      expect: () => [ApproverState.initial()],
    );

    blocTest(
      'Approver Fetch when remote config enableReturns is true',
      build: () => ApproverBloc(approverRepository: approverRepositoryMock),
      setUp: () {
        when(() => approverRepositoryMock.getReturnsConfig())
            .thenAnswer((invocation) => true);
        when(
          () => approverRepositoryMock.getIsApprover(mockUser),
        ).thenAnswer((invocation) async => const Right(true));
      },
      act: (ApproverBloc bloc) {
        bloc.add(ApproverEvent.fetch(userInfo: mockUser));
      },
      expect: () => [mockApproverState],
    );

    blocTest(
      'Approver Fetch when remote config enableReturns is false',
      build: () => ApproverBloc(approverRepository: approverRepositoryMock),
      setUp: () {
        when(() => approverRepositoryMock.getReturnsConfig())
            .thenAnswer((invocation) => false);
        when(
          () => approverRepositoryMock.getIsApprover(mockUser),
        ).thenAnswer((invocation) async => const Right(true));
      },
      act: (ApproverBloc bloc) {
        bloc.add(ApproverEvent.fetch(userInfo: mockUser));
      },
      expect: () => [ApproverState.initial()],
    );

    blocTest(
      'Approver Fetch Failed',
      build: () => ApproverBloc(approverRepository: approverRepositoryMock),
      setUp: () {
        when(() => approverRepositoryMock.getReturnsConfig())
            .thenAnswer((invocation) => true);
        when(
          () => approverRepositoryMock.getIsApprover(mockUser),
        ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('mockError')));
      },
      act: (ApproverBloc bloc) {
        bloc.add(ApproverEvent.fetch(userInfo: mockUser));
      },
      expect: () => [
        ApproverState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('mockError')),
          ),
        ),
      ],
    );
  });
}
