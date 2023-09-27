part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const UserState._();

  const factory UserState({
    required User user,
    required bool isLoginOnBehalf,
    required Option<Either<ApiFailure, dynamic>> userFailureOrSuccessOption,
    required Locale activeLanguage,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
        isLoginOnBehalf: false,
        userFailureOrSuccessOption: none(),
        activeLanguage: const Locale(
          ApiLanguageCode.english,
        ),
      );

  bool get haveSalesOrganisation => user.userSalesOrganisations.isNotEmpty;
  bool get isSalesRep => user.role.type.isSalesRepRole;
  bool get isNotEmpty => user != User.empty();
  String get userRoleName => user.role.name;
  FullName get userFullName => user.fullName;
  bool get userCanLoginOnBehalf => user.role.type.canLoginOnBehalf;
  bool get userHasReturnsAdminAccess => user.role.type.hasReturnsAdminAccess;
  Locale get languagePreference => user.settings.languagePreference;
  bool get emailNotifications => user.settings.emailNotifications;
  List<SalesOrganisation> get userSalesOrganisations =>
      user.userSalesOrganisations;
  List<String> get salesOrgValue =>
      userSalesOrganisations.map((e) => e.salesOrg.getValue()).toList();
}
