import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';

import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';

import 'package:ezrxmobile/domain/returns/repository/i_user_restriction_repository.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/value/value_objects.dart';

import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';

import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';

part 'user_restriction_details_event.dart';
part 'user_restriction_details_state.dart';
part 'user_restriction_details_bloc.freezed.dart';

class UserRestrictionDetailsBloc
    extends Bloc<UserRestrictionDetailsEvent, UserRestrictionDetailsState> {
  final IUserRestrictionRepository userRestrictionRepository;
  UserRestrictionDetailsBloc({required this.userRestrictionRepository})
      : super(UserRestrictionDetailsState.initial()) {
    on<UserRestrictionDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    UserRestrictionDetailsEvent event,
    Emitter<UserRestrictionDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async =>
          emit(UserRestrictionDetailsState.initial().copyWith(
        addedApproverRightsList: [
          ApproverRightsDetails.empty()
              .copyWith(salesOrg: e.salesOrganisation.salesOrg),
        ],
        approvalLimits: ApprovalLimits.empty().copyWith(
          salesOrg: e.salesOrganisation.salesOrg,
        ),
      )),
      fetchUserRestrictionDetails: (e) async {
        emit(
          UserRestrictionDetailsState.initial().copyWith(isFetching: true),
        );

        final approverRights =
            await userRestrictionRepository.getUserRestrictions(
          salesOrganisation: e.salesOrganisation,
          userName: e.userName,
        );
        approverRights.fold(
          (failure) {
            emit(state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(approverRights),
            ));

            return;
          },
          (userRestrictions) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                approverRights: userRestrictions.approverRights,
                addedApproverRightsList:
                    userRestrictions.approverRights.approverRightsList,
                approvalLimits: userRestrictions.approverLimitsDetails,
              ),
            );
          },
        );
      },
      updateTextField: (e) {
        _updateTextField(
          emit: emit,
          index: e.index,
          label: e.label,
          value: e.value,
        );
      },
      addUserRestriction: (e) async {
        emit(
          state.copyWith(
            userRestrictionStatus: UserRestrictionStatus.empty(),
            apiFailureOrSuccessOption: none(),
          ),
        );

        final addApprovalLimit =
            await userRestrictionRepository.addApprovalLimit(
          approverLimits: state.approvalLimits,
        );

        addApprovalLimit.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(addApprovalLimit),
              ),
            );
          },
          (addApprovalLimit) {
            add(const UserRestrictionDetailsEvent.configureUserRestriction());
          },
        );
      },
      configureUserRestriction: (e) async {
        emit(
          state.copyWith(
            userRestrictionStatus: UserRestrictionStatus.empty(),
            apiFailureOrSuccessOption: none(),
          ),
        );

        final approverRights = state.approverRights.copyWith(
          approverRightsList: state.configurableApproverRightsList,
          userName: state.approvalLimits.userName,
        );

        final configureRestrictions =
            await userRestrictionRepository.configureUserRestriction(
          approverRights: approverRights,
        );
        configureRestrictions.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(
                  configureRestrictions,
                ),
              ),
            );
          },
          (configureRestrictions) {
            emit(state.copyWith(
              userRestrictionStatus: configureRestrictions,
              apiFailureOrSuccessOption: none(),
            ));
          },
        );
      },
      deleteUserRestriction: (e) async {
        emit(
          state.copyWith(
            userRestrictionStatus: UserRestrictionStatus.empty(),
            apiFailureOrSuccessOption: none(),
          ),
        );

        final deleteApprovalRights =
            await userRestrictionRepository.deleteApprovalRights(
          approverRights: state.approverRights,
        );

        await deleteApprovalRights.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(
                  deleteApprovalRights,
                ),
              ),
            );
          },
          (deleteUserRestriction) async {
            if (state.approvalLimits.isNotValidApprovalLimit) {
              emit(
                state.copyWith(
                  userRestrictionStatus: UserRestrictionStatus.empty().copyWith(
                    approvalLimitStatus: deleteUserRestriction,
                  ),
                  apiFailureOrSuccessOption: none(),
                ),
              );

              return;
            }

            final deleteApprovalLimit = await userRestrictionRepository
                .deleteApprovalLimit(approverLimits: state.approvalLimits);

            deleteApprovalLimit.fold(
              (failure) {
                emit(
                  state.copyWith(
                    isFetching: false,
                    apiFailureOrSuccessOption: optionOf(
                      deleteApprovalLimit,
                    ),
                  ),
                );
              },
              (deleteApprovalLimit) {
                emit(state.copyWith(
                  userRestrictionStatus: deleteApprovalLimit,
                  apiFailureOrSuccessOption: none(),
                ));
              },
            );
          },
        );
      },
      addApproverRights: (e) {
        emit(
          state.copyWith(
            addedApproverRightsList: List.from(state.addedApproverRightsList)
              ..add(
                ApproverRightsDetails.empty().copyWith(salesOrg: e.salesOrg),
              ),
          ),
        );
      },
      deleteApproverRights: (e) {
        emit(
          state.copyWith(
            addedApproverRightsList: List.from(state.addedApproverRightsList)
              ..remove(e.approverRightsDetails),
          ),
        );
      },
    );
  }

  void _updateTextField({
    required String value,
    required UserRestrictionLabel label,
    required int index,
    required Emitter<UserRestrictionDetailsState> emit,
  }) {
    final approverLimits = state.approvalLimits;
    switch (label) {
      case UserRestrictionLabel.userName:
        emit(
          state.copyWith(
            approvalLimits: approverLimits.copyWith(
              userName: Username(value),
            ),
          ),
        );
        break;
      case UserRestrictionLabel.returnLowerLimit:
        emit(
          state.copyWith(
            approvalLimits: approverLimits.copyWith(
              valueLowerLimit: ApprovalLimit(int.parse(value)),
            ),
          ),
        );
        break;
      case UserRestrictionLabel.returnUpperLimit:
        emit(
          state.copyWith(
            approvalLimits: approverLimits.copyWith(
              valueUpperLimit: ApprovalLimit(int.parse(value)),
            ),
          ),
        );
        break;
      default:
        emit(
          state.copyWith(
            addedApproverRightsList: _updateApproverRights(
              value: value,
              label: label,
              index: index,
            ),
          ),
        );
    }
  }

  List<ApproverRightsDetails> _updateApproverRights({
    required String value,
    required UserRestrictionLabel label,
    required int index,
  }) {
    final approverRights = state.addedApproverRightsList[index];
    late final ApproverRightsDetails updatedObject;
    switch (label) {
      case UserRestrictionLabel.industryCode1:
        updatedObject = approverRights.copyWith(industryCode1: value);
        break;
      case UserRestrictionLabel.industryCode2:
        updatedObject = approverRights.copyWith(industryCode2: value);
        break;
      case UserRestrictionLabel.industryCode3:
        updatedObject = approverRights.copyWith(industryCode3: value);
        break;
      case UserRestrictionLabel.industryCode4:
        updatedObject = approverRights.copyWith(industryCode4: value);
        break;
      case UserRestrictionLabel.industryCode5:
        updatedObject = approverRights.copyWith(industryCode5: value);
        break;
      case UserRestrictionLabel.plant:
        updatedObject = approverRights.copyWith(plant: value);
        break;
      case UserRestrictionLabel.materialNumber:
        updatedObject =
            approverRights.copyWith(materialNumber: MaterialNumber(value));
        break;
      case UserRestrictionLabel.principal:
        updatedObject = approverRights.copyWith(principal: value);
        break;
      default:
        break;
    }

    return List.from(state.addedApproverRightsList)
      ..removeAt(index)
      ..insert(index, updatedObject);
  }

  @override
  void onChange(Change<UserRestrictionDetailsState> change) {
    super.onChange(change);
  }
}
