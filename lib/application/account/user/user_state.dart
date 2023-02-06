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
  bool get isNotEmpty => user != User.empty();
  String get userRoleName => user.role.name;
  FullName get userFullName => user.fullName;
  bool get userCanLoginOnBehalf => user.role.type.canLoginOnBehalf;
  bool get userHasReturnsAdminAccess => user.role.type.hasReturnsAdminAccess;
  String get languagePreference => user.settings.languagePreference;
  bool get emailNotifications => user.settings.emailNotifications;
  List<SalesOrganisation> get userSalesOrganisations =>
      user.userSalesOrganisations;
  bool get userCanCreateOrder =>
      isNotEmpty && !(user.disableCreateOrder || user.role.type.isReturnRole);
}
