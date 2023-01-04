part of 'user_restriction_list_bloc.dart';

@freezed
class UserRestrictionListEvent with _$UserRestrictionListEvent {
  const factory UserRestrictionListEvent.initialized() = _Initialized;

  const factory UserRestrictionListEvent.fetch({
    required SalesOrg salesOrg,
  }) = _Fetch;

  const factory UserRestrictionListEvent.updateSearchKey(String searchKey) =
      _UpdateSearchKey;
}
