part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState({
    required User user,
    required Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
        userFailureOrSuccessOption: none(),
      );

  bool get haveSalesOrganisation => user.userSalesOrganisations.isNotEmpty;
  bool get isSalesRep => user.role.type.isSalesRep;
}
