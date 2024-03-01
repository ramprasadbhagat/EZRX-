part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState({
    required User user,
    required bool isLoginOnBehalf,
    required Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption,
    required Language activeLanguage,
    required bool isLoading,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
        isLoginOnBehalf: false,
        userFailureOrSuccessOption: none(),
        activeLanguage: Language.english(),
        isLoading: false,
      );

  bool get haveSalesOrganisation => user.userSalesOrganisations.isNotEmpty;

  bool get isSalesRep => user.role.type.isSalesRepRole;

  bool get isNotEmpty => user != User.empty();

  bool get userCanLoginOnBehalf => user.role.type.canLoginOnBehalf;

  List<SalesOrganisation> get userSalesOrganisations =>
      user.userSalesOrganisations;

  bool get showTermsAndConditionDialog =>
      isNotEmpty && !isLoginOnBehalf && !user.acceptPrivacyPolicy;
}
