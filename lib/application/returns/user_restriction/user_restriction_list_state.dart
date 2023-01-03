part of 'user_restriction_list_bloc.dart';

@freezed
class UserRestrictionListState with _$UserRestrictionListState {
  UserRestrictionListState._();

  factory UserRestrictionListState({
    required bool isFetching,
    required List<String> usernames,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _UserRestrictionState;

  factory UserRestrictionListState.initial() => UserRestrictionListState(
    isFetching: false,
    usernames: <String>[],
    apiFailureOrSuccessOption: none(),
  );
}
