import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';
import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRestrictionsRepoMock extends Mock
    implements UserRestrictionRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserRestrictionRepository userRestrictionRepositoryMock;
  late UserRestrictions fetUserRestrictionDetails;
  late UserRestrictionStatus userRestrictionStatusApprovalLimit;
  late UserRestrictionStatus userRestrictionStatusApproverRights;

  late SalesOrganisation fakeSaleOrganisation;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    userRestrictionRepositoryMock = UserRestrictionsRepoMock();

    fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('fake-1234'),
    );
  });

  group('Add Edit User Restriction', () {
    setUp(() async {
      fetUserRestrictionDetails =
          await UserRestrictionLocalDataSource().getUserRestrictions();
      userRestrictionStatusApprovalLimit = const UserRestrictionStatus(
        approverRightsStatus: 'fake-status',
        approvalLimitStatus: true,
      );
      userRestrictionStatusApproverRights = const UserRestrictionStatus(
        approverRightsStatus: 'fake-status',
        approvalLimitStatus: false,
      );
    });
    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'User Restriction Initialized',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        UserRestrictionDetailsEvent.initialized(
          salesOrganisation: fakeSaleOrganisation,
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty()
                .copyWith(salesOrg: fakeSaleOrganisation.salesOrg),
          ],
          approvalLimits: ApprovalLimits.empty().copyWith(
            salesOrg: fakeSaleOrganisation.salesOrg,
          ),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Fetch User restriction Details',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.getUserRestrictions(
            userName: Username('fake-user'),
            salesOrganisation: fakeSaleOrganisation,
          ),
        ).thenAnswer((invocation) async => Right(fetUserRestrictionDetails));
      },
      act: (bloc) => bloc.add(
        UserRestrictionDetailsEvent.fetchUserRestrictionDetails(
          salesOrganisation: fakeSaleOrganisation,
          userName: Username('fake-user'),
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(isFetching: true),
        UserRestrictionDetailsState.initial().copyWith(
          isFetching: false,
          approverRights: fetUserRestrictionDetails.approverRights,
          addedApproverRightsList:
              fetUserRestrictionDetails.approverRights.approverRightsList,
          approvalLimits: fetUserRestrictionDetails.approverLimitsDetails,
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Add user restriction',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.addApprovalLimit(
            approverLimits:
                UserRestrictionDetailsState.initial().approvalLimits,
          ),
        ).thenAnswer(
          (invocation) async => Right(userRestrictionStatusApprovalLimit),
        );
        when(
          () => userRestrictionRepositoryMock.configureUserRestriction(
            approverRights: ApproverRights.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(userRestrictionStatusApproverRights),
        );
      },
      act: (bloc) =>
          bloc.add(const UserRestrictionDetailsEvent.addUserRestriction()),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: UserRestrictionStatus.empty(),
          apiFailureOrSuccessOption: none(),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: userRestrictionStatusApproverRights,
          apiFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Configure User restriction',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.configureUserRestriction(
            approverRights: ApproverRights.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(userRestrictionStatusApproverRights),
        );
      },
      act: (bloc) => bloc
          .add(const UserRestrictionDetailsEvent.configureUserRestriction()),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: UserRestrictionStatus.empty(),
          apiFailureOrSuccessOption: none(),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: userRestrictionStatusApproverRights,
          apiFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Configure User restriction Fail',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.configureUserRestriction(
            approverRights: ApproverRights.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc
          .add(const UserRestrictionDetailsEvent.configureUserRestriction()),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: UserRestrictionStatus.empty(),
          apiFailureOrSuccessOption: none(),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Delete User restriction',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.deleteApprovalRights(
            approverRights: ApproverRights.empty(),
          ),
        ).thenAnswer((invocation) async => const Right(true));
      },
      act: (bloc) =>
          bloc.add(const UserRestrictionDetailsEvent.deleteUserRestriction()),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: UserRestrictionStatus.empty(),
          apiFailureOrSuccessOption: none(),
        ),
        UserRestrictionDetailsState.initial().copyWith(
          userRestrictionStatus: UserRestrictionStatus.empty().copyWith(
            approvalLimitStatus: true,
          ),
          apiFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'add approver rights',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        UserRestrictionDetailsEvent.addApproverRights(
          salesOrg: fakeSaleOrganisation.salesOrg,
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: List.from(
            UserRestrictionDetailsState.initial().addedApproverRightsList,
          )..add(
              ApproverRightsDetails.empty()
                  .copyWith(salesOrg: fakeSaleOrganisation.salesOrg),
            ),
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'delete approver rights',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        UserRestrictionDetailsEvent.deleteApproverRights(
          approverRightsDetails: ApproverRightsDetails.empty(),
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: List.from(
            UserRestrictionDetailsState.initial().addedApproverRightsList,
          )..remove(
              ApproverRightsDetails.empty(),
            ),
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'Delete User restriction with valid approval rights',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        approvalLimits: ApprovalLimits.empty().copyWith(
          salesOrg: fakeSaleOrganisation.salesOrg,
          userName: Username('fake-username'),
          uuid: '',
          valueLowerLimit: ApprovalLimit(0),
          valueUpperLimit: ApprovalLimit(10),
        ),
      ),
      setUp: () {
        when(
          () => userRestrictionRepositoryMock.deleteApprovalRights(
            approverRights: ApproverRights.empty(),
          ),
        ).thenAnswer((invocation) async => const Right(true));
        when(
          () => userRestrictionRepositoryMock.deleteApprovalLimit(
            approverLimits: ApprovalLimits.empty().copyWith(
              salesOrg: fakeSaleOrganisation.salesOrg,
              userName: Username('fake-username'),
              uuid: '',
              valueLowerLimit: ApprovalLimit(0),
              valueUpperLimit: ApprovalLimit(10),
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            UserRestrictionStatus.empty().copyWith(approvalLimitStatus: true),
          ),
        );
      },
      act: (bloc) =>
          bloc.add(const UserRestrictionDetailsEvent.deleteUserRestriction()),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          approvalLimits: ApprovalLimits.empty().copyWith(
            salesOrg: fakeSaleOrganisation.salesOrg,
            userName: Username('fake-username'),
            uuid: '',
            valueLowerLimit: ApprovalLimit(0),
            valueUpperLimit: ApprovalLimit(10),
          ),
          userRestrictionStatus: UserRestrictionStatus.empty().copyWith(
            approvalLimitStatus: true,
          ),
          apiFailureOrSuccessOption: none(),
        )
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.userName,
          value: 'fake-name',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          approvalLimits: ApprovalLimits.empty().copyWith(
            userName: Username('fake-name'),
          ),
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields lower limit',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.returnLowerLimit,
          value: '0',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          approvalLimits: ApprovalLimits.empty().copyWith(
            valueLowerLimit: ApprovalLimit(int.parse('0')),
          ),
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields upper limit',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.returnUpperLimit,
          value: '10',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          approvalLimits: ApprovalLimits.empty().copyWith(
            valueUpperLimit: ApprovalLimit(int.parse('10')),
          ),
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields principal',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.principal,
          value: 'fake-principal',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              principal: 'fake-principal',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields industrial code 1',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.industryCode1,
          value: 'fake-industrialcode1',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              industryCode1: 'fake-industrialcode1',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields industrial code 2',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.industryCode2,
          value: 'fake-industrialcode2',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              industryCode2: 'fake-industrialcode2',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields industrial code 3',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.industryCode3,
          value: 'fake-industrialcode3',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              industryCode3: 'fake-industrialcode3',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields industrial code 4',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.industryCode4,
          value: 'fake-industrialcode4',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              industryCode4: 'fake-industrialcode4',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields industrial code 5',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.industryCode5,
          value: 'fake-industrialcode5',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              industryCode5: 'fake-industrialcode5',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields plant',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.plant,
          value: 'fake-plant',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              plant: 'fake-plant',
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );

    blocTest<UserRestrictionDetailsBloc, UserRestrictionDetailsState>(
      'update text fields material number',
      build: () => UserRestrictionDetailsBloc(
        userRestrictionRepository: userRestrictionRepositoryMock,
      ),
      seed: () => UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: fakeSaleOrganisation.salesOrg)
        ],
      ),
      act: (bloc) => bloc.add(
        const UserRestrictionDetailsEvent.updateTextField(
          index: 0,
          label: UserRestrictionLabel.materialNumber,
          value: '1234',
        ),
      ),
      expect: () => [
        UserRestrictionDetailsState.initial().copyWith(
          addedApproverRightsList: [
            ApproverRightsDetails.empty().copyWith(
              materialNumber: MaterialNumber('1234'),
              salesOrg: fakeSaleOrganisation.salesOrg,
            )
          ],
        ),
      ],
    );
  });
}
